FROM node:12-alpine
FROM ubuntu:18.04
RUN apt update
RUN apt install -y git
RUN apk add -U subversion
