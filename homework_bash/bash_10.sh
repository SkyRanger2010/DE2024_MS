#!/bin/bash

# Настройка cron для автоматического выполнения:
#    crontab -e  -> добавить строку вида:
#    0 2 * * * /путь_к_скрипту/bash.sh /путь_к_директории
#   каждую ночь в 2 часа утра
#
#

# Проверка наличия аргумента
if [ -z "$1" ]; then
    echo "Использование: $0 <директория>"
    exit 1
fi

# Путь к директории, переданный параметром
SOURCE_DIR="$1"

# Папки для сортировки в пределах указанной директории
IMAGES_DIR="$SOURCE_DIR/Images"
DOCUMENTS_DIR="$SOURCE_DIR/Documents"

# Лог-файл
LOG_FILE="$SOURCE_DIR/auto_sort.log"

# Создание папок, если они еще не существуют
mkdir -p "$IMAGES_DIR"
mkdir -p "$DOCUMENTS_DIR"

# Запись даты в лог
echo "Сортировка файлов начата: $(date)" >> "$LOG_FILE"

# Перемещение файлов
for file in "$SOURCE_DIR"/*; do
    if [ -f "$file" ]; then
        case "${file,,}" in
            *.jpg|*.png|*.gif)
                mv "$file" "$IMAGES_DIR"
                echo "Перемещен $file в $IMAGES_DIR" >> "$LOG_FILE"
                ;;
            *.txt|*.pdf|*.docx)
                mv "$file" "$DOCUMENTS_DIR"
                echo "Перемещен $file в $DOCUMENTS_DIR" >> "$LOG_FILE"
                ;;
        esac
    fi
done

echo "Сортировка файлов завершена: $(date)" >> "$LOG_FILE"