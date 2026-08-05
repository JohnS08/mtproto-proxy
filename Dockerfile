FROM ubuntu:22.04

# Переключаемся на root для установки пакетов
USER root

# Устанавливаем необходимые утилиты
RUN apt-get update && \
    apt-get install -y wget xxd curl && \
    rm -rf /var/lib/apt/lists/*

# Скачиваем бинарник mtproto-proxy
RUN wget -O /mtproto-proxy https://github.com/TelegramMessenger/MTProxy/raw/master/mtproto-proxy && \
    chmod +x /mtproto-proxy

# Генерируем секрет и запускаем
CMD SECRET=$(head -c 16 /dev/urandom | xxd -ps) && \
    echo "=========================================" && \
    echo "Сгенерирован SECRET: $SECRET" && \
    echo "=========================================" && \
    exec /mtproto-proxy -p 8080 -s $SECRET -c 10000
