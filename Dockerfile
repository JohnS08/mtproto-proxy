FROM alpine:latest

RUN apk add --no-cache mtproto-proxy

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV PORT=8080
ENV SECRET=

CMD ["/entrypoint.sh"]
