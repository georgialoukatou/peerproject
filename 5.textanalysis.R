#georgia

library(ggplot2)
library(gridtext)
library(grid)
library(gridExtra)
library(gtable)

demuthlongstats<-read.csv(file="/Users/admin/Documents/peerspeech_13.06.2020/shortoutputSesotho.csv", header=TRUE)
demuthlongstats$language<-"Sesotho"
demuthlongstats<-demuthlongstats[!is.na(demuthlongstats$numberoflines), ]

frenchlongstats<-read.csv(file="/Users/admin/Documents/peerspeech_03.06.2020/dissertationDraftResults/shortoutputFrench.csv", header=TRUE) 
frenchlongstats$language<-"French"
frenchlongstats<-frenchlongstats[!is.na(frenchlongstats$numberoflines), ]

stats<-rbind(demuthlongstats, frenchlongstats)

#stats<-stats[!is.na(stats$numberoflines), ]
stats$ratiohapaxes<-stats$numberofhapaxes/stats$numberofwords
stats$ratiouttsinglewords<-stats$numberofuttsinglewords/stats$numberoflines
stats$language[grep("Hlobohang|Litlhare|Tsebo", stats$targetchild)]  <- "Sesotho"
stats$language[grep("Anais|Anae|Theotime", stats$targetchild)]  <- "French"


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
##

#####TABLE-MORPHOSYNTAX
write.table(morphosynt, file=paste0("/Users/admin/Documents/peerspeech_13.06.2020/morphosyntax.txt"), row.names = FALSE, col.names = TRUE)
write.table(acrossmorphosynt, file=paste0("/Users/admin/Documents/peerspeech_13.06.2020/morphosyntax_short.txt"), row.names = FALSE, col.names = TRUE)

