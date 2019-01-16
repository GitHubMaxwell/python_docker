#!/bin/bash

cp /usr/local/share/postgresql/postgresql.conf.sample /var/lib/postgresql/data/postgresql.conf

postgres &

sleep 10

source /democracylab_environment_variables.sh

python manage.py migrate


# Permissions should be u=rwx (0700) or u=rwx,g=rx (0750)