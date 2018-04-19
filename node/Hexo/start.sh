#!/bin/bash

cnpm install hexo-cli -g \
        && hexo init blog \
        && cd blog \
        && cnpm install \
	&& hexo server 

