install.packages("carData")
library(carData)
data("States")
help("States")
df<-States
str(df)
summary(df$dollars)
boxplot(df$dollars)$out
which(df$dollars%in%boxplot(df$dollars)$out)
dfDollar<-df$dollars[-c(2,7,9,31,33)]
boxplot(dfDollar)$out
which(dfDollar%in%boxplot(dfDollar)$out)
dfDollar<-dfDollar[-35]
boxplot(dfDollar)$out
summary(dfDollar)
shapiro.test(dfDollar)
hist(dfDollar)
hist(dfDollar)
hist(dfDollar,freq = FALSE, main = "histograma y densidad", ylab = "densidad")
density(dfDollar)
lines(density(dfDollar), col = "red", lwd = 2, lty = 3)
