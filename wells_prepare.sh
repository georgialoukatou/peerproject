#!/usr/bin/env bash

# Selecting speakers from cha files in prep to generating a phono
# format.
#
# IMPORTANT!! Includes data selection.
#


######### VARIABLES
# Variables that have been passed by the user
RAW_FOLDER="/Users/lscpuser/Downloads/Wells/"
output_file=$RAW_FOLDER/output.tmp
output_file1=$RAW_FOLDER/output1.tmp
output_file2=$RAW_FOLDER/output2.tmp
output_file3=$RAW_FOLDER/output3.txt
output_file4=$RAW_FOLDER/output4.txt
output_file5=$RAW_FOLDER/output5.txt
output_file6=$RAW_FOLDER/output6.txt


SCRIPTS=../../database_creation/scripts

for corpus in $(find $RAW_FOLDER -type d);
 do
 [ -d "$corpus" ]; 
 for chafile in $corpus/*cha;
   do
   echo $chafile
   grep  -v  '@\|*CHI\|%mor\|%com\|%gra\|%sit\|%int\|%par\|%exp\|%act\|%xpho\|%gpx\|\|\|^ .*$'  $chafile >> $output_file
   #grep -v '@\|*CHI\|%\|\|\|^	[?!.]$' $chafile >> $output_file
   
# iconv -t ISO-8859-1 >> $SELFILE
   done
#
sed -e 's/&[^ ]* //g'  -e 's/\[.*\]//g' -e 's/[()<>]//g' -e 's/[0-0]//g' -e "s/[^a-zA-Z' 	*%]//g" -e '/^[	| ]*$/d' -e 's/  / /g'  -e 's/	/ /g' $output_file > $output_file1
cat $output_file1 | tr -d '\n' > $output_file2
cat $output_file2 | tr '\*' '\n' | tr '%' '	%'  > $output_file3
sed 's/ /	/' $output_file3> $output_file4
cat $output_file4 | tr  '	' ',' > $output_file5
#sed 's/\,add//g' $output_file5 > $output_file6


#sed 's/\n%add/%add/g'  $output_file2 > $output_file3
#cat $output_file1 | tr -d '\n' | tr "*	" '*\n' |tr '[:upper:]' '[:lower:]' > $output_file2
#sed -e 's/\*.*//' -e 's/xxx//g' -e '/^[[:space:]]*$/d' -e 's/^ //g'<  $output_file2 > $output_file3
done
#rm $RAW_FOLDER/*.tmp

#phonemize -b festival -w ';' -p ' '  output3.txt -o phonemized.txt --strip


#import csv

# cat ifile.txt | tr -s '[:blank:]' ',' > ofile.txt
