library(MASS)
data("survey")
help("survey")
str(survey)

tabla_contingencia1 <- table(survey$Smoke, survey$Sex)
tabla_contingencia1

tabla_contingencia2 <- table(survey$Smoke, survey$Exer)
tabla_contingencia2

#Prueba de Chi-cuadrado
chisq.test( tabla_contingencia1 )
qchisq(0.05, 3, lower.tail = F)

# 0.3139 > 0.05
#EL SEXO DEL ESTUDIANTE NO INFLUYE EN SU AMBITO DE FUMAR
#ESTADISTICAMENTE ESTAMOS COMPROBANDO QUE EL SEXO NO ESTA RELACIONADO CON EL HABITO DE SUMAR

chisq.test( tabla_contingencia2 )
#Hacer fisher test por el warning

fisher.test(tabla_contingencia2)
# 0.4138 > 0.05