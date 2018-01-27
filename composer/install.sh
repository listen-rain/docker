#!/bin/sh
	touch /usr/local/bin/composer
	
	echo '#!/bin/bash
export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
echo "Current working directory: '"$(pwd)"'"
docker run --rm -v $(pwd):/app -v ~/.ssh:/root/.ssh composer/composer $@' > /usr/local/bin/composer

	chmod +x /usr/local/bin/composer

	composer --help
