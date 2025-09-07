FROM alpine:3.22.1

RUN apk add --no-cache dnsmasq

COPY etc /etc/
COPY tftp /var/lib/tftp/

VOLUME /etc/dnsmasq.d
EXPOSE 67/udp

ENTRYPOINT ["dnsmasq", "--keep-in-foreground"]
CMD ["--dhcp-range=0.0.0.0,proxy"]
