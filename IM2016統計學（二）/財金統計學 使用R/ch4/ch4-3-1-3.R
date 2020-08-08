# Daily TSMC
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\finstats\\ch4\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))
# TWI
# 1/4/2000-7/10/2014
TWI = read.table("c:\\meiyih\\Finstats\\ch4\\TWI1.txt",header=T)
attach(TWI)
names(TWI)
twi.r = 100*diff(log(T收盤價))

tsmc.2r = 100*diff(log(收盤價),2)
tsmc.5r = 100*diff(log(收盤價),5)
tsmc.10r = 100*diff(log(收盤價),10)

library(fGarch)
windows()
par(mfcol=c(2,4))
model1 = stdFit(tsmc.r)
model1
#sd(tsmc.r)
#mean(tsmc.r)
y = tsmc.r
param1 = c(-0.0036, 2.2249, 4.1547) # 按照model1內之$par
plot(density(y), main="實證與理論t (k=1)", ylim=c(0,0.3),xlab="r",lwd=2)
n = length(y)
x1 = seq(min(y), max(y), length=n)
lines(x1, dstd(x1,mean=param1[1],sd=param1[2],nu=param1[3]),lty=2,lwd=2,col="red")
grid = (1:n)/(n+1)
s_dx = sort(y)
qqplot(s_dx,qstd(grid,mean=param1[1],sd=param1[2],nu=param1[3]),lwd=2,
       xlab="",ylab="", main="QQ 圖")
q1 = qstd(c(0.25,0.75), mean=param1[1],sd=param1[2],nu=param1[3])
lmfit1 = lm(q1~quantile(y,c(0.25,0.75)))
abline(lmfit1,col="red",lty=2,lwd=2)

model2 = stdFit(tsmc.2r)
model2
#sd(tsmc.2r)
#mean(tsmc.2r)
y = tsmc.2r
param2 = c(0.0465, 3.1636, 4.433)
plot(density(y), main="實證與理論t (k=2)", ylim=c(0,0.2),xlab="r",lwd=2)
n = length(y)
x1 = seq(min(y), max(y), length=n)
lines(x1, dstd(x1,mean=param2[1],sd=param2[2],nu=param2[3]),lty=2,col="red",lwd=2)
grid = (1:n)/(n+1)
s_dx = sort(y)
qqplot(s_dx,qstd(grid,mean=param2[1],sd=param2[2],nu=param2[3]),lwd=2,
       xlab="",ylab="", main="QQ 圖")
q1 = qstd(c(0.25,0.75), mean=param2[1],sd=param2[2],nu=param2[3])
lmfit1 = lm(q1~quantile(y,c(0.25,0.75)))
abline(lmfit1,lty=2,col="red")

model5 = stdFit(tsmc.5r)
model5
#sd(tsmc.5r)
#mean(tsmc.5r)
param5 = c(0.2438, 5.0132, 3.8699)
y = tsmc.5r
plot(density(y), main="實證與理論t (k=5)", ylim=c(0,0.12),xlab="r",lwd=2)
n = length(y)
x1 = seq(min(y), max(y), length=n)
lines(x1, dstd(x1,mean=param5[1],sd=param5[2],nu=param5[3]),lty=2,lwd=2,col="red")
grid = (1:n)/(n+1)
s_dx = sort(y)
qqplot(s_dx,qstd(grid,mean=param5[1],sd=param5[2],nu=param5[3]),lwd=2,
       xlab="",ylab="", main="QQ 圖")
q1 = qstd(c(0.25,0.75), mean=param5[1],sd=param5[2],nu=param5[3])
lmfit1 = lm(q1~quantile(y,c(0.25,0.75)))
abline(lmfit1,lty=2,col="red",lwd=2)

model10 = stdFit(tsmc.10r)
model10
#sd(tsmc.10r)
#mean(tsmc.10r)
param10 = c(0.5552, 6.6779, 3.9973)
y = tsmc.10r
plot(density(y), main="實證與理論t (k=10)", ylim=c(0,0.09),xlab="r",lwd=2)
n = length(y)
x1 = seq(min(y), max(y), length=n)
lines(x1, dstd(x1,mean=param10[1],sd=param10[2],nu=param10[3]),lty=2,col="red",lwd=2)
grid = (1:n)/(n+1)
s_dx = sort(y)
qqplot(s_dx,qstd(grid,mean=param10[1],sd=param10[2],nu=param10[3]),lwd=2,
       xlab="",ylab="", main="QQ 圖")
q1 = qstd(c(0.25,0.75), mean=param10[1],sd=param10[2],nu=param10[3])
lmfit1 = lm(q1~quantile(y,c(0.25,0.75)))
abline(lmfit1,lty=2,col="red",lwd=2)

windows()
y = tsmc.r
n = length(y)
grid = (1:n)/(n+1)
param1 = c(-0.0036, 2.2249, 4.1547)
s_dx = sort(tsmc.r)
qtpo = qqplot(s_dx,qstd(grid,mean=param1[1],sd=param1[2],nu=param1[3]),
       xlab="",ylab="", main="QQ plot")
qtpo
length(s_dx)
basicStats(tsmc.r)
qtpo$x[1:10]
qtpo$y[1:10]
qtpo$x[3613:3623]
qtpo$y[3613:3623]


 

# TSMC and TWI
twi.r = 100*diff(log(T收盤價),1)
twi.2r = 100*diff(log(T收盤價),2)
twi.5r = 100*diff(log(T收盤價),5)
twi.10r = 100*diff(log(T收盤價),10)

windows()
par(mfrow=c(2,2))
y = sort(twi.r)
y1 = sort(tsmc.r)
qqplot(y, y1, xlab="TWI returns", ylab="TSMC returns", lwd=2,
       main="(a) k = 1")
lmfit = lm(quantile(y1, c(0.25, 0.75)) ~ quantile(y, c(0.25, 0.75)))   
abline(lmfit,lwd=2,lty=2,col="red")

y = sort(twi.2r)
y1 = sort(tsmc.2r)
qqplot(y, y1, xlab="TWI returns", ylab="TSMC returns", lwd=2,
       main="(b) k = 2")
lmfit = lm(quantile(y1, c(0.25, 0.75)) ~ quantile(y, c(0.25, 0.75)))   
abline(lmfit,lty=2,lwd=2,col="red")

y = sort(twi.5r)
y1 = sort(tsmc.5r)
qqplot(y, y1, xlab="TWI returns", ylab="TSMC returns", lwd=2,
       main="(c) k = 5")
lmfit = lm(quantile(y1, c(0.25, 0.75)) ~ quantile(y, c(0.25, 0.75)))   
abline(lmfit,lty=2,lwd=2,col="red")

y = sort(twi.10r)
y1 = sort(tsmc.10r)
qqplot(y, y1, xlab="TWI returns", ylab="TSMC returns",lwd=2,
       main="(d) k = 10")
lmfit = lm(quantile(y1, c(0.25, 0.75)) ~ quantile(y, c(0.25, 0.75)))   
abline(lmfit,lty=2,lwd=2,col="red")