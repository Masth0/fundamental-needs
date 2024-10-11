FROM ubuntu:22.04 as ubuntu-22

ENV TERM=xterm-256color

RUN apt-get update && apt-get -y install sudo openssh-client
RUN useradd bloodynine --create-home --password password
RUN usermod -aG sudo bloodynine

USER bloodynine
WORKDIR /app

COPY ./scripts /app/scripts
COPY ./functions.sh /app
COPY ./install.sh /app