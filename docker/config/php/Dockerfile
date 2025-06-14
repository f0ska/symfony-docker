FROM php:8.4-fpm

ARG PROJECT_USER_ID
ARG PROJECT_GROUP_ID

RUN groupadd -g ${PROJECT_GROUP_ID} project
RUN useradd -u ${PROJECT_USER_ID} -g ${PROJECT_GROUP_ID} project

RUN apt update

RUN apt install -y git
RUN apt install -y ssh
RUN apt install -y unzip
RUN apt install -y libicu-dev

RUN git config --global user.email "dev@project.local"
RUN git config --global user.name "Project Dev"

RUN docker-php-ext-install opcache
RUN docker-php-ext-enable opcache

RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

RUN docker-php-ext-install intl
RUN docker-php-ext-enable intl

wget https://raw.githubusercontent.com/composer/getcomposer.org/f3108f64b4e1c1ce6eb462b159956461592b3e3e/web/installer -O - -q | php -- --quiet

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash
RUN apt install symfony-cli
