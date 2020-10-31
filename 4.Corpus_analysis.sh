#!/bin/bash



path_="/Users/admin/Desktop/resultspeerspeech/"
pathToText="/Users/admin/Desktop/resultspeerspeech/utterances/Sesotho/" 
pathToText1="/Users/admin/Desktop/resultspeerspeech/utterances/Sesotho_processed/" 
pathToTextwordseg="/Users/admin/Desktop/resultspeerspeech/utterances/Sesotho_wordseg/" 
pathToTextf="/Users/admin/Desktop/resultspeerspeech/utterances/French/" 
pathToTextf1="/Users/admin/Desktop/resultspeerspeech/utterances/French_processed/" 
pathToTextfwordseg="/Users/admin/Desktop/resultspeerspeech/utterances/French_wordseg/" 
sesotho="/Users/admin/Desktop/resultspeerspeech/demuth.txt"
french="/Users/admin/Desktop/resultspeerspeech/french.txt"



  for speaker in  "adult" "mother" "child"; 
  do
    	for addressee in  "CDS" "OCDS" "ADS" ;
    	do 
      		for targetchild in "Hlobohang" "Litlhare" "Neuoe" ;
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
     			
	    cut -f22 < "${pathToText}${targetchild}${speaker}${session}${addressee}.csv" > "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}.csv"
     	tr '[:upper:]' '[:lower:]'< "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}.csv" > "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}1.csv"  && mv "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}1.csv" "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}.csv"
      awk 'FNR>1'  "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}.csv"  > "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}1.csv"  && mv "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}1.csv" "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}.csv"
	    cut -f25 < "${pathToText}${targetchild}${speaker}${session}${addressee}.csv" > "${pathToText1}morphology${targetchild}${speaker}${session}${addressee}.csv"
      awk 'FNR>1'  "${pathToText1}morphology${targetchild}${speaker}${session}${addressee}.csv"  > "${pathToText1}morphology${targetchild}${speaker}${session}${addressee}1.csv"  && mv "${pathToText1}morphology${targetchild}${speaker}${session}${addressee}1.csv" "${pathToText1}morphology${targetchild}${speaker}${session}${addressee}.csv"
	    cut -f12 < "${pathToText}${targetchild}${speaker}${session}${addressee}.csv" > "${pathToText1}question${targetchild}${speaker}${session}${addressee}.csv"
      awk 'FNR>1'  "${pathToText1}question${targetchild}${speaker}${session}${addressee}.csv"  > "${pathToText1}question${targetchild}${speaker}${session}${addressee}1.csv"  && mv "${pathToText1}question${targetchild}${speaker}${session}${addressee}1.csv" "${pathToText1}question${targetchild}${speaker}${session}${addressee}.csv"
      sed -e 's/\.//g'  -e 's/!//g'  -e 's/\_//g' -e 's/\&//g' -e 's/-//g' -e 's/\?//g'  -e 's/\[.*\]//g' -e 's/([^)]*)//g' -e  's/<.*>//g' -e '/xxx/d'  -e 's/+\///g' -e "s/\'//g" -e 's/  / /g' -e 's/^ //g' -e '/^\s$/d' -e 's/[0-0]//g' -e '/^$/g' -e 's/\://g' -e '/^  $/d' -e '/^</d' -e '/^$/d' < "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextwordseg}cleanutterance${targetchild}${speaker}${session}${addressee}.csv"
      sed -e  's/ $//g' -e 's/ / ;eword /g' -e 's/$/ ;eword/g' < "${pathToTextwordseg}cleanutterance${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextwordseg}cleanutterancewordseg${targetchild}${speaker}${session}${addressee}.csv" #wordseg format
      wordseg-stats  "${pathToTextwordseg}cleanutterancewordseg${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextwordseg}stats${targetchild}${speaker}${session}${addressee}.csv"

         numberoflines=`sed  '1q;d' "${pathToTextwordseg}stats${targetchild}${speaker}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'` 		
      	 numberofwords=`sed  '5q;d' "${pathToTextwordseg}stats${targetchild}${speaker}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'`
         numberofuttsinglewords=`sed  '2q;d' "${pathToTextwordseg}stats${targetchild}${speaker}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'`
         numberofhapaxes=`sed  '7q;d' "${pathToTextwordseg}stats${targetchild}${speaker}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'`
         mattr=`sed  '3q;d' "${pathToTextwordseg}stats${targetchild}${speaker}${session}${addressee}.csv"  | awk '{printf $3}' | tr -d '\n'`
         mlu=`echo "scale=3; $numberofwords / $numberoflines" | bc`		
         nquestion=`grep question -o "${pathToText1}question${targetchild}${speaker}${session}${addressee}.csv"| wc -l`  #count questions
      	 percquest=`echo "scale=3; $nquestion / $numberoflines" | bc` 
           
           ntotalturns=`grep "${speaker_}', '${session_}', '${addressee_}', '_match" -o "${pathToText1}demuthturns.txt"|wc -l`
           ntotal=`grep "${speaker_}', '${session_}', '${addressee_}', " -o "${pathToText1}demuthturns.txt"|wc -l`            
           ratioturn=`echo "scale=3; $ntotalturns / $ntotal" | bc `

 	    echo "${targetchild},${speaker},${addressee},${session},${numberoflines},${numberofwords},${mlu},${mattr},${numberofuttsinglewords},${numberofhapaxes},${percquest},${ratioturn}" >> "${pathToText1}shortoutputSesotho.csv"   
 done done  


   
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
     		echo "${pathToTextf}${targetchild}${speaker}${session}${addressee}.csv"





       	   cut -f4 < "${pathToTextf}${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextf1}utterance${targetchild}${speaker}${session}${addressee}.csv"
           awk 'FNR>1'  "${pathToTextf1}utterance${targetchild}${speaker}${session}${addressee}.csv"  > "${pathToTextf1}utterance${targetchild}${speaker}${session}${addressee}1.csv"  && mv "${pathToTextf1}utterance${targetchild}${speaker}${session}${addressee}1.csv" "${pathToTextf1}utterance${targetchild}${speaker}${session}${addressee}.csv"
   	   	   sed -e 's/< //g' -e 's/xxx //g' -e 's/xxx//g' -e 's/\[\/\]//g' -e 's/\<//g' -e 's/\>//g'  -e 's/!//g' -e 's/\(\.\)//g' -e 's/ \.//g' -e 's/\[\=\!.*\]//g' -e 's/\[.*]//g'  -e '/^$/d' -e '/^xxx$/d'  -e 's/www//g' -e 's/://g' -e 's/+//g' -e 's/\///g' -e 's/(//g'  -e 's/)//g' -e 's/›//g' -e 's/‹//g' -e 's/\...//g' -e 's/\..//g'  -e 's/  / /g' -e 's/ ?/?/g' -e '/^$/d' "${pathToTextf1}utterance${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextf1}cleanutterance${targetchild}${speaker}${session}${addressee}.csv"
           tr '[:upper:]' '[:lower:]'< "${pathToTextf1}cleanutterance${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextf1}cleanutterance${targetchild}${speaker}${session}${addressee}1.csv"  && mv "${pathToTextf1}cleanutterance${targetchild}${speaker}${session}${addressee}1.csv" "${pathToTextf1}cleanutterance${targetchild}${speaker}${session}${addressee}.csv"
  	  	  
  	  	  
  	  	     #run part of speech spacy
            sed -e 's/\?//g' -e 's/^ //g' -e "s/\' /\'/g"  "${pathToTextf1}partofspeechutterance${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextf1}partofspeechutterance1${targetchild}${speaker}${session}${addressee}.csv"
            sed  -e 's/-//g' -e 's/  / /g' -e "s/\'//g" -e  's/ $//g'  -e  's/^ //g' -e  '/^ $/d'  -e  '/^$/d'  -e 's/ / ;eword /g' -e 's/$/ ;eword/g' < "${pathToTextf1}partofspeechutterance1${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextfwordseg}cleanutterancewordseg${targetchild}${speaker}${session}${addressee}.csv" #wordseg format
            wordseg-stats  "${pathToTextfwordseg}cleanutterancewordseg${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextfwordseg}stats${targetchild}${speaker}${session}${session}${addressee}.csv"          		
  
    	      nquestionf=`grep ? -o  "${pathToTextf1}partofspeechutterance${targetchild}${speaker}${session}${addressee}.csv"| wc -l`  #count questions
      	  	numberoflinesf=`sed  '1q;d' "${pathToTextfwordseg}stats${targetchild}${speaker}${session}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'` 		
      		  numberofwordsf=`sed  '5q;d' "${pathToTextfwordseg}stats${targetchild}${speaker}${session}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'`
      		  numberofuttsinglewordsf=`sed  '2q;d' "${pathToTextfwordseg}stats${targetchild}${speaker}${session}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'`
      	    numberofhapaxesf=`sed  '7q;d' "${pathToTextfwordseg}stats${targetchild}${speaker}${session}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'`
      	    mattrf=`sed  '3q;d' "${pathToTextfwordseg}stats${targetchild}${speaker}${session}${session}${addressee}.csv"  | awk '{printf $3}' | tr -d '\n'`
            mluf=`echo "scale=3; $numberofwordsf / $numberoflinesf" | bc`		
   	        percquestf=`echo "scale=3; $nquestionf / $numberoflinesf" | bc` 
          
              ntotalturnsf=`grep "${speaker_}', '${session_}', '${addressee_}', '_match" -o "${pathToTextf1}frenchturns.txt"|wc -l`
              ntotalf=`grep "${speaker_}', '${session_}', '${addressee_}', " -o "${path_}frenchturns.txt"|wc -l`       
              ratioturnf=`echo "scale=3; $ntotalturnsf / $ntotalf" | bc `
 
  	    echo "${targetchild},${speaker},${addressee},${session},${numberoflinesf},${numberofwordsf},${mluf},${mattrf},${numberofuttsinglewordsf},${numberofhapaxesf},${percquestf},${ratioturnf}" >> "${path_}shortoutputFrench1.csv" 
 
 

