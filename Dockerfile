FROM node:14.4.0
MAINTAINER PPC Analytics Devops Team
LABEL name="Ppc Analytics Frontend Node JS Image"

#RUN apk update && apk install -y
RUN apt-get -y update 
RUN apt-get -y upgrade
RUN apt-get -y install

ARG build_version
ENV ppc_build_version=$build_version

RUN mkdir -p /usr/src/app
#RUN adduser --disabled-password -u 8877 '' ppctoolbox
COPY . /usr/src/app/
WORKDIR /usr/src/app/application
RUN npm install -y
RUN npm fund
RUN npm audit fix -force
EXPOSE 80
#USER ppctoolbox
ENTRYPOINT ["/usr/src/app/application/container-startup.sh"]
