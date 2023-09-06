library(carData)
library(factoextra)
library(cowplot)
library(NbClust)
library(cluster)
library(ggplot2)
library(dendextend)
data("States")

help(States)

data("States")
summary(States)
States
#Omitimos los NA's

datos = States[-c(1, 8)]
datos = na.omit(datos)
datos = scale(datos)

datos

distancia = dist(datos, method = "manhattan")
distancia


#Aplicamos el primer cluster.
hc1 = hclust(distancia,method="ward.D")
dendograma =plot(hc1,cex=0.6,hang = -1)

#Aplicamos el metodo de ward para hallar el coeficiente de variación.
hc2 = agnes(distancia,method="ward")
coef_aglomeracion <- hc2$ac
coef_aglomeracion

#Regla de la mayoria

