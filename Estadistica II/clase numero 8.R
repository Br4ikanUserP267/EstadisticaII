

data("rivers")
str(rivers)
head(rivers)
summary(rivers)
#In this section we going to saw 


boxplot(rivers,horizontal = T)$out


#I cach the min value in the out datas 
min(boxplot(rivers)$out)

riversOne = rivers [rivers<1234]
riversOne


par(mfrow=c(1,2))

boxplot(rivers)$out
boxplot(riversOne) $out
min(boxplot(riversOne)$out)


riversTwo = riversOne [riversOne<1100]
riversTwo


par(mfrow=c(1,2))

boxplot(rivers)$out
boxplot(riversTwo) $out

min(boxplot(riversTwo)$out)

riversTrees = riversTwo [riversTwo<1054]
riversTrees
boxplot(riversTrees) $out




help("rivers")


