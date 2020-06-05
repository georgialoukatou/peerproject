#!/bin/bash

path_="/Users/admin/Documents/peerspeech_03.06.2020/"
pathToText="/Users/admin/Documents/peerspeech_03.06.2020/utterances/Sesotho/" 
pathToText1="/Users/admin/Documents/peerspeech_03.06.2020/utterances/Sesotho_processed/" 
pathToTextwordseg="/Users/admin/Documents/peerspeech_03.06.2020/utterances/Sesotho_wordseg/" 
pathToTextf="/Users/admin/Documents/peerspeech_03.06.2020/utterances/French/" 
pathToTextf1="/Users/admin/Documents/peerspeech_03.06.2020/utterances/French_processed/" 
pathToTextfwordseg="/Users/admin/Documents/peerspeech_03.06.2020/utterances/French_wordseg/" 



#declare -a listSesotho=("2414" "2415" "2416" "2417" "2418" "2419" "2420" "2421" "2422" "2423" "2424" "2425" "2426" "2427" "2428" "2429" "2430" "2431" "2432" "2433" "2434" "2435" "2436" "2437" "2438" "2439" "2440" "2441" "2442" "2443" "2444" "2445" "2446" "2447" "2448" "2449" "2450" "2451" "2452" "2453" "2454" "2455" "2456" "2457" "2458" "2459" "2460" "2461" "2462" "2463" "2464" "2465" "2466" "2467" "2468" "2469" "2470" "2471" "2472" "2473" "2474" "2475" "2476" "2477" "2478" "2479" "2480" "2481" "2482" "2483" "2484" "2485" "2486" "2487" "2488" "2489" "2490" "2491" "2492" "2493" "2494" "2495" "2496" "2497" "2498" "2499" "2500" "2501" "2502" "2503" "2504" "2505" "2506" "2507" "2508" "2509" "2510" "2511" "2512" "2513" "2514" "2515" "2516" "2517" "2518" "2519" "2520" "2521" "2522" "2523" "2524" "2525" "2526" "2527" "2528" "2529" "2530" "2531" "2532" "2533" "2534" "2535" "2536" "2537" "2538" "2539" "2540" "2541" "2542")
#declare -a listFrench=("Anae_215.cha" "Anae_2216.cha" "Anae_2428.cha" "Anae_2529.cha" "Anae_2626.cha" "Anae_284.cha" "Anae_2923.cha" "Anae_2123.cha" "Anae_21122.cha"     "Anae_317.cha"       "Anais_239a.cha"     "Anais_247a.cha"     "Anais_247b.cha"     "Anais_242a.cha"     "Anais_242b.cha"     "Anais_2511a.cha"    "Anais_2511b.cha"    "Anais_2523a.cha"   "Anais_2525a.cha"    "Anais_2621a.cha"    "Anais_28a.cha"      "Anais_296b.cha"     "Theotime_2111a.cha" "Theotime_239b.cha" "Theotime_2324a.cha" "Theotime_2324b.cha" "Theotime_2422a.cha" "Theotime_252a.cha"  "Theotime_263a.cha"  "Theotime_273a.cha" "Theotime_2112a.cha")


 for speaker in  "adult" "mother" "child"; 
   	do
   	for addressee in  "CDS" "OCDS" "ADS" ;
   		do 
    		for targetchild in "Hlobohang" "Litlhare" "Tsebo" ;
    			do
   			if [ $targetchild == "Hlobohang" ]; then
   		       declare -a listSesotho=("2414" "2415" "2416" "2417" "2418" "2419" "2420" "2421" "2422" "2423" "2424" "2425" "2426" "2427" "2428" "2429" "2430" "2431" "2432" "2433" "2434" "2435" "2436" "2437" "2438" "2439" "2440" "2441" "2442" "2443" "2444" "2445" "2446" "2447" "2448" "2449" "2450" "2451" "2452" "2453" "2454" "2455" "2456" "2457" "2458")
 				fi
 			if [ $targetchild == "Litlhare" ]; then
   		       declare -a listSesotho=("2459" "2460" "2461" "2462" "2463" "2464" "2465" "2466" "2467" "2468" "2469" "2470" "2471" "2472" "2473" "2474" "2475" "2476" "2477" "2478" "2479" "2480" "2481" "2482" "2483" "2484" "2485" "2486" "2487" "2488" "2489" "2490" "2491" "2492" "2493" "2494" "2495" "2496" "2497" "2498" "2499" "2500" "2501" "2502" "2503")
 				fi	
 			if [ $targetchild == "Tsebo" ]; then
   		       declare -a listSesotho=("2504" "2505" "2506" "2507" "2508" "2509" "2510" "2511" "2512" "2513" "2514" "2515" "2516" "2517" "2518" "2519" "2520" "2521" "2522" "2523" "2524" "2525" "2526" "2527" "2528" "2529" "2530" "2531" "2532" "2533" "2534" "2535" "2536" "2537" "2538" "2539" "2540" "2541" "2542")
 				fi					
   			  for session in ${listSesotho[@]} ;
   			  do
  			echo "${pathToText}${targetchild}${speaker}${session}${addressee}.csv"
    			
