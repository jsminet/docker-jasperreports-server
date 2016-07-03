FROM ubuntu:15.04
MAINTAINER JS Minet

ENV jasperEEVersion 6.2.0

ADD https://d2ev2buidpvgfo.cloudfront.net/${jasperVersion}/Installers/jasperreports-server-${jasperEEVersion}-linux-x64-installer.run /home/root/

RUN chmod a+x /home/root/jasperreports-server-${jasperEEVersion}-linux-x64-installer.run

RUN /home/root/jasperreports-server-${jasperEEVersion}-linux-x64-installer.run --mode unattended --jasperLicenseAccepted yes --postgres_password Postgres1

WORKDIR /opt/jasperreports-server-${jasperEEVersion}

EXPOSE 8080

CMD sh ctlscript.sh start && /bin/bash
