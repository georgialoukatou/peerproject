#!/bin/bash
source /Users/lscpuser/opt/miniconda2/etc/profile.d/conda.sh

conda activate wordseg


path_="/Users/lscpuser/Documents/peerproject/github/peerproject/for_reproduce/derived/text_analysis/"
pathToText="/Users/lscpuser/Documents/peerproject/github/peerproject/for_reproduce/derived/text_analysis/Sesotho/"
pathToTextf="/Users/lscpuser/Documents/peerproject/github/peerproject/for_reproduce/derived/text_analysis/French/"  
pathToTextwordseg="/Users/lscpuser/Documents/peerproject/github/peerproject/for_reproduce/derived/text_analysis/Sesotho/wordseg/"
pathToTextfwordseg="/Users/lscpuser/Documents/peerproject/github/peerproject/for_reproduce/derived/text_analysis/French/wordseg/"

####SESOTHO
  for speaker in  "adult" "mother" "child"; 
  do
    	for addressee in  "CDS" "OCDS" "ADS" ;
    	do 
      		for targetchild in "Hlobohang" ; #"Hlobohang" "Neuoe"
      		do
      		
     			if [ $targetchild == "Hlobohang" ]; then
     		       declare -a listSesotho=("Hlobohang-020100ab.cha" "Hlobohang-020100cd.cha" "Hlobohang-020100ef.cha" "Hlobohang-020200ab.cha" "Hlobohang-020200cd.cha" "Hlobohang-020400ab.cha" "Hlobohang-020400cd.cha" "Hlobohang-020500ab.cha" "Hlobohang-020500cd.cha" "Hlobohang-021100ab.cha" "Hlobohang-021100cd.cha" "Hlobohang-020600ab.cha" "Hlobohang-020600cd.cha" "Hlobohang-020700ab.cha" "Hlobohang-020700cd.cha" "Hlobohang-020800ab.cha" "Hlobohang-020800cd.cha" "Hlobohang-020800ef.cha" "Hlobohang-020900ab.cha" "Hlobohang-020900cd.cha" "Hlobohang-020900e.cha" "Hlobohang-030000ab.cha" "Hlobohang-030000cd.cha")
   				fi
   			    

          if [ $targetchild == "Litlhare" ]; then
     		       declare -a listSesotho=("Litlhare-020100ab.cha" "Litlhare-020100cd.cha"  "Litlhare-020100ef.cha"  "Litlhare-020200ab.cha"  "Litlhare-020200cd.cha" "Litlhare-020400ab.cha"  "Litlhare-020400cd.cha"  "Litlhare-020500ab.cha"  "Litlhare-020500cd.cha" "Litlhare-020500ef.cha"  "Litlhare-030000ab.cha"  "Litlhare-030000cd.cha"  "Litlhare-020600ab.cha" "Litlhare-020600cd.cha"  "Litlhare-020600e.cha"   "Litlhare-020800ab.cha"  "Litlhare-020800cd.cha"  "Litlhare-020900ab.cha"  "Litlhare-020900cd.cha"  "Litlhare-021000ab.cha"  "Litlhare-021000cd.cha"  "Litlhare-030200ab.cha"  "Litlhare-030200cd.cha") 
   				fi	
  			    

          if [ $targetchild == "Neuoe" ]; then
    		       declare -a listSesotho=( "Neuoe-030800ab.cha" "Neuoe-030800cd.cha"  "Neuoe-030800ef.cha" "Neuoe-030900a.cha"  "Neuoe-030900b.cha"  "Neuoe-031000ab.cha"     "Neuoe-031000cd.cha"     "Neuoe-031000e.cha"      "Neuoe-040000ab.cha"     "Neuoe-040000cd.cha"     "Neuoe-040100ab.cha"     "Neuoe-040100cd.cha"     "Neuoe-040100ef.cha"     "Neuoe-040300ab.cha"    "Neuoe-040300cd.cha"     "Neuoe-040300e.cha"      "Neuoe-040300f.cha"      "Neuoe-040500ab.cha"     "Neuoe-040500cd.cha"     "Neuoe-040500e.cha"      "Neuoe-040700ab.cha"     "Neuoe-040700cd.cha"    "Neuoe-040700e.cha" )
   				fi	


     			for session in ${listSesotho[@]} ;
     			do
    			
    			echo "${pathToText}${targetchild}${speaker}${session}${addressee}.csv"


