FROM node:12-alpine
RUN apk add -U subversion
FROM ubuntu:18.04
RUN apt update
RUN apt install -y git
