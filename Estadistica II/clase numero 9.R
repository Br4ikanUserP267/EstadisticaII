library("EnvStats")

rosnerTest(rivers,k=12)

riosUnos  = rivers[-c(68,70,66,69,101 ,141,7,23)]


rosnerTest(riosUnos)

max(order(boxplot(riosUnos)$out))