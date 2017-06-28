FROM ubuntu:17.04
MAINTAINER JS Minet

ENV JS_EE_VERSION 6.3.0
ENV JS_EE_HOME /opt/jasperreports-server-${JS_EE_VERSION}
ENV PATH $PATH:${JS_EE_HOME}

RUN apt-get update && apt-get install -y wget \
	&& wget --progress=bar:force:noscroll -O jasperreports-server-linux-x64-installer.run https://d2ev2buidpvgfo.cloudfront.net/6.3/Installers/jasperreports-server-${JS_EE_VERSION}-linux-x64-installer.run \
	&& chmod a+x jasperreports-server-linux-x64-installer.run \
	&& /jasperreports-server-linux-x64-installer.run --mode unattended --jasperLicenseAccepted yes --postgres_password Postgres1 \
	&& rm jasperreports-server-linux-x64-installer.run \
	&& rm -rf ${JS_EE_HOME}/apache-ant ${JS_EE_HOME}/apps ${JS_EE_HOME}/buildomatic \
			  ${JS_EE_HOME}/docs ${JS_EE_HOME}/eval-licenses ${JS_EE_HOME}/samples ${JS_EE_HOME}/scripts \
	&& rm ${JS_EE_HOME}/TIBCO-EULA.txt ${JS_EE_HOME}/uninstall \
	&& apt-get clean

EXPOSE 8080 

CMD ctlscript.sh start && tail -f /dev/null