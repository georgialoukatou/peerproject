from operator import itemgetter
import linecache

#remember to check order of utterances before

file1=open("/Users/admin/Documents/peerspeech_03.06.2020/frenchturns.txt","w") 

with open('/Users/admin/Documents/peerspeech_03.06.2020/french.txt') as fp:
  lines = fp.readlines()
  for line in range(len(lines) - 1):
       info=str(lines[line]).lower().rstrip().replace('other child', 'child').replace('target_child', 'keychild').split(';;')
       info2= str(lines[line+1]).lower().rstrip().replace('other child', 'child').replace('target_child', 'keychild').split(';;')  
       try: 
        speaker, addressee, register_, keychild, session_ =info[14], info[15],info[16], info[13],info[7]  
        speaker2, addressee2, register_2, keychild2, session_2 =info2[14], info2[15],info2[16], info2[13],info2[7] 
    #    speaker, addressee, register_, keychild, session_ =info[41], info[42],info[43], info[40],info[2] 
     #   speaker2, addressee2, register_2, keychild2, session_2 =info2[41], info2[42],info2[43], info2[40],info2[2]
       except:
        print("info not found")    
       if (str(session_) == str(session_2)  and "keychild" not in speaker and "investigator" not in speaker and "NA" not in speaker and "investigator" not in speaker2):
         if addressee == speaker2 :
          listinfo=[speaker, session_, register_, "_match"]
          listinfo=str(listinfo).replace('\n', '').replace('"','').replace('/','_')
          file1.write(str(listinfo))
         else:
          listinfo=[speaker, session_, register_, "_nomatch"]
          listinfo=str(listinfo).replace('\n', '').replace('"','').replace('/','_')
          file1.write(str(listinfo))
file1.close()

         
         

