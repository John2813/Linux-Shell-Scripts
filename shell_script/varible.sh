#define
var=10
your_name="Bill"  # do not use space
PI=3.14
#for files in $(ls /sdln) for example

#usage
echo ${your_name}

#delete
unset your_name

#read only varible cna not unset
#declare -r PI=3.14
readonly PI
#PI=3.1415 Error

##types

#string use "" or ''
usrname="root"

#integer
declare -i year=2026

#array
declare -a scores=(1 2 3 4 5) # indexed array  split with space
declare -A user # associative array
user[name]="John"
user[age]=20

echo ${scores[0]}
echo ${user[name]}

#environment varible
echo $PATH
#declare -x xxx  or export

#special varible
echo $0 # name of the script
# $1 $2 -> parameter of the script


##String operation
#splice
#can not use simple ' and use varible in ' '
echo 'hello $user[name]'
echo 'hello ${user[name]}'
#can use varible and escaped characters in " "
echo "hello $user[name]"
echo "hello ${user[name]}" # recommend

#getlength
var="shell script"
echo “${#var}” # space counts

#substring
echo "${var:1:6}"

#find
echo `expr index "$var" sc` # find the first 's' or 'c', return the index(start with 1)

##array operation
declare -a a=(1 2 3 4 5) # split with space
declare -A b
b[name]="John"
b[age]=20
#length
echo "${#a}" # simple element length
echo "${#a[@]}" # num of element
echo "${#a[*]}" # the same

#read
echo "${a[@]}" # raed all
echo "${a[*]}"
echo "${!b[@]}" # show all keys in associative array
#comment
# just use # 
