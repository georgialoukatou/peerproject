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

#demuthlongstatsnainv$rationounverb <- demuthlongstatsnainv$rationoun + demuthlongstatsnainv$ratioverb

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






