# Simple Docker Symfony environment

This repository provides a small Docker environment for creating and running a local Symfony application.

## Requirements

- Docker
- Docker Compose v2 (`docker compose`)

## Quick start

Generate local configuration:

```sh
./setup --version 7 --php latest
```

Start the environment:

```sh
docker compose up -d --build
```

On first PHP container startup, Symfony is installed automatically into `project/` when `project/composer.json` does not exist.

Open the app:

- `http://localhost:8880/`
- `https://localhost:8843/`

## Version options

`setup` validates Symfony and PHP compatibility:

```sh
./setup --version 6.4 --php minimum
./setup --version 7 --php latest
./setup --version 8 --php 8.4
```

Supported Symfony aliases:

- `6` or `6.4`
- `7` or `7.4`
- `8` or `8.1`

The generated `.env` file is local-only and ignored by Git. Committed defaults live in `.env.dist`.

## Helper commands

Run tools inside the PHP container:

```sh
./composer install
./console cache:clear
./symfony check:requirements
```

Manual Symfony installation is still available:

```sh
./install
```

## Useful information

- Symfony code lives in `project/` by default.
- Runtime data lives in `docker/data/` and `docker/var/`.
- To change ports, project name, PHP version, Symfony version, or MariaDB version, edit `.env` or rerun `./setup`.
- For Xdebug on Docker Desktop, adjust `xdebug.client_host` in `docker/config/php/override-php.ini`.
