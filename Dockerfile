
FROM ubuntu:latest
USER root

RUN apt-get clean
RUN apt-get update
RUN apt-get -y install curl gnupg unzip
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN apt-get -y install nodejs
RUN apt-get install -y git

RUN npm install serverless -g


RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
