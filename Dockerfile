FROM ubuntu:22.04 as Ubuntu-test

RUN apt-get update && \
    apt-get -y install sudo

WORKDIR /app

COPY . /app
