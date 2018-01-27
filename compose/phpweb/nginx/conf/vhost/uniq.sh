#!/bin/bash

for i in $(ls .)
do
	cat $i | uniq | tee $i > /dev/null
done
