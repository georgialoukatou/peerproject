#!/usr/bin/env bash

# Selecting speakers from cha files in prep to generating a csv format.
#
# IMPORTANT!! Includes data selection.
#


######### VARIABLES
# Variables that have been passed by the user
RAW_FOLDER="/Users/lscpuser/Documents/peerproject/peerproject/Wells/"
RAW_FOLDER1="/Users/lscpuser/Documents/peerproject/peerproject/"
output_file=${RAW_FOLDER1}output.txt
output_file1=${RAW_FOLDER1}output1.txt
output_file2=${RAW_FOLDER1}output2.csv




for corpus in $(find $RAW_FOLDER -type d);
 do
 [ -d "$corpus" ]; 
 for chafile in $corpus/*cha;
   do
    echo $chafile
    # grep  -v  '*CHI\|%mor\|%com\|%gra\|%sit\|%int\|%par\|%exp\|%act\|%xpho\|%gpx\|%eng\|%alt\|%spa\|\|\|^ .*$'  $chafile >> ${RAW_FOLDER1}output_file
     grep  -v  '*CHI\|%\|^@\|\|\|^ .*$'  $chafile >> $output_file

   done
done



sed -e 's/&[^ ]* //g'  -e 's/\[.*\]//g' -e 's/[()<>]//g' -e 's/[0-0]//g' -e "s/[^a-zA-Z' 	@*%]//g" -e '/^[	| ]*$/d' -e 's/  / /g'  -e 's/	/ /g' $output_file > $output_file1
cat $output_file1 | tr -d '\n'| tr '\*' '\n' | sed  's/@/;/' | sed 's/ /;/'  > $output_file2
