#Test de dixon
library(outliers)
library(EnvStats)

set.seed(123)

df_dixon=sample(5:16,20,replace=T)
summary(df_dixon)
boxplot(df,horizontal=T)
df_dixon = df
limteInferior<-7.75-1.5*(14-7.75)
limteInferior

limteSuperior<-14+1.5*(14-7.75)
limteSuperior
df_dixon[c(10,45,16)] = c(25,38,120)
#Highest
boxplot(df_dixon,horizontal=T)

dixon = dixon.test(df_dixon)
dixon

which(df_dixon%in%boxplot(df_dixon)$out)

dixon = dixon.test(df_dixon, opposite = T)



dixon.test(df_dixon)

rosnerTest()