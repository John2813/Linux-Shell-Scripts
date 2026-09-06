##arithmetic operator
a=10
b=20
echo "`expr $a + $b`"
echo "`expr $a - $b`" #must split with space, or output "10-20"
echo "`expr $a \* $b`"
echo "`expr $b / $a`"
echo "`expr $a % $b`"
c=$b
echo "$c"

if [ $a == $b ]
then
	echo "a == b"
fi

if [ $a != $b ]
then 
	echo "a != b"
fi

##comparison operator
if [ $c -ne $b ]
then
	echo "$c -eq $b"
fi

echo "$a -ne $b"
echo "$a -le $b" # boolean
#gt lt ge le

##boolean operator
#only be used in conditional line [ ]
#! -> not
#-o -> or
#-a -> and

##logical operator
#can be used between commends and [[ ]] 
#&& -> and
#|| -> or

##string operator
str1="llle"
str2="jdisd"
#= -> if equal
#!= -> if not equal
#-z -> if length = 0
#-n -> if not length = 0
#$ -> if not NULL(length = 0)

##file operator
#there are too many. Record in another file

##increment/decrement operator
num=5
#use let
let num++
echo $num
let num--
echo $num

#use (())
num=$((num +1))
echo $num
num=$((num - 1))

#use expr
num=$(expr $num + 1)
echo $num
