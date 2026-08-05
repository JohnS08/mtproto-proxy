FROM serjs/telegram-mtproto-proxy:latest

ENV PORT=8080

CMD SECRET=$(head -c 16 /dev/urandom | xxd -ps) && \
    echo "=========================================" && \
    echo "Сгенерирован SECRET: $SECRET" && \
    echo "=========================================" && \
    echo "Ваша ссылка для подключения:" && \
    echo "tg://proxy?server=ВАШ_АДРЕС.render.com&port=443&secret=$SECRET" && \
    echo "=========================================" && \
    exec /usr/local/bin/mtproto-proxy -p 8080 -s $SECRET -c 10000
