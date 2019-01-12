FROM postgres:alpine

# WORKDIR /

# RUN mkdir 
# VOLUME ["/var/lib/postgresql/data","../python-app"]

COPY python-app /

# installing git and then pulling down the remote repo per container build to allow for updates extensibilities

# RUN pwd

# RUN ls

#install python 3
RUN apk add python3-dev

#rename python3 to python
RUN ln -s $(which python3) /bin/python
# check version of python
RUN python --version

#install python package manager/installer
RUN apk add py3-pip

# RUN pip install --upgrade pip

RUN apk add --no-cache gcc
RUN apk add --no-cache musl-dev
RUN pip3 install --no-cache-dir -r requirements.txt
# RUN apk add nodejs
RUN apk add --update nodejs nodejs-npm
# install node
RUN npm install
# install project dependencies
USER postgres
# change user to be "postgres"

RUN cp /usr/local/share/postgresql/postgresql.conf.sample /var/lib/postgresql/data/postgresql.conf 

# RUN postgres

# And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
# RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf
# RUN echo "listen_addresses='*'"


# USER root
# run postgres which needs user to be postgres
# after postgres installation chagne user back root
# sourcing env vars first
# have these commands in the same line in order to run in the same context and therefore share the env var otherwise the env state is destroyed

# change WORKDIR or something in order to 
# RUN source democracylab_environment_variables.sh && npm run build
# RUN cd ../../../
# RUN pwd

# install the ENV variables
# doesnt work / put in SH file

# RUN source democracylab_environment_variables.sh
# grab the shell commands to populate the postgres DB

# populate the database
# CMD ["python", "manage.py", "migrate"]
# RUN python manage.py migrate

EXPOSE 5432