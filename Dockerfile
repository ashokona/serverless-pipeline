
FROM ubuntu:latest
USER root

RUN apt-get update
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN apt-get -y install nodejs
RUN apt-get install -y git

RUN npm install serverless -g
