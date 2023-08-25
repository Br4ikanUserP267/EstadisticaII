set.seed(123)
n= 100
mu = 10
sigma = 1
x= rnorm(n,mu,sigma)
hist(x)
#Densidad 
par(mfrow=c(1,2))
hist(x)
hist(x,freq = F)
densidad = density(x)
lines(densidad,lwd=2,col="red")