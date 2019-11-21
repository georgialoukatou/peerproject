#R script to convert R data frame to csv for peer project (Sesotho)
#G.Loukatou 

LANGUAGE="Sesotho"
load("/Users/lscpuser/Documents/fair_project/acqdiv_corpus_2018-08-27.rda" ) #detailed acqdiv database
languages<-c(LANGUAGE) # languages to extract
for (lang in languages){ 
  utterances_lang=utterances[utterances$language==lang,]
  speakers_lang=speakers[speakers$language==lang,]
  morphemes_lang=morphemes[morphemes$language==lang,]
  words_lang=words[words$language==lang,]
  sessions_lang=sessions[sessions$language==lang,]
  uniquespeakers_lang=uniquespeakers[uniquespeakers$language==lang,]
}

colnames(utterances_lang)[colnames(utterances_lang)=="speaker_id_fk"] <- "speaker_id" #in case of name inconsistencies
utterances_lang$order<-1:nrow(utterances_lang)
merge(utterances_lang, speakers_lang,by=c("speaker_id", "uniquespeaker_id_fk"))->sesotho_lang #merge main with phonemized 
sesotho_lang <- lapply(sesotho_lang, gsub, pattern='\t', replacement=' ')
sesotho_lang <- lapply(sesotho_lang, gsub, pattern=',', replacement=' ')
write.table(sesotho_lang, file=paste0("~/Documents/peerproject/", lang, "ordered.csv"), row.names=F, col.names=T, sep="@", quote=F) 