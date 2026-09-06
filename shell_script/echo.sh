#output a string
echo "hello"

#output a varible
name="Luca"
echo "$name"

#options
echo -n "greet: " # excape character spport
echo -e "\\hello\\" # disable new line
echo -e "\033[31mloading\033[0m"
echo -e "\033[45mthat's right\033[0m"
echo -e "\033[31m\033[45mtest\033[0m"
#ANSI color excape code
#text color: 30m(black) 31m(red) 32m(green) 33m(yellow) 34m(blue) 35(purple) 36(cyan) 37(white)
#background color 40-47 in the same order
#\033[0m -> clean all color set

#comment replace
echo Today is $(date) #Do not foget to add brackets()

#output to files
echo "hello" > output.txt #overwrite
echo "good night" >> output.txt #append

#an example: progress bar
echo -n "Progress: ["
for i in {1..20}; do
    echo -n "#"
    sleep 0.1
done
echo "] Done!"

