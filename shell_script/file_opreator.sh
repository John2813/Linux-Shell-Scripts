file="./hello.sh"
##relative path and path sign
#.. ->parent path
#.  ->current path
#/  ->subdirecory
#~  ->/home
#-  ->previous directory

#-r -w -x read write excute
#-s -> if file is empty
#-e -> if file or directory is exit
#-f noemal file
#...
if [ -r $file ]
then
   echo "readable"
else
   echo "not readable"
fi
if [ -w $file ]
then
   echo "writable"
else
   echo "not writable"
fi
if [ -x $file ]
then
   echo "excutable"
else
   echo "can not excute"
fi
if [ -f $file ]
then
   echo "normal file"
else
   echo "not normal"
fi
if [ -d $file ]
then
   echo "directory"
else
   echo "not a directory"
fi
if [ -s $file ]
then
   echo "file is not empty"
else
   echo "file is empty"
fi
if [ -e $file ]
then
   echo "file exits"
else
   echo "file not exit"
fi
