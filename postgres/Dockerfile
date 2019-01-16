FROM postgres:alpine

# WORKDIR /

# VOLUME ["/var/lib/postgresql/data","../python-app"]

COPY python-app /
COPY init/migrate.sh /

# do this in the docker compose in the pg volumes
# COPY docker-entrypoint-initdb.d/migrate.sh docker-entrypoint-initdb.d

#install python 3
RUN apk add python3-dev

# rename python3 to python
RUN ln -s $(which python3) /bin/python
# check version of python
RUN python --version

#install python package manager/installer
RUN apk add py3-pip

# RUN pip install --upgrade pip

RUN apk add --no-cache gcc
RUN apk add --no-cache musl-dev
RUN pip3 install --no-cache-dir -r requirements.txt
# install node
RUN apk add --update nodejs nodejs-npm
# install project dependencies
RUN npm install
# change user to be "postgres"

# psql ocnfig files - not sure if you need
# RUN cp /usr/local/share/postgresql/postgresql.conf.sample /var/lib/postgresql/data/postgresql.conf

# RUN chown postgres /var/lib/postgresql/data/postgresql.conf
# -R for recursive
# 750 for octal permissions code
# RUN chmod -R 750 /var/lib/postgresql/data
# RUN chmod -R u=rwx,g=rx /var/lib/postgresql/data

# USER root

# import env variables
# RUN source democracylab_environment_variables.sh

# grab the shell commands to populate the postgres DB

# populate the database
# CMD ["python", "manage.py", "migrate"]
# RUN python manage.py migrate

# COPY init/*.sh /docker-entrypoint-initdb.d/

# wont run migrate.sh without this??
# ENTRYPOINT ??? initdb

# ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 5432

USER postgres
# CMD ["/bin/bash","/migrate.sh"]