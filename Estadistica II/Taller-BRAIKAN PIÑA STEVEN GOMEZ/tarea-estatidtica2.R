#Punto 1
data("attenu")
install.packages("VIM")
library("VIM")

#Punto 2
help("attenu")
str(attenu)

#Punto 3
summary(attenu)
sum(is.na(attenu)) #Contar los NA's
colSums(is.na(attenu)) #Contar los NA'S por columnas
dfAtenu <- na.omit(attenu) #Omitir las filas de las observaciones NA
sum(is.na(dfAtenu)) #Contar los NA's en dfAtenu
summary(dfAtenu)

#Ver el patron de datos ausentes
aggr(attenu$station, numbers=TRUE, ylab=c("Porcentaje de datos perdidos", "Patron"))

#Imputar datos usando el promedio
install.packages("mice")
library(mice)

datos_imputados <- mice(attenu, method = "mean", print=FALSE)
datos_completos <- mice::complete(datos_imputados)
summary(datos_completos)
sum(is.na(datos_completos))

aggr(datos_completos, numbers=TRUE)

#Imputar datos usando la regresion
datos_imputados2 <- mice(attenu, method = "norm.predict", print=FALSE)
datos_completos2 <- mice::complete(datos_imputados2)
summary(datos_completos2)
sum(is.na(datos_completos2))
aggr(datos_completos2, numbers=TRUE)

#Imputar datos usando el metodo "pmm"
datos_imputados3 <- mice(attenu, method = "pmm", print=FALSE)
datos_completos3 <- mice::complete(datos_imputados3)
summary(datos_completos3)
sum(is.na(datos_completos3))
aggr(datos_completos3, numbers=TRUE)






