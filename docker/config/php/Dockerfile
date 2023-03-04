FROM php:8.1-fpm

RUN groupadd -g 1000 project
RUN useradd -l -u 1000 -g 1000 project

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

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash
RUN apt install symfony-cli
