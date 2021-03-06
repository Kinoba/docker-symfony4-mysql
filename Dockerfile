FROM phpdockerio/php72-fpm:latest

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV TZ UTC

WORKDIR /application

# Fix debconf warnings upon build
ARG DEBIAN_FRONTEND=noninteractive

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
  && echo $TZ > /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata

# Install selected extensions and other stuff
RUN apt-get update \
  && apt-get -y install --no-install-recommends \
     # utils
     ant \
     chromium-chromedriver \
     libzip-dev \
     git \
     tzdata \
     zlib1g-dev \
     # php ext
     php7.2-intl \
     php7.2-gd \
     php7.2-mysql \
     php-xdebug \
     php7.2-phpdbg \
     php7.2-zip \
  && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install nodejs -yq

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install yarn -yq

RUN curl -SL https://github.com/theseer/phpdox/releases/download/0.11.2/phpdox-0.11.2.phar --silent -o phpdox-0.11.2.phar \
    && mv phpdox-0.11.2.phar /usr/local/bin/phpdox \
    && chmod +x /usr/local/bin/phpdox
