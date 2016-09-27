#!/bin/sh
# remove previous images and containers
docker ps -a | grep acs/tomcat:8.5-centos-jre8 | awk '{print $1}' | xargs docker rm
docker rmi -f acs/tomcat:8.5-centos-jre8

# build the image
docker build --tag="acs/tomcat:8.5-centos-jre8" .


