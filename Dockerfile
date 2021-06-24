FROM alpine:3.12.7 as build

WORKDIR /var/build

RUN apk add --no-cache musl-dev gcc make cmake pkgconf git libusb-dev librtlsdr-dev

RUN git clone https://github.com/antirez/dump1090.git; \
    cd dump1090; \
    make; 

FROM alpine:3.12.7

WORKDIR /

RUN apk add --no-cache libusb librtlsdr

COPY --from=build /var/build/dump1090 /usr/local/bin/

EXPOSE 30001
EXPOSE 30002
EXPOSE 30003
EXPOSE 8080

ENTRYPOINT ["dump1090", "--net", "--raw"]