done done
done done




          
# 
# #####Treetagger
#   #          /Users/admin/Documents/tree-tagger-MacOSX-3.2.2/cmd/tree-tagger-French "${pathToTextf1}cleanutterance1${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextf1}partofspeech${targetchild}${speaker}${session}${addressee}.csv"
#          #   cut -f2 < "${pathToTextf1}partofspeech${targetchild}${speaker}${session}${addressee}.csv"  > "${pathToTextf1}partofspeech1${targetchild}${speaker}${session}${addressee}.csv"  && mv "${pathToTextf1}partofspeech1${targetchild}${speaker}${session}${addressee}.csv" "${pathToTextf1}partofspeech${targetchild}${speaker}${session}${addressee}.csv" #count questions
#   #	  	    nnounf=`grep NOM -o  "${pathToTextf1}partofspeech${targetchild}${speaker}${session}${addressee}.csv"| wc -l`  #count questions
#   #	  	    nverbf=`grep VER -o  "${pathToTextf1}partofspeech${targetchild}${speaker}${session}${addressee}.csv"| wc -l`  #count questions
#   #          nounverbf=$((nnounf +  nverbf)) 
#   #          rationvf=`echo "scale=3; $nounverbf / $numberofwordsf" | bc ` 
#     # #        #   nverb=`grep "\-v\|v-\|^v\| v" -o "${pathToText1}morphology${targetchild}${speaker}${session}${addressee}.csv"| wc -l`  
# # #    	     nnoun0=`grep  "\-n \|-n-\| n-\|^n-\| n \|^n \|^n$" -o "${pathToText1}morphology${targetchild}${speaker}${session}${addressee}.csv"| wc -l` 
# # #          nnoun1=`grep  " n$" -o "${pathToText1}morphology${targetchild}${speaker}${session}${addressee}.csv"| wc -l`  
# # #          nnoun2=`grep  "\-n$" -o "${pathToText1}morphology${targetchild}${speaker}${session}${addressee}.csv"| wc -l` 
# # #          nnoun=$(($nnoun0 +  $nnoun1  + $nnoun2)) 
# # #          nounverb=$((nnoun +  nverb)) 
# # #          rationv=`echo "scale=3; $nounverb / $numberofwords" | bc ` 	    
         #     speaker_=$(echo "$speaker" | awk '{print tolower($0)}')
        #      session_=$(echo "$session" | awk '{print tolower($0)}')
       #       addressee_=$(echo "$addressee" | awk '{print tolower($0)}')                   
  
