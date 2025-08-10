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

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-enable pdo_mysql

ENV PATH="/home/project/bin:${PATH}"
