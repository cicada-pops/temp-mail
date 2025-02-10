# Temp-mail CLI

Простой инструмент командной строки для создания временной электронной почты и получения писем в реальном времени.

## Возможности

- Автоматическое создание временного email-адреса
- Получение писем в реальном времени
- Генерация случайных имен пользователей

## Установка

### Автоматическая установка

```bash
curl -s -L https://raw.githubusercontent.com/cicada-pops/temp-mail/main/install.sh | bash
```

### Ручная установка

1. Убедитесь, что у вас установлены необходимые зависимости:

   - Python 3
   - curl
2. Скачайте скрипт:

```bash
curl -s -L https://raw.githubusercontent.com/cicada-pops/temp-mail/main/temp-mail -o ~/.local/bin/temp-mail
```

```bash
chmod +x ~/.local/bin/temp-mail
```

3. Добавьте путь в PATH:

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
```

```bash
source ~/.bashrc
```

## Использование

Просто запустите команду:

```bash
temp-mail
```


После запуска скрипт автоматически:

1. Создаст временный email-адрес
2. Покажет его на экране
3. Начнет ожидать входящие письма
4. При получении нового письма выведет его содержимое

## Поддерживаемые системы

- Linux
- macOS
- WSL (Windows Subsystem for Linux)

## Зависимости

- Python 3
- curl

## Вклад в проект

Если вы нашли баг или у вас есть предложения по улучшению, пожалуйста, создайте issue или pull request.
