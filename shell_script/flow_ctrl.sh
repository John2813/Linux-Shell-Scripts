##branching structure
#if elif else
#if condition1
#then
#    command1
#elif condition2 
#then 
#    command2
#else
#    commandN
#fi
a=10
b=20
if [ $a == $b ]
then
   echo "a equal to b"
elif [ $a -gt $b ]
then
   echo "a great than b"
elif [ $a -lt $b ]
then
   echo "a less than b"
else
   echo "extra situation"
fi
#hint: can not create an empty branch like other language

#case esac
#case var in
#case1)
#	command
#	;;
#case2)
#	command
#	;;
#esac
echo "Enter a number from 1 to 4"
read num
case $num in
1)	echo "1 is selected"
	;;
2)	echo "2 is selected"
	;;
3)	echo "3 is selected"
	;;		
4)	echo "4 is selected"
	;;
*)	echo "other number"
	;;
esac

##loop
#for
#for var in item1 item2 ... itemN
#do
#    command1
#    command2
#    ...
#    commandN
#done
declare -a arr=(1 2 3 4 5 6)
for i in ${arr[@]}
do 
	echo -n "$i "
done
printf "\n"

#while
#while condition
#do
#    command
#done
num=0
while(($num <= 10))
do
	echo -n "$num "
	let num++
done
printf "\n"
#while read FILM --> to get input

#while :  / while true  / for (( ; ; )) --> infinity loop
#do
#    command
#done

#until
#until condition
#do
#    command
#done
num=5
until [ $num -gt 10 ]
do
	echo -n "$num "
	let num++
done
printf "\n"

#break and continue are the same to C
