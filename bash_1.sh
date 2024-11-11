#!/bin/bash
ASKFILE=$1
CUR_DIR=$PWD
IFS='
'
BLUE='\033[34m' #Blue color
NC='\033[0m' # No Color
echo "Список файлов в ""$CUR_DIR"":\n"

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
	  с)
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
	if [ "$TYPE" = "Каталог                    " ]; then res="$res$BLUE";fi
	res="$res $file $NC"
	i=$((i+1))
	echo "$res"
done

if  [ "$ASKFILE" != "" ]; then
	echo 
	if [ -f "$ASKFILE" ]; then
    		echo "Файл '$ASKFILE' найден в текущем каталоге."
	else
    		echo "Файл '$ASKFILE' не найден в текущем каталоге."
	fi
	echo
fi
