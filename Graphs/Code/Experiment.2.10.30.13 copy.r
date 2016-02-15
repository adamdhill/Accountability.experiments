Exec.data <- read.csv("~/Skydrive/Foundations/Canonical.data/Exec.data.csv", quote="")
View(Exec.data)
attach(Exec.data)
library(ggplot2)

Exp2 <- c(Exec.data$S1.Base, Exec.data$Congress1)
Exp2.Labels <- gl(2, 85, 170, labels = c("Direct", "Indirect"))
Exp2.Data <- c(Exec.data$S1.Base, Exec.data$Congress1)
Exp2 <- data.frame(Exp2.Data, Exp2.Labels)

Exp2.plot <- ggplot(Exp2, aes(factor(Exp2.Labels), Exp2.Data))

Exp2.plot + geom_boxplot() + ylab("Blame Attributions under Direct Comparison") + labs(title = "Comparison of Direct and Indirect Action") + xlab("Direct =  8.788, Indirect = 8.384")