library(cluster)
library(ggplot2)
library(NbClust)
library(dendextend)
library(factoextra)
library(cowplot)
install.packages("dendextend")
install.packages("factoextra")

help("attenu")
summary(attenu)
data("attenu")

datos = attenu[-c(3,1)]
datos = na.omit(datos)
datos = scale(datos)
datos
summary(datos)

#calcular la distancia de los datos.

distancia = dist(datos,method="euclidean")
#Aplicamos cluster
hc1 = hclust(distancia,method="ward.D")
dendograma =plot(hc1,cex=0.6,hang = -1)

hc2 = agnes(distancia,method="ward")
coef_aglomeracion <- hc2$ac
coef_aglomeracion
#Entre más cecarno a uno es más facil.




#Regla de la mayoía


res = NbClust(datos,distance = "euclidean", min.nc = 4, max.nc = 7,method = "ward.D",index="alllong")
res

clust = cutree(hc1,k=5)


fviz_cluster(list(data=datos,cluster=clust))

cluster_resumen = data.frame(hc1[2:1])
cluster_resumen

par(nfrow=c(1,2))
dendograma = plot(hc1,cex =0.6,hang=-1)
rect.hclust(hc1,k=5,border="red")
dendograma = plot(hc1,cex =0.6,hang=1)
rect.hclust(hc1,h=12,border="red")

clust = cutree(hc1,k=7)
fviz_cluster(list(data=datos,cluster=clust))

dend = color_branches(hc1,k=5)
plot(dend)

#No jerarquico
#Kmeans
kmedias<-kmeans(datos,7)
kmedias
#obtenemos las medias
aggregate(datos,by=list(kmedias$cluster),FUN=mean)
#adicionamos la pertencia al cluster
datos_cluster_kmedias<-data.frame(datos,kmedias$cluster)
datos_cluster_kmedias
fviz_cluster (kmedias, data = datos)

#Visualicemos el análisis con cada método (Jerarquico vs No jerarquico)
g1<-fviz_cluster(list(data = datos, cluster = clust),main = "Metodo Jerárquico")
g2<-fviz_cluster (kmedias, data = datos,main = "Método No Jerárquico")
g1
g2


plot_grid(g1,g2,ncol =2)
help("cowplot")
