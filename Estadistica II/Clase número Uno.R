#Como se verifica la normalidad en el sotware 
#Que criterion usamos para detectar atipicos atravez de boxPLOT



df=sample(5:16,100,replace=T)

boxplot(df,horizontal=T)

dfDos = df

dfDos[c(10,21,33)] = c(21,33,100)

boxplot(dfDos,horizontal=T)

par(mfrow=c(1,2))
boxplot(df,horizontal=T)
boxplot(dfDos,horizontal=T)$out
which(dfDos %in% boxplot(dfDos)$out)




str(iris)
help(iris)
boxplot(iris[-5])
medias = colMeans(iris[-5])
meadias
points(medias,col='red',pch= 12)
# went is horizontal you must to do 

boxplot(iris,horizontal = T)
points(medias,c(1,2,3,4),col='red', pch=10)


#Turkey adjuster test

set.seed(123)
boxplot(dfDos)
# step 1  quit quantile 0.95  nd 0.5
cuantiles = quantile(dfDos,c(0.95,0.05))
cuantiles
#Step 2 Replace 
plot(dfDos,pch=16,ylim = x(0,100))
dfDosRecortado = dfDos[dfDos >cuantiles[1] &  dfDos< cuantiles[2]]
dfDosRecortado
cuartilRecortadoUno = quantile(dfDosRecortado,0.25)
cuantilRecortadoTres = quantile(dfDosRecortado,0.75)
IQRRecortado = cuantilRecortadoTres -cuartilRecortadoUno


cuantilUno  = quantile(dfDos,0.25)
cuantilTres  = quantile(dfDos,0.75)
cuantilTres
IQR = cuantilUno-cuantilDos
IQR
IQRRecortado


#Apply Turkey adjust 
df2 = dfDos

abline(h =c(cuantilUno-1.5*IQR, cuantilTres+1.5 *IQR),col="blue")


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



help(abline)