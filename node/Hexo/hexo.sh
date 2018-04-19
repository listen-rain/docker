#!/bin/bash 

docker run --name myhexo -p 4000:4000 -v /hexo:/hexo -d myhexo 
