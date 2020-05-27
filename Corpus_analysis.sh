#!/bin/bash

#pathToText="/Users/admin/Documents/peerSpeech/" #path to text we want the descriptive stats from (MLU, MATTR, % questions)
#lang="EnglishWells" # "SesothoDemuth"
#corpus="${pathToText}${lang}"

pathToText="/Users/admin/Desktop/corpora/" 
pathToText1="/Users/admin/Desktop/processedcorpora/" 

for speaker in  "adult" "mother" "otherchild"; 
  	do
  	for addressee in  "CDS" "OCDS" "ADS" ;
  		do 
  		for targetchild in "Hlobohang" "Litlhare" "Tsebo" ;
  			do
  			echo "${pathToText}${targetchild}${speaker}${addressee}.csv"
  			
				#tr '[:upper:]' '[:lower:]'< "${pathToText}${targetchild}${speaker}${addressee}.csv" > "${pathToText1}${targetchild}${speaker}${addressee}1.csv"  && mv "${pathToText1}${targetchild}${speaker}${addressee}1.csv" "${pathToText1}${targetchild}${speaker}${addressee}.csv"
    #          cut -f19 < "${pathToText1}${targetchild}${speaker}${addressee}.csv" > "${pathToText1}utterance_${targetchild}${speaker}${addressee}.csv"
#				cut -f10 < "${pathToText1}${targetchild}${speaker}${addressee}.csv" > "${pathToText1}question_${targetchild}${speaker}${addressee}.csv"
# # 				cut -f25 < "${pathToText}${targetchild}_${speaker}_${addressee}.csv" > "${pathToText}morphology${targetchild}_${speaker}_${addressee}.csv"
#			cut -f11 < "${pathToText1}${targetchild}${speaker}${addressee}.csv" > "${pathToText1}question_${targetchild}${speaker}${addressee}3.csv"
# 
  		done
  	    for targetchild in "Anae" "Anais" "Theotime" ;
  			do
  			echo "${pathToText}${targetchild}${speaker}${addressee}.csv"
  			
				#tr '[:upper:]' '[:lower:]'< "${pathToText}${targetchild}${speaker}${addressee}.csv" > "${pathToText1}${targetchild}${speaker}${addressee}1.csv"  && mv "${pathToText1}${targetchild}${speaker}${addressee}1.csv" "${pathToText1}${targetchild}${speaker}${addressee}.csv"
       #    cut -f4 < "${pathToText1}${targetchild}${speaker}${addressee}.csv" > "${pathToText1}utterance_${targetchild}${speaker}${addressee}.csv"
#					sed -e 's/< //g' -e 's/xxx //g' -e 's/xxx//g' -e 's/\[\/\]//g' -e 's/\<//g' -e 's/\>//g'  -e 's/!//g' -e 's/\(\.\)//g' -e 's/ \.//g' -e 's/\[\=\!.*\]//g' -e 's/\[.*]//g'  -e '/^$/d' -e '/^xxx$/d'  -e 's/www//g' -e 's/://g' -e 's/+//g' -e 's/\///g' -e 's/(//g'  -e 's/)//g' -e 's/›//g' -e 's/‹//g' -e 's/\...//g' -e 's/\..//g'  -e 's/  / /g' -e 's/ ?/?/g' "${pathToText1}utterance_${targetchild}${speaker}${addressee}.csv" > "${pathToText1}cleanutterance_${targetchild}${speaker}${addressee}.csv"
# # 				cut -f10 < "${pathToText}${targetchild}_${speaker}_${addressee}.csv" > "${pathToText}question${targetchild}_${speaker}_${addressee}.csv"
# # 				cut -f25 < "${pathToText}${targetchild}_${speaker}_${addressee}.csv" > "${pathToText}morphology${targetchild}_${speaker}_${addressee}.csv"
# #				cut -f11 < "${pathToText}${targetchild}_${speaker}_${addressee}.csv" > "${pathToText}question${targetchild}_${speaker}_${addressee}3.csv"
# 
  		done	
  		# 
  	done
  done





