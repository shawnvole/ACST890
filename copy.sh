#!/bin/bash
mkdir -p new
n=$(wc -l < $1)
i=1
while [ $i -le $n ]
do
      	x=$(sed -n "$i p" $1)
	cp $x $PWD/new/ACST890_s1_2018_$x.txt
	i=$(expr $i + 1)
done
