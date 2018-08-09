#！/bin/bash

docker run --name php-mongo \
	-v /www:/www \
	-p 9002:9000 \
	--net phpweb_appnet \
	--ip 172.19.0.21 \
	-d 

