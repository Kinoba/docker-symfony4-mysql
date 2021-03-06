# Custom Symfony 4 Docker image

This is the image we use at Kinoba to start developing quickly on a Symfony 4 project.

## What's inside?

- phpdockerio/php72-fpm:latest
- php-ext:
    - php-xdebug
    - php7.2-gd
    - php7.2-intl
    - php7.2-mysql
    - php7.2-phpdbg
    - php7.2-zip
- nodejs 8.x
- yarn
- composer
- ant
- phpdox ([https://github.com/theseer/phpdox](https://github.com/theseer/phpdox))

## Build

`docker build -t kinoba/docker-symfony4-mysql .`

## Publish

`docker push kinoba/docker-symfony4-mysql`