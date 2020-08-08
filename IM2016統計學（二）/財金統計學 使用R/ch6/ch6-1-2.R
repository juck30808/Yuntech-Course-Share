# Daily TSMC and TWI
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch6\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
# MA and EWMA
p = 收盤價
tsmc.r = 100*diff(log(p))
library(fBasics)
basicStats(tsmc.r)
T = length(tsmc.r)
windows()
par(mfrow=c(2,1))
plot(tsmc.r^2,type="p",xlab="time",ylab="", ylim=c(0,30),main="n = 250")
abline(h=var(tsmc.r), col="red",lwd=3)
ne = 250
T1 = T-ne+1
sigma = numeric(T1)
for(i in ne:T)
{
 i1 = i-ne+1
 sigma[i1] = var(tsmc.r[i1:i])
}
lines(ne:T,sigma, lty=2, col="green",lwd=3)
lambda = 0.94
var1 = var(tsmc.r[1:ne]) # 期初變異數
ewma = numeric(T1)
ewma[1] = var1
for(i in ne:(T-1))
{
 i1 = i-ne+1
 ewma[(i1+1)] = lambda*ewma[i1]+(1-lambda)*tsmc.r[(ne+i1-1)]^2
}
lines(ne:T,ewma, lty=4, col="blue",lwd=3)
legend("topright",c("移動平均","EWMA"),col=c("green","blue"),lwd=3,
      lty=c(2,4),bty="n")

plot(tsmc.r^2,type="p",xlab="time",ylab="", ylim=c(0,30),main="n = 500")
abline(h=var(tsmc.r), col="red",lwd=3)
ne = 500
T1 = T-ne+1
sigma = numeric(T1)
for(i in ne:T)
{
 i1 = i-ne+1
 sigma[i1] = var(tsmc.r[i1:i])
}
lines(ne:T,sigma, lty=2, col="green",lwd=3)
lambda = 0.94
var1 = var(tsmc.r[1:ne]) # initial standard deviation
ewma = numeric(T1)
ewma[1] = var1
for(i in ne:(T-1))
{
 i1 = i-ne+1
 ewma[(i1+1)] = lambda*ewma[i1]+(1-lambda)*tsmc.r[(ne+i1-1)]^2
}
lines(ne:T,ewma, lty=2, col="blue",lwd=3)
legend("topright",c("移動平均","EWMA"),col=c("green","blue"),lty=c(2,4),lwd=3,
       bty="n")

