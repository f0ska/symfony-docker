FROM php:8.5-fpm

ARG PROJECT_USER_ID
ARG PROJECT_GROUP_ID

RUN groupadd -g ${PROJECT_GROUP_ID} project
RUN useradd -u ${PROJECT_USER_ID} -g ${PROJECT_GROUP_ID} project
RUN mkdir /home/project
RUN chown project:project /home/project

RUN apt update

RUN apt install -y wget
RUN apt install -y git
RUN apt install -y ssh
RUN apt install -y unzip
RUN apt install -y libicu-dev

RUN /bin/sh -c 'if php -m | grep -qi "$1$"; then  \
       printf "%s already installed\n" "$1";      \
    else docker-php-ext-install -- "$1"; fi' --   \
       opcache
RUN docker-php-ext-enable opcache || true

RUN wget 'https://php.github.io/pie/pie-nightly.phar' -O /usr/local/bin/pie
RUN chmod +x /usr/local/bin/pie
RUN pie install xdebug/xdebug
RUN docker-php-ext-enable xdebug

RUN docker-php-ext-install intl
RUN docker-php-ext-enable intl

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-enable pdo_mysql

RUN wget 'https://get.symfony.com/cli/installer' -O ./sinstaller
RUN chmod +x ./sinstaller
RUN ./sinstaller --install-dir=/usr/local/bin/
RUN symfony check:requirements

RUN wget 'https://getcomposer.org/installer' -O ./composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin/ --filename=composer

USER project
RUN git config --global user.email "dev@project.local"
RUN git config --global user.name "Project Dev"
