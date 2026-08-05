#!/bin/sh

# Генерируем секрет
if [ -z "$SECRET" ]; then
    SECRET=$(head -c 16 /dev/urandom | od -A n -t x1 | tr -d ' \n')
    echo "========================================="
    echo "Сгенерирован SECRET: $SECRET"
    echo "========================================="
fi

# Запускаем прокси
exec mtproto-proxy -p 8080 -s "$SECRET" -c 10000
