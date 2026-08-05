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

# Запускаем прокси
# Проверяем, есть ли mtproto-proxy в текущей директории
if [ -f "./mtproto-proxy" ]; then
    echo "Запускаем mtproto-proxy..."
    exec ./mtproto-proxy -p 8080 -s "$SECRET" -c 10000
else
    # Если бинарник не найден, пробуем запустить из системного пути
    exec mtproto-proxy -p 8080 -s "$SECRET" -c 10000
fi
