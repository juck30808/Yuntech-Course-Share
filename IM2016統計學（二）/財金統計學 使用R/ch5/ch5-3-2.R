# exchange rates 1/2/2002-7/10/2014
exch = read.table("c:\\meiyih\\Finstats\\ch5\\exch.txt", header=T)
attach(exch)
names(exch)

# sample size and power of tests
x = 新台幣
y = 人民幣
tai = x/y
windows()
par(mfrow=c(2,2))
plot(tai,type="l",xlab="時間",ylab="匯率",main="(a) 人民幣對新台幣匯率",frame.plot=F,lwd=2)
library(fBasics)
basicStats(tai)
abline(h=mean(tai),lty=2,col="red",lwd=2)
abline(h=quantile(tai,c(0.25,0.75)), lty=3, col="blue",lwd=2)
mu = mean(tai)
n = 100
sigma = 2/sqrt(n)
x = seq(3.5,5.5, length=1000)
plot(x,dnorm(x,mu,sigma), type="l",axes=F,frame.plot=F, ylim=c(-1,2),ylab="", lwd=2,
     xlab="",main="(b) 型2誤差")
lower = mu+qnorm(0.025)*sigma 
upper = mu+qnorm(0.975)*sigma 
segments(lower,0,lower,2,lty=2)
segments(upper,0,upper,2,lty=2)
abline(h=0)
points(mu,0,pch=20)
text(4.43,0,labels=expression(paste(mu," = 4.43")),pos=1,cex=1.5)
mu1 = quantile(tai,0.25)
mu2 = quantile(tai,0.75)
lines(x,dnorm(x,mu1,sigma),type="l",col="steelblue",lwd=2)
lines(x,dnorm(x,mu2,sigma),type="l",col="tomato",lwd=2)
text(lower,0,labels=expression(mu-z[alpha/2]*sigma/sqrt(n)),pos=1,cex=1.5)
text(upper,0,labels=expression(mu+z[alpha/2]*sigma/sqrt(n)),pos=1,cex=1.5)
i = x >= lower  
polygon(c(lower,x[i],upper),c(0,dnorm(x[i],mu1,sigma),0), density=c(10,30),
    angle=c(-60,60), col="steelblue")
i = x <= upper
polygon(c(lower,x[i],upper),c(0,dnorm(x[i],mu2,sigma),0), density=c(10,30),
    angle=c(-60,60), col="tomato")
text(5.5,0,labels=expression(bar(x)),pos=1,cex=1.5)
arrows(lower,2,upper,2,code=3)

# power curve
#windows()
#par(mfrow=c(2,1))
type2a = pnorm(upper,x,sigma)-pnorm(lower,x,sigma)
powera = 1-type2a
type2b = 1-pnorm(lower,x,sigma)
powerb = 1-type2b
power = c(powera,powerb)
power = power[1:1000]
plot(x,power,type="l",axes=F,frame.plot=F,main="(c) 雙尾檢定之效力曲線",xlab="", lwd=2,
   ylim=c(-0.5,1),ylab=expression(paste("拒絕",H[0],"的機率")))   
abline(h=0)
text(5.5,0,labels=expression(mu),pos=1,cex=1.5)
points(mu,0.05,pch=1)
points(mu,0,pch=20)
text(mu,0,labels="4.43",pos=1,cex=1.5)

i = x >= mu
x1 = x[i] 
upper1 = mu+qnorm(0.95)*sigma
type2 = pnorm(upper1,x1,sigma)
power = 1-type2
plot(x1,power,type="l",axes=F,frame.plot=F,main="(d) 右尾檢定之效力曲線",xlab="", lwd=2,
   ylim=c(-0.5,1),ylab=expression(paste("拒絕",H[0],"的機率")))   
abline(h=0)
points(mu,0.05,pch=1)
text(5.5,0,labels=expression(mu),pos=1,cex=1.5)
points(mu,0,pch=20)
text(mu,0,labels="4.43",pos=1,cex=1.5)

# type 2 error if mu=mu2 or mu1
pnorm(upper,mu2,sigma)
1-pnorm(lower,mu1,sigma)


# size effect
windows()
n = 50
delta = seq(-1,1,length=1000)
alpha = 0.05
k1 = sqrt(n)*delta-qnorm((1-(alpha/2)))
k2 = sqrt(n)*delta+qnorm((1-(alpha/2)))
power = pnorm(k1) + (1-pnorm(k2))
plot(delta,power,type="l",xlab=expression(delta),main="不同樣本數下之效力曲線", lwd=3)
n = 100
delta = seq(-1,1,length=1000)
alpha = 0.05
k1 = sqrt(n)*delta-qnorm((1-(alpha/2)))
k2 = sqrt(n)*delta+qnorm((1-(alpha/2)))
power = pnorm(k1) + (1-pnorm(k2))
lines(delta,power,lty=2,col="tomato", lwd=3)
n = 200
delta = seq(-1,1,length=1000)
alpha = 0.05
k1 = sqrt(n)*delta-qnorm((1-(alpha/2)))
k2 = sqrt(n)*delta+qnorm((1-(alpha/2)))
power = pnorm(k1) + (1-pnorm(k2))
lines(delta,power,lty=3,col="steelblue", lwd=3)
legend("bottomright",c("n = 50","n = 100","n = 200"), col=c("black","tomato", lwd=3,
     "steelblue"),lty=1:3,bty="n")
abline(v=0.25,lty=2, lwd=2)
abline(h=0.95,lty=2, lwd=2)