acrossnumberoflines<-aggregate(stats$numberoflines, by=list(stats$language, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )

averagequestion<-aggregate(stats$percquest, by=list(stats$targetchild, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(averagequestion)<-c("keychild", "register", "speaker", "averagequestion")
averageconvturn<-aggregate(stats$ratioturn, by=list(stats$targetchild, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(averageconvturn)<-c("keychild", "register", "speaker", "averageconvturn")
speechelicitation<-merge(x=averagequestion, y=averageconvturn, by.x=c("keychild", "register", "speaker"), by.y=c("keychild", "register", "speaker"), all.x=TRUE, sort=TRUE)
colnames(speechelicitation)<- c("keychild", "register", "speaker", "questionmean", "convturnmean")



acrossquestion<-aggregate(stats$percquest, by=list(stats$language, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(acrossquestion)<-c("language", "register", "speaker", "averagequestion")
acrossconvturn<-aggregate(stats$ratioturn, by=list(stats$language, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(acrossconvturn)<-c("language", "register", "speaker", "averageconvturn")
acrossspeechelic<-merge(x=acrossquestion, y=acrossconvturn, by.x=c("language", "register", "speaker"), by.y=c("language", "register", "speaker"), all.x=TRUE, sort=TRUE)
colnames(acrossspeechelic)<- c("language", "register", "speaker", "questionratio", "convturnratio")


#####TABLE-SPEECHELICITATION
write.table(speechelicitation, file=paste0("/Users/admin/Documents/peerspeech_13.06.2020/speechelicitation.txt"), row.names = FALSE, col.names = TRUE)
write.table(acrossspeechelic, file=paste0("/Users/admin/Documents/peerspeech_13.06.2020/speechelicitation_short.txt"), row.names = FALSE, col.names = TRUE)


averagettr<-aggregate(stats$mattr, by=list(stats$targetchild, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(averagettr)<-c("keychild", "register", "speaker", "averagettr")
averagenvratio<-aggregate(stats$nounverbratio, by=list(stats$targetchild, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(averagenvratio)<-c("keychild", "register", "speaker", "averagenvratio")
lexicaldiversity<-merge(x=averagettr, y=averagenvratio, by.x=c("keychild", "register", "speaker"), by.y=c("keychild", "register", "speaker"), all.x=TRUE, sort=TRUE)
colnames(lexicaldiversity)<- c("keychild", "register", "speaker", "ttrmean", "nvratiomean")

acrossttr<-aggregate(stats$mattr, by=list(stats$language, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(acrossttr)<-c("language", "register", "speaker", "averagettr")
acrossnvratio<-aggregate(stats$nounverbratio, by=list(stats$language, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(acrossnvratio)<-c("language", "register", "speaker", "averagenvratio")
acrosslexicaldiv<-merge(x=acrossttr, y=acrossnvratio, by.x=c("language", "register", "speaker"), by.y=c("language", "register", "speaker"), all.x=TRUE, sort=TRUE)
colnames(acrosslexicaldiv)<- c("language", "register", "speaker", "mattr", "nounverbratio")

acrossttr<-aggregate(stats$mattr, by=list(stats$language, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(acrossttr)<-c("language", "register", "speaker", "averagettr")
acrosshapaxratio<-aggregate(stats$ratiohapaxes, by=list(stats$language, stats$addressee, stats$speaker), function(x) cbind(round(mean(x),2), round(sd(x),2)) )
names(acrosshapaxratio)<-c("language", "register", "speaker", "averagehapaxratio")
acrosslexicaldiv<-merge(x=acrossttr, y=acrosshapaxratio, by.x=c("language", "register", "speaker"), by.y=c("language", "register", "speaker"), all.x=TRUE, sort=TRUE)
colnames(acrosslexicaldiv)<- c("language", "register", "speaker", "mattr", "hapaxratio")



#####TABLE-LEXICALDIVERSITY
write.table(lexicaldiversity, file=paste0("/Users/admin/Documents/peerspeech_13.06.2020/lexicaldiversity.txt"), row.names = FALSE, col.names = TRUE)
write.table(acrosslexicaldiv, file=paste0("/Users/admin/Documents/peerspeech_13.06.2020/lexicaldiversity_hapax_short.txt"), row.names = FALSE, col.names = TRUE)


#### average number of utts per session
a<-aggregate(stats$numberoflines, by=list(stats$targetchild, stats$session), function(x) (round(sum(x),2)))
b<-aggregate(a$x, by=list(a$Group.1), function(x) (round(mean(x),2)))






##############figures
get_legend<-function(myggplot){
  tmp <- ggplot_gtable(ggplot_build(myggplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)
}

statsna$mlu<-as.numeric(stats$mlu)
title1=textGrob("Morphosyntactic properties ", gp=gpar(fontface="bold"))
title2=textGrob("Lexical properties", gp=gpar(fontface="bold"))
title3=textGrob("Interactional properties", gp=gpar(fontface="bold"))


statsCDS<-subset(stats, (stats$addressee=="CDS")) 
statsADS<-subset(stats, (stats$addressee=="ADS")) 
statsOCDS<-subset(stats, (stats$addressee=="OCDS")) 

demuth<-subset(stats, (stats$language=="Sesotho")) 
french<-subset(stats, (stats$language=="French")) 

library(forcats)

demuth$addressee <- factor(demuth$addressee,levels = c("CDS", "OCDS", "ADS"))
french$addressee <- factor(french$addressee,levels = c("CDS", "OCDS", "ADS"))


demuth$targetchild<-as.factor(demuth$targetchild)
plot1<-ggplot(demuth, aes(x=addressee, y=mlu, fill=speaker))+ geom_boxplot(aes(fill=speaker)) +  geom_point(aes(fill=speaker, colour=targetchild), size = 0.6, position = position_jitterdodge()) + labs(title="Sesotho") + ylab("Mean utt. length") + ylim(2, 7) +scale_color_manual(values=c('#999999','#E69F00', 'violet')) #+ theme(legend.position = "none")
plot2<-ggplot(french, aes(x=addressee, y=mlu, fill=speaker))+ geom_boxplot(aes(fill=speaker)) +  geom_point(aes(fill=speaker, colour=targetchild), size = 0.6, position = position_jitterdodge()) + labs(title="French") + ylab("Mean utt. length") + ylim(2, 7) +scale_color_manual(values=c('#999999','#E69F00', 'violet'))
#legend <- get_legend(plot2)
png(filename="/Users/admin/Documents/peerspeech_13.06.2020/mlu_new1.png", width = 13, height = 4, units = 'in', res = 500)
grid.arrange(arrangeGrob(plot1, plot2, top=title1, ncol=2),  nrow = 2, heights = c(5, 1))
dev.off()

plot3<-ggplot(demuth, aes(x=addressee, y=mattr, fill=speaker)) + geom_boxplot(aes(fill=speaker)) +  geom_point(aes(fill=speaker, colour=targetchild), size = 0.6, position = position_jitterdodge()) + labs(title="Sesotho") + ylab("Type token ratio") + ylim(0.65, 1)+scale_color_manual(values=c('#999999','#E69F00', 'violet'))
plot4<-ggplot(french, aes(x=addressee, y=mattr, fill=speaker)) + geom_boxplot(aes(fill=speaker)) +  geom_point(aes(fill=speaker, colour=targetchild), size = 0.6, position = position_jitterdodge()) + labs(title="French")  + ylab("Type token ratio") + ylim(0.65, 1) +scale_color_manual(values=c('#999999','#E69F00', 'violet'))
png(filename="/Users/admin/Documents/peerspeech_13.06.2020/ttr_new.png",  width = 13, height = 4, units = 'in', res = 500)
grid.arrange(arrangeGrob(plot3, plot4, top=title2, ncol=2), nrow = 2, heights = c(5, 1))
dev.off()

frenchlongstats$addressee <- factor(frenchlongstats$addressee,levels = c("CDS", "OCDS", "ADS"))

plot5<-ggplot(demuth, aes(x=addressee, y=percquest, fill=speaker))+ geom_boxplot(aes(fill=speaker))  + geom_boxplot(aes(fill=speaker)) +  geom_point(aes(fill=speaker, colour=targetchild), size = 0.6, position = position_jitterdodge()) + labs(title="Sesotho")+ ylim(0.0, 0.9)  + ylab("Question ratio")+scale_color_manual(values=c('#999999','#E69F00', 'violet'))
plot6<-ggplot(frenchlongstats, aes(x=addressee, y=percquest, fill=speaker))+ geom_boxplot(aes(fill=speaker))  + geom_boxplot(aes(fill=speaker)) +  geom_point(aes(fill=speaker, colour=targetchild), size = 0.6, position = position_jitterdodge()) + labs(title="French") + ylim(0.0, 0.9)  + ylab("Question ratio")+scale_color_manual(values=c('#999999','#E69F00', 'violet'))  
png(filename="/Users/admin/Documents/peerspeech_13.06.2020/questionratio_new.png",  width = 13, height = 4, units = 'in', res = 500)
grid.arrange(arrangeGrob(plot5, plot6, top=title3, ncol=2), nrow = 2, heights = c(5, 1))
dev.off()

plot7<-ggplot(demuth, aes(x=addressee, y=ratiouttsinglewords, fill=speaker))+ geom_boxplot(aes(fill=speaker))  + geom_boxplot(aes(fill=speaker)) +  geom_point(aes(fill=speaker, colour=targetchild), size = 0.6, position = position_jitterdodge()) + labs(title="Sesotho") + ylim(0.0, 0.75) + ylab("Single word utt. ratio")+scale_color_manual(values=c('#999999','#E69F00', 'violet'))
plot8<-ggplot(french, aes(x=addressee, y=ratiouttsinglewords, fill=speaker))+ geom_boxplot(aes(fill=speaker))  + geom_boxplot(aes(fill=speaker)) +  geom_point(aes(fill=speaker, colour=targetchild), size = 0.6, position = position_jitterdodge()) + labs(title="French") + ylim(0.0, 0.75) + ylab("Single word utt. ratio")+scale_color_manual(values=c('#999999','#E69F00', 'violet'))  
png(filename="/Users/admin/Documents/peerspeech_13.06.2020/singlewordutt_new.png",  width = 13, height = 4, units = 'in', res = 500)
grid.arrange(arrangeGrob(plot7, plot8, top=title1, ncol=2), nrow = 2, heights = c(5, 1))
dev.off()

plot9<-ggplot(demuth, aes(x=addressee, y=ratioturn, fill=speaker))+ geom_boxplot(aes(fill=speaker))  + geom_boxplot(aes(fill=speaker)) +  geom_point(aes(fill=speaker, colour=targetchild), size = 0.6, position = position_jitterdodge()) + labs(title="Sesotho")+ ylim(0.0, 1.0) + ylab("Conv. turn ratio")+scale_color_manual(values=c('#999999','#E69F00', 'violet'))
plot10<-ggplot(french, aes(x=addressee, y=ratioturn, fill=speaker))+ geom_boxplot(aes(fill=speaker))  + geom_boxplot(aes(fill=speaker)) +  geom_point(aes(fill=speaker, colour=targetchild), size = 0.6, position = position_jitterdodge()) + labs(title="French")+ ylim(0.0, 1.0)   + ylab("Conv. turn ratio")+scale_color_manual(values=c('#999999','#E69F00', 'violet'))  
png(filename="/Users/admin/Documents/peerspeech_13.06.2020/convturn_new.png",  width = 13, height = 4, units = 'in', res = 500)
grid.arrange(arrangeGrob(plot9, plot10, top=title3, ncol=2), nrow = 2, heights = c(5, 1))
dev.off()

plot11<-ggplot(demuth, aes(x=addressee, y=ratiohapaxes, fill=speaker))+ geom_boxplot(aes(fill=speaker))  + geom_boxplot(aes(fill=speaker)) +  geom_point(aes(fill=speaker, colour=targetchild), size = 0.6, position = position_jitterdodge()) + labs(title="Sesotho") + ylab("Hapax ratio")+scale_color_manual(values=c('#999999','#E69F00', 'violet'))
plot12<-ggplot(french, aes(x=addressee, y=ratiohapaxes, fill=speaker))+ geom_boxplot(aes(fill=speaker))  + geom_boxplot(aes(fill=speaker)) +  geom_point(aes(fill=speaker, colour=targetchild), size = 0.6, position = position_jitterdodge()) + labs(title="French")  + ylab("Hapax ratio")+scale_color_manual(values=c('#999999','#E69F00', 'violet'))  
png(filename="/Users/admin/Documents/peerspeech_13.06.2020/hapax_new.png",  width = 13, height = 4, units = 'in', res = 500)
grid.arrange(arrangeGrob(plot11, plot12, top=title2, ncol=2), nrow = 2, heights = c(5, 1))
dev.off()




