FROM ubuntu
MAINTAINER Tom Nielsen <tomn@openbrain.org>

RUN apt-get update

RUN apt-get install -y postgresql libgmp3-dev zlib1g-dev 

RUN mkdir -p /opt/keter/bin
RUN mkdir /opt/keter/etc

ADD keter-1.1.0.1 /opt/keter/bin/keter
ADD keter-config.yaml /opt/keter/etc/keter-config.yaml
ADD bundles/ /opt/keter/incoming/

EXPOSE 80

CMD ["/opt/keter/bin/keter", "/opt/keter/etc/keter-config.yaml"]