#awk 'FNR>1'  ${pathToText}HlobohangAdultCDS.csv ${pathToText}HlobohangFatherCDS.csv ${pathToText}HlobohangGrandmotherCDS.csv ${pathToText}HlobohangInvestigatorCDS.csv ${pathToText}HlobohangMotherCDS.csv ${pathToText}HlobohangUncleCDS.csv  > ${pathToText}Hlobohang_A_CDS.csv
#awk 'FNR>1'  ${pathToText}HlobohangFatherADS.csv ${pathToText}HlobohangGrandmotherADS.csv ${pathToText}HlobohangInvestigatorADS.csv ${pathToText}HlobohangMotherADS.csv ${pathToText}HlobohangUncleADS.csv  > ${pathToText}Hlobohang_A_ADS.csv
#awk 'FNR>1'  ${pathToText}HlobohangAdultOCDS.csv ${pathToText}HlobohangFatherOCDS.csv ${pathToText}HlobohangGrandmotherOCDS.csv ${pathToText}HlobohangInvestigatorOCDS.csv ${pathToText}HlobohangMotherOCDS.csv ${pathToText}HlobohangUncleOCDS.csv  > ${pathToText}Hlobohang_A_OCDS.csv
# awk 'FNR>1'  ${pathToText}HlobohangTeenagerCDS.csv ${pathToText}HlobohangSisterCDS.csv ${pathToText}HlobohangPlaymateCDS.csv ${pathToText}HlobohangCousinCDS.csv ${pathToText}HlobohangBrotherCDS.csv  > ${pathToText}Hlobohang_C_CDS.csv
# awk 'FNR>1'  ${pathToText}HlobohangTeenagerADS.csv ${pathToText}HlobohangSisterADS.csv ${pathToText}HlobohangPlaymateADS.csv ${pathToText}HlobohangCousinADS.csv ${pathToText}HlobohangBrotherADS.csv  > ${pathToText}Hlobohang_C_ADS.csv
# awk 'FNR>1'  ${pathToText}HlobohangTeenagerOCDS.csv ${pathToText}HlobohangSisterOCDS.csv ${pathToText}HlobohangPlaymateOCDS.csv ${pathToText}HlobohangCousinOCDS.csv ${pathToText}HlobohangBrotherOCDS.csv  > ${pathToText}Hlobohang_C_OCDS.csv
# awk 'FNR>1'  ${pathToText}LitlhareAdultCDS.csv ${pathToText}LitlhareFatherCDS.csv ${pathToText}LitlhareGrandmotherCDS.csv ${pathToText}LitlhareInvestigatorCDS.csv ${pathToText}LitlhareMotherCDS.csv ${pathToText}LitlhareUncleCDS.csv  > ${pathToText}Litlhare_A_CDS.csv
# awk 'FNR>1'  ${pathToText}LitlhareAdultADS.csv ${pathToText}LitlhareFatherADS.csv ${pathToText}LitlhareGrandmotherADS.csv ${pathToText}LitlhareInvestigatorADS.csv ${pathToText}LitlhareMotherADS.csv ${pathToText}LitlhareUncleADS.csv  > ${pathToText}Litlhare_A_ADS.csv
# awk 'FNR>1'  ${pathToText}LitlhareAdultOCDS.csv ${pathToText}LitlhareFatherOCDS.csv ${pathToText}LitlhareGrandmotherOCDS.csv ${pathToText}LitlhareInvestigatorOCDS.csv ${pathToText}LitlhareMotherOCDS.csv ${pathToText}LitlhareUncleOCDS.csv  > ${pathToText}Litlhare_A_OCDS.csv
# awk 'FNR>1'  ${pathToText}LitlhareTeenagerCDS.csv ${pathToText}LitlhareSisterCDS.csv ${pathToText}LitlharePlaymateCDS.csv ${pathToText}LitlhareCousinCDS.csv ${pathToText}LitlhareBrotherCDS.csv  > ${pathToText}Litlhare_C_CDS.csv
# awk 'FNR>1'  ${pathToText}LitlhareTeenagerADS.csv ${pathToText}LitlhareSisterADS.csv ${pathToText}LitlharePlaymateADS.csv ${pathToText}LitlhareCousinADS.csv ${pathToText}LitlhareBrotherADS.csv  > ${pathToText}Litlhare_C_ADS.csv
# awk 'FNR>1'  ${pathToText}LitlhareTeenagerOCDS.csv ${pathToText}LitlhareSisterOCDS.csv ${pathToText}LitlharePlaymateOCDS.csv ${pathToText}LitlhareCousinOCDS.csv ${pathToText}LitlhareBrotherOCDS.csv  > ${pathToText}Litlhare_C_OCDS.csv
# awk 'FNR>1'  ${pathToText}TseboAdultADS.csv ${pathToText}TseboFatherADS.csv ${pathToText}TseboGrandmotherADS.csv ${pathToText}TseboInvestigatorADS.csv ${pathToText}TseboMotherADS.csv ${pathToText}TseboUncleADS.csv  > ${pathToText}Tsebo_A_ADS.csv
# awk 'FNR>1'  ${pathToText}TseboAdultCDS.csv ${pathToText}TseboFatherCDS.csv ${pathToText}TseboGrandmotherCDS.csv ${pathToText}TseboInvestigatorCDS.csv ${pathToText}TseboMotherCDS.csv ${pathToText}TseboUncleCDS.csv  > ${pathToText}Tsebo_A_CDS.csv
# awk 'FNR>1'  ${pathToText}TseboAdultOCDS.csv ${pathToText}TseboFatheOCDS.csv ${pathToText}TseboGrandmotherOCDS.csv ${pathToText}TseboInvestigatorOCDS.csv ${pathToText}TseboMotherOCDS.csv ${pathToText}TseboUncleOCDS.csv  > ${pathToText}Tsebo_A_OCDS.csv
# awk 'FNR>1'  ${pathToText}TseboTeenagerCDS.csv ${pathToText}TseboSisterCDS.csv ${pathToText}TseboPlaymateCDS.csv ${pathToText}TseboCousinCDS.csv ${pathToText}TseboBrotherCDS.csv  > ${pathToText}Tsebo_C_CDS.csv
# awk 'FNR>1'  ${pathToText}TseboTeenagerADS.csv ${pathToText}TseboSisterADS.csv ${pathToText}TseboPlaymateADS.csv ${pathToText}TseboCousinADS.csv ${pathToText}TseboBrotherADS.csv  > ${pathToText}Tsebo_C_ADS.csv
# awk 'FNR>1'  ${pathToText}TseboTeenagerOCDS.csv ${pathToText}TseboSisterOCDS.csv ${pathToText}TseboPlaymateOCDS.csv ${pathToText}TseboCousinOCDS.csv ${pathToText}TseboBrotherOCDS.csv  > ${pathToText}Tsebo_C_OCDS.csv


