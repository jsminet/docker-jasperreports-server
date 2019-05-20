FROM ubuntu:18.04
LABEL maintainer="JS Minet"

ENV JS_EE_VERSION 7.1.1
ENV JS_EE_HOME /opt/jasperreports-server-${JS_EE_VERSION}
ENV PATH $PATH:${JS_EE_HOME}

RUN apt-get update && apt-get install -y wget \
	&& wget --progress=bar:force:noscroll -O jasperreports-server-linux-x64-installer.run "https://edownloads.tibco.com/Installers/tap/js-jrs-dev/${JS_EE_VERSION}/TIB_js-jrs_${JS_EE_VERSION}_linux_x86_64.run?SJCDPTPG=1560448858_e9a4ff484a6948c284de29e3af4b8d33&ext=.run" \
	&& chmod a+x jasperreports-server-linux-x64-installer.run \
	&& /jasperreports-server-linux-x64-installer.run --mode unattended --jasperLicenseAccepted yes --postgres_password Postgres1 \
	&& rm jasperreports-server-linux-x64-installer.run \
	&& rm -rf ${JS_EE_HOME}/apache-ant ${JS_EE_HOME}/apps ${JS_EE_HOME}/buildomatic \
			  ${JS_EE_HOME}/docs ${JS_EE_HOME}/eval-licenses ${JS_EE_HOME}/samples ${JS_EE_HOME}/scripts \
	&& rm ${JS_EE_HOME}/uninstall \
	&& apt-get clean

EXPOSE 8080 

CMD ctlscript.sh start && tail -f /dev/null