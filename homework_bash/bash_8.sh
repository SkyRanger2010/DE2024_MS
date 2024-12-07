#!/bin/bash

# Убедитесь, что передан аргумент - директория
if [ -z "$1" ]; then
  echo "Пожалуйста, укажите директорию для резервного копирования."
  exit 1
fi

# Параметры
source_dir="$1"
log_file="backup.log"
current_date=$(date +"%Y%m%d")
file_count=0

# Создаем директорию для резервных копий
dest_dir="${source_dir}_backup_${current_date}"
mkdir -p "$dest_dir"

# Очистка файла лога
echo '' > "$log_file"

# Копирование файлов с добавлением даты
for file in "$source_dir"/*; do
  if [ -f "$file" ]; then
    file_name=$(basename "$file")
    cp "$file" "$dest_dir/${file_name}_${current_date}"
    echo "Сохранен файл $file_name в $dest_dir/${file_name}_${current_date}" >> "$log_file"
    ((file_count++))
  fi
done

# Уведомление пользователя об успешном завершении
echo "Резервное копирование завершено. Сохранено файлов: $file_count."
echo "Подробности операций сохранены в $log_file."