# for speaker in  "A" "C" ; 
#  	do
#  	for addressee in  "CDS" "OCDS" "ADS" ;
#  		do 
#  		for targetchild in "Hlobohang" "Litlhare" "Tsebo";
#  			do
# # 				tr '[:upper:]' '[:lower:]'< "${pathToText}${targetchild}_${speaker}_${addressee}.csv" > "${pathToText}${targetchild}_${speaker}_${addressee}1.csv"  && mv "${pathToText}${targetchild}_${speaker}_${addressee}1.csv" "${pathToText}${targetchild}_${speaker}_${addressee}.csv"
# #                 cut -f19 < "${pathToText}${targetchild}_${speaker}_${addressee}.csv" > "${pathToText}utterance_${targetchild}_${speaker}_${addressee}.csv"
# # 				cut -f10 < "${pathToText}${targetchild}_${speaker}_${addressee}.csv" > "${pathToText}question${targetchild}_${speaker}_${addressee}.csv"
# # 				cut -f25 < "${pathToText}${targetchild}_${speaker}_${addressee}.csv" > "${pathToText}morphology${targetchild}_${speaker}_${addressee}.csv"
# #				cut -f11 < "${pathToText}${targetchild}_${speaker}_${addressee}.csv" > "${pathToText}question${targetchild}_${speaker}_${addressee}3.csv"
# 
#  		done
#  	done
#  done

