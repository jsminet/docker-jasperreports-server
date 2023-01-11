FROM phusion/baseimage:jammy-1.0.1
LABEL maintainer="JS Minet"

ARG PASSWORD=postgres
ENV JS_EE_VERSION 8.1.1
ENV JS_EE_HOME /opt/jasperreports-server-${JS_EE_VERSION}
ENV PATH $PATH:${JS_EE_HOME}

CMD ["/sbin/my_init"]

RUN apt-get update && apt-get install -y wget \
	&& wget --progress=bar:force:noscroll -O jasperreports-server-linux-x64-installer.run "https://edownloads.tibco.com/Installers/tap/js-jrs-dev/${JS_EE_VERSION}/TIB_js-jrs-dev_${JS_EE_VERSION}_linux_x86_64.run?SJCDPTPG=1675972559_c3bde7a3b48336c0f56c67c465b29437&ext=.run" \
	&& chmod a+x jasperreports-server-linux-x64-installer.run \
	&& /jasperreports-server-linux-x64-installer.run \
	--mode unattended \
	--jasperLicenseAccepted yes \
	--postgres_password ${PASSWORD} \
	--chromium_folder_windows C: \
	--chromium_folder_unix /usr/var \
	--postgres_installation_type bundled \
	--tomcat_installation_type bundled \
	&& rm jasperreports-server-linux-x64-installer.run \
	&& rm -rf ${JS_EE_HOME}/apache-ant ${JS_EE_HOME}/apps ${JS_EE_HOME}/buildomatic \
			  ${JS_EE_HOME}/docs ${JS_EE_HOME}/eval-licenses ${JS_EE_HOME}/samples ${JS_EE_HOME}/scripts \
	&& rm ${JS_EE_HOME}/uninstall \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN ["ctlscript.sh", "start"]