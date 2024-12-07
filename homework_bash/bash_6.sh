#!/bin/bash

# 1. Чтение данных из файла input.txt
if [ -f input.txt ]; then
    echo "Файл input.txt найден. Содержание:"
    cat input.txt
else
    echo "Файл input.txt не найден."
    exit 1
fi

# 2. Перенаправление вывода команды wc -l (подсчет строк) в файл output.txt
wc -l < input.txt > output.txt
echo "Число строк в input.txt записано в файл output.txt."

# 3. Перенаправление ошибок выполнения команды ls для несуществующего файла в файл error.log
ls non_existent_file 2> error.log
echo "Ошибки от ls для несуществующего файла записаны в файл error.log."