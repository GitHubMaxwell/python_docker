FROM postgres:alpine

WORKDIR /src

# VOLUME ["/var/lib/postgresql/data","../python-app"]

COPY python-app /src

# installing git and then pulling down the remote repo per container build to allow for updates extensibilities

RUN pwd

RUN ls

RUN apk add python3-dev
RUN ln -s $(which python3) /bin/python
RUN python --version
RUN apk add py3-pip 
# RUN pip install --upgrade pip

RUN apk add --no-cache gcc
RUN apk add --no-cache musl-dev
RUN pip3 install --no-cache-dir -r requirements.txt
# RUN apk add nodejs
RUN apk add --update nodejs nodejs-npm
RUN npm install
USER postgres
RUN postgres
USER root
# sourcing env vars first
# have these commands in the same line in order to run in the same context and therefore share the env var otherwise the env state is destroyed
RUN source democracylab_environment_variables.sh && npm run build

# CMD ["python3", "manage.py", "runserver"]

RUN python3 manage.py migrate

EXPOSE 5432