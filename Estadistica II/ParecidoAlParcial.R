library(cluster)
library(factoextra)
library(ggplot2)
library(NbClust)

help("USArrests")
str(USArrests)
datos = scale(USArrests)
datos


d = dist(datos, method = "euclidean")
d
#euclidian alk cuadrado 
#hc1 = hclust(d^2,method ="ward.D")
hc1 = hclust(d,method ="ward.D")
#dendograma = plot(hc1)#Nos salen clusters por debajo de 0
dendograma = plot(hc1,cex=0.6,hang=-1)
#Historial de aglmeracion es en el que tenemos las alturas.
hc_resumen = data.frame(hc1[2:1])
hc_resumen
clust <- cutree(hc1, h = 5)

rect.hclust(hc1, h = 5, border = "red")

res <- NbClust(datos, distance = "euclidean", min.nc = 2, max.nc = 8, 
               method = "ward.D", index = "alllong")

#ACP
acp = prcomp(datos)

acp
biplot(acp)