# for speaker in  "Father" "Mother" "Grandmother" "Uncle" "Investigator" "Adult" "Brother" "Cousin" "Playmate" "Sister" "Teenager" ; 
# 	do
# 	for addressee in  "CDS" "OCDS" "ADS" ;
# 		do 
# 		for targetchild in "Hlobohang" "Litlhare" "Tsebo";
# 			do
# 		#		tr '[:upper:]' '[:lower:]'< "${pathToText}${targetchild}${speaker}${addressee}.csv" > "${pathToText}${targetchild}${speaker}${addressee}1.csv"  && mv "${pathToText}${targetchild}${speaker}${addressee}1.csv" "${pathToText}${targetchild}${speaker}${addressee}.csv"
#          #       cut -f19 < "${pathToText}${targetchild}${speaker}${addressee}.csv" > "${pathToText}utterance${targetchild}${speaker}${addressee}.csv"
#  		#		cut -f10 < "${pathToText}${targetchild}${speaker}${addressee}.csv" > "${pathToText}question${targetchild}_${speaker}${addressee}.csv"
#  		#		cut -f25 < "${pathToText}${targetchild}${speaker}${addressee}.csv" > "${pathToText}morphology${targetchild}${speaker}${addressee}.csv"
# 				cut -f11 < "${pathToText}${targetchild}${speaker}${addressee}.csv" > "${pathToText}question${targetchild}_${speaker}${addressee}3.csv"
# 
#  		done
#  	done
#  done
# 
for speaker in  "adult" "mother" "otherchild"; 
  	do
  	for addressee in  "CDS" "OCDS" "ADS" ;
  		do 
  		for targetchild in "Hlobohang" "Litlhare" "Tsebo" ;
  			do
  			echo "${pathToText1}${targetchild}${speaker}${addressee}.csv"
