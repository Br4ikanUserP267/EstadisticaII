#importa datos_cluster
str(datos_cluster)
#grafico de dispersipon por ser dos variables
plot(datos_cluster$INVERSION,datos_cluster$VENTAS,pch=19)
# Asignamos las etiquetas
text(datos_cluster$INVERSION,datos_cluster$VENTAS,
     labels = row.names(datos_cluster),
     cex = 0.5, pos = 4, col = "red")
library(NbClust)

#matriz de distancias
#Distancia Euclidea
# matriz_dist_euclidia<-dist(datos_cluster[-1],method = "euclidean",diag = T)
round(matriz_dist_euclidia,2)
#Distancia Manhattan
matriz_dist_manhattan<-dist(datos_cluster[-1],method = "manhattan",diag = T)
round(matriz_dist_manhattan,2)

#Distancia Minkowski
matriz_dist_minkowski<-dist(datos_cluster[-1],method = "minkowski",diag = T)
round(matriz_dist_minkowski,2)

#Distancias para variables binarias
#importa datos_cluster_binarios
#install.packages("ade4")
library(ade4)
matriz_dist_binary_1<-dist.binary(datos_cluster_binarios[-1],method=1)
round(matriz_dist_binary_1,2)

########################### ANALISIS CLUSTER ############################
####################### Métodos Jerarquicso Aglomerativos  ############################

#METODO DEL CENTROIDE
#CALCULAMOS LA DISTANCIA EUCLIDEA
matriz_dist_euclidia<-dist(datos_cluster[-1],method = "euclidean",diag = T)

#CALCULAMOS LA DISTANCIA EUCLIDEA AL CUADRADO
matriz_dist_euclidia_2<-(matriz_dist_euclidia)^2

#EFECTUAMOS EL ANALISIS DE CLUSTER CON EL METODO DEL CENTROIDE
cluster_centroide<-hclust(matriz_dist_euclidia_2,method = "centroid")

#Graficamos los resultados
plot(cluster_centroide,labels = datos_cluster$Nombre)

#Obtener el historial de aglomeración
cluster_centroide_resumen<-data.frame(cluster_centroide[2:1])
cluster_centroide_resumen


#METODO DEL VECINO MÁS CERCANO

cluster_vecino_mascercano<-hclust(matriz_dist_euclidia_2,method = "single")

cluster_vecino_mascercano = data.frame(cluster_vecino_mascercano[2:1])
cluster_vecino_mascercano

#regla de la mayoria 
library(NbClust)

regla_mayoritaria_vecino_mas_cercano  = NbClust(datos_cluster[-1],distance ="euclidean",min.nc = 2,max.nc = 4,method = "ward.D2",index="allong")
#Graficamos los resultados
plot(cluster_vecino_mascercano,labels = datos_cluster$Nombre)

#Obtener el historial de aglomeración
cluster_vecino_mascercano_resumen<-data.frame(cluster_vecino_mascercano[2:1])
cluster_vecino_mascercano_resumen





#METODO DEL VECINO MÁS lejano

#EFECTUAMOS EL ANALISIS DE CLUSTER CON EL METODO DEL CENTROIDE
cluster_vecino_maslejano<-hclust(matriz_dist_euclidia_2,method = "complete")

#Graficamos los resultados
plot(cluster_vecino_maslejano,labels = datos_cluster$Nombre)

#Obtener el historial de aglomeración
cluster_vecino_maslejano_resumen<-data.frame(cluster_vecino_maslejano[2:1])
cluster_vecino_maslejano_resumen

#METODO DE Ward

#EFECTUAMOS EL ANALISIS DE CLUSTER CON EL METODO DEL CENTROIDE
cluster_wardD<-hclust(matriz_dist_euclidia_2,method = "ward.D")

#Graficamos los resultados
plot(cluster_wardD,labels = datos_cluster$Nombre)

#Obtener el historial de aglomeración
cluster_wardD_resumen<-data.frame(cluster_wardD[2:1])
cluster_wardD_resumen

#EFECTUAMOS EL ANALISIS DE CLUSTER CON EL METODO DEL CENTROIDE
cluster_wardD2<-hclust(matriz_dist_euclidia_2,method = "ward.D2")

#Graficamos los resultados
plot(cluster_wardD2,labels = datos_cluster$Nombre)

#Obtener el historial de aglomeración
cluster_wardD2_resumen<-data.frame(cluster_wardD2[2:1])
cluster_wardD2_resumen

#Numero de Cluster
install.packages("NbClust")
library(NbClust)
regla_mayoritaria_centroide<-NbClust(datos_cluster[-1],distance = "euclidean",min.nc = 2,
             max.nc = 4,method = "ward.D2",index = "alllong")
#La regla de la mayoría.

#No jerarquico
#Kmeans
kmedias<-kmefans(datos_cluster[-1],2)
kmedias
#obtenemos las medias
datos<-datos_cluster[-1]
aggregate(datos,by=list(kmedias$cluster),FUN=mean)
#adicionamos la pertencia al cluster
datos_cluster_kmedias<-data.frame(datos,kmedias$cluster)
datos_cluster_kmedias
#

