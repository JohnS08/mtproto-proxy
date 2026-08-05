FROM telegrammessenger/proxy:latest

ENV PORT=8080
ENV SECRET=

CMD ./entrypoint.sh
