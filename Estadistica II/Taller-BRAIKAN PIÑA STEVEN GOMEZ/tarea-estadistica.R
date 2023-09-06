#punto 2
install.packages("carData")
install.packages("outliers")
library(outliers)
library(carData)
States

#punto 3

summary(States)
help(States)

#punto 4
df<-States
str(df)   #Saber el tipo de variables que vamos a trabajar
summary(df$dollars)

#punto 5

boxplot(df$dollars, horizontal = TRUE)$out    #Visualizamos los atipicos
which(df$dollars%in%boxplot(df$dollars)$out)  

dfDollar<-df$dollars[-c(2,7,9,31,33)]
boxplot(dfDollar, horizontal = TRUE)$out
which(dfDollar%in%boxplot(dfDollar)$out)

#Con esto comprobamos que no hayan mas datos atipicos.
#Aceptamos la hiptesis Ho, ya que el p-valor es mayor al valor de tolerancia
test_grubbs <- grubbs.test(dfDollar)
test_grubbs

boxplot(dfDollar, horizontal = TRUE)
which(dfDollar%in%boxplot(dfDollar)$out)  
dfDollar <- dfDollar[-35]
boxplot(dfDollar, horizontal = TRUE)

#Punto 6
summary(dfDollar)

#Punto 7

shapiro.test(dfDollar)
hist(dfDollar)
hist(dfDollar,freq = F, main = "Histograma y Densidad", ylab = "Densidad")
density(dfDollar)
lines(density(dfDollar), col = "blue", lwd = 2, lty = 3)