#  			do
#	 sed -e 's/\.//g'  -e 's/!//g'  -e 's/\_//g' -e 's/\&//g' -e 's/-//g' -e 's/\?//g'  -e 's/\[.*\]//g' -e 's/([^)]*)//g' -e  's/<.*>//g' -e '/xxx/d'  -e 's/+\///g' -e "s/\'//g" -e 's/  / /g' -e 's/^ //g' -e '/^\s$/d' -e 's/[0-0]//g' -e '/^$/g' -e 's/\://g' -e '/^  $/d' -e '/^</d' -e '/^$/d' < "${pathToText1}utterance_${targetchild}${speaker}${addressee}.csv" > "${pathToText1}cleanutterance_${targetchild}${speaker}${addressee}.csv"
#	tail -n +2  < "${pathToText1}cleanutterance_${targetchild}${speaker}${addressee}.csv" > "${pathToText1}clean1utterance_${targetchild}${speaker}${addressee}.csv" #uncomment this line if column title!
#    tail -n +2  < "${pathToText1}question_${targetchild}${speaker}${addressee}.csv" > "${pathToText1}question1_${targetchild}${speaker}${addressee}.csv" #uncomment this line if column title!
####      #   tail -n +2  < "${pathToText}morphology${targetchild}_${speaker}_${addressee}.csv" > "${pathToText}morphology${targetchild}_${speaker}_${addressee}_clean.csv" #uncomment this line if column title!
#	sed -e  's/ $//g' -e 's/ / ;eword /g' -e 's/$/ ;eword/g' < "${pathToText1}clean1utterance_${targetchild}${speaker}${addressee}.csv" > "${pathToText1}clean2utterance_${targetchild}${speaker}${addressee}.csv" #wordseg format
#   wordseg-stats  "${pathToText1}clean2utterance_${targetchild}${speaker}${addressee}.csv" > "${pathToText1}stats_utterance${targetchild}${speaker}${addressee}.txt"
  		numberoflines=`sed  '1q;d' "${pathToText1}stats_utterance${targetchild}${speaker}${addressee}.txt" | awk '{printf $3}' | tr -d '\n'` 		
 		numberofwords=`sed  '5q;d' "${pathToText1}stats_utterance${targetchild}${speaker}${addressee}.txt" | awk '{printf $3}' | tr -d '\n'`
  		numberofuttsinglewords=`sed  '2q;d' "${pathToText1}stats_utterance${targetchild}${speaker}${addressee}.txt" | awk '{printf $3}' | tr -d '\n'`
   		numberofhapaxes=`sed  '7q;d' "${pathToText1}stats_utterance${targetchild}${speaker}${addressee}.txt" | awk '{printf $3}' | tr -d '\n'`
        mattr=`sed  '3q;d' "${pathToText1}stats_utterance${targetchild}${speaker}${addressee}.txt"  | awk '{printf $3}' | tr -d '\n'`
        mlu=`echo "scale=3; $numberofwords / $numberoflines" | bc`		

 		nquestion=`grep question -o "${pathToText1}question1_${targetchild}${speaker}${addressee}.csv"| wc -l`  #count questions
 		percquest=`echo "scale=3; $nquestion / $numberoflines" | bc`

# 	
#  	    nverb=`grep "\-v\|v-\|^v\| v" -o "${pathToText}morphology${targetchild}_${speaker}_${addressee}_clean.csv"| wc -l`  #count questions
#  	    nnoun0=`grep  "\-n \|-n-\| n-\|^n-\| n \|^n \|^n$" -o "${pathToText}morphology${targetchild}_${speaker}_${addressee}_clean.csv"| wc -l`  #count questions
#         nnoun1=`grep  " n$" -o "${pathToText}morphology${targetchild}_${speaker}_${addressee}_clean.csv"| wc -l`  #count questions
#         nnoun2=`grep  "\-n$" -o "${pathToText}morphology${targetchild}_${speaker}_${addressee}_clean.csv"| wc -l` 
#         nnoun=$(($nnoun0 +  $nnoun1  + $nnoun2)) 
#  	    ratioverb=`echo "scale=3; $nverb / $numberofwords" | bc `
#  	    rationoun=`echo "scale=3; $nnoun / $numberofwords" | bc `
#  	    
#	    echo "${targetchild},${speaker},${addressee},${numberoflines},${numberofwords},${mlu},${mattr},${numberofuttsinglewords},${numberofhapaxes},${percquest}" >> ${pathToText1}shortoutputSesotho.csv
# 

#,${rationoun},${ratioverb}	
# #'-v-\| v-\|^v-\|^v '
# #"\-n \|-n-\|-n$\| n-\|^n-\| n \| n$\|^n \|^n$