####text processing:

	    #cut -f22 < "${pathToText}${targetchild}${speaker}${session}${addressee}.csv" > "${pathToText}utterance${targetchild}${speaker}${session}${addressee}.csv"
     	#tr '[:upper:]' '[:lower:]'< "${pathToText}utterance${targetchild}${speaker}${session}${addressee}.csv" > "${pathToText}utterance${targetchild}${speaker}${session}${addressee}1.csv"  && mv "${pathToText}utterance${targetchild}${speaker}${session}${addressee}1.csv" "${pathToText}utterance${targetchild}${speaker}${session}${addressee}.csv"
      #awk 'FNR>1'  "${pathToText}utterance${targetchild}${speaker}${session}${addressee}.csv"  > "${pathToText}utterance${targetchild}${speaker}${session}${addressee}1.csv"  && mv "${pathToText}utterance${targetchild}${speaker}${session}${addressee}1.csv" "${pathToText}utterance${targetchild}${speaker}${session}${addressee}.csv"
	    
      #cut -f24 < "${pathToText}${targetchild}${speaker}${session}${addressee}.csv" > "${pathToText}morphology${targetchild}${speaker}${session}${addressee}.csv"
      #awk 'FNR>1'  "${pathToText}morphology${targetchild}${speaker}${session}${addressee}.csv"  > "${pathToText}morphology${targetchild}${speaker}${session}${addressee}1.csv"  && mv "${pathToText}morphology${targetchild}${speaker}${session}${addressee}1.csv" "${pathToText}morphology${targetchild}${speaker}${session}${addressee}.csv"
	    #sed -e 's/-/ /g'  -e 's/#/ /g' "${pathToText}morphology${targetchild}${speaker}${session}${addressee}.csv" > "${pathToText}morphologymorphemes${targetchild}${speaker}${session}${addressee}.csv" 


      #cut -f12 < "${pathToText}${targetchild}${speaker}${session}${addressee}.csv" > "${pathToText}question${targetchild}${speaker}${session}${addressee}.csv"
      #awk 'FNR>1'  "${pathToText}question${targetchild}${speaker}${session}${addressee}.csv"  > "${pathToText}question${targetchild}${speaker}${session}${addressee}1.csv"  && mv "${pathToText}question${targetchild}${speaker}${session}${addressee}1.csv" "${pathToText}question${targetchild}${speaker}${session}${addressee}.csv"
      
      #sed -e 's/\.//g'  -e 's/!//g'  -e 's/\_//g' -e 's/\&//g' -e 's/-//g' -e 's/\?//g'  -e 's/\[.*\]//g' -e 's/([^)]*)//g' -e  's/<.*>//g' -e '/xxx/d'  -e 's/+\///g' -e "s/\'//g" -e 's/  / /g' -e 's/^ //g' -e '/^\s$/d' -e 's/[0-0]//g' -e '/^$/g' -e 's/\://g' -e '/^  $/d' -e '/^</d' -e '/^$/d' < "${pathToText}utterance${targetchild}${speaker}${session}${addressee}.csv" > "${pathToText}cleanutterance${targetchild}${speaker}${session}${addressee}.csv"
      #sed -e  's/ $//g' -e 's/ / ;eword /g' -e 's/$/ ;eword/g' < "${pathToText}cleanutterance${targetchild}${speaker}${session}${addressee}.csv" > "${pathToText}cleanutterancewordseg${targetchild}${speaker}${session}${addressee}.csv" #wordseg format
      #sed -e  's/ $//g' -e 's/ / ;eword /g' -e 's/$/ ;eword/g' < "${pathToText}morphologymorphemes${targetchild}${speaker}${session}${addressee}.csv" > "${pathToText}cleanutterancewordsegmorphemes${targetchild}${speaker}${session}${addressee}.csv" #wordseg format

      #wordseg-stats  "${pathToText}cleanutterancewordseg${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextwordseg}stats${targetchild}${speaker}${session}${addressee}.csv"
      #wordseg-stats  "${pathToText}cleanutterancewordsegmorphemes${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextwordseg}statsmorphemes${targetchild}${speaker}${session}${addressee}.csv"


