#output redirect
#command1 > file1
echo "hello" > output.txt # overwrite
echo "world" >> output.txt # append
who >> output.txt

#input redirect
#command1 < file1
cat < output.txt #not echo(read from stdin)

#mixed redirect
#command1 < infile > outfile

#deeper in
#usually, a commend runs with 3 files:
#name      file discriptor
#stdin     0
#stdout    1
#stderr    2

# redard m,n as file discriptors(fd)
# n >& m   ->merge output file m,n
# n <& m   ->merge input file m,n

#$ command 2>file:  stderr redirect to file
#$ command > file 2>&1: stdin -> file; stderr -> stdin
# equal to: command &> file

#redriect output to /dev/null : abandon output

# |(pipe):first in sirst out to link command1's output to command2's input
# tee: split data flow, output and write files 
# /bin/bash echo.sh | tee output.txt | grep Today  #try this command


#here document 
#command << delimiter
#    document
#delimiter
#hint: delimiter can be EOF, TAG...
cat <<EOF
hello
world
EOF

#wc: count lines,words,and bits.
wc <<TAG
hello
TAG 