done 
  		for targetchild in "Anae" "Anais" "Theotime" ;
  			do
  			echo "${pathToText1}${targetchild}${speaker}${addressee}.csv"
             #	tail -n +2  < "${pathToText1}cleanutterance_${targetchild}${speaker}${addressee}.csv" > "${pathToText1}clean1utterance_${targetchild}${speaker}${addressee}.csv" #uncomment this line if column title!
 	         nquestion=`grep ? -o "${pathToText1}clean1utterance_${targetchild}${speaker}${addressee}.csv"| wc -l`  #count questions
 	     #    sed 's/\?//g' "${pathToText1}clean1utterance_${targetchild}${speaker}${addressee}.csv" > "${pathToText1}clean2utterance_${targetchild}${speaker}${addressee}.csv"
    	  #   sed -e  's/ $//g' -e 's/ / ;eword /g' -e 's/$/ ;eword/g' < "${pathToText1}clean2utterance_${targetchild}${speaker}${addressee}.csv" > "${pathToText1}clean3utterance_${targetchild}${speaker}${addressee}.csv" #wordseg format
    	   #  wordseg-stats  "${pathToText1}clean3utterance_${targetchild}${speaker}${addressee}.csv" > "${pathToText1}stats_utterance${targetchild}${speaker}${addressee}.txt"		 
    		
  		    numberoflines=`sed  '1q;d' "${pathToText1}stats_utterance${targetchild}${speaker}${addressee}.txt" | awk '{printf $3}' | tr -d '\n'` 		
 		    numberofwords=`sed  '5q;d' "${pathToText1}stats_utterance${targetchild}${speaker}${addressee}.txt" | awk '{printf $3}' | tr -d '\n'`
  		    numberofuttsinglewords=`sed  '2q;d' "${pathToText1}stats_utterance${targetchild}${speaker}${addressee}.txt" | awk '{printf $3}' | tr -d '\n'`
   		    numberofhapaxes=`sed  '7q;d' "${pathToText1}stats_utterance${targetchild}${speaker}${addressee}.txt" | awk '{printf $3}' | tr -d '\n'`
            mattr=`sed  '3q;d' "${pathToText1}stats_utterance${targetchild}${speaker}${addressee}.txt"  | awk '{printf $3}' | tr -d '\n'`
            mlu=`echo "scale=3; $numberofwords / $numberoflines" | bc`		
    		percquest=`echo "scale=3; $nquestion / $numberoflines" | bc` 


	    echo "${targetchild},${speaker},${addressee},${numberoflines},${numberofwords},${mlu},${mattr},${numberofuttsinglewords},${numberofhapaxes},${percquest}" >> ${pathToText1}shortoutputFrench.csv

done
 done
 done


 # for speaker in  "Father" "Mother" "Grandmother" "Uncle" "Investigator" "Adult" "Brother" "Cousin" "Playmate" "Sister" "Teenager" ; 
