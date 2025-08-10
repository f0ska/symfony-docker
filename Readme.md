# Simple Docker Symfony environment
This configuration allows you quickly install fresh Symfony installation
using Docker with a few simple commands.

## Pre-requisites
Make sure you have correctly installed [Docker](https://docs.docker.com/engine/install/) and [Docker Compose](https://docs.docker.com/compose/install/).

## Step 1: Run container
Clone this repository, go into main folder and run:

`docker-compose up -d`

_If you familiar with docker - you probably know what to do_

## Step 2: Install Symfony
Run the command, just copy/past:

`docker exec -u project -i symfony-test-php symfony new project --webapp`

## Step 3: Test your installation
http://localhost:8880/

https://localhost:8843/

## The end
Congratulations! Now you have installed Symfony with docker.

## Useful information
* Symfony code is in `project` folder.
* Symfony Console : `docker exec -u project -i symfony-test-php project/bin/console`.
* Composer : `docker exec -u project -i symfony-test-php composer -d project`.
* If you want to use Xdebug and you are using Docker Desktop -> change `xdebug.client_host` at `docker/config/php/override-php.ini`

## Good luck!
