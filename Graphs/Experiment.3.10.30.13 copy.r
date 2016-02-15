t.test <- read.csv("~/SkyDrive/Foundations/Canonical.data/t.test.csv")
attach(t.test)
library(ggplot2)

Exp3.Data <- c(Base.S1.2.HH, S1.2.HH, Base.S1.2.LL, S1.2.LL, Base.S2.2.HH, S2.2.HH, Base.S2.2.LL, S2.2.LL, Base.S3.2.HH, S3.2.HH, Base.S3.2.LL, S3.2.LL)

Exp3.Labels <- gl(12, 78, 936, labels = c("Direct.S1.HH", "Indirect.S1.HH", "Direct.S1.LL", "Indirect.S1.LL", "Direct.S2.HH", "Indirect.S2.HH", "Direct.S2.LL", "Indirect.S2.LL", "Direct.S3.HH", "Indirect.S3.HH", "Direct.S3.LL", "Indirect.S3.LL"))

Exp3 <- data.frame(Exp3.Data, Exp3.Labels)

Direct.S1.HH <- subset(Exp3, Exp3.Labels=="Direct.S1.HH")
Direct.S2.HH <- subset(Exp3, Exp3.Labels=="Direct.S2.HH")
Direct.S3.HH <- subset(Exp3, Exp3.Labels=="Direct.S3.HH")
Indirect.S1.HH <- subset(Exp3, Exp3.Labels=="Indirect.S1.HH")
Indirect.S2.HH <- subset(Exp3, Exp3.Labels=="Indirect.S2.HH")
Indirect.S3.HH <- subset(Exp3, Exp3.Labels=="Indirect.S3.HH")
Direct.S1.LL <- subset(Exp3, Exp3.Labels=="Direct.S1.LL")
Direct.S2.LL <- subset(Exp3, Exp3.Labels=="Direct.S2.LL")
Direct.S3.LL <- subset(Exp3, Exp3.Labels=="Direct.S3.LL")
Indirect.S1.LL <- subset(Exp3, Exp3.Labels=="Indirect.S1.LL")
Indirect.S2.LL <- subset(Exp3, Exp3.Labels=="Indirect.S2.LL")
Indirect.S3.LL <- subset(Exp3, Exp3.Labels=="Indirect.S3.LL")

D1 <- mean(Direct.S1.HH[,1]) - mean(Indirect.S1.HH[,1])
D2 <- mean(Direct.S2.HH[,1]) - mean(Indirect.S2.HH[,1])
D3 <- mean(Direct.S3.HH[,1]) - mean(Indirect.S3.HH[,1])
D4 <- mean(Direct.S1.LL[,1]) - mean(Indirect.S1.LL[,1])
D5 <- mean(Direct.S2.LL[,1]) - mean(Indirect.S2.LL[,1])
D6 <- mean(Direct.S3.LL[,1]) - mean(Indirect.S3.LL[,1])

HHs <- c(D1, D2, D3)
LLs <- c(D4, D5, D6)

Direct <- c(8.765385, 8.347436, 8.638462,  8.079487, 8.201282,  8.453846)
Indirect <- c(4.391026, 4.869231, 6.561538, 7.783333, 7.907692, 8.25)

#plot(Direct, ylim=c(0,10), ylab()
#points(Indirect)
#lines(Direct)
#lines(Indirect)

###

Exp3.Data.diff <- c(D1, D2, D3, D4, D5, D6)

Exp3.Labels.diff <- gl(6, 1, 6, labels = c("Trans.Inst", "Impl.Inst", "Create.Inst", "Trans.Auto", "Impl.Auto", "Create.Auto"))

Exp3.diff <- data.frame(Exp3.Data.diff, Exp3.Labels.diff)

Exp3.diff.plot + geom_bar() + ylab("Difference in Blame Scores") + labs(title = "Difference between Direct and Indirect Conditions") + xlab("Scenarios")

###


Trans.L.I <- subset(Exp3, Exp3.Labels=="Direct.S1.HH")
Impl.L.I <- subset(Exp3, Exp3.Labels=="Direct.S2.HH")
Create.L.I <- subset(Exp3, Exp3.Labels=="Direct.S3.HH")
Trans.I <- subset(Exp3, Exp3.Labels=="Indirect.S1.HH")
Impl.I <- subset(Exp3, Exp3.Labels=="Indirect.S2.HH")
Create.I <- subset(Exp3, Exp3.Labels=="Indirect.S3.HH")
Trans.L.A <- subset(Exp3, Exp3.Labels=="Direct.S1.LL")
Impl.L.A <- subset(Exp3, Exp3.Labels=="Direct.S2.LL")
Create.L.A <- subset(Exp3, Exp3.Labels=="Direct.S3.LL")
Trans.A <- subset(Exp3, Exp3.Labels=="Indirect.S1.LL")
Impl.A <- subset(Exp3, Exp3.Labels=="Indirect.S2.LL")
Create.A<- subset(Exp3, Exp3.Labels=="Indirect.S3.LL")


Tra.direct <- c(Direct.S1.HH[,1], Direct.S1.LL[,1])
Tra.indirect <- c(Indirect.S1.HH[,1], Indirect.S1.LL[,1])
Imp.direct <- c(Direct.S2.HH[,1], Direct.S2.LL[,1])
Imp.indirect <- c(Indirect.S2.HH[,1], Indirect.S2.LL[,1])
Cr.direct <- c(Direct.S3.HH[,1], Direct.S3.LL[,1])
Cr.indirect <- c(Indirect.S3.HH[,1], Indirect.S3.LL[,1])

Dirs <- c(mean(Tra.direct), mean(Imp.direct), mean(Cr.direct))
Indirs <- c(mean(Tra.indirect), mean(Imp.indirect), mean(Cr.indirect))

yy <- c(Dirs, Indirs)

#Exp3.cut <- Exp3[c(1:156), 1:2]

#library(plyr)
#mm <- ddply(Exp3, "Exp3.Labels", summarise, Blame=mean(Exp3.Data))
#ggplot(mm, aes(x=Exp3.Labels, y=Blame)) +geom_bar(stat="identity") + geom_jitter()


;;;;;;;;;;;;;;;;;;;

yy <- c(Dirs, Indirs)
yy.Labels <- gl(6, 1, 6, labels = c("Trans", "Impl", "Create", "Trans", "Impl", "Create"))
yyy <- data.frame(yy, yy.Labels)
p <- ggplot(yyy, aes(x = yy.Labels, y=yy))
p + geom_point() + geom_line() + ylab("Difference in Blame Scores") + labs(title = "More Policymaking Authority Produces More Agency Blame") + xlab("Scenarios") + ylim(1,10)