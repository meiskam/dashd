FROM alpine:3.6
LABEL maintainer="meiskam"
RUN apk add --update curl tcpdump && rm -rf /var/cache/{apk,tcpdump}/*
ADD dashd.sh /tmp/
ENTRYPOINT ["/tmp/dashd.sh"]
