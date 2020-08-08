# ch 6
# Daily TSMC and TWI
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch6\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))
twi = read.table("c:\\meiyih\\Finstats\\ch6\\TWI.txt", header=T)
attach(twi)
names(twi)
# exchange rates 1/2/2002-7/10/2014
exch = read.table("c:\\meiyih\\Finstats\\ch6\\exch.txt", header=T)
attach(exch)
names(exch)

# chi-square distribution
windows()
par(mfrow=c(2,1))
T = 10000
n = 10
sigma = 2
chi = numeric(T)
for(i in 1:T)
{
x = rnorm(n,0,sigma) # sigma = 2, mu=0
s2 = var(x)
chi[i] = (n-1)*s2/sigma^2
}
plot(density(chi),type="l",xlab="卡方值",main="自由度為9之卡方分配",lwd=2,cex=1.5)
abline(h=0,lwd=2)
x1 = sort(chi)
lines(x1,dchisq(x1,(n-1)),lty=2,col="blue",lwd=2)
legend("topright",c("估計密度","卡方分配"),col=c("black","blue"),lty=1:2,lwd=2,
        bty="n")
 
T = 10000
n = 100
sigma = 2
chi = numeric(T)
for(i in 1:T)
{
x = rnorm(n,0,sigma) # sigma = 2, mu=0
s2 = var(x)
chi[i] = (n-1)*s2/sigma^2
}
plot(density(chi),type="l",xlab="卡方值",main="自由度為99之卡方分配",axes=T, cex=1.5,
   frame.plot=T,ylim=c(-0.01,0.03),lwd=2)
abline(h=0,lwd=2)
x1 = sort(chi)
lines(x1,dchisq(x1,(n-1)),lty=2,col="red",lwd=2)
a = qchisq(0.025,(n-1))
b = qchisq(0.975,(n-1))
i = x1 <= a
polygon(c(55,x1[i],a),c(0,dchisq(x1[i],(n-1)),0),col="green")
i = x1 >= b
polygon(c(b,x1[i],160),c(0,dchisq(x1[i],(n-1)),0),col="green")
points(a,0,pch=20)
text(a,0,labels=expression(chi[(1-alpha/2)(n-1)]^2),pos=1,cex=1.5)   
points(b,0,pch=20)
text(b,0,labels=expression(chi[(alpha/2)(n-1)]^2),pos=1,cex=1.5)   
legend("topright",c("估計密度","卡方分配"),col=c("black","red"),lty=1:2,bty="n",lwd=2)
lines(x1,dchisq(x1,(n-1)),lty=2,col="red")
text(100,0.01,labels=expression(1-alpha),pos=2,cex=1.5)



# try again, VR ratio test
p = 收盤價 # TSMC
lp = log(p)
n = length(lp)
n
lp = lp[512:n] # 12/26/2001-7/10/2014
n = length(lp)
n
q = 2 # 再改為3,4,5,6
p = lp
chat = (p[n]-p[1])/(n-1)
sigma1 = 0
for(i in 2:n)
{
sigma = (p[i]-p[i-1]-chat)^2
sigma1 = sigma1+sigma
}
sigma12 = sigma1/((n-1)-1)
sigma3 = 0
for(i in q:(n-1))
{
sigma = (p[(i+1)]-p[((i+1)-q)]-q*chat)^2
sigma3 = sigma3+sigma
}
m = q*((n-1)-q+1)*(1-(q/(n-1)))
sigma32 = sigma3/m
h = 2*((2*q)-1)*(q-1)/(3*q)
VR = sqrt((n-1))*((sigma12/sigma32)-1)/sqrt(h)
VR

tsmc.r = diff(lp)*100
library(fBasics)
basicStats(tsmc.r)
set.seed(1234)
n = 100
r = sample(tsmc.r,n,replace=T)
s2 = var(r)
s2
qchisq(0.025,(n-1))
qchisq(0.975,(n-1))
(n-1)*s2/qchisq(0.975,(n-1))
(n-1)*s2/qchisq(0.025,(n-1))
sqrt((n-1)*s2/qchisq(0.975,(n-1)))
sqrt((n-1)*s2/qchisq(0.025,(n-1)))


windows()
par(mfrow=c(3,1))
n = 100
sigma2 = 4
x = seq(50,180,length=1000)
plot(x,dchisq(x,(n-1)),type="l", axes=T,frame.plot=T,xlab="",ylab="", lwd=2,
     ylim=c(-0.015,0.035),main=expression(paste("(a) ", H[0], " : ", sigma^2,
      " = 4")))
abline(h=0,lwd=2)
chis = (n-1)*s2/sigma2
chis
2*pchisq(chis,(n-1))
i = x <= chis
polygon(c(50,x[i],chis),c(0,dchisq(x[i],(n-1)),0), col="tomato")
points(chis,0,pch=20)
text(chis,0,labels=expression(chi[1]^2),pos=1,cex=1.5)
segments(qchisq(0.025,(n-1)),0,qchisq(0.025,(n-1)),0.03)
text(qchisq(0.025,(n-1)),0.03,labels="拒絕區",pos=2,cex=1.5)

plot(x,dchisq(x,(n-1)),type="l", axes=T,frame.plot=T,xlab="",ylab="",lwd=2,
     ylim=c(-0.015,0.035),main=expression(paste("(b) ", H[0], " : ", sigma^2
     >= 4)))     
abline(h=0,lwd=2)
segments(qchisq(0.05,(n-1)),0,qchisq(0.05,(n-1)),0.03)
text(chis,0.03,labels="拒絕區",pos=2,cex=1.5)
points(chis,0,pch=20)
text(chis,0,labels=expression(chi[1]^2),pos=1,cex=1.5)
i = x <= chis
polygon(c(50,x[i],chis),c(0,dchisq(x[i],(n-1)),0), col="tomato")
pchisq(chis,(n-1))

sigma2 = 2.5
chis = (n-1)*s2/sigma2
plot(x,dchisq(x,(n-1)),type="l", axes=T,frame.plot=T,xlab="",ylab="",lwd=2,
     ylim=c(-0.015,0.035),main=expression(paste("(c) ", H[0], " : ", sigma^2
     <= 2.5)))     
abline(h=0,lwd=2)
segments(qchisq(0.95,(n-1)),0,qchisq(0.95,(n-1)),0.03)
text(chis,0.03,labels="拒絕區",pos=2,cex=1.5)
points(chis,0,pch=20)
text(chis,0,labels=expression(chi[1]^2),pos=1,cex=1.5)
i = x >= chis
polygon(c(chis,x[i],160),c(0,dchisq(x[i],(n-1)),0), col="tomato")
segments(qchisq(0.95,(n-1)),0,qchisq(0.95,(n-1)),0.03)

1-pchisq(chis,(n-1))
