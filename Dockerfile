FROM node:alpine as docker-node-gitbook
LABEL maintainer_name="Roger R Reyes M."
LABEL maintainer_email="r3m@tundervirld.com"
LABEL build_date="31-01-2020"
COPY . /docker-node-gitbook
WORKDIR /docker-node-gitbook
RUN npm update && npm install -g gitbook-cli