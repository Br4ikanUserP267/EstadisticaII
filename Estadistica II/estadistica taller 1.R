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
help(States)
#Omitimos los NA's

datos = States[-c(1)]
datos
datos = na.omit(datos)
#Here we dca
datos = scale(datos)

datos

distancia = dist(datos, method = "manhattan")
distancia

#First Clust
hc1 = hclust(distancia,method="ward.D")
dendograma =plot(hc1,cex=0.6,hang = -1)

#Here we've ward method 
hc2 = agnes(distancia,method="ward")
coef_aglomeracion <- hc2$ac
coef_aglomeracion

#Majority Rule
regla_mayoritaria_vecino_mas_cercano  = NbClust(datos, distance = "manhattan", min.nc = 2, max.nc = 15, method = "ward.D")
help("NbClust")


#

