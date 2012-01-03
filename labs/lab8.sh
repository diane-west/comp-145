#!/bin//sh
# lab8.sh

#Check the existence of the bkup directory in $HOME
if [ ! -d $HOME/bkup ]
then
     mkdir $HOME/bkup
     echo "made directory $HOME/bkup"
fi

#Verify the file exists
if [ -f $1 ]
then
     echo "File exists"
     cp $1 bkup
     if [ $? -eq 0 ]
     then
          echo "Success in copying"
          echo "Success in copying" >> logfileLab8.txt
     else
          echo "Failure in copying"
          echo "Failure in copying" >> logfileLab8.txt
     fi

fi 


