#!/bin/bash

brs=$(brctl show | cut -f 1 | grep -v name | grep -v docker0 | grep -v test)
if [ "$#" -lt 1 ];then
	echo -e "  Usege: sh $0 (del | add IP/24)"
elif [ "$#" -gt 1 ];then
	brs=$2
fi

for i in ${brs}
do
	case "$1" in
		del)
			if [ "$2" != "" ];then
				ip link set dev "$2" down
				brctl delbr "$2"
				echo -e "\E[32m Deleted the $2 bridge!\E[0m"
				exit 0
			fi

			ip link set dev "$i" down
			brctl delbr "$i"
			echo -e "\E[32m Deleted the $i bridge!\E[0m"
			;;
		add)
			if [ "$3" == "" ];then
				echo "Please input the IP!"
				exit 1
			fi
			 
 			ADDIP=echo "$3" | sed -n 's/\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}\/24//p'
			if [ "$ADDIP" != "" ];then
				echo "Please input valid IP!"
				exit 2
			fi

			brctl addbr "$2"
			ip addr add "$3" dev $2
			ip link set dev $i up
			ip addr show $i
			;;
	esac
done
