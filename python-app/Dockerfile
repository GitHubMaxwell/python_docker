FROM python:3.4.9-alpine3.7
# is this correct version is 3.4.3

LABEL maintainer = "Maxwell Rediker <maxwell.rediker@gmail.com>"

ENV PORT 3000

WORKDIR /app

COPY requirements.txt ./
RUN apk add python3-dev
# /usr/local/include/python3.4m/Python.h:11:20: fatal error: limits.h: No such file or directory
#include <limits.h>

RUN apk add --no-cache postgresql-dev
# this to solve the Error: pg_config executable not found.
# Please add the directory containing pg_config to the PATH
# or specify the full executable path with the option:
# python setup.py build_ext --pg-config /path/to/pg_config build ...
# or with the pg_config option in 'setup.cfg'.

RUN apk add --no-cache gcc
# unable to execute 'gcc': No such file or directory
# error: command 'gcc' failed with exit status 1

RUN apk add --no-cache musl-dev
# https://www.musl-libc.org/

# RUN apk add --no-cache linux-headers
# /usr/local/include/python3.4m/Python.h:11:20: fatal error: limits.h: No such file or directory
#include <limits.h>

RUN pip install --no-cache-dir -r requirements.txt

COPY ./* /app/

# node and npm
RUN apk add --no-cache nodejs

# RUN npm install --production
RUN npm install

COPY webpack.config.js /app
COPY manage.py /app
# COPY .env /app

RUN npm run build
# have this run the build

# CMD ["python", "manage.py"]
# this command should be spinning up the server

# RUN exec commands in alpine apk-get
# migrate the database over 
# source ~/Desktop/democracylab_environment_variables.sh

# source ~/git/virtualenv/bin/activate

# cd ~/git/CivicTechExchange

# history -a && gnome-terminal

# python manage.py runserver
