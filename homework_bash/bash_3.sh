#!/bin/bash

read -p "Введите  любое число: " number

if (( number > 0 )); then
    echo "Число положительное."
    
    # Используем цикл while для подсчета от 1 до введенного числа
    cnt=1
    echo "Посчитаем от 1 до $number"       
    while (( cnt <= number )); do
        echo $cnt
        ((cnt++))
    done

elif (( number < 0 )); then
    echo "Число отрицательное."
else
    echo "Число равно нулю."
fi