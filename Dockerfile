FROM alpine:latest

RUN apk add --no-cache ipmitool


CMD ["ipmitool", "sensor"]
