FROM postgres:16-alpine

# This is necessary. Otherwise the data written to the container will not be part of the created image.
RUN mkdir -p /var/lib/postgresql-static/data
ENV PGDATA=/var/lib/postgresql-static/data