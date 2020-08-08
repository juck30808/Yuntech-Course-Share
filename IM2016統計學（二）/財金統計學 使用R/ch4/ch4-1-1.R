# ch4
?runif

# Binomial Distribution
?rbinom

windows()
plot(c(0,7), c(0,14), type="n", xlab="", ylab="", axes=F, frame.plot = F)
points(0,7,cex=2, pch=20)
points(2,5,cex=2, pch=20)
segments(0,7,2,5, cex=2,lwd=3)
points(2,9,cex=2, pch=20)
segments(0,7,2,9, cex=2, lwd=3)
text(0,7,labels="S",pos=3,cex=2)
text(2,9, labels="uS",pos=3,cex=2)
text(2,5,labels="dS",pos=3,cex=2)
points(4,11, cex=2, pch=20)
points(4,3,cex=2,pch=20)
segments(0,7,4,11, cex=2,lwd=3)
segments(0,7,4,3, cex=2, lwd=3)
text(4,11, labels="uuS", pos=3,cex=2)
text(4,3, labels="ddS", pos=3,cex=2)
points(4,7,cex=2,pch=20)
segments(2,9,4,7, cex=2,lwd=3)
segments(2,5,4,7, cex=2, lwd=3)
text(4,7,labels="duS",pos=3,cex=2)
points(6,13,cex=2,pch=20)
points(6,1,cex=2,pch=20)
segments(0,7,6,1,cex=2,lwd=3)
segments(0,7,6,13,cex=2,lwd=3)
points(6,9,cex=2,pch=20)
segments(4,11,6,9,cex=2,lwd=3)
segments(4,7,6,9,cex=2,lwd=3)
points(6,5,cex=2,pch=20)
segments(4,7,6,5,cex=2,lwd=3)
segments(4,3,6,5,cex=2,lwd=3)
text(6,13,labels="uuuS",pos=3,cex=2)
text(6,9,labels="duuS",pos=3,cex=2)
text(6,5,labels="dduS",pos=3,cex=2)
text(6,1,labels="dddS",pos=3,cex=2)
text(1,8,labels="p",pos=3)
text(1,6,labels="1-p",pos=1)
text(3,10,labels="p",pos=3)
text(3,4,labels="1-p",pos=1)
text(5,12,labels="p",pos=3)
text(5,2,labels="1-p",pos=1)
text(3,8,labels="1-p",pos=3)
text(3,6,labels="p",pos=3)
text(5,10,labels="1-p",pos=3)
text(5,8,labels="p",pos=3)
text(5,6,labels="1-p",pos=3)
text(5,4,labels="p",pos=3)

text(6.5,13,labels=expression(p^3),cex=1,pos=4)
text(6.5,9,labels=expression(3*p^2%.%(1-p)),cex=1,pos=4)
text(6.5,5,labels=expression(3*p(1-p)^2),cex=1,pos=4)
text(6.5,1,labels=expression((1-p)^3),cex=1,pos=4)

text(0,7,labels="100", col="blue", pos=1)
text(1,13,labels="u = 1.1", col="blue", pos=3)
text(1,12.5,labels="d = 0.9", col="blue", pos=3)
text(1,12,labels="R = 1.07", col="blue", pos=3)
text(1,11.5,labels="p = 0.85", col="blue", pos=3)

text(1,11,labels="S = 100", col="blue", pos=3)
text(2,9,labels="110", col="blue", pos=1)
text(2,5,labels="90", col="blue", pos=1)
text(4,11,labels="121", col="blue",pos=1)
text(4,7,labels="99", col="blue",pos=1)
text(4,3,labels="81", col="blue",pos=1)
text(6,13,labels="133.1", col="blue", pos=1)
text(6,9,labels="108.9", col="blue", pos=1)
text(6,5,labels="89.1", col="blue", pos=1)
text(6,1,labels="72.9", col="blue", pos=1)

segments(2,0.2,6,0.2)
text(2,0.2,labels="1",pos=1)
text(4,0.2,labels="2",pos=1)
text(6,0.2,labels="3",pos=1)
points(2,0.2,pch=3,cex=1, lwd=2)
points(4,0.2,pch=3,cex=1, lwd=2)
points(6,0.2,pch=3,cex=1, lwd=2)

library(fOptions)
windows()
CRRTree = BinomialTreeOption(TypeFlag = "ce", S = 50, X = 50,
Time = 0.4167, r = 0.1, b = 0.1, sigma = 0.4, n = 40)
BinomialTreePlot(CRRTree, dy = 1, cex = 0.8, ylim = c(-40, 40),
xlab = "n", ylab = "Option Value")
title(main = "Option Tree")
CRRTree

# 二項式機率分配
x = rbinom(100000,10,0.5)
x1 = sort(x)
windows()
par(mfrow=c(2,1))
plot(x,dbinom(x,10,0.5),type="h", lwd=40, col="blue", ylim=c(0,0.3),ylab="機率",
     main="二項式之機率分配: p = 0.5")
plot(c(0,10),c(0,1), xlab="x", ylab="累機機率", main="二項式分配之累積機率: p = 0.5")
lines(x1,pbinom(x1,10,0.5),type="s",lwd=3)
qbinom(0.3,10,0.5)
 
# 台灣的失業率資料
# 8/1963-5/2014
library(fBasics)
un = read.table("c:\\meiyih\\Finstats\\ch4\\失業率.txt")
un = ts(un[,1],start=c(1963,8), frequency=12)
windows()
par(mfrow=c(2,1))
ts.plot(un,main="台灣失業率的時間走勢",lwd=3,ylab="失業率",cex=3)
abline(h=4, lty=2, col="red")
basicStats(un)
hist(un,main="台灣失業率的次數分配",lwd=3,xlab="失業率",ylab="次數",cex=3)
abline(v=mean(un),lty=2,col="red",lwd=3)
abline(v=median(un),lty=3, col="green",lwd=3)
abline(v=quantile(un,prob=0.65), lty=4, col="blue",lwd=2)
legend("topright", c("平均數","中位數","第65個百分位數"), lty=2:4, bty="n",lwd=3,
      col=c("red","green","blue"))

quantile(un,prob=0.65)

sun = sort(un)
uncdf = ecdf(sun)
Fun = uncdf(sun)
sun
Fun
sun[456]
Fun[456]

index = un >= 4
pbar = mean(as.numeric(index))
pbar

dbinom(2,6,pbar)
factorial(4)
(factorial(6)/(factorial(2)*factorial(4)))*pbar^2*(1-pbar)^4
1-pbinom(2,6,pbar)

# Daily TSMC
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch4\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))
index = tsmc.r < 0
pbar = mean(as.numeric(index))
pbar
dbinom(3,10,pbar)



