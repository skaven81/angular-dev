FROM node:slim

RUN apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y -q locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Setup sample project using Angular-CLI
RUN npm --progress false --verbose install -g @angular/cli

RUN ng new my-app

WORKDIR /my-app
EXPOSE 4200

CMD ng serve --host 0.0.0.0 --port 4200
