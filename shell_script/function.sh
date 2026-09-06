#define a function
#name() {
#	...
#	return 0/$var  / echo "string"
#}
#bash: function name()

put(){
	echo "$0 end with:"
	echo $1
}
# $0 -> name of script
# $1 -> the first argument
# $# -> number of argument
# $@ -> all the argument(split)
# $* -> all the argument(in a string)
# $$ -> process ID
# $! -> the last process ID
# $- -> the mode of shell
# $? -> end with .. (0 means no error)

add(){
	local a="$1"
	local b="$2"
	echo $((a + b))  
}

main(){
	read -r a
	read -r b
	sum=$(add "$a" "$b")  
	put $sum
	return 0
}
#return -> return the status
#echo   -> return the data

main "$@"
