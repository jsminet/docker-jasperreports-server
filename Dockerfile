FROM ubuntu:14.04.4
MAINTAINER JS Minet

ENV jasperVersion 6.2.0

ADD https://d2ev2buidpvgfo.cloudfront.net/${jasperVersion}/Installers/jasperreports-server-${jasperVersion}-linux-x64-installer.run /home/root/

RUN chmod a+x /home/root/jasperreports-server-${jasperVersion}-linux-x64-installer.run

RUN /home/root/jasperreports-server-${jasperVersion}-linux-x64-installer.run --mode unattended --jasperLicenseAccepted yes --postgres_password Postgres1

WORKDIR /opt/jasperreports-server-${jasperVersion}

EXPOSE 8080

CMD sh ctlscript.sh start && /bin/bash
