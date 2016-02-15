File1 <- read.csv("~/SkyDrive/NewExp11.BEta.03.30.14.csv")
attach(File1)
library(ggplot2)


Base <- na.omit(V5)
Eff <- na.omit(V6)
EffEn <- na.omit(V7)
All <- na.omit(V8)
Data.Exp1a <- c(Base, Eff, EffEn, All)
Quantity <- gl(4, 62, 248, labels = c("Baseline", "Effects only", "Effects+Enactment", "All"))
Exp1a <- data.frame(Data.Exp1a, Quantity)

#Establish means 
mean(Base)
mean(Eff)
mean(EffEn)
mean(All)

#T Test
t.test(Base, All)

#Graphics

Exp1a.plot <- ggplot(Exp1a, aes(factor(Quantity), Data.Exp1a))
Exp1a.plot + geom_boxplot(aes(fill=Quantity)) + ylab("Blame Attributions") + xlab("") + labs(title = "Relative to baseline scenario, more blame as information increases") 
