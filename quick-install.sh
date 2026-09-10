#!/bin/bash

# Beautiful Hyprland Configuration - Quick Install Script
# Быстрая установка конфигурации Hyprland с GitHub

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Detect language
LANG_CHOICE="en"
if [[ $1 == "--ru" ]] || [[ $1 == "-ru" ]]; then
    LANG_CHOICE="ru"
fi

# Language strings
if [ "$LANG_CHOICE" = "ru" ]; then
    MSG_WELCOME="╔════════════════════════════════════════════════════════════╗
║   Beautiful Hyprland Configuration - Быстрая установка   ║
╚════════════════════════════════════════════════════════════╝"
    MSG_CLONE="📥 Клонирование репозитория..."
    MSG_INSTALL="⚙️  Запуск установщика..."
    MSG_SUCCESS="✅ Установка успешно завершена!"
    MSG_ERROR="❌ Ошибка при установке"
    MSG_RESTART="🔄 Пожалуйста, перезагрузитесь или выполните:"
    MSG_CLEANUP="🧹 Очистка временных файлов..."
else
    MSG_WELCOME="╔════════════════════════════════════════════════════════════╗
║      Beautiful Hyprland Configuration - Quick Install     ║
╚════════════════════════════════════════════════════════════╝"
    MSG_CLONE="📥 Cloning repository..."
    MSG_INSTALL="⚙️  Running installer..."
    MSG_SUCCESS="✅ Installation completed successfully!"
    MSG_ERROR="❌ Installation error"
    MSG_RESTART="🔄 Please restart or run:"
    MSG_CLEANUP="🧹 Cleaning up temporary files..."
fi

echo -e "${BLUE}${MSG_WELCOME}${NC}\n"

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo -e "${RED}Git is not installed. Please install git first.${NC}"
    exit 1
fi

# Create temporary directory
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

echo -e "${GREEN}${MSG_CLONE}${NC}"
cd "$TEMP_DIR"
git clone https://github.com/dagtew12rqza61-hash/hyprland-beautiful-config.git
cd hyprland-beautiful-config

echo -e "${GREEN}${MSG_INSTALL}${NC}"
chmod +x install.sh

# Run installer with language option
if [ "$LANG_CHOICE" = "ru" ]; then
    bash install.sh --ru || {
        echo -e "${RED}${MSG_ERROR}${NC}"
        exit 1
    }
else
    bash install.sh || {
        echo -e "${RED}${MSG_ERROR}${NC}"
        exit 1
    }
fi

echo -e "${GREEN}${MSG_SUCCESS}${NC}\n"
echo -e "${YELLOW}${MSG_RESTART}${NC}"
echo -e "${BLUE}source ~/.bashrc${NC}\n"

if [ "$LANG_CHOICE" = "ru" ]; then
    echo "📖 Документация: README.md"
    echo "❓ Вопросы: FAQ.md"
    echo "⚡ Оптимизация: PERFORMANCE.md"
    echo ""
    echo "🚀 Быстрый старт:"
    echo "   1. Выйдите из текущей сессии"
    echo "   2. Выберите 'Hyprland' на экране входа"
    echo "   3. Нажмите Super + Q для открытия терминала"
else
    echo "📖 Documentation: README.md"
    echo "❓ Questions: FAQ.md"
    echo "⚡ Performance: PERFORMANCE.md"
    echo ""
    echo "🚀 Quick start:"
    echo "   1. Log out of current session"
    echo "   2. Select 'Hyprland' on login screen"
    echo "   3. Press Super + Q to open terminal"
fi

echo ""
echo -e "${GREEN}${MSG_CLEANUP}${NC}"
