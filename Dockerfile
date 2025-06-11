FROM python:3.10-slim

WORKDIR /app

# Установка зависимостей
RUN apt-get update && apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Клонируем репозиторий FileStreamBot
RUN git clone https://github.com/avipatilpro/FileStreamBot.git .

# Устанавливаем Python зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем нашу сессию
COPY sessions/ /app/sessions/

# Создаем конфиг
RUN echo "from os import environ" > config.py && \
    echo "API_ID = int(environ.get('API_ID', 0))" >> config.py && \
    echo "API_HASH = environ.get('API_HASH', '')" >> config.py && \
    echo "BOT_TOKEN = environ.get('BOT_TOKEN', '')" >> config.py && \
    echo "OWNER_ID = int(environ.get('OWNER_ID', 0))" >> config.py && \
    echo "LOG_CHANNEL = int(environ.get('LOG_CHANNEL', 0))" >> config.py && \
    echo "PORT = int(environ.get('PORT', 8080))" >> config.py

# Порт для Railway
EXPOSE $PORT

# Правильная команда запуска
CMD python bot.py