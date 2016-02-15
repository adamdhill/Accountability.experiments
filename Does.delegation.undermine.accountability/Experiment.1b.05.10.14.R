#Issue here - the variables aren't the same length
#Not going to make a graph for this one, anyway

File2 <- read.csv("~/SkyDrive/Jan29.March2.March31.csv")
attach(File2)
library(ggplot2)


Base <- na.omit(Base2_1)
Eff <- na.omit(Eff_1)
EffEn <- na.omit(Eff...En_1)
All <- na.omit(All_1)
Data.Exp1b <- c(Base, Eff, EffEn, All)
Quantity <- gl(4, 53, 248, labels = c("Baseline", "Effects only", "Effects+Enactment", "All"))
Exp1b <- data.frame(Data.Exp1b, Quantity)

#Establish means 
mean(Base)
mean(Eff)
mean(EffEn)
mean(All)

#T Test
t.test(Base, All)

#Graphics

Exp1b.plot <- ggplot(Exp1b, aes(factor(Quantity), Data.Exp1b))
Exp1b.plot + geom_boxplot(aes(fill=Quantity)) + ylab("Blame Attributions") + xlab("") + labs(title = "Relative to baseline scenario, more blame as information increases") 
