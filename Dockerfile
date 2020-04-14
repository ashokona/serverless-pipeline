//FROM node:12-alpine
//RUN apk add -U subversion
//FROM ubuntu:18.04
//RUN apt update
//RUN apt install -y git
FROM ubuntu:latest
USER root
WORKDIR /home/app
COPY ./package.json /home/app/package.json
RUN apt-get update
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -
RUN apt-get -y install nodejs
