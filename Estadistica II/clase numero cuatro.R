#Test de rosner
library(outliers)
library(EnvStats)

set.seed(123)

rosner=sample(5:16,20,replace=T)
summary(rosner)
boxplot(df,horizontal=T)
rosner[c(10,17,45)] = c(25,38,120)

rosnerTest(rosner,k=4)
help(rosnerTest)