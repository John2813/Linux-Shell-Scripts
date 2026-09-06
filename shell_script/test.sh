#test EXPRESSION  <=> [ EXPRESSION ]


#flie test
file="$HOME/sdln/shell_script/output.txt"

if [ -e "$file" ]; then
    echo "$file exists"
    if [ -r "$file" ]; then
        echo "readable"
    fi
else
    echo "$file not exists"
fi

#string
read -p "Enter Username: " username

if [ -z "$username" ]; then
    echo "Error: username is empty"
    exit 1
elif [ "$username" = "root" ]; then
    echo "Warning : Root usage"
else
    echo "Welcome, $username"
fi

#numeric comparison
read -p "Enter age: " age

if [ "$age" -lt 0 ]; then
    echo "Age is not a native number"
elif [ "$age" -lt 18 ]; then
    echo "minor"
elif [ "$age" -ge 18 ] && [ "$age" -lt 60 ]; then
    echo "adult"
else
    echo "the old"
fi

#logical 
#! -o -a

#[[ ]] 
file="he.txt"
if [[ "$file" == *.log ]]; then #pattern matching,regular expression and safer string operation
    echo "It's a log"
fi

#(())
count=9
if (( $count > 10 )); then # numeric comparison and complex arithmetic expression
    echo "greater than 10"
fi
