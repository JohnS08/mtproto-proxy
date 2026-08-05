FROM telegrammessenger/proxy:latest

# Устанавливаем необходимые утилиты
RUN apt-get update && apt-get install -y xxd && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENV PORT=8080

CMD ["/app/entrypoint.sh"]
