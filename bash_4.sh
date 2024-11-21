#!/bin/bash

say_hello() {
    echo "Hello, $1"
}

sum() {
    local num1="$1"
    local num2="$2"
    echo $((num1 + num2))
}

read -p "Введите ваше имя: " name
say_hello "$name"

read -p "Введите первое число: " number1
read -p "Введите второе число: " number2
result=$(sum "$number1" "$number2")
echo "Сумма $number1 и $number2 равна: $result"