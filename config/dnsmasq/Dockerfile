FROM debian:stable-slim

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y dnsmasq

RUN addgroup dnsmasq
RUN adduser --system --no-create-home dnsmasq 


ENTRYPOINT systemctl --no-daemon -C /etc/dnsmasq.conf
