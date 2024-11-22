FROM ubuntu:24.04

WORKDIR /var/www/devcanvas

RUN apt update && apt upgrade -y
RUN apt install php libapache2-mod-php php-cli curl -y
RUN apt install php-mysql php-curl -y
RUN apt install git-all -y
RUN apt install npm -y
RUN apt install php-xml php-dom php-mbstring unzip -y

COPY composer /usr/bin

RUN composer global require laravel/installer

COPY ./data /var/devcanvas/data/scripts

RUN chmod +x /var/devcanvas/data/scripts/*
RUN . /var/devcanvas/data/scripts/init.sh

RUN npm install && npm run build
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN composer install

RUN php artisan key:generate

EXPOSE 8000

# CMD composer run dev
CMD php artisan serve --host=0.0.0.0 --port=8000
