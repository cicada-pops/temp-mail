#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}Установка Temp-mail...${NC}\n"

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
elif command -v brew &> /dev/null; then
    brew install python3 curl
else
    echo -e "${RED}Не удалось определить пакетный менеджер${NC}"
    exit 1
fi

echo "Скачиваем Temp-mail..."
curl -s -L https://github.com/cicada-pops/temp-mail/temp-mail -o /usr/local/bin/temp-mail
chmod +x /usr/local/bin/temp-mail

echo -e "\n${GREEN}Temp-mail успешно установлен!${NC}"
echo "Запустите командой: temp-mail" 