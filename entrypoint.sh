#!/bin/bash

until nc -z mysql-outrider 3306; do
    echo "$(date) - waiting for mysql..."
    sleep 1
done

echo "Setting directory permissions";
chown -R www-data.www-data /var/www/web && chmod 775 /var/www/web;

echo "directory permissions set";

exec "$@"
