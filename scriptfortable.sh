#!/bin/bash

module  load anaconda/3
source activate wordseg
pathToText="/scratch2/gloukatou/peer_project/peerproject/corpusStats/" #path to text we want the descriptive stats from (MLU, MATTR, % questions)
lang="EnglishWells" # "SesothoDemuth"
corpus="${pathToText}${lang}"

for speech in  "adult" "child" ; 
	do

		tr '[:upper:]' '[:lower:]'< "${corpus}${speech}directed.txt" > "${corpus}${speech}_.txt" #small letters
		nquestion=`grep ? -o "${corpus}${speech}_.txt"| wc -l`  #count questions
                #clean:
                sed -e 's/\.//g'  -e 's/\_/ /g' -e 's/\&//g' -e 's/-//g' -e 's/\?//g'  -e 's/\[.*\]//g' -e 's/([^)]*)//g' -e  's/<.*>//g' -e '/xxx/d'  -e 's/+\///g' -e "s/\'//g" -e 's/  / /g' -e 's/^ //g' -e '/^\s$/d' -e 's/[0-0]//g' -e '/^$/g' -e 's/\://g' -e '/^  $/d' -e '/^</d' -e '/^$/d' < "${corpus}${speech}_.txt" > "${corpus}${speech}_1.txt"
		#tail -n +2  < "${corpus}${speech}_1.txt" > "${corpus}${speech}_2.txt" #uncomment this line if column title!
		sed -e  's/ $//g' -e 's/ / ;eword /g' -e 's/$/ ;eword/g' < "${corpus}${speech}_2.txt" > "${corpus}${speech}_3.txt" #wordseg format
		wordseg-stats  "${corpus}${speech}_3.txt" > stats${corpus}${speech}.txt
		numberoflines=`sed  '1q;d' "stats${corpus}${speech}.txt" | awk '{printf $3}' | tr -d '\n'` #compute variables from wordseg stats
		numberofwords=`sed  '5q;d' "stats${corpus}${speech}.txt" | awk '{printf $3}' | tr -d '\n'`
		mattr=`sed  '3q;d' "stats${corpus}${speech}.txt" | awk '{printf $3}' | tr -d '\n'`
                mlu=`echo "scale=3; $numberofwords / $numberoflines" | bc`
                percquest=`echo "scale=3; $nquestion / $numberoflines" | bc`
                ###############
                echo "For ${speech} text:"
                echo "Number of lines: ${numberoflines}"
                echo "Number of words: ${numberofwords}"
                echo "MATTR: ${mattr}"
                echo "Number of questions: ${nquestion}"
                echo "MLU: $mlu"
		echo "Question Ratio: $percquest"
	done
