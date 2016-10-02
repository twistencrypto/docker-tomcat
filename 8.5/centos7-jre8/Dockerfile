FROM andrescuadros/java:8u101-centos7
MAINTAINER Andres Cuadros "andrescuadros@gmail.com"

ENV TOMCAT_MAJOR_VERSION 8
ENV TOMCAT_FULL_VERSION 8.5.5

# Installing wget
RUN yum -y install wget

# Get Tomcat
RUN wget --quiet --no-cookies http://apache.rediris.es/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_FULL_VERSION}/bin/apache-tomcat-${TOMCAT_FULL_VERSION}.tar.gz -O /tmp/tomcat.tgz && \
tar xzvf /tmp/tomcat.tgz -C /opt && \
mv /opt/apache-tomcat-${TOMCAT_FULL_VERSION} /opt/tomcat && \
rm /tmp/tomcat.tgz && \
rm -rf /opt/tomcat/webapps/examples && \
rm -rf /opt/tomcat/webapps/docs && \
rm -rf /opt/tomcat/webapps/ROOT

# Add admin/admin user
ADD tomcat-users.xml /opt/tomcat/conf/
ADD manager.xml /opt/tomcat/conf/Catalina/localhost/

ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080

WORKDIR /opt/tomcat

# Launch Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
