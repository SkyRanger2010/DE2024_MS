new_path=$1
OLD_IFS=$IFS
if [ $# != 0 ]; then
	echo "Добавим новый путь"
fi

IFS=':'

for item in $(echo $PATH | tr ':')
do
	echo $item
done	
