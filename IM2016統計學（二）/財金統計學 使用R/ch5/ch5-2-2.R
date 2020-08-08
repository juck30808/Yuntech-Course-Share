# exchange rates 1/2/2002-7/10/2014
exch = read.table("c:\\meiyih\\Finstats\\ch5\\exch.txt", header=T)
attach(exch)
names(exch)
tai.r = 100*diff(log(新台幣))
# 區間估計
windows()
plot(c(-5,4),c(-0.5,0.6),type="n", axes=F, frame.plot=T,xlab="",ylab="")
x = seq(-4,4,length=1000)
lines(x,dnorm(x),type="l",lwd=3)
abline(h=0)
points(0,0,pch=20)
a = qnorm(0.025)
b = qnorm(0.975)
points(a,0,pch=20)
points(b,0,pch=20)
i = x >= a & x <= b
polygon(c(a,x[i],b),c(0,dnorm(x[i]),0), density=c(10,30), angle=c(-60,60),
        col="tomato") 
lines(x,dnorm(x),type="l",lwd=3)
text(0,0,labels=expression(mu),pos=1,cex=1.5)
text(a,0,labels=expression(mu-z[alpha/2]*sigma[bar(x)]),pos=1,cex=1.5)
text(b,0,labels=expression(mu+z[alpha/2]*sigma[bar(x)]),pos=1,cex=1.5)
text(0,0.25,labels=expression(1-alpha),pos=1,cex=1.5)
segments(1,-0.2,1,0.4,lty=2)
segments((1-b),-0.2,(1+b),-0.2)
segments((1-b),-0.2,(1-b),-0.19)
segments((1+b),-0.2,(1+b),-0.19)
text(1,-0.2,labels=expression(bar(x)[1]),pos=1,cex=1.5)
text((1-b),-0.2,labels=expression(bar(x)[1]-z[alpha/2]*sigma[bar(x)]),pos=1,cex=1.5)
text((1+b),-0.2,labels=expression(bar(x)[1]+z[alpha/2]*sigma[bar(x)]),pos=1,cex=1.5)
segments(-2.1,-0.4,-2.1,0.4,lty=2,col="blue")
segments((-2.1-b),-0.4,(-2.1+b),-0.4, col="blue")
segments((-2.1-b),-0.4,(-2.1-b),-0.39,col="blue")
segments((-2.1+b),-0.4,(-2.1+b),-0.39, col="blue")
text(-2.1,-0.4,labels=expression(bar(x)[2]),pos=1,cex=1.5)
text((-2.1-b),-0.4,labels=expression(bar(x)[2]-z[alpha/2]*sigma[bar(x)]),pos=1,cex=1.5)
text((-2.1+b),-0.4,labels=expression(bar(x)[2]+z[alpha/2]*sigma[bar(x)]),pos=1,cex=1.5)
text(4,0,labels=expression(bar(x)),pos=1,cex=1.5)
library(fBasics)
basicStats(tai.r)
x = tai.r
n = 3135
lower1 = mean(x)+qnorm(0.05)*sd(x)/sqrt(n)
lower1
upper1 = mean(x)+qnorm(0.95)*sd(x)/sqrt(n)
upper1
lower2 = mean(x)+qnorm(0.025)*sd(x)/sqrt(n)
lower2
upper2 = mean(x)+qnorm(0.975)*sd(x)/sqrt(n)
upper2
lower3 = mean(x)+qnorm(0.005)*sd(x)/sqrt(n)
lower3
upper3 = mean(x)+qnorm(0.995)*sd(x)/sqrt(n)
upper3
