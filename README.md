# Dockerfile for Tibco Jasper Reports Server
Jasper reports server community and enterprise trial dockerisation

## Introduction
This dockerfile use the jasper server unattend installation mode.
All the needed components are already packaged (Apache tomcat, Oracle java virtual machine and postgres database)

The resulting images should be use for testing purpose only (See [my docker hub](https://hub.docker.com/r/jsminet/docker-jasperreports-server/))

## Usage
#### Community edition
$ docker run -itd -p 8080:8080 jsminet/docker-jasperreports-server:latest

Then open a browser and go to http://192.168.99.100:8080/jasperserver-pro

#### Enterprise trial edition
$ docker run -itd -p 8080:8080 jsminet/docker-jasperreports-server:EE/6.3.0

Then open a browser and go to http://192.168.99.100:8080/jasperserver
