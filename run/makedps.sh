#!/bin/bash

if [ -e /usr/local/bin/dps.sh ];then 
    sudo rm -f /usr/local/bin/dps.sh;
fi

sudo touch /usr/local/bin/dps.sh \
 && sudo echo -e "#!/bin/bash\ndocker ps | awk '{print \$NF}'" > /usr/local/bin/dps.sh \
 && sudo chmod +x /usr/local/bin/dps.sh

