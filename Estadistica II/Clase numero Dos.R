library(outliers)
library(EnvStats)

set.seed(333)

df=sample(5:16,100,replace=T)
boxplot(df,horizontal=T)
dfDos = df

dfDos[c(10,17,45)] = c(21,33,100)
#Highest
boxplot(dfDos,horizontal=T)
test_grubbs= grubbs.test(dfDos)
test_grubbs



#Lowest
test_grubbs= grubbs.test(dfDos, opposite = T)
test_grubbs


which(dfDos%in%boxplot(dfDos)$out)


#Eliminar la poscioón 

dfDos = dfDos[-45]
dfDos
test_grubbs= grubbs.test(dfDos)
test_grubbs
dfDos = dfDos[-17]
test_grubbs= grubbs.test(dfDos)

test_grubbs= grubbs.test(dfDos, opposite = T)
test_grubbs



help(grubbs.test)




#H0: El valor más alto  (más bajo ) no es un valor atipico 
#H1 : El valor más alto (más bajo ) si es un valor atípico0


#Prueba de Grubbs 
