FROM alpine:latest

RUN apk add pdns-backend-sqlite3
RUN mkdir -p  /etc/pdns/conf.d

ADD https://raw.githubusercontent.com/PowerDNS/pdns/7a0bef6560e7b589d74b22ff9667fa621c787e6d/modules/gsqlite3backend/schema.sqlite3.sql /etc/pdns
RUN sqlite3 /etc/pdns/powerdns.sqlite < /etc/pdns/schema.sqlite3.sql 
ADD pdns.conf /etc/pdns/
ADD entrypoint.sh /

EXPOSE 53/tcp 53/udp

ENTRYPOINT ["/entrypoint.sh"]
