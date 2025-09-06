FROM alpine:3.22.1

RUN apk add --no-cache dnsmasq

COPY dnsmasq.conf dnsmasq.d /etc/
COPY ipxe pxelinux memtest /var/lib/tftp/
COPY pxelinux.cfg /var/lib/tftp/pxelinux/

VOLUME /etc/dnsmasq.d
EXPOSE 67/udp

ENTRYPOINT ["dnsmasq", "--no-daemon"]
CMD ["--dhcp-range=0.0.0.0,proxy"]
