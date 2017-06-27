FROM ubuntu:17.04
MAINTAINER JS Minet

ENV JASPER_EE_VERSION 6.2.0

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget \
	&& wget --progress=bar:force:noscroll -O jasperreports-server-linux-x64-installer.run https://d2ev2buidpvgfo.cloudfront.net/${JASPER_EE_VERSION}/Installers/jasperreports-server-${JASPER_EE_VERSION}-linux-x64-installer.run \
	&& chmod a+x jasperreports-server-linux-x64-installer.run \
	&& /jasperreports-server-linux-x64-installer.run --mode unattended --jasperLicenseAccepted yes --postgres_password Postgres1 \
	&& rm jasperreports-server-linux-x64-installer.run \
	&& apt-get clean

WORKDIR /opt/jasperreports-server-${JASPER_EE_VERSION}

EXPOSE 8080

CMD ctlscript.sh start && tail -f /dev/null
