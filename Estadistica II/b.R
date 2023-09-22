#INTEGRANTES
#BRAIKAN PIÑA SALCEDO 
#STEVEN GOMEZ FOLIACO

#install.packages("carData")
#install.packages("cluster")
#install.packages("ggplot2")
#install.packages("NbClust")
#install.packages("dendextend")
#install.packages("factoextra")
#install.packages("dplyr")
#install.packages("purrr")
#install.packages("cowplot")

library(carData)
library(factoextra)
library(dendextend)
library(NbClust)
library(cluster)
library(ggplot2)
library(dplyr)
library(purrr)
library(cowplot)

# Conociendo el dataset 

help("States")
str(States)
summary(States)

####################################################################################
###################################### Punto 3 #####################################
####################################################################################

data(States)

####################################################################################
###################################### Punto 4 #####################################
####################################################################################

datos <- States[-1]
datos <- na.omit(datos)

####################################################################################
###################################### Punto 5 #####################################
####################################################################################

# Es necesario escalar los datos debido a que tienen escalas diferentes, y resulta dificil
# Comparar las variables directamente, es por esa razon que escalamos los datos para tener
# una escala comun entre ellas faciitando el analisis a lo largo de este trabajo

datos2 <- scale(datos)

####################################################################################
###################################### Punto 6 #####################################
####################################################################################

# Calculamos distancias de manhattan
d <- dist(datos2, method = "manhattan")
round(d,2)

hc1 <- hclust(d, method = "complete")


####################################################################################
###################################### Punto 7 #####################################
####################################################################################

hc2 <- agnes(d, method = "complete")
coef_aglomeracion <- hc2$ac
coef_aglomeracion

####################################################################################
###################################### Punto 8 #####################################
####################################################################################

dendograma <- plot(hc1, cex = 0.6, hang = -1)

# Obtenemos historial de aglomeración
cluster_centroide_resumen <- data.frame(hc1[2:1])
cluster_centroide_resumen


####################################################################################
###################################### Punto 9 #####################################
####################################################################################

#regla de la mayoria

res <- NbClust(datos2, distance = "manhattan", min.nc = 2, max.nc = 7, 
               method = "complete", index = "alllong")


####################################################################################
###################################### Punto 10 ####################################
####################################################################################

# Cortar el dendograma en 5 grupos
clust <- cutree(hc1, k = 5)

#Gráfico de pertenencia de individuos al cluster
fviz_cluster(list(data = datos2, cluster = clust))

par(mfrow = c(1,2))
dendograma <- plot(hc1, cex = 0.6, hang = -1)
rect.hclust(hc1, k = 5, border = "red")
dendograma <- plot(hc1, cex = 0.6, hang = -1)
rect.hclust(hc1, h = 14, border = "red")

#También podemos dar color a las ramas de los grupos
dend <- color_branches(hc1, k = 5)
plot(dend)
ggplot(dend)

####################################################################################
###################################### Punto 12 #####################################
####################################################################################

#No jerarquico
#Kmeans
kmedias<-kmeans(datos2, 5)
kmedias
#obtenemos las medias
aggregate(datos2,by=list(kmedias$cluster),FUN=mean)
#adicionamos la pertencia al cluster
datos_cluster_kmedias<-data.frame(datos2,kmedias$cluster)
datos_cluster_kmedias
fviz_cluster(kmedias, data = datos2)


####################################################################################
###################################### Punto 13 ####################################
####################################################################################

#Visualicemos el análisis con cada método (Jerarquico vs No jerarquico)
g1<-fviz_cluster(list(data = datos2, cluster = clust),main = "Metodo Jerárquico")

g2<-fviz_cluster (kmedias, data = datos2, main = "Método No Jerárquico")
g1
g2


plot_grid(g1, g2, ncol = 2)

