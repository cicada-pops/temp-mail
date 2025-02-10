#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}Установка Temp-mail...${NC}\n"

# Функция для установки через Homebrew
install_with_brew() {
    if [ "$EUID" -eq 0 ]; then
        echo -e "${RED}Homebrew не должен запускаться от root. Пожалуйста, запустите скрипт без sudo${NC}"
        exit 1
    fi
    brew install python3 curl
    return $?
}

# Функция для установки через другие пакетные менеджеры
install_with_other() {
    if [ "$EUID" -ne 0 ]; then 
        echo -e "${RED}Для установки требуются права суперпользователя${NC}"
        exit 1
    fi
    
    if command -v apt-get &> /dev/null; then
        apt-get update
        apt-get install -y python3 curl
    elif command -v yum &> /dev/null; then
        yum install -y python3 curl
    elif command -v pacman &> /dev/null; then
        pacman -Sy python curl
    else
        echo -e "${RED}Не удалось определить пакетный менеджер${NC}"
        exit 1
    fi
}

# Определяем способ установки
if command -v brew &> /dev/null; then
    install_with_brew
else
    install_with_other
fi

echo "Скачиваем Temp-mail..."
INSTALL_DIR="$HOME/.local/bin"
mkdir -p "$INSTALL_DIR"

curl -s -L https://raw.githubusercontent.com/cicada-pops/temp-mail/main/temp-mail -o "$INSTALL_DIR/temp-mail"
chmod +x "$INSTALL_DIR/temp-mail"

# Добавляем путь в PATH, если его там нет
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
    echo 'Добавлен путь в .bashrc'
    # Также добавляем в .zshrc, если он существует
    if [ -f "$HOME/.zshrc" ]; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.zshrc"
        echo 'Добавлен путь в .zshrc'
    fi
fi

echo -e "\n${GREEN}Temp-mail успешно установлен!${NC}"
echo "Чтобы начать использовать temp-mail, либо перезапустите терминал, либо выполните:"
echo "export PATH=\"\$HOME/.local/bin:\$PATH\""
echo "После этого запустите командой: temp-mail" 
