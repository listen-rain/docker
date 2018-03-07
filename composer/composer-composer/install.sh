#!/bin/sh
touch /usr/bin/composer \
 && echo '#!/bin/bash
export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
echo "Current working directory: $PWD"
docker run --rm -v $(pwd):/app -v ~/.ssh:/root/.ssh composer/composer $@ ' > /usr/bin/composer \
 && chmod +x /usr/bin/composer \
 && composer --help

