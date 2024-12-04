#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Скрипт добавляет новый путь в переменную окружения %PATH%"
	echo "Использование: $0 <новый путь>"
    exit 1
fi

echo "Текущее значение переменной PATH:"
echo "$PATH"

new_directory=$1

export PATH="$new_directory:$PATH"
echo "Новое значение переменной PATH:"
echo "$PATH"

echo "По умолчанию новое значение PATH действует только в текущей сессии, то есть до выхода из скрипта!!!!"
echo "Выберите дальнейшее действие:"
do1="Добавить изменения в файл ~/.bashrc (изменения PATH будут сохранены для каждого запуска терминала bash под текущим пользователем)"
do2="Добавить изменения в файл  /etc/enviroment (изменения PATH будут сохранены в системе и будут работать для всех пользователей, нужны права root)"
do3="Выйти из скрипта (изменения PATH пропадут после перезагрузки терминала)"
do4="Выйти из текущей сессии терминала"
do5="Завершить скрипт"

select  act in "$do1" "$do2" "$do3"; do
	case "$act" in
		"$do1" )
			echo "export PATH='$new_directory:$PATH'" >> ~/.bashrc
			select act2 in "$do4" "$do5"; do
				case "$act2" in
					"$do4" )
						kill -9 $PPID
					;;
					"$do5" )
						exit
					;;	
				esac
			done
			break
		;;
		"$do2" )
			sudo bash -c 'echo "export PATH='$new_directory:$PATH'" >>  /etc/enviroment'
			select act2 in "$do4" "$do5"; do
				case "$act2" in
					"$do4" )
						kill -9 $PPID
					;;
					"$do5" )
						exit
					;;
				esac
			done			
		;;
		"$do3" )
			exit
		;;	
	esac
done
