#!/bin/bash

# apk add python3-dev
# install env variables (not the right relative path)
# if the database exists delete it first and run these commands

source democracylab_environment_variables.sh

python manage.py migrate

# it wouldnt to access manage.py because its not in this service unless we volumize it and share it across services

#running privledged commands in pg container