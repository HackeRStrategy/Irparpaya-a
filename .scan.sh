#!/bin/bash
echo -e "\e[1;32m"
if [ $@ > 0 ]
then
	list=`wget -O - $1 -q | grep -i "href=['|\"]" | sed "s/^.*href=['|\"]//" | awk -F"[\"|']" '{print $1}' | sort -u`
	for url in $list
	do
		if [ ${#url} -ge 4 -a ${url:0:4} = "http" ];then
			newlist="$newlist\n$url"
		elif [ -n $url -a ${url:0:1} = "/" ];then
			newlist="$newlist\n$1$url"
		else
			newlist="$newlist\n$1"/"$url"
		fi
	done
	echo -e "\e[1;32m $newlist\e[0m " | sort -u | sort
else

echo ""

fi