####measure variables:
      #   numberoflines=`sed  '1q;d' "${pathToTextwordseg}stats${targetchild}${speaker}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'` 		
      	 
      #   numberofwords=`sed  '5q;d' "${pathToTextwordseg}stats${targetchild}${speaker}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'`
      #   numberofmorphemes=`sed  '5q;d' "${pathToTextwordseg}statsmorphemes${targetchild}${speaker}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'`
      #   numberofuttsinglewords=`sed  '2q;d' "${pathToTextwordseg}stats${targetchild}${speaker}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'`
      #   numberofhapaxes=`sed  '7q;d' "${pathToTextwordseg}stats${targetchild}${speaker}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'`
         
      #   mattr=`sed  '3q;d' "${pathToTextwordseg}stats${targetchild}${speaker}${session}${addressee}.csv"  | awk '{printf $3}' | tr -d '\n'`
         
      #   mlu=`echo "scale=3; $numberofwords / $numberoflines" | bc`		
      #   mlumorphemes=`echo "scale=3; $numberofmorphemes / $numberoflines" | bc`    

      #  nquestion=`grep question -o "${pathToText}question${targetchild}${speaker}${session}${addressee}.csv"| wc -l`  #count questions
      #  percquest=`echo "scale=3; $nquestion / $numberoflines" | bc` 
           
       #  ntotalturns=`grep "${speaker_}', '${session_}', '${addressee_}', '_match" -o "${path_}sesothoturns.txt"|wc -l`
       #  ntotal=`grep "${speaker_}', '${session_}', '${addressee_}', " -o "${path_}sesothoturns.txt"|wc -l`            
       #  ratioturn=`echo "scale=3; $ntotalturns / $ntotal" | bc `

 	   # echo "${targetchild},${speaker},${addressee},${session},${numberoflines},${numberofwords},${numberofmorphemes},${mlu},${mlumorphemes},${mattr},${numberofuttsinglewords},${numberofhapaxes},${percquest},${ratioturn}" >> "${path_}shortoutputSesotho.csv"   
 done done  


#####FRENCH

        for targetchild in "Anae" "Anais" "Theotime" ;
     	  do

     		if [ $targetchild == "Anae" ]; then
      		declare -a listFrench=("Anae_215.cha" "Anae_2216.cha" "Anae_2428.cha" "Anae_2529.cha" "Anae_2626.cha" "Anae_284.cha" "Anae_2923.cha" "Anae_2123.cha" "Anae_21122.cha" "Anae_317.cha"  )
    		fi
   			if [ $targetchild == "Anais" ]; then
     		declare -a listFrench=("Anais_239a.cha"     "Anais_247a.cha"     "Anais_247b.cha"     "Anais_242a.cha"     "Anais_242b.cha"     "Anais_2511a.cha"    "Anais_2511b.cha"    "Anais_2523a.cha"   "Anais_2525a.cha"    "Anais_2621a.cha"    "Anais_28a.cha"      "Anais_296b.cha"  )
   			fi	
   			if [ $targetchild == "Theotime" ]; then
   			declare -a listFrench=("Theotime_2111a.cha" "Theotime_239b.cha" "Theotime_2324a.cha" "Theotime_2324b.cha" "Theotime_2422a.cha" "Theotime_252a.cha"  "Theotime_263a.cha"  "Theotime_273a.cha" "Theotime_2112a.cha")
    		fi						 
     		for session in ${listFrench[@]} ;
    			do
     		# echo ${numberofmorphemesf}echo "${pathToTextf}${targetchild}${speaker}${session}${addressee}.csv"




