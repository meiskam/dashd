FROM alpine:3.6
LABEL maintainer="meiskam"
RUN apk add --update curl tcpdump beep && rm -rf /var/cache/{apk,tcpdump,beep}/*
ADD dashd.sh /tmp/
ENTRYPOINT ["/tmp/dashd.sh"]
