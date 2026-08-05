#!/bin/sh

# Переходим в каталог с приложением
cd /app

# Генерируем секретный ключ, если он не задан
if [ -z "$SECRET" ]; then
    SECRET=$(head -c 16 /dev/urandom | xxd -ps)
    echo "========================================="
    echo "Сгенерирован SECRET: $SECRET"
    echo "========================================="
fi

# Запускаем прокси с правильными параметрами
# Вместо -s используем --secret
# Вместо -p используем --port
exec ./mtproto-proxy \
    --port=8080 \
    --secret="$SECRET" \
    --workers=4 \
    --max-connections=10000
