FROM alpine:latest

# Устанавливаем curl для проверки
RUN apk add --no-cache curl

# Просто выводим приветствие и запускаем бесконечный цикл, чтобы сервис не завершался
CMD echo "MTProto Proxy Test" && tail -f /dev/null
