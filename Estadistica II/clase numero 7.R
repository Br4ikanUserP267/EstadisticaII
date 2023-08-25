#Eliminición 
library(mice)

library(VIM)
data("airquality")

help("airquality")

str(airquality)
summary(airquality)

#Count the NA'S into the all dataframe 

sum(is.na(airquality))

#Count NA per colums 
colSums(is.na(airquality))

#Omit
airUno = na.omit(airquality)

sum(is.na(airUno))


summary(airUno)

aggr(airquality, numbers= TRUE, ylab=c("% Loss data","Patron"))

aggr(airquality,numbers=T, ylab=c("Porcentaje de datos", "Patron"))
#Metodo media

datos_imputados = mice(airquality,method = "mean" , print= F)

datos_completos =  mice::complete(datos_imputados)
summary(datos_completos)
sum(is.na(datos_completos))

aggr(datos_completos, mumbers= TRUE)


#Hacer Con el metodo de regresión 
datos_imputados_dos = mice(airquality,method = "norm.predict" , print= F)

datos_completos_dos =  mice::complete(datos_imputados_dos)
summary(datos_completos_dos)
sum(is.na(datos_completos_dos))

aggr(datos_completos, mumbers= TRUE)

#PMM
datos_imputados_tres = mice(airquality,method = "pmm" , print= F)

datos_completos_tres =  mice::complete(datos_imputados_tres)
summary(datos_completos_tres)
sum(is.na(datos_completos_tres))

aggr(datos_completos, mumbers= TRUE, seed=123)
