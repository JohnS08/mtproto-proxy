#!/bin/sh

# Переходим в каталог с приложением
cd /app

# Проверяем, где находится mtproto-proxy
PROXY_PATH=$(find / -name "mtproto-proxy" -type f 2>/dev/null | head -1)

if [ -z "$PROXY_PATH" ]; then
    echo "Ошибка: mtproto-proxy не найден!"
    echo "Ищем в стандартных директориях..."
    ls -la /usr/bin/ | grep mtproto
    ls -la /usr/local/bin/ | grep mtproto
    exit 1
fi

echo "Найден mtproto-proxy по пути: $PROXY_PATH"

# Генерируем секретный ключ, если он не задан
if [ -z "$SECRET" ]; then
    SECRET=$(head -c 16 /dev/urandom | od -A n -t x1 | tr -d ' \n')
    echo "========================================="
    echo "Сгенерирован SECRET: $SECRET"
    echo "========================================="
fi

# Запускаем прокси
exec $PROXY_PATH -p 8080 -s "$SECRET" -c 10000
