#!/bin/bash

# Генерируем секрет, если он не задан
if [ -z "$SECRET" ]; then
    SECRET=$(head -c 16 /dev/urandom | xxd -ps)
    echo "========================================="
    echo "Сгенерирован SECRET: $SECRET"
    echo "========================================="
fi

# Проверяем, существует ли бинарник
if [ -f "/usr/bin/mtproto-proxy" ]; then
    PROXY_PATH="/usr/bin/mtproto-proxy"
elif [ -f "/usr/local/bin/mtproto-proxy" ]; then
    PROXY_PATH="/usr/local/bin/mtproto-proxy"
else
    echo "mtproto-proxy не найден!"
    find / -name "mtproto-proxy" 2>/dev/null
    exit 1
fi

echo "Запуск прокси с секретом: $SECRET"
echo "Порт: $PORT"

# Запускаем с правильными параметрами
exec $PROXY_PATH -p $PORT -s $SECRET -c 10000
