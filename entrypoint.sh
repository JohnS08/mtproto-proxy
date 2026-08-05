#!/bin/sh

# Генерируем секретный ключ, если он не задан
if [ -z "$SECRET" ]; then
    SECRET=$(head -c 16 /dev/urandom | xxd -ps)
    echo "Сгенерирован новый SECRET: $SECRET"
fi

# Запускаем прокси с указанием порта
exec ./mtproto-proxy \
    -p 8080 \
    -s "$SECRET" \
    -c 10000 \
    -a 0.0.0.0:8080
