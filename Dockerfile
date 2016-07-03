FROM ubuntu:14.04.4
MAINTAINER JS Minet

ENV jasperVersion 6.2.1

ADD http://netcologne.dl.sourceforge.net/project/jasperserver/JasperServer/JasperReports%20Server%20Community%20Edition%20${jasperVersion}/jasperreports-server-cp-${jasperVersion}-linux-x64-installer.run /home/root/
RUN chmod +x /home/root/jasperreports-server-cp-${jasperVersion}-linux-x64-installer.run
RUN /home/root/jasperreports-server-cp-${jasperVersion}-linux-x64-installer.run --mode unattended --jasperLicenseAccepted yes --postgres_password Postgres1
WORKDIR /opt/jasperreports-server-cp-${jasperVersion}
EXPOSE 8080

CMD ["ctlscript.sh","start"]
