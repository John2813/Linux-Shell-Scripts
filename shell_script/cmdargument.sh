#commend line argument
echo "program name $0"
echo "argument1 $1"
echo "argument2 $2"

echo "num of argument $#"
echo "all $*" #all together
echo "$@" # all split
echo "process ID $$"
echo "statas $?" # if end with error
echo "shell mode $-"
