#!/bin/bash
echo "How many number of terms to be generated ?"
read n
if [ $n -lt 1 ];
then 
	echo "n CANNOT be less than 1!!!"
else
 	x=1
 	y=1
 	i=2
 	echo "Fibonacci Series up to $n terms :"
  	echo "$x"
  	echo "$y"
  	while [ $i -lt $n ]
  	do
      		i=`expr $i + 1 `
      		z=`expr $x + $y `
      		echo "$z"
      		x=$y
      		y=$z
  	done
fi
