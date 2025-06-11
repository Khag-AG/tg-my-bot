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

# Порт для Railway
EXPOSE $PORT

# Запускаем
CMD python -m FileStream