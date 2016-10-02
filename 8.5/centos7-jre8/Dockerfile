FROM andrescuadros/java:8u101-centos7
MAINTAINER Andres Cuadros "andrescuadros@gmail.com"

# Environment
ENV TOMCAT_MAJOR_VERSION=8 \
	TOMCAT_FULL_VERSION=8.5.5 \
	CATALINA_HOME=/opt/tomcat \
	PATH=$PATH:$CATALINA_HOME/bin

## Install tomcat:
# - Download tomcat
# - Unpack tomcat
# - Delete unnecesaries webapps
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

# Exposing ports
EXPOSE 8080

# Launch Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
