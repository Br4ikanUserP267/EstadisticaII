
str(iris)           #Importar o llamar la base de datos iris
boxplot(iris)       #Grafica
boxplot(iris[-5])   #Grafica y Elimina la columna numero 5

medias <- colMeans(iris[-5])  #Guarda las medias de cada columna, excepto la columna 5
medias
#dibuja puntos
points(medias, col="red", pch=8)


#Dibuja el conjunto de datos de forma horizontal
boxplot(iris[-5], horizontal = TRUE) 
points(medias, c(1,2,3,4), col="orange", pch=8)


#################################################################################
set.seed(123)
df <- sample(5:16, 100, replace = TRUE)
df2 <- df
df2[c(10,21,33)] <- c(21,33,100)
boxplot(df2)
df2

#############################################################################

cuantiles_5 <- quantile(df2, c(0.05, 0.95))
df2_recortado <- df2[df2>cuantiles_5[1] & df2<cuantiles_5[2]]
q1_r <- quantile(df2_recortado, 0.25)
q3_r <- quantile(df2_recortado, 0.75)
IQR_r <- q3_r - q1_r
tukey_ajust <- df2<(q1_r - 1.5 * IQR_r) | df2>(q3_r + 1.5 + IQR_r)
which(tukey_ajust)

plot(df2, pch=16, ylim = c(0,100))
q1 <- quantile(df2, 0.25)
q3 <- quantile(df2, 0.75)

IQR <- q3 - q1
abline(h=c(q1 - 1.5 * IQR, q3 + 1.5 * IQR), col="blue")
abline(h=c(q1_r - 1.5 * IQR_r, q3_r + 1.5 * IQR_r), col="red", lwd=3, lty=2)


abline(h=c(q1 - 1.5 * IQR, q3 + 1.5))
