FROM ubuntu:latest

ENV TS_VERSION=3.11.0

RUN apt-get update && \
    apt-get install wget -yqq && \
    apt-get install netcat -yqq && \
    wget -O /tmp/teamspeak3.tar.bz2 https://files.teamspeak-services.com/releases/server/$TS_VERSION/teamspeak3-server_linux_amd64-$TS_VERSION.tar.bz2 && \
    tar -xf /tmp/teamspeak3.tar.bz2 && \
    rm -f /tmp/teamspeak3.tar.bz2 && \
    mkdir -p /var/lib/teamspeak && \
    ln -s /var/lib/teamspeak/ts3server.sqlitedb /var/lib/teamspeak/query_ip_whitelist.txt /teamspeak3-server_linux_amd64/ && \
    touch /teamspeak3-server_linux_amd64/.ts3server_license_accepted

WORKDIR /teamspeak3-server_linux_amd64

EXPOSE 10011
EXPOSE 30033
EXPOSE 9987/udp

CMD ["./ts3server_minimal_runscript.sh"]
