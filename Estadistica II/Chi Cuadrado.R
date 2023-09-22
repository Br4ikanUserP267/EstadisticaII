#Prueba de indepedenci chi-cuadrado


help("matrix")

tabla1 = matrix(c(21,36,30,48,26,19),nrow=2,byrow=T)
tabla1


rownames(tabla1)<-c("Con h", "Sin h")
colnames(tabla1)<-c("nf","fm", "FE")
tabla1

#Valor de prueba.


#x^2 =14,464
chisq.test(tabla1)
#Valor criticio 
qchisq(0.05,2,lower.tail = FALSE)