#  			cut -f19 < "${pathToText}${targetchild}${speaker}${session}${addressee}.csv" > "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}.csv"
#        	tr '[:upper:]' '[:lower:]'< "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}.csv" > "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}1.csv"  && mv "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}1.csv" "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}.csv"
#             awk 'FNR>1'  "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}.csv"  > "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}1.csv"  && mv "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}1.csv" "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}.csv"
#     		cut -f25 < "${pathToText}${targetchild}${speaker}${session}${addressee}.csv" > "${pathToText1}morphology${targetchild}${speaker}${session}${addressee}.csv"
#             awk 'FNR>1'  "${pathToText1}morphology${targetchild}${speaker}${session}${addressee}.csv"  > "${pathToText1}morphology${targetchild}${speaker}${session}${addressee}1.csv"  && mv "${pathToText1}morphology${targetchild}${speaker}${session}${addressee}1.csv" "${pathToText1}morphology${targetchild}${speaker}${session}${addressee}.csv"
# 			cut -f11 < "${pathToText}${targetchild}${speaker}${session}${addressee}.csv" > "${pathToText1}question${targetchild}${speaker}${session}${addressee}.csv"
#             awk 'FNR>1'  "${pathToText1}question${targetchild}${speaker}${session}${addressee}.csv"  > "${pathToText1}question${targetchild}${speaker}${session}${addressee}1.csv"  && mv "${pathToText1}question${targetchild}${speaker}${session}${addressee}1.csv" "${pathToText1}question${targetchild}${speaker}${session}${addressee}.csv"
#            sed -e 's/\.//g'  -e 's/!//g'  -e 's/\_//g' -e 's/\&//g' -e 's/-//g' -e 's/\?//g'  -e 's/\[.*\]//g' -e 's/([^)]*)//g' -e  's/<.*>//g' -e '/xxx/d'  -e 's/+\///g' -e "s/\'//g" -e 's/  / /g' -e 's/^ //g' -e '/^\s$/d' -e 's/[0-0]//g' -e '/^$/g' -e 's/\://g' -e '/^  $/d' -e '/^</d' -e '/^$/d' < "${pathToText1}utterance${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextwordseg}cleanutterance${targetchild}${speaker}${session}${addressee}.csv"
#           	sed -e  's/ $//g' -e 's/ / ;eword /g' -e 's/$/ ;eword/g' < "${pathToTextwordseg}cleanutterance${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextwordseg}cleanutterancewordseg${targetchild}${speaker}${session}${addressee}.csv" #wordseg format
#            wordseg-stats  "${pathToTextwordseg}cleanutterancewordseg${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextwordseg}stats${targetchild}${speaker}${session}${addressee}.csv"

