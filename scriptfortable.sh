#!/bin/bash

module  load anaconda/3
source activate wordseg
pathToText="/scratch2/gloukatou/peer_project/Wells" #path to text we want the descriptive stats from (MLU, MATTR, % questions)



for speech in  "adult" "child" ; 
	do

		tr '[:upper:]' '[:lower:]'< "${pathToText}${speech}directed.txt" > "${pathToText}${speech}_.txt" #small letters
		nquestion=`grep ? -o "${pathToText}${speech}_.txt"| wc -l`  #count questions
                #clean:
                sed -e 's/\.//g'  -e 's/\_/ /g' -e 's/\&//g' -e 's/-//g' -e 's/\?//g'  -e 's/\[.*\]//g' -e 's/([^)]*)//g' -e  's/<.*>//g' -e '/xxx/d'  -e 's/+\///g' -e "s/\'//g" -e 's/  / /g' -e 's/^ //g' -e '/^\s$/d' -e 's/[0-0]//g' -e '/^$/g' -e 's/\://g' -e '/^  $/d' -e '/^</d' -e '/^$/d' < "${pathToText}${speech}_.txt" > "${pathToText}${speech}_1.txt"
		#tail -n +2  < "${pathToText}${speech}_1.txt" > "${pathToText}${speech}_2.txt" #uncomment this line if column title!
		sed -e  's/ $//g' -e 's/ / ;eword /g' -e 's/$/ ;eword/g' < "${pathToText}${speech}_2.txt" > "${pathToText}${speech}_3.txt" #wordseg format
		wordseg-stats  "${pathToText}${speech}_3.txt" > stats${speech}.txt
		numberoflines=`sed  '1q;d' "stats${speech}.txt" | awk '{printf $3}' | tr -d '\n'` #compute variables from wordseg stats
		numberofwords=`sed  '5q;d' "stats${speech}.txt" | awk '{printf $3}' | tr -d '\n'`
		mattr=`sed  '3q;d' "stats${speech}.txt" | awk '{printf $3}' | tr -d '\n'`
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
