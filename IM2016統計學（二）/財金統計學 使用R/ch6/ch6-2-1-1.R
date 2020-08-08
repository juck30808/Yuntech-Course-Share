# Daily TSMC and TWI
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch6\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
# 二個樣本平均數差異的抽樣分配
tsmcx = 本益比
library(fBasics)
basicStats(tsmcx)
windows()
par(mfrow=c(2,1))
plot(tsmcx,type="l",xlab="time",ylab="本益比",main="TSMC日本益比走勢圖",lwd=2)
abline(v=1200,lty=2,col="red",lwd=2)
xa = tsmcx[1:1200]
xb = tsmcx[1201:length(tsmcx)]
basicStats(xa)
basicStats(xb)
m = 500
T = 10000
corr = numeric(T)
for(i in 1:T)
{
x1 = sample(xa,m,replace=T)
x2 = sample(xb,m,replace=T)
corr[i] = cor(x1,x2)
}
plot(corr,type="l",xlab="",ylab="樣本相關係數",main="二個結構之間估計的相關係數")
basicStats(corr)

xa = tsmcx[1:1200]
xb = tsmcx[1201:length(tsmcx)]
set.seed(1234)
x2 = sample(xb,m,replace=T)
set.seed(12)
x1 = sample(xa,m,replace=T)
cor(x1,x2)
mean(x1)
mean(x2)
mean(x1)-mean(x2)
sigma12 = sqrt((var(x1)/m)+(var(x2)/m))
sigma12
mean(x1)-mean(x2)+qnorm(0.025)*sigma12
mean(x1)-mean(x2)+qnorm(0.975)*sigma12
z1 = (mean(x1)-mean(x2)-25)/sigma12
z1
# p-value
2*(1-pnorm(z1))

windows()
par(mfrow=c(2,2))
T = 10000
twobar = numeric(T)
n = 30
for(i in 1:T)
{
x = runif(n)
y = runif(n)
twobar[i] = mean(x)-mean(y)
}
z = (twobar-mean(twobar))/sd(twobar)
plot(density(z),type="l",xlab="",ylab="",main=expression(paste("(a) ", 
     bar(x)[1]-bar(x)[2]," 的抽樣分配")),lwd=2,)
x1 = sort(z)
lines(x1,dnorm(x1),lty=2,col="red",lwd=2)
abline(h=0)

twobar = numeric(T)
n = 500
for(i in 1:T)
{
x = runif(n)
y = runif(n)
twobar[i] = mean(x)-mean(y)
}
z = (twobar-mean(twobar))/sd(twobar)
plot(density(z),type="l",xlab="",ylab="",axes=F,frame.plot=T,ylim=c(-0.1,0.4),
    main=expression(paste("(b) ",mu[1]-mu[2]," = 25")),lwd=2)   
x1 = sort(z)
lines(x1,dnorm(x1),lty=2,col="red",lwd=2)
a = qnorm(0.025)
b = qnorm(0.975)
points(a,0,pch=20)
points(b,0,pch=20)
i = x1 <= a
polygon(c(-4,x1[i],a),c(0,dnorm(x1[i]),0), col="steelblue")
i = x1 >= b
polygon(c(b,x1[i],4),c(0,dnorm(x1[i]),0), col="steelblue")
text(a,0,labels=expression(-z[alpha/2]),pos=1,cex=1.5)
text(b,0,labels=expression(z[alpha/2]),pos=1,cex=1.5)
abline(h=0)
segments(z1,0,z1,0.4)
text(z1,0,labels=expression(z[1]),pos=1,cex=1.5)

twobar = numeric(T)
n = 500
for(i in 1:T)
{
x = runif(n)
y = runif(n)
twobar[i] = mean(x)-mean(y)
}
z = (twobar-mean(twobar))/sd(twobar)
plot(density(z),type="l",xlab="",ylab="",axes=F,frame.plot=T,ylim=c(-0.1,0.4),
   main=expression(paste("(c) ",H[0]," : ",mu[1]-mu[2]<= 25)),lwd=2)   
x1 = sort(z)
lines(x1,dnorm(x1),lty=2,col="red",lwd=2)
a = qnorm(0.95)
points(a,0,pch=20)
i = x1 >= a
text(a,0,labels=expression(-z[alpha]),pos=1,cex=1.5)
polygon(c(a,x1[i],4),c(0,dnorm(x1[i]),0),col="steelblue")
segments(z1,0,z1,0.4)
text(z1,0,labels=expression(z[1]),pos=1,cex=1.5)
abline(h=0)

twobar = numeric(T)
n = 500
for(i in 1:T)
{
x = runif(n)
y = runif(n)
twobar[i] = mean(x)-mean(y)
}
z = (twobar-mean(twobar))/sd(twobar)
plot(density(z),type="l",xlab="",ylab="",axes=F,frame.plot=T,ylim=c(-0.1,0.4),
   main=expression(paste("(d) ",H[0]," : ",mu[1]-mu[2]>= 30)),lwd=2)   
x1 = sort(z)
lines(x1,dnorm(x1),lty=2,col="red",lwd=2)
a = qnorm(0.1)
points(a,0,pch=20)
i = x1 <= a
text(a,0,labels=expression(-z[alpha]),pos=1,cex=1.5)
polygon(c(-4,x1[i],a),c(0,dnorm(x1[i]),0),col="steelblue")
z2 = (mean(xa)-mean(xb)-30)/sigma12
z2
segments(z2,0,z2,0.4)
text(z2,0,labels=expression(z[2]),pos=1,cex=1.5)
abline(h=0)