####text processing:
	 #  cut -f4 < "${pathToTextf}${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextf}utterance${targetchild}${speaker}${session}${addressee}.csv"
   #  awk 'FNR>1'  "${pathToTextf}utterance${targetchild}${speaker}${session}${addressee}.csv"  > "${pathToTextf}utterance${targetchild}${speaker}${session}${addressee}1.csv"  && mv "${pathToTextf}utterance${targetchild}${speaker}${session}${addressee}1.csv" "${pathToTextf}utterance${targetchild}${speaker}${session}${addressee}.csv"
   #	 sed -e 's/< //g' -e 's/xxx //g' -e 's/xxx//g' -e 's/\[\/\]//g' -e 's/\<//g' -e 's/\>//g'  -e 's/!//g' -e 's/\(\.\)//g' -e 's/ \.//g' -e 's/\[\=\!.*\]//g' -e 's/\[.*]//g'  -e '/^$/d' -e '/^xxx$/d'  -e 's/www//g' -e 's/://g' -e 's/+//g' -e 's/\///g' -e 's/(//g'  -e 's/)//g' -e 's/›//g' -e 's/‹//g' -e 's/\...//g' -e 's/\..//g'  -e 's/  / /g' -e 's/ ?/?/g' -e '/^$/d' "${pathToTextf}utterance${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextf}cleanutterance${targetchild}${speaker}${session}${addressee}.csv"
   #  tr '[:upper:]' '[:lower:]'< "${pathToTextf}cleanutterance${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextf}cleanutterance${targetchild}${speaker}${session}${addressee}1.csv"  && mv "${pathToTextf}cleanutterance${targetchild}${speaker}${session}${addressee}1.csv" "${pathToTextf}cleanutterance${targetchild}${speaker}${session}${addressee}.csv"
    	  
   #run part of speech spacy
   ####python /Users/lscpuser/Documents/peerproject/github/peerproject/adjplusnoun.py

   #  sed -e 's/\?//g' -e 's/^ //g' -e "s/\' /\'/g"  "${pathToTextf}partofspeechutterance${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextf}partofspeechutterance1${targetchild}${speaker}${session}${addressee}.csv"
   # sed  -e 's/-//g' -e 's/  / /g' -e "s/\'//g" -e  's/ $//g'  -e  's/^ //g' -e  '/^ $/d'  -e  '/^$/d'  -e 's/ / ;eword /g' -e 's/$/ ;eword/g' < "${pathToTextf}partofspeechutterance1${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextfwordseg}cleanutterancewordseg${targetchild}${speaker}${session}${addressee}.csv" #wordseg format
   #  wordseg-stats  "${pathToTextfwordseg}cleanutterancewordseg${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextfwordseg}stats${targetchild}${speaker}${session}${session}${addressee}.csv"          		
          

   #CLAN files
   #sed '/*CHI:/d' "${pathToTextf}frenchmorphs/cleanutterance${targetchild}${speaker}${session}${addressee}.csv.cha" > "${pathToTextf}frenchmorphs/cleanutterance1${targetchild}${speaker}${session}${addressee}.csv"
   #sed -e 's/-/ /g'  -e 's/#/ /g' -e  's/%mor://g' -e  's/\?//g' -e 's/  / /g'  
"${pathToTextf}frenchmorphs/cleanutterance1${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextf}frenchmorphs/cleanutterancewordseg${targetchild}${speaker}${session}${addressee}.csv"
  



####measure variables:
            numberofmorphemesf=`wc -w "${pathToTextf}frenchmorphs/cleanutterancewordseg${targetchild}${speaker}${session}${addressee}.csv"| awk '{printf $1}' | tr -d ' '`
            #echo ${numberofmorphemesf}

 	          nquestionf=`grep ? -o  "${pathToTextf}partofspeechutterance${targetchild}${speaker}${session}${addressee}.csv"| wc -l`  #count questions
      	  	numberoflinesf=`sed  '1q;d' "${pathToTextfwordseg}stats${targetchild}${speaker}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'` 		
            numberofwordsf=`sed  '5q;d' "${pathToTextfwordseg}stats${targetchild}${speaker}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'`
      		  numberofuttsinglewordsf=`sed  '2q;d' "${pathToTextfwordseg}stats${targetchild}${speaker}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'`
      	    numberofhapaxesf=`sed  '7q;d' "${pathToTextfwordseg}stats${targetchild}${speaker}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'`
      	    mattrf=`sed  '3q;d' "${pathToTextfwordseg}stats${targetchild}${speaker}${session}${addressee}.csv"  | awk '{printf $3}' | tr -d '\n'`
            mluf=`echo "scale=3; $numberofwordsf / $numberoflinesf" | bc`		
            mlumorphemesf=`echo "scale=3; $numberofmorphemesf / $numberoflinesf" | bc`   
            #echo ${mlumorphemesf}
   	        percquestf=`echo "scale=3; $nquestionf / $numberoflinesf" | bc` 
          
            ntotalturnsf=`grep "${speaker_}', '${session_}', '${addressee_}', '_match" -o "${path_}frenchturns.txt"|wc -l`
            ntotalf=`grep "${speaker_}', '${session_}', '${addressee_}', " -o "${path_}frenchturns.txt"|wc -l`       
            ratioturnf=`echo "scale=3; $ntotalturnsf / $ntotalf" | bc `
 
  	    echo "${targetchild},${speaker},${addressee},${session},${numberoflinesf},${numberofwordsf},${numberofmorphemesf},${mluf},${mlumorphemesf},${mattrf},${numberofuttsinglewordsf},${numberofhapaxesf},${percquestf},${ratioturnf}" >> "${path_}shortoutputFrench.csv" 
 
 

done done
done done
