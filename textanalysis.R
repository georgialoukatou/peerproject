library(ggplot2)
library(gridtext)
library(grid)
library(gridExtra)
library(gtable)

demuthlongstats<-read.csv(file="/Users/admin/Documents/peerspeech_03.06.2020/shortoutputSesotho.csv", header=TRUE)
demuthlongstats$language<-"Sesotho"

frenchlongstats<-read.csv(file="/Users/admin/Documents/peerspeech_03.06.2020/shortoutputFrench.csv", header=TRUE) 
frenchlongstats$language<-"French"

stats<-rbind(demuthlongstats, frenchlongstats)

stats<-stats[!is.na(stats$numberoflines), ]
stats$ratiohapaxes<-stats$numberofhapaxes/stats$numberofwords
stats$ratiouttsinglewords<-stats$numberofuttsinglewords/stats$numberoflines
stats$language[grep("Hlobohang|Litlhare|Tsebo", stats$targetchild)]  <- "Sesotho"
stats$language[grep("Anais|Anae|Theotime", stats$targetchild)]  <- "French"

#across sessions - long version
averagemlu<-aggregate(stats$mlu, by=list(stats$targetchild, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(averagemlu)<-c("keychild", "register", "speaker", "averagemlu")
averagesinglewordutts<-aggregate(stats$ratiouttsinglewords, by=list(stats$targetchild, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(averagesinglewordutts)<-c("keychild", "register", "speaker", "averagesinglewordutts")
morphosynt<-merge(x=averagemlu, y=averagesinglewordutts, by.x=c("keychild", "register", "speaker"), by.y=c("keychild", "register", "speaker"), all.x=TRUE, sort=TRUE)
colnames(morphosynt)<- c("keychild", "register", "speaker", "mlumean", "singleworduttmean")
                                 
#across children - short version
acrossmlu<-aggregate(stats$mlu, by=list(stats$language, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(acrossmlu)<-c("language", "register", "speaker", "averagemlu")
acrosssinglewordutts<-aggregate(stats$ratiouttsinglewords, by=list(stats$language, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(acrosssinglewordutts)<-c("language", "register", "speaker", "averagesinglewordutts")
acrossmorphosynt<-merge(x=acrossmlu, y=acrosssinglewordutts, by.x=c("language", "register", "speaker"), by.y=c("language", "register", "speaker"), all.x=TRUE, sort=TRUE)
colnames(acrossmorphosynt)<- c("language", "register", "speaker", "mlumean", "singleworduttmean")
                                 

#####TABLE-MORPHOSYNTAX
write.table(morphosynt, file=paste0("/Users/admin/Documents/peerspeech_03.06.2020/morphosyntax.txt"), row.names = FALSE, col.names = TRUE)
write.table(acrossmorphosynt, file=paste0("/Users/admin/Documents/peerspeech_03.06.2020/morphosyntax_short.txt"), row.names = FALSE, col.names = TRUE)

#across sessions - long version
averagequestion<-aggregate(stats$percquest, by=list(stats$targetchild, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(averagequestion)<-c("keychild", "register", "speaker", "averagequestion")
averageconvturn<-aggregate(stats$ratioturn, by=list(stats$targetchild, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(averageconvturn)<-c("keychild", "register", "speaker", "averageconvturn")
speechelicitation<-merge(x=averagequestion, y=averageconvturn, by.x=c("keychild", "register", "speaker"), by.y=c("keychild", "register", "speaker"), all.x=TRUE, sort=TRUE)
colnames(speechelicitation)<- c("keychild", "register", "speaker", "questionmean", "convturnmean")

#across children - short version                           
acrossquestion<-aggregate(stats$percquest, by=list(stats$language, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(acrossquestion)<-c("language", "register", "speaker", "averagequestion")
acrossconvturn<-aggregate(stats$ratioturn, by=list(stats$language, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(acrossconvturn)<-c("language", "register", "speaker", "averageconvturn")
acrossspeechelic<-merge(x=acrossquestion, y=acrossconvturn, by.x=c("language", "register", "speaker"), by.y=c("language", "register", "speaker"), all.x=TRUE, sort=TRUE)
colnames(acrossspeechelic)<- c("language", "register", "speaker", "questionratio", "convturnratio")
                          
                           
                           
#####TABLE-SPEECHELICITATION
write.table(speechelicitation, file=paste0("/Users/admin/Documents/peerspeech_03.06.2020/speechelicitation.txt"), row.names = FALSE, col.names = TRUE)
write.table(acrossspeechelic, file=paste0("/Users/admin/Documents/peerspeech_03.06.2020/speechelicitation_short.txt"), row.names = FALSE, col.names = TRUE)


                          
#across sessions - long version                          
averagettr<-aggregate(stats$mattr, by=list(stats$targetchild, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(averagettr)<-c("keychild", "register", "speaker", "averagettr")
averagenvratio<-aggregate(stats$nounverbratio, by=list(stats$targetchild, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(averagenvratio)<-c("keychild", "register", "speaker", "averagenvratio")
lexicaldiversity<-merge(x=averagettr, y=averagenvratio, by.x=c("keychild", "register", "speaker"), by.y=c("keychild", "register", "speaker"), all.x=TRUE, sort=TRUE)
colnames(lexicaldiversity)<- c("keychild", "register", "speaker", "ttrmean", "nvratiomean")

#across children - short version                           
acrossttr<-aggregate(stats$mattr, by=list(stats$language, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(acrossttr)<-c("language", "register", "speaker", "averagettr")
acrossnvratio<-aggregate(stats$nounverbratio, by=list(stats$language, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(acrossnvratio)<-c("language", "register", "speaker", "averagenvratio")
acrosslexicaldiv<-merge(x=acrossttr, y=acrossnvratio, by.x=c("language", "register", "speaker"), by.y=c("language", "register", "speaker"), all.x=TRUE, sort=TRUE)
colnames(acrosslexicaldiv)<- c("language", "register", "speaker", "mattr", "nounverbratio")

                          
                          
                          
#####TABLE-LEXICALDIVERSITY
write.table(lexicaldiversity, file=paste0("/Users/admin/Documents/peerspeech_03.06.2020/lexicaldiversity.txt"), row.names = FALSE, col.names = TRUE)
write.table(acrosslexicaldiv, file=paste0("/Users/admin/Documents/peerspeech_03.06.2020/lexicaldiversity_short.txt"), row.names = FALSE, col.names = TRUE)



                          
                          
####figure                           
get_legend<-function(myggplot){
  tmp <- ggplot_gtable(ggplot_build(myggplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)
}

statsna$mlu<-as.numeric(stats$mlu)
title1=textGrob("Mean utterance length", gp=gpar(fontface="bold"))
title2=textGrob("Type token ratio", gp=gpar(fontface="bold"))
title3=textGrob("Question ratio", gp=gpar(fontface="bold"))


statsCDS<-subset(stats, (stats$addressee=="CDS")) 
statsADS<-subset(stats, (stats$addressee=="ADS")) 
statsOCDS<-subset(stats, (stats$addressee=="OCDS")) 

demuth<-subset(stats, (stats$language=="Sesotho")) 
french<-subset(stats, (stats$language=="French")) 



plot1<-ggplot(demuth, aes(x=addressee, y=mlu, fill=speaker))+ geom_boxplot() +  geom_point(aes(fill = speaker), size = 0.4, shape = 21, position = position_jitterdodge()) + labs(title="Sesotho") + ylab("Mean utt. length") + ylim(2, 8) + theme(legend.position = "none")
plot2<-ggplot(french, aes(x=addressee, y=mlu, fill=speaker))+ geom_boxplot()+  geom_point(aes(fill = speaker), size = 0.4, shape = 21, position = position_jitterdodge()) + labs(title="French") + ylab("Mean utt. length") + ylim(2, 8)
legend <- get_legend(plot2)
plot2<-ggplot(french, aes(x=addressee, y=mlu, fill=speaker))+ geom_boxplot() +  geom_point(aes(fill = speaker), size = 0.4, shape = 21, position = position_jitterdodge()) + labs(title="French") + ylab("Mean utt. length")+ ylim(2, 8) + theme(legend.position = "none")
grid.arrange(arrangeGrob(plot1, plot2, top=title1, ncol=2), legend, nrow = 2, heights = c(10, 1))

plot3<-ggplot(demuth, aes(x=addressee, y=mattr, fill=speaker))+ geom_boxplot() +  geom_point(aes(fill = speaker), size = 0.4, shape = 21, position = position_jitterdodge())+ labs(title="Sesotho") + ylab("Type token ratio")
plot4<-ggplot(french, aes(x=addressee, y=mattr, fill=speaker))+ geom_boxplot() + geom_point(aes(fill = speaker), size = 0.4, shape = 21, position = position_jitterdodge()) + labs(title="French")  + ylab("type token ratio") + ylim(0.6, 1)  + theme(legend.position = "none")
legend <- get_legend(plot3)
plot3<-ggplot(demuth, aes(x=addressee, y=mattr, fill=speaker))+ geom_boxplot() +  geom_point(aes(fill = speaker), size = 0.4, shape = 21, position = position_jitterdodge())+ labs(title="Sesotho") + ylab("Type token ratio") + ylim(0.6, 1)  + theme(legend.position = "none")
grid.arrange(arrangeGrob(plot3, plot4, top=title2, ncol=2), legend, nrow = 2, heights = c(10, 1))


plot5<-ggplot(demuth, aes(x=addressee, y=percquest, fill=speaker))+ geom_boxplot() +  geom_point(aes(fill = speaker), size = 0.4, shape = 21, position = position_jitterdodge())+ labs(title="Sesotho") + ylab("Question ratio")
plot6<-ggplot(french, aes(x=addressee, y=percquest, fill=speaker))+ geom_boxplot() + geom_point(aes(fill = speaker), size = 0.4, shape = 21, position = position_jitterdodge()) + labs(title="French")  + ylab("Question ratio")  + theme(legend.position = "none")
legend <- get_legend(plot5)
plot5<-ggplot(demuth, aes(x=addressee, y=percquest, fill=speaker))+ geom_boxplot() +  geom_point(aes(fill = speaker), size = 0.4, shape = 21, position = position_jitterdodge())+ labs(title="Sesotho") + ylab("Question ratio") + theme(legend.position = "none")
grid.arrange(arrangeGrob(plot5, plot6, top=title3, ncol=2), legend, nrow = 2, heights = c(10, 1))






