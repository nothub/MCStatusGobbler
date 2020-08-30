FROM ubuntu:20.04

MAINTAINER blockparole@national.shitposting.agency

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -qy update \
  && apt-get -qy upgrade

RUN apt-get install -y --no-install-recommends python3 python3-pip \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get -qy clean \
  && apt-get -qy autoremove

WORKDIR /app
COPY gobbler.py /app
COPY run.sh /app
COPY servers.txt /app

VOLUME /log

RUN pip3 install --no-cache-dir mcstatus

CMD [ "./run.sh" ]