#  	do
#  	for addressee in  "CDS" "OCDS" "ADS" ;
#  		do 
#  		for targetchild in "Hlobohang" "Litlhare" "Tsebo";
#         do
# # 		#sed -e 's/\.//g'  -e 's/!//g'  -e 's/\_//g' -e 's/\&//g' -e 's/-//g' -e 's/\?//g'  -e 's/\[.*\]//g' -e 's/([^)]*)//g' -e  's/<.*>//g' -e '/xxx/d'  -e 's/+\///g' -e "s/\'//g" -e 's/  / /g' -e 's/^ //g' -e '/^\s$/d' -e 's/[0-0]//g' -e '/^$/g' -e 's/\://g' -e '/^  $/d' -e '/^</d' -e '/^$/d' < "utterance${targetchild}${speaker}${addressee}.csv" > "utterance_${targetchild}_${speaker}_${addressee}_clean.csv"
# #  		#tail -n +2  < "utterance_${targetchild}_${speaker}_${addressee}_clean.csv" > "utterance_${targetchild}_${speaker}_${addressee}_clean1.csv" #uncomment this line if column title!
# #         tail -n +2  < "question${targetchild}_${speaker}${addressee}.csv" > "question${targetchild}_${speaker}_${addressee}_clean.csv" #uncomment this line if column title!
# #         tail -n +2  < "${pathToText}morphology${targetchild}${speaker}${addressee}.csv" > "${pathToText}morphology${targetchild}_${speaker}_${addressee}_clean.csv" #uncomment this line if column title!
# #  # 		sed -e  's/ $//g' -e 's/ / ;eword /g' -e 's/$/ ;eword/g' < "utterance_${targetchild}_${speaker}_${addressee}_clean1.csv" > "utterance_${targetchild}_${speaker}_${addressee}_clean2.csv" #wordseg format
# # 	    wordseg-stats  "utterance_${targetchild}_${speaker}_${addressee}_clean2.csv" > "stats_utterance_${targetchild}_${speaker}_${addressee}.txt"
#   		numberoflines=`sed  '1q;d' "${pathToText}stats_utterance_${targetchild}_${speaker}_${addressee}.txt" | awk '{printf $3}' | tr -d '\n'` 		
# 
#  	 	numberofwords=`sed  '5q;d' "${pathToText}stats_utterance_${targetchild}_${speaker}_${addressee}.txt" | awk '{printf $3}' | tr -d '\n'`
#  	 	
#  	 	numberoftypes=`sed  '6q;d' "${pathToText}stats_utterance_${targetchild}_${speaker}_${addressee}.txt" | awk '{printf $3}' | tr -d '\n'`
# 
#    		numberofuttsinglewords=`sed  '2q;d' "${pathToText}stats_utterance_${targetchild}_${speaker}_${addressee}.txt" | awk '{printf $3}' | tr -d '\n'`
#      	
#      	numberofhapaxes=`sed  '7q;d' "${pathToText}stats_utterance_${targetchild}_${speaker}_${addressee}.txt" | awk '{printf $3}' | tr -d '\n'`
#         
#         mattr=`sed  '3q;d' "${pathToText}stats_utterance_${targetchild}_${speaker}_${addressee}.txt"  | awk '{printf $3}' | tr -d '\n'`
#         
#         mlu=`echo "scale=3; $numberofwords / $numberoflines" | bc`		
# # #  
#  		nquestion=`grep question -o "${pathToText}question${targetchild}_${speaker}_${addressee}_clean.csv"| wc -l`  #count questions
#   		
#   		percquest=`echo "scale=3; $nquestion / $numberoflines" | bc`
#   		
#   		ratiohapax=`echo "scale=3; $numberofhapaxes / $numberofwords" | bc`
# 
#   	    nverb=`grep "\-v\|v-\|^v\| v" -o "${pathToText}morphology${targetchild}_${speaker}_${addressee}_clean.csv"| wc -l`  #count questions
#   	    
#   	    nnoun0=`grep  "\-n \|-n-\| n-\|^n-\| n \|^n \|^n$" -o "${pathToText}morphology${targetchild}_${speaker}_${addressee}_clean.csv"| wc -l`  #count questions
#         
#         nnoun1=`grep  " n$" -o "${pathToText}morphology${targetchild}_${speaker}_${addressee}_clean.csv"| wc -l`  #count questions
#         
#         nnoun2=`grep  "\-n$" -o "${pathToText}morphology${targetchild}_${speaker}_${addressee}_clean.csv"| wc -l` 
#         
#         ratiouttsinglewords=`echo "scale=3; $numberofuttsinglewords / $numberoflines" | bc `
#         
#         nnoun=$(($nnoun0 +  $nnoun1  + $nnoun2)) 
#   	    
#   	    ratioverb=`echo "scale=3; $nverb / $numberofwords" | bc `
#   	    
#   	    rationoun=`echo "scale=3; $nnoun / $numberofwords" | bc `
#   	    
#   	    numberofphonemes=`cat "${pathToText}utterance_${targetchild}_${speaker}_${addressee}_clean2.csv" |  sed 's/;eword//g'  | tr -d '[:space:]'   | wc -c `
#   	    
#         echo $"utterance_${targetchild}_${speaker}_${addressee}_clean2.csv"  	   
#   	    echo ${numberofphonemes}
#   	    
#   	    mwl=`echo "scale=3; $numberofphonemes / $numberofwords" | bc `
# #  	    
#  	    echo "${targetchild},${speaker},${addressee},${numberoflines},${numberofwords},${mlu},${mwl},${mattr},${ratiouttsinglewords},${ratiohapax},${percquest},${rationoun},${ratioverb}" >> ${pathToText}longoutput.csv
# # 	
# 
# 
# 
# 
# done
# done
# done
# 
