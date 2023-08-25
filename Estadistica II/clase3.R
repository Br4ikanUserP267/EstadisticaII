#library(outliers)
#library(EnvStats)

#Test de Dixon, dixon trabajo con muestras pequeñas

set.seed(123)
df_dixon <- sample(5:16,20, replace = TRUE)
summary(df_dixon)
limite_inferior <- 7.75 - 1.5 * (14 - 7.75)
limite_superior <- 14 + 3 * (14-7.75)

df_dixon2 <- df_dixon
# Remplazamos la posicion 10, 21 y 45 por los valores 21, 33 y 100
df_dixon2[c(10, 17, 19)] <- c(25, 38, 120)
dixon.test(df_dixon2)

which(df_dixon2%in%boxplot(df_dixon2)$out)

df_dixon2 <- df_dixon2[-19]
boxplot(df_dixon2, horizontal = T)
dixon.test(df_dixon2)

df_dixon2 <- df_dixon2[-17]
boxplot(df_dixon2, horizontal = T)
dixon.test(df_dixon2)

df_dixon2 <- df_dixon2[-10]
boxplot(df_dixon2, horizontal = T)
dixon.test(df_dixon2)

#Test dee Rosner
set.seed(587)
df_rosner <- sample(5:16,100, replace = TRUE)
df_rosner2 <- df_rosner
df_rosner2[c(10, 17, 45)]<- c(55, 33, 100)
rosnerTest(df_rosner2, k=4)










