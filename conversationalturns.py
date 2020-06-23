from operator import itemgetter
import linecache

#remember to check order of utterances before

file1=open("/Users/admin/Documents/peerspeech_13.06.2020/demuthturns.txt","w") 

with open('/Users/admin/Documents/peerspeech_13.06.2020/demuth.txt') as fp:
  lines = fp.readlines()
  for line in range(len(lines) - 1):
       info=str(lines[line]).lower().rstrip().replace('other child', 'child').replace('target_child', 'keychild').split(';;')
       info2= str(lines[line+1]).lower().rstrip().replace('other child', 'child').replace('target_child', 'keychild').split(';;') 
       print(info, info2) 
       try: 
  #      speaker, addressee, register_, keychild, session_ =info[14], info[15],info[16], info[13],info[7]  
   #     speaker2, addressee2, register_2, keychild2, session_2 =info2[14], info2[15],info2[16], info2[13],info2[7] 
        speaker, addressee, register_, keychild, session_ =info[42], info[42],info[45], info[41],info[43] 
        speaker2, addressee2, register_2, keychild2, session_2 =info2[42], info2[42],info2[45], info2[41],info2[43]   
        if (str(session_) == str(session_2)  and "keychild" not in speaker and "investigator" not in speaker and "investigator" not in register_ and "NA" not in speaker and "investigator" not in speaker2):
         print(speaker, addressee, speaker2)
         if addressee == speaker2 :
          listinfo=[speaker, session_, register_, "_match"]
         # print(listinfo)
          listinfo=str(listinfo).replace('\n', '').replace('"','').replace('/','_')
          file1.write(str(listinfo))
         else:
          listinfo=[speaker, session_, register_, "_nomatch"]
          listinfo=str(listinfo).replace('\n', '').replace('"','').replace('/','_')
          file1.write(str(listinfo))
          print(listinfo)
       except:
        print("info not found") 

          
file1.close()
