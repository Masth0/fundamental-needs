FROM ubuntu:22.04 as ubuntu-22

ARG USERNAME=bloodynine
ARG PASSWORD=bloodynine
ENV TERM=xterm-256color

RUN apt-get update && apt-get -y install sudo openssh-client
RUN useradd --create-home -p "$(openssl passwd -1 $PASSWORD)" $USERNAME
RUN usermod -aG sudo $USERNAME

USER $USERNAME
WORKDIR /app

COPY ./scripts /app/scripts
COPY ./functions.sh /app
COPY ./install.sh /app