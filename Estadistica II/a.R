#Prueba de indepedenci chi-cuadrado


help("matrix")

tabla1 = matrix(c(5,4,3,10,3,23,15,3,5),nrow=2)
tabla1

#Valor de prueba.


#x^2 =14,464
chisq.test(tabla1)
#Valor criticio 
qchisq(0.05,4,lower.tail = FALSE)


#Test de fisher : por si chisqu In chisq.test(tabla1) : Chi-squared approximation may be incorrect


fisher.test(tabla1)

library(MASS)
help(survey)
str(survey)

