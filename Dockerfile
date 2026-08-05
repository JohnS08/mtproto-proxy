FROM telegrammessenger/proxy:latest

# Создаем рабочий каталог
WORKDIR /app

# Копируем entrypoint.sh в контейнер
COPY entrypoint.sh /app/entrypoint.sh

# Делаем файл исполняемым
RUN chmod +x /app/entrypoint.sh

# Устанавливаем переменные окружения
ENV PORT=8080
ENV SECRET=

# Запускаем скрипт
CMD ["/app/entrypoint.sh"]
