FROM telegrammessenger/proxy:latest

# Этот образ сам генерирует секрет и выводит ссылку.
# Ему не нужен entrypoint.sh, просто запускаем.
# Render назначит порт автоматически.
CMD []
