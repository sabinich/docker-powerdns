FROM alpine:latest




EXPOSE 53/tcp 53/udp

ENTRYPOINT ["/entrypoint.sh"]
