#!/bin/bash

HEXO_WORKDIR='/www/hexo'

if [ ! -d "$HEXO_WORKDIR" ];then
	mkdir $HEXO_WORKDIR \
		&& cd $HEXO_WORKDIR \
		&& cnpm install hexo-cli -g  
fi

if [ ! -d "$HEXO_WORKDIR/blog" ];then
	hexo init blog \
	  && cd blog \
	  && cnpm install
fi

# hexo server
bash

