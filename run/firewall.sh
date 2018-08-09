#!/bin/bash

#说明
#type=0 只运行了脚本没有传递参数
#type=1 运行了脚本，传递了add\del参数
#type=2 运行了脚本，传递了add\del参数并指定了要添加删除的端口
#type=3 运行了脚本，传递了add\del参数并指定了要添加删除的端口，以及要添加的主机fromHost
type="$#"

if [ "$type" -lt 2 ];then
	echo "Please specify the port to be added or deleted!"
	exit 1
fi

if [ "$2" == '139.224.223.206' ];then
	echo "Can't Remove The Host!"
	exit
fi

#numbers=$(echo  "$@" |  awk '{for (i=1;i<=NF;i++) if($i!="add" && $i!="del") print($i)}')
#numbers=$(echo "$@" | echo $(sed 's/[a-z]//g') | sed 's/\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\)//g')
#此处只能测试，不能赋值，如果赋值，在for循环时,会当做字符串处理!

for i in $(echo "$@" | echo $(sed 's/[a-z]//g') | sed 's/\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\)//g')
do
	#str=$(echo "$i" | sed 's/[0-9 ]//g')
	#if [ -n "$str" ];then
	#	echo "Please input numbers Only!"
	#	exit 2
	#fi
	
	case "$1" in
		add)
			firewall-cmd --zone=public --add-port="$i"/tcp --permanent	
			;;
		del)
			firewall-cmd --remove-port="$i"/tcp --permanent
			;;
		addh)
			fromHost=$(echo "$2" | sed 's/\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\)//g')
			if [ -n "$fromHost" ];then
				echo "Please input a valid IP!"
				exit 3
			fi

			firewall-cmd --permanent --add-rich-rule="rule family="ipv4" source address="$2" port protocol="tcp" port="$i" accept"
			;;
		delh)
			fromHost=$(echo "$2" | sed 's/\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\)//g')            
			if [ -n "$fromHost" ];then
				echo "Please input a valid IP!"
				exit 3
			fi  

			firewall-cmd --permanent --remove-rich-rule="rule family="ipv4" source address="$2" port protocol="tcp" port="$i" accept"
			;;
		*)
			echo "Usege: (add|del|addh|delh)"
			;;
	esac
done

firewall-cmd --reload
firewall-cmd --list-all

exit

