#!/bin/bash

# Проверка наличия аргумента
if [ -z "$1" ]; then
    echo "Использование: $0 <директория>"
    exit 1
fi

# Путь к директории, полученный из параметра
TARGET_DIR="$1"

# Поиск и сортировка файлов с расширением .log
find "$TARGET_DIR" -type f -name "*.log" -printf "%T@ %p\n" | sort -n | head -n 5 | awk '{print $2}'