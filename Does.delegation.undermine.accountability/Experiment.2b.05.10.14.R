#Issue here - the variables aren't the same length
#Not going to make a graph for this one, anyway

File3 <- read.csv("~/[...].csv")
attach(File3)
library(ggplot2)


All <- na.omit(Eff.En.His_1)
All.Plus <- na.omit(EEH.Plus_1)

