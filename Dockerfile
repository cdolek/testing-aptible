# Dockerfile
FROM quay.io/aptible/nodejs:v0.10.x

# Install Meteor
RUN apt-install curl procps
RUN curl https://install.meteor.com/ | sh

# Install `meteor build` dependencies
RUN apt-install python build-essential

ADD . /app
WORKDIR /app

RUN meteor build --directory .
WORKDIR /app/bundle/programs/server
RUN npm install

ENV PORT 3000
EXPOSE 3000
