#!/usr/bin/env bash

# Selecting speakers from cha files in prep to generating a csv format.
#
# IMPORTANT!! Includes data selection.
# Problem: @ inside word separates lines


######### VARIABLES
# Variables that have been passed by the user
NAME="abigail"
RAW="/Users/lscpuser/Documents/peerproject/alexannot/"
RAW_FOLDER="/Users/lscpuser/Documents/peerproject/alexannot/${NAME}/"


output_file=${RAW_FOLDER}output.txt
output_file1=${RAW_FOLDER}output1.txt
output_file2=${RAW_FOLDER}output2.txt
output_file3=${RAW_FOLDER}output3.txt
output_file4=${RAW_FOLDER}output4.csv



for corpus in $(find $RAW_FOLDER -type d);
 do
 [ -d "$corpus" ]; 
 for chafile in $corpus/*cha;
   do
    echo $chafile
     grep  -v  '%mor\|%gra\|%sit\|%int\|%par\|%exp\|%act\|%xpho\|%gpx\|%eng\|%alt\|%add\|%spa\|@Begin\|@UTF\|@PID\|@Languages\|@ID\|@Date\|@Time Start\|\|\|^ .*$'  $chafile >> $output_file
    # grep  -v  '*CHI\|%\|^@\|\|\|^ .*$'  $chafile >> $output_file

   done
done

sed -e "s/[^a-zA-Z0-0' 	@*%:&[]!]//g" -e '/^[	| ]*$/d' -e 's/  / /g'  -e 's/	/ /g'  $output_file > $output_file1

cat $output_file1 | tr -d '\n'| tr '\*' '\n' | tr '@' '\n' | sed 's/%com/	%com/g'  > $output_file2

if [ $NAME = "abigail" ];
then
cat $output_file2 |  sed 's/^REB/REB	Rebecca Sister%/g' | sed 's/^MOT/MOT	Mother%/g' | sed 's/^FAT/FAT	Father%/g' | sed 's/^LOU/LOU	Louise Sister%/g' | sed 's/^SIR/SIR	Sirka  Adult%/g'  | sed 's/^UNK/UNK	Unidentified%/g' |  sed 's/^CHI/CHI	Abigail Target Child%/g' |  sed 's/^NIC/NIC	Nicole Sister%/g' | sed 's/^ERI/ERI	Erika Family_Friend%/g' | sed 's/^CAR/CAR	Carol Visitor%/g' | sed 's/^ISA/ISA	Isabelle Child%/g' | sed 's/^HEL/HEL	Helen Family_Friend%/g' | sed 's/^HMO/HMO	Adult%/g'  > $output_file3
fi

#geoffrey
if [ $NAME = "geoffr" ];
then
cat $output_file2 | sed 's/^CHI/CHI	Geoffrey Target_Child%/g' | sed 's/^MOT/MOT	Mother%/g'| sed 's/^FAT/FAT	Father%/g' |  sed 's/^RAC/RAC	Rachel Sister%/g'  | sed 's/^UNK/UNK	Unidentified%/g' | sed 's/^TVM/TVM 	TVMan Visitor%/g' |  sed 's/^CHR/CHR	Child%/g' | sed 's/^CAT/CAT	Catherine  Child%/g'    > $output_file3
fi


#harrie
if [ $NAME = "harrie" ];
then
cat $output_file2 | sed 's/^CHI/CHI	Harriet Target_Child%/g' | sed 's/^MOT/MOT	Mother%/g'| sed 's/^FAT/FAT	Father%/g' | sed  's/^NAO/NAO	Naomi Child%/g' | sed 's/^RIC/RIC	Richard Sibling%/g' | sed 's/^NEI/NEI	Neighbor Adult%/g' | sed 's/^SAR/SAR	Child%/g' | sed  's/^HAN/HAN	Child%/g' | sed 's/^UNK/UNK	Unidentified%/g'  | sed 's/^CLA/CLA	Claire Child%/g' | sed 's/^KAT/KAT	Unidentified%/g' | sed 's/^TIN/TIN	Tina Child%/g'  > $output_file3 
fi


#laura
if [ $NAME = "laura" ];
then
cat $output_file2 | sed 's/^CHI/CHI	Laura Target_Child%/g' | sed 's/^MOT/MOT	Mother%/g'| sed 's/^FAT/FAT	Father%/g' | sed 's/^SAR/SAR	Sarah  Sister%/g' | sed  's/^UNK/UNK	Unidentified%/g' | sed  's/^KER/KER	Kerry  Child%/g' | sed  's/^KEL/KEL	Kelly  Child%/g' |sed  's/^DAL/DAL	Dale  Child%/g' | sed  's/^LEE/LEE	Lee  Child%/g' |  sed  's/^AUN/AUN	Aunt%/g' |sed 's/^INS/INS	Unidentified%/g' |sed 's/^ARL/ARL	Unidentified%/g'| sed 's/^UNC/UNC	Uncle%/g'  > $output_file3 
fi

if [ $NAME = "benjamin" ]; #ADU, LOR
then
cat $output_file2 | sed 's/^CHI/CHI	Benjamin Target_Child%/g' | sed 's/^MOT/MOT	Mother%/g'| sed 's/^FAT/FAT	Father%/g' | sed 's/^NIC/NIC	Nicola  Sister%/g' | sed  's/^SUZ/SUZ	Suzanne Family_Friend%/g' | sed  's/^VIS/VIS	Visitor%/g'  > $output_file3 
fi

if [ $NAME = "samantha" ];
then
cat $output_file2 | sed 's/^CHI/CHI	Samantha Target_Child%/g' | sed 's/^MOT/MOT	Mother%/g'| sed 's/^FAT/FAT	Father%/g' | sed 's/^JON/JON	Jonathan Brother%/g' | sed 's/^CHR/CHR	Christine Aunt%/g' | sed 's/^NEI/NEI	Adult%/g' | sed 's/^UNK/UNK	Unidentified%/g' | sed 's/^BAB/BAB	Unidentified%/g' |  sed 's/^HAZ/HAZ	Hazel Child%/g' | sed 's/^TEL/TEL	Television Non_Human%/g' | sed 's/^UNK/UNK	Unidentified%/g' > $output_file3 
fi

if [ $NAME = "sean" ];
then
cat $output_file2 | sed 's/^CHI/CHI	Debbie Target_Child%/g' | sed 's/^MOT/MOT	Mother%/g'| sed 's/^FAT/FAT	Father%/g' | sed 's/^LOR/LOR	Sister%/g' |  sed 's/^UNK/UNK	Unidentified%/g' > $output_file3 
fi

if [ $NAME = "sheila" ];
then
cat $output_file2 | sed 's/^CHI/CHI	Sheila Target_Child%/g' | sed 's/^MOT/MOT	Mother%/g'| sed 's/^FAT/FAT	Father%/g' | sed 's/^LOR/LOR	Lorna Sister%/g' | sed 's/^JAN/JAN	Adult%/g'|  sed 's/^UNK/UNK	Unidentified%/g' > $output_file3 
fi

if [ $NAME = "stella" ];
then
cat $output_file2 | sed 's/^CHI/CHI	Stella Target_Child%/g' | sed 's/^MOT/MOT	Mother%/g'| sed 's/^FAT/FAT	Father%/g' | sed 's/^ADR/ADR	Adrian Sibling%/g' | sed 's/^UNK/UNK	Unidentified%/g' | sed 's/^GRA/GRA	Grandmother%/g' > $output_file3 
fi


sed -e  's/%: /	/g' -e '/^.$/d'  <$output_file3 >  $output_file4




#cat ${RAW}lauraoutput2.txt ${RAW}harrieoutput2.txt ${RAW}geoffroutput2.txt ${RAW}abigailoutput2.txt >>${RAW}totaloutput2.txt
