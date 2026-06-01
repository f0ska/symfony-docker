#!/bin/sh
set -eu

app_dir=${SYMFONY_APP_DIR:-project}
install_on_start=${SYMFONY_INSTALL_ON_START:-1}
symfony_version=${SYMFONY_VERSION:-7.4}

if [ "$install_on_start" = "1" ] && [ ! -f "/var/www/${app_dir}/composer.json" ]; then
    symfony new "$app_dir" --webapp --version="$symfony_version"
fi

exec docker-php-entrypoint "$@"
