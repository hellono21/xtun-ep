FROM alpine:3.5

RUN apk add bash iptables --no-cache

COPY rootfs /

EXPOSE 443/udp

CMD ["/opt/xtun/entry.sh"]
