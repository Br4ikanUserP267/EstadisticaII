ibrary("cluster")
library("mice")
library("EnvStats")
library(outliers)


data("votes.repub")


# Conociendo mi data set 
help(votes.repub)

data <- votes.repub # 1) Si hay valores ausentes
sum(is.na(data)) # 2) 217 valores ausentes, 14% del total de datos
# 3) 1856, 30 Na's, 60% de los datos ese año

# Revisando na por variable
na_por_columna <- colSums(is.na(data))

# punto 4)
data_data_imp <- mice(data, method="pmm", print=F) # Se realiza la imputacion de datos usando el metodo PMM (Predictive Mean Matching)
data_data_complete <- mice::complete(data_data_imp) # Se completa los datos de data usando la prediccion de valores anterior
sum(is.na(data_data_complete)) # Se verifican los faltantes y queda en 0 el resultado, podemos decir que station ya no tiene NA's
aggr(data_data_complete,numbers=T, ylab=c("Porcentaje de datos perdidos", "Patron")) # Graficamos y en la parte del porcentaje de valores faltantes esta vacio, todos los datos estan rellenados, el grafico 2.0 nos ayuda con la validacion de esto

# Punto 5

# a)

datosSinNormalizar <- data_data_complete$X1956
shapiro.test(datosSinNormalizar) # Al ser el p-valor (5.96e-06) se rechaza la H0 de que los datos provienen de una distribucion normal

# b)

qqnorm(datosSinNormalizar) # Sin normalizar
qqline(datosSinNormalizar, col = 2) # Sin normalizar

# c) 

boxplot(datosSinNormalizar, horizontal = T) # Verificando los datos atipicos para la variable 1856 con boxplot

# Calcular los cuartiles y el rango intercuartil (IQR)
q1 <- quantile(datosSinNormalizar, 0.25)
q3 <- quantile(datosSinNormalizar, 0.75)
iqr <- q3 - q1

# Calcular los límites inferior y superior para los valores atípicos
limite_inferior <- q1 - 1.5 * iqr
limite_superior <- q3 + 1.5 * iqr

# Contar los valores atípicos
valores_atipicos <- datosSinNormalizar < limite_inferior | datosSinNormalizar > limite_superior
cantidad_atipicos <- sum(valores_atipicos)

# Imprimir la cantidad de valores atípicos
cat("Cantidad de valores atípicos:", cantidad_atipicos, "\n") # Los valores atipicos fueron 5

# d)

outliers_tukey <- outliers(datosSinNormalizar, method = "tukey")





# Datos normalizados

n<-50 # cantidad de observaciones
mu<-mean(data_data_complete$X1856) # media
sigma<-sd(data_data_complete$X1856) # desviacion estandar
normalidad<-rnorm(n, mu, sigma) # 

qqnorm(normalidad) # normalizados
qqline(normalidad, col = 2) # normalizados

par(mfrow=c(1,2))
hist(normalidad)
histograma<-hist(normalidad, freq = F)
density<-density(normalidad)
lines(density, lwd=2, col="red")

boxplot(normalidad, horizontal = T) # Se detecta 0 valores atipicos utilizando bloxpot para graficarlos