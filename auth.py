#!/usr/bin/env python3
"""
Скрипт для первичной авторизации в Telegram
Используйте его локально перед развертыванием на Railway
"""

import os
import asyncio
from pyrogram import Client

# Конфигурация
API_ID = 25851310
API_HASH = "6e623f9734f999d0ca50f8b9d81247ae"
BOT_TOKEN = "8100386629:AAGr3hwt9EoeGRRiubIJwIYOSJ1qLKtB9h8"
SESSION_NAME = "filestream_bot"

async def main():
    print("🔐 Авторизация FileStream Bot")
    print("=" * 40)
    print()
    
    # Создаем клиент
    app = Client(
        SESSION_NAME,
        api_id=API_ID,
        api_hash=API_HASH,
        bot_token=BOT_TOKEN,
        workdir="sessions/"
    )
    
    # Создаем папку для сессий
    os.makedirs("sessions", exist_ok=True)
    
    print("📱 Подключаемся к Telegram...")
    
    async with app:
        me = await app.get_me()
        print(f"✅ Успешно авторизован как: @{me.username}")
        print(f"🤖 Имя бота: {me.first_name}")
        print()
        print("💾 Сессия сохранена в папку 'sessions/'")
        print("📤 Теперь загрузите эту папку на Railway")
    
    print()
    print("✨ Готово! Следующие шаги:")
    print("1. Закоммитьте папку 'sessions' в git")
    print("2. Запушьте в GitHub")
    print("3. Railway автоматически обновится")

if __name__ == "__main__":
    asyncio.run(main())