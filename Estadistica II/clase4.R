#install.packages("VIM")
#library(VIM)
#data("airquality")

#Conociendo mi dataset
help("airquality")
str(airquality)
summary(airquality)

#Contar los NA's
sum(is.na(airquality))

#Contar los NA'S por columnas
colSums(is.na(airquality))

#Omitir las filas de las observaciones NA
air1 <- na.omit(airquality)

#Contar los NA's en air1
sum(is.na(air1))

summary(air1)

#Ver el patron de datos ausentes
aggr(airquality, numbers=TRUE, ylab=c("Porcentaje de datos perdidos", "Patron"))
#porcentaje de datos auscente por cada variable

#install.packages("mice")
library(mice)
#Imputar datos usando el promedio

datos_imputados <- mice(airquality, method = "mean", print=FALSE)
datos_completos <- mice::complete(datos_imputados)
summary(datos_completos)
sum(is.na(datos_completos))
aggr(datos_completos, numbers=TRUE)


#Imputar datos usando la regresion
datos_imputados2 <- mice(airquality, method = "norm.predict", print=FALSE)
datos_completos2 <- mice::complete(datos_imputados2)
summary(datos_completos2)
sum(is.na(datos_completos2))
aggr(datos_completos2, numbers=TRUE)

#Imputar datos usando el metodo "pmm"
datos_imputados3 <- mice(airquality, method = "pmm", print=FALSE, seed = 123)
datos_completos3 <- mice::complete(datos_imputados3)
summary(datos_completos3)
sum(is.na(datos_completos3))
aggr(datos_completos3, numbers=TRUE)


