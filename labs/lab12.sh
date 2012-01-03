#!/bin/sh
# lab12.sh 
# Shell menu program

choice=1
while [ $choice -ne "5" ] ; do
    echo "Menu"
    echo "1. Copy a file to a designated directory "
    echo "2. Check if a specified user is logged in"
    echo "3. Dispay the details of a specified file"
    echo "4. List the contents of a specified directory"
    echo "5. Quit to Unix"
    echo -n "Enter your option #: "

    read choice
    case "$choice" in

         # 1) copy a file to a designated directory
      1) echo  "Please enter a file name and the directory where you 
would like the file to be copied. Separate each field with a space: "
         read fName dirName
#Check the existence of the specified directory 
if [ ! -d $dirName ]
then
     mkdir $dirName
     echo "made directory $dirName"
fi

#Verify the file exists
if [ -f $fName ]
then
     echo "File exists"
     #echo "fName=$fName"               #checking code
     #echo "dirName=$dirName"           #checking code
     #echo "Getting ready to do cp"     #checking code
     cp $fName $dirName                 #copy file to specified dir
     if [ $? -eq 0 ]                    #test exit status of last command
     then
          echo "Success in copying"
          echo "Success in copying" >> logfileLab12.txt
     else
          echo "Failure in copying"
          echo "Failure in copying" >> logfileLab12.txt
     fi
else
     echo "File $fName does not exist."
     echo "$fName does not exist. Failure to copy." >> logfileLab12.txt
fi                                  ;; 

        # 2) tell you  if a specified user is logged in
      2) echo -n "Please enter the userid: "
         read userId
         whoMatch=`who | grep "$userId"`   #variable for match of userid
         #echo $whoMatch                    #checking code
         if [ -z "$whoMatch" ]            #test if who match null 
         then
             echo "$userId is not logged in"
         else
             echo "$userId is logged in"
             echo $whoMatch
         fi
            ;;    

         # 3) Display the details of a specified file    
      3) echo -n  "Please specify the file and its directory location: "
         read fileName3  dirLoc3
         if [ -d $dirLoc3 ]   # test if dirLoc3 exists
         then
             #echo "directory $dirLoc3 exists --preparing to cd"
             cd $dirLoc3      # cd to dirLoc3
             #echo "$PWD"     #checking code
         else
             echo "Directory $dirLoc3 not found"
             echo "directory $dirLoc3 not found" >> $HOME/logfileLab12.txt
         fi
         if [ -f $fileName3 ]    # test if fileName3 exists
         then
             echo "Details for $fileName3 are: "	
             ls -l $fileName3      #display long listing of fileName3
         else
             echo "The file $fileName3 does not exist."
             echo "$fileName3 does not exist" >> $HOME/logfileLab12.txt
         fi
         cd                        # reset to home dir
         #echo "Returning to home. Current directory is: $PWD" #check code
               ;;

         # 4) List the contents of a specified directory
      4) echo -n "Please specify the directory you wish to check: "
         read dirLoc4
         if [ ! -d $dirLoc4 ]         #test dir exists
         then
              echo "$dirLoc4 not found"
              echo "$dirLoc4 does not exist" >> $HOME/logfileLab112.txt
         fi
         cd $dirLoc4
         ls                          # list contents of $dirLoc4   
         dirContents=ls              # variable to hold ls output
         if [ -z "$dirContents" ]    # test if contents empty
         then 
              echo "The directory $dirLoc4 is empty."
         fi
         cd                     # reset working directory to home
         #echo "cd to home. Current directory is: $PWD" #check code
         ;;        
      5) exit ;;                          # exit to UNIX command line
      *) echo "Invalid option"
    esac                                 #end of case
done

cd
echo "Displaying logfileLab12.txt: "
cat logfileLab12.txt

