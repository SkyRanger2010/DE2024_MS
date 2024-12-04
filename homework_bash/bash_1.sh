#!/bin/bash
ASKFILE=$1
CUR_DIR=$PWD
IFS='
'
echo -e "Список файлов в $CUR_DIR:\n"

i=0



for str in $(ls -Al)
do
	if [ $i -eq 0 ]
	 then
	  i=$((i + 1))
	  continue
	fi
	file=$(echo "$str" | grep -oP '\S+$')
	rights=$(echo "$str" | grep -oP '(?<=^.).{9}')
	t_sym=$(echo "$str" | grep -oP '^.{1}')
	case $t_sym in
	  -)
	   TYPE="Обычный файл               "
	   ;;
    b)
     TYPE="Файл блочного устройства   "
     ;;
	  c)
     TYPE="Файл символьного устройства"
     ;;
	  l)
     TYPE="Cимвольная ссылка          "
     ;;
	  p)
	   TYPE="Именованный конвейер       "
	   ;;
	  s)
	   TYPE="Сокет                      "
	   ;;
	  d)
	   TYPE="Каталог                    "
	   ;;
	esac
	res="$i Права: $rights \t$TYPE\t"
	res="$res $file"
	i=$((i+1))
	echo -e "$res"
done

if  [ "$ASKFILE" != "" ]; then
	echo 
	if [ -f "$ASKFILE" ]; then
    		echo "Файл '$ASKFILE' найден в текущем каталоге."
	else
    		echo "Файл '$ASKFILE' не найден в текущем каталоге."
	fi

fi
	echo