#!/bin/bash

apk add python3-dev
# dont need makemigrations
# python manage.py makemigrations && 
python manage.py migrate

# it wouldnt to access manage.py because its not in this service unless we volumize it and share it accross services