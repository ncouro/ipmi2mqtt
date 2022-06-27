FROM alpine:latest

RUN apk add --no-cache ipmitool jo mosquitto-clients

ADD ipmi2mqtt.sh .

CMD ["./ipmi2mqtt.sh"]
