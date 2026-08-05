FROM telegrammessenger/proxy

# Генерируем секрет при запуске
ENV SECRET=$(head -c 16 /dev/urandom | od -A n -t x1 | tr -d ' \n')

# Запускаем прокси
CMD /usr/bin/mtproto-proxy -p 8080 -s "$SECRET" -c 10000
