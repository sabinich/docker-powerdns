FROM alpine:latest


RUN apk --update add libpq sqlite-libs libstdc++ libgcc && \
    apk add --virtual build-deps g++ make sqlite-dev curl boost-dev 
RUN curl -sSL https://github.com/PowerDNS/pdns/archive/auth-4.1.13.tar.gz | tar xz -C /tmp && \
    cd /tmp/pdns-auth-4.1.13 && \
    ./configure --prefix="" --exec-prefix=/usr --sysconfdir=/etc/pdns --with-modules="gsqlite3" --without-lua &&

EXPOSE 53/tcp 53/udp

ENTRYPOINT ["/entrypoint.sh"]
