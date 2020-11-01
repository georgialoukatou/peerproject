library(lme4)

q1<-read.csv(file=path, "q1.csv", header=TRUE,  sep="\t")
model<-lmer(formula= ratio ~ speaker * language + (1 |session) + (1 + speaker|targetchild), data=q1) ##########first question

q2<-read.csv(file=path, "q2.csv", header=TRUE,  sep="\t")
model2<-lmer(formula= ratio ~ speaker * language *register+  (1|session) + (1 + speaker*language*register|targetchild), data=q2) ##########second question
