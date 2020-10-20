
#remember to check order of utterances before

file1=open("/Users/admin/Desktop/resultspeerspeech/utterances/French_processed/frenchturns.txt","w") 

with open('/Users/admin/Desktop/resultspeerspeech/french1.txt') as fp: #demuth1 and french1 must have child utterances!!!
  lines = fp.readlines()
  for line in range(len(lines) - 1):
       info_=str(lines[line]).lower().rstrip().replace('other child', 'child').replace('target_child', 'keychild').split(';;')
       info2= str(lines[line+1]).lower().rstrip().replace('other child', 'child').replace('target_child', 'keychild').split(';;') 
       try: 
       # register_, addressee_, speaker_, session_, keychild_ =info_[48], info_[47], info_[9], info_[45], info_[44]  # for demuth
       # register_2, addressee_2, speaker_2, session_2, keychild_2 =info2[48], info2[47], info2[9], info2[45], info2[44] #for demuth
        speaker_, addressee_, register_, keychild, session_ =info_[16], info_[17],info_[18], info_[15],info_[7]  
        speaker_2, addressee_2, register_2, keychild_2, session_2 =info2[16], info2[17],info2[18], info2[15],info2[7] 
        print(addressee_, speaker_2)         
        if (str(session_) == str(session_2)  and "keychild" not in speaker_ and "investigator" not in speaker_ and "investigator" not in register_ and "NA" not in speaker_ and "investigator" not in speaker_2):
  #       print(addressee_, speaker_2)
         if addressee_ == speaker_2 : #choose speaker_role_raw and role_adressee columns 
        #  print(addressee_, speaker_2)
          listinfo=[speaker_, session_, register_, "_match"]
          listinfo=str(listinfo).replace('\n', '').replace('"','').replace('/','_').replace('grandmother', 'adult').replace('cousin', 'child').replace('playmate', 'child').replace('uncle', 'adult').replace('teenager', 'child').replace('brother', 'child').replace('sister', 'child').replace('father', 'adult')
          file1.write(str(listinfo))
         else:
          #print(addressee_, speaker_2)
          listinfo=[speaker_, session_, register_, "_nomatch"]
          listinfo=str(listinfo).replace('\n', '').replace('"','').replace('/','_').replace('grandmother', 'adult').replace('cousin', 'child').replace('playmate', 'child').replace('uncle', 'adult').replace('teenager', 'child').replace('brother', 'child').replace('sister', 'child').replace('father', 'adult')
       #   print(addressee_, speaker_2)
          file1.write(str(listinfo))
          print(listinfo)
          print(addressee_, speaker_2)
       except:
        print("info not found")  

 
  
file1.close()

         
         

