#!/bin/bash

# Файл для логирования
log_file="system_usage.log"

# Функция для проверки и создания файла журнала
function initialize_log_file() {
    if [ ! -f "$log_file" ]; then
        touch "$log_file"
    fi
}

# Функция для сбора данных о загрузке процессора
function check_cpu_usage() {
    echo "Загрузка процессора:" >> "$log_file"
    top -bn1 | grep "Cpu(s)" | \
    sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
    awk '{print "Использование процессора: " 100 - $1 "%"}' >> "$log_file"
}

# Функция для сбора данных об использовании памяти
function check_memory_usage() {
    local memory_usage
    memory_usage=$(free | awk '/Mem:/ { printf "%.2f", $3/$2 * 100.0 }')
    echo "Текущее использование памяти: $memory_usage%" >> "$log_file" 2>&1

    if (( $(echo "$memory_usage > 80.0" | bc -l) )); then
        {
        echo "Внимание: Использование памяти превышает 80%!"
        echo "Текущие процессы, потребляющие больше всего памяти:"
        ps aux --sort=-%mem | awk 'NR<=10'
        } >> "$log_file" 2>&1
    fi
}

# Функция для сбора данных об использовании дискового пространства
function check_disk_usage() {
    echo "Использование дискового пространства:" >> "$log_file"
    df -h >> "$log_file"
}

# Запуск функций в фоновом режиме
function run_in_background() {
    while true; do
        check_cpu_usage
        check_memory_usage
        check_disk_usage
        sleep 60  # Повтор каждые 60 секунд
    done &
}

# Инициализация лога
initialize_log_file

# Запуск функции в фоновом режиме
run_in_background

echo "Скрипт запущен в фоновом режиме и собирает данные. Логи записываются в $log_file."