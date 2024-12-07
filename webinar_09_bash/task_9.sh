#!/bin/bash

# Проверка наличия аргументов
if [ "$#" -lt 1 ]; then
    echo "Использование: $0 <команда1> <команда2> ... <командаN>"
    exit 1
fi

# Перебор всех переданных команд и их запуск в фоне
for cmd in "$@"; do
    $cmd &
    PIDS+=("$!")  # Сохранение PID процесса
done

# Ожидание завершения всех процессов
for pid in "${PIDS[@]}"; do
    wait $pid
done

echo "Все команды завершены."