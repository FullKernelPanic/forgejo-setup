FROM mariadb:12.3.2 AS base

ARG DATABASE_FORGEJO_USER
ARG DATABASE_FORGEJO_PASSWORD
ARG DATABASE_FORGEJO_DBNAME

RUN echo ${DATABASE_FORGEJO_USER}
RUN echo ${DATABASE_FORGEJO_PASSWORD}
RUN echo ${DATABASE_FORGEJO_DBNAME}

COPY .docker/database/init-db.tmpl.sql /docker-entrypoint-initdb.d/1.sql

RUN sed -i "s/\${DATABASE_FORGEJO_USER}/${DATABASE_FORGEJO_USER}/" /docker-entrypoint-initdb.d/1.sql && \
    sed -i "s/\${DATABASE_FORGEJO_PASSWORD}/${DATABASE_FORGEJO_PASSWORD}/" /docker-entrypoint-initdb.d/1.sql && \
    sed -i "s/\${DATABASE_FORGEJO_DBNAME}/${DATABASE_FORGEJO_DBNAME}/" /docker-entrypoint-initdb.d/1.sql

