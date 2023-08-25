# install.packages("outliers")
# install.packages("EnvStats")

# library(outliers)
# library(EnvStats)

# Test de Grubbs
set.seed(333)
df <- sample(5:16,100, replace = TRUE)
boxplot(df, horizontal = TRUE)
df2 <- df
# df2[c(10,21,45)] <- c(21,33,100) # Remplazamos la posicion 10, 21 y 45 por los valores 21, 33 y 100
df2[c(10, 17, 45)]<- c(21, 33, 100)

boxplot(df2, horizontal = TRUE)
test_grubbs <- grubbs.test(df2)
test_grubbs

test_grubbs <- grubbs.test(df2, opposite = T)
test_grubbs

#Conlusion: No hay evidencia estadistica para rechazar que el minimo de los datos no es un valor atipico 

which(df2%in%boxplot(df2)$out)
df2<-df2[-45]
boxplot(df2, horizontal = T)
test_grubbs <- grubbs.test(df2)
test_grubbs
df2<-df2[-17]#Teniendo en cuenta que el valor de alfa es 0.05, no se rechaza Ho. Pvalor > alfa
grubbs.test(df2)
test_grubbs <- grubbs.test(df2, opposite = T)
test_grubbs
