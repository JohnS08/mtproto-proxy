FROM telegrammessenger/proxy:latest

ENV PORT=8080
ENV SECRET=

CMD ./entrypoint.sh

RUN chmod +x /entrypoint.sh