#    		numberoflines=`sed  '1q;d' "${pathToTextwordseg}stats${targetchild}${speaker}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'` 		
#   		numberofwords=`sed  '5q;d' "${pathToTextwordseg}stats${targetchild}${speaker}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'`
#    		numberofuttsinglewords=`sed  '2q;d' "${pathToTextwordseg}stats${targetchild}${speaker}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'`
#     	    numberofhapaxes=`sed  '7q;d' "${pathToTextwordseg}stats${targetchild}${speaker}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'`
#           mattr=`sed  '3q;d' "${pathToTextwordseg}stats${targetchild}${speaker}${session}${addressee}.csv"  | awk '{printf $3}' | tr -d '\n'`
#           mlu=`echo "scale=3; $numberofwords / $numberoflines" | bc`		
#  
#   		nquestion=`grep question -o "${pathToText1}question${targetchild}${speaker}${session}${addressee}.csv"| wc -l`  #count questions
#   		percquest=`echo "scale=3; $nquestion / $numberoflines" | bc`
#  
#  	
#   	    nverb=`grep "\-v\|v-\|^v\| v" -o "${pathToText1}morphology${targetchild}${speaker}${session}${addressee}.csv"| wc -l`  #count questions
#   	    nnoun0=`grep  "\-n \|-n-\| n-\|^n-\| n \|^n \|^n$" -o "${pathToText1}morphology${targetchild}${speaker}${session}${addressee}.csv"| wc -l`  #count questions
#           nnoun1=`grep  " n$" -o "${pathToText1}morphology${targetchild}${speaker}${session}${addressee}.csv"| wc -l`  #count questions
#           nnoun2=`grep  "\-n$" -o "${pathToText1}morphology${targetchild}${speaker}${session}${addressee}.csv"| wc -l` 
#           nnoun=$(($nnoun0 +  $nnoun1  + $nnoun2)) 
#  	        ratioverb=`echo "scale=3; $nverb / $numberofwords" | bc `
#   	    rationoun=`echo "scale=3; $nnoun / $numberofwords" | bc ` 	    
# 	    echo "${targetchild},${speaker},${addressee},${session},${numberoflines},${numberofwords},${mlu},${mattr},${numberofuttsinglewords},${numberofhapaxes},${percquest}" >> ${path_}shortoutputSesotho.csv
# #

   	      done
          done
    
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
#    	   cut -f4 < "${pathToTextf}${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextf1}utterance${targetchild}${speaker}${session}${addressee}.csv"
          awk 'FNR>1'  "${pathToTextf1}utterance${targetchild}${speaker}${session}${addressee}.csv"  > "${pathToTextf1}utterance${targetchild}${speaker}${session}${addressee}1.csv"  && mv "${pathToTextf1}utterance${targetchild}${speaker}${session}${addressee}1.csv" "${pathToTextf1}utterance${targetchild}${speaker}${session}${addressee}.csv"
  		   sed -e 's/< //g' -e 's/xxx //g' -e 's/xxx//g' -e 's/\[\/\]//g' -e 's/\<//g' -e 's/\>//g'  -e 's/!//g' -e 's/\(\.\)//g' -e 's/ \.//g' -e 's/\[\=\!.*\]//g' -e 's/\[.*]//g'  -e '/^$/d' -e '/^xxx$/d'  -e 's/www//g' -e 's/://g' -e 's/+//g' -e 's/\///g' -e 's/(//g'  -e 's/)//g' -e 's/›//g' -e 's/‹//g' -e 's/\...//g' -e 's/\..//g'  -e 's/  / /g' -e 's/ ?/?/g' "${pathToTextf1}utterance${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextf1}cleanutterance${targetchild}${speaker}${session}${addressee}.csv"
          tr '[:upper:]' '[:lower:]'< "${pathToTextf1}cleanutterance${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextf1}cleanutterance${targetchild}${speaker}${session}${addressee}1.csv"  && mv "${pathToTextf1}cleanutterance${targetchild}${speaker}${session}${addressee}1.csv" "${pathToTextf1}cleanutterance${targetchild}${speaker}${session}${addressee}.csv"
	  	   nquestionf=`grep ? -o  "${pathToTextf1}cleanutterance${targetchild}${speaker}${session}${addressee}.csv"| wc -l`  #count questions
          sed -e 's/\?//g' -e 's/^ //g' "${pathToTextf1}cleanutterance${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextf1}cleanutterance1${targetchild}${speaker}${session}${addressee}.csv"
          sed -e  's/ $//g' -e 's/ / ;eword /g' -e 's/$/ ;eword/g' < "${pathToTextf1}cleanutterance1${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextfwordseg}cleanutterancewordseg${targetchild}${speaker}${session}${addressee}.csv" #wordseg format
           wordseg-stats  "${pathToTextfwordseg}cleanutterancewordseg${targetchild}${speaker}${session}${addressee}.csv" > "${pathToTextfwordseg}stats${targetchild}${speaker}${session}${session}${addressee}.csv"
       		
   		   numberoflinesf=`sed  '1q;d' "${pathToTextfwordseg}stats${targetchild}${speaker}${session}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'` 		
  		   numberofwordsf=`sed  '5q;d' "${pathToTextfwordseg}stats${targetchild}${speaker}${session}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'`
   		   numberofuttsinglewordsf=`sed  '2q;d' "${pathToTextfwordseg}stats${targetchild}${speaker}${session}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'`
    	   numberofhapaxesf=`sed  '7q;d' "${pathToTextfwordseg}stats${targetchild}${speaker}${session}${session}${addressee}.csv" | awk '{printf $3}' | tr -d '\n'`
           mattrf=`sed  '3q;d' "${pathToTextfwordseg}stats${targetchild}${speaker}${session}${session}${addressee}.csv"  | awk '{printf $3}' | tr -d '\n'`
             mluf=`echo "scale=3; $numberofwordsf / $numberoflinesf" | bc`		
     		percquestf=`echo "scale=3; $nquestionf / $numberoflinesf" | bc` 
 
 
 	    echo "${targetchild},${speaker},${addressee},${session},${numberoflinesf},${numberofwordsf},${mluf},${mattrf},${numberofuttsinglewordsf},${numberofhapaxesf},${percquestf}" >> ${path_}shortoutputFrench.csv

 
            done 
            done 
  done
  done	


