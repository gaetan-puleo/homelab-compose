FROM debian:stable-slim

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y dnsmasq

ENTRYPOINT systemctl start dnsmasq
