# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\finstats\\ch4\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)

# type I error
windows()
par(mfrow=c(2,1))
plot(c(-4,4),c(-0.5,0.6),type="n", axes=F, frame.plot=F,xlab="",ylab="")
x = seq(-4,4,length=1000)
lines(x,dnorm(x),type="l",lwd=2)
abline(h=0)
segments(0,0,0,0.6,lty=2)
points(0,0,pch=20)
text(0,0,labels=expression(paste(mu," = 0.02")),pos=1,cex=1.5)
i = x >= 0
polygon(c(0,x[i],4),c(0,dnorm(x[i]),0), density=c(10,30), angle=c(-60,60),
        col="tomato") 
arrows(0,0.5,0.5,0.5)
text(0.5,0.5,labels="拒絕區",pos=4,cex=1.5)
arrows(0,0.45,-0.5,0.45)
text(-0.5,0.45,labels="接受區",pos=2,cex=1.5)
text(1,0.03,labels=expression(alpha),pos=3,cex=1.5)
lines(x,dnorm(x),type="l")
abline(h=0)
segments(0,0,0,0.6,lty=2)
text(4,0,labels=expression(bar(x)),pos=1,cex=1.5)

plot(c(-4,4),c(-0.5,0.6),type="n", axes=F, frame.plot=F,xlab="",ylab="")
x = seq(-4,4,length=1000)
lines(x,dnorm(x),type="l",lwd=2)
abline(h=0)
segments(0,0,0,0.6,lty=2)
points(0,0,pch=20)
text(0,0,labels=expression(paste(mu," = 0.02")),pos=1,cex=1.5)
i = x >= qnorm(0.95)
polygon(c(qnorm(0.95),x[i],4),c(0,dnorm(x[i]),0),
        col="tomato") 
segments(qnorm(0.95),0,qnorm(0.95),0.6)        
arrows(qnorm(0.95),0.5,(qnorm(0.95)+0.5),0.5)
text((qnorm(0.95)+0.5),0.5,labels="拒絕區",pos=4,cex=1.5)
arrows(qnorm(0.95),0.45,(qnorm(0.95)-0.5),0.45)
text((qnorm(0.95)-0.5),0.45,labels="接受區",pos=2,cex=1.5)
text(4,0,labels=expression(bar(x)),pos=1,cex=1.5)
text(1.8,0,labels=expression(alpha),pos=3,cex=1.5)
text(qnorm(0.95),0,labels=expression(mu+z[alpha]*sigma[bar(x)]),pos=1,cex=1.5)

# p_value
windows()
par(mfrow=c(2,1))
plot(c(-4,4),c(-0.5,0.6),type="n", axes=F, frame.plot=F,xlab="",ylab="")
x = seq(-4,4,length=1000)
lines(x,dnorm(x),type="l",lwd=2)
abline(h=0)
segments(0,0,0,0.6,lty=2)
points(0,0,pch=20)
text(0,0,labels=expression(paste(mu," = 0.02")),pos=1,cex=1.5)
i = x >= 1.645
polygon(c(1.645,x[i],4),c(0,dnorm(x[i]),0),col="tomato")        
text(1.645,0,expression(bar(x)[1]),pos=1,cex=1.5)
lines(x,dnorm(x),type="l",lwd=2)
abline(h=0)
text(4,0,labels=expression(bar(x)),pos=1,cex=1.5)

plot(c(-4,4),c(-0.5,0.6),type="n", axes=F, frame.plot=F,xlab="",ylab="")
x = seq(-4,4,length=1000)
lines(x,dnorm(x),type="l",lwd=2)
abline(h=0)
segments(0,0,0,0.6,lty=2)
points(0,0,pch=20)
text(0,0,labels="0",pos=1,cex=1.5)
i = x >= qnorm(0.95)
polygon(c(qnorm(0.95),x[i],4),c(0,dnorm(x[i]),0),col="tomato")         
segments(qnorm(0.95),0,qnorm(0.95),0.6)        
text(4,0,labels=expression(z),pos=1,cex=1.5)
text(1.645,0,expression(bar(z)[1]),pos=1,cex=1.5)

# 雙尾檢定
windows()
par(mfrow=c(2,1))
plot(c(-4,4),c(-0.5,0.6),type="n", axes=F, frame.plot=F,xlab="",ylab="")
x = seq(-4,4,length=1000)
lines(x,dnorm(x),type="l",lwd=2)
abline(h=0)
segments(0,0,0,0.4,lty=2)
points(0,0,pch=20)
text(0,0,labels=expression(paste(mu," = 0.02")),pos=1,cex=1.5)
i = x <= -1.96  
polygon(c(-4,x[i],-1.96),c(0,dnorm(x[i]),0), col="tomato")
i = x >= 1.96  
polygon(c(1.96,x[i],-4),c(0,dnorm(x[i]),0), col="tomato")
segments(-1.96,0,-1.96,0.6)       
arrows(-1.96,0.5,-2.5,0.5)
text(-2.5,0.5,labels="拒絕區",pos=2,cex=1.5)
segments(1.96,0,1.96,0.6)       
arrows(1.96,0.5,2.5,0.5)
text(2.5,0.5,labels="拒絕區",pos=4,cex=1.5)
arrows(-1,0.55,-1.96,0.55)
arrows(1,0.55,1.96,0.55)
text(0,0.45,labels="接受區",pos=3,cex=1.5)
text(2.5,0.1,labels=expression(alpha/2),pos=3,cex=1.5)
text(-2.5,0.1,labels=expression(alpha/2),pos=3,cex=1.5)
arrows(-2.1,0.01,-2.5,0.1)
arrows(2.1,0.01,2.5,0.1)
text(4,0,labels=expression(bar(x)),pos=1,cex=1.5)
text(-1.96,0,labels=expression(mu-z[alpha/2]*sigma[bar(x)]),pos=1,cex=1.5)
text(1.96,0,labels=expression(mu+z[alpha/2]*sigma[bar(x)]),pos=1,cex=1.5)

plot(c(-4,4),c(-0.5,0.6),type="n", axes=F, frame.plot=F,xlab="",ylab="")
x = seq(-4,4,length=1000)
lines(x,dnorm(x),type="l",lwd=2)
abline(h=0)
segments(0,0,0,0.4,lty=2)
points(0,0,pch=20)
text(0,0,labels="0",pos=1,cex=1.5)
i = x <= -1.96  
polygon(c(-4,x[i],-1.96),c(0,dnorm(x[i]),0), col="tomato")
i = x >= 1.96  
polygon(c(1.96,x[i],-4),c(0,dnorm(x[i]),0), col="tomato")
segments(-1.96,0,-1.96,0.6)       
arrows(-1.96,0.5,-2.5,0.5)
text(-2.5,0.5,labels="拒絕區",pos=2,cex=1.5)
segments(1.96,0,1.96,0.6)       
arrows(1.96,0.5,2.5,0.5)
text(2.5,0.5,labels="拒絕區",pos=4,cex=1.5)
arrows(-1,0.55,-1.96,0.55)
arrows(1,0.55,1.96,0.55)
text(0,0.45,labels="接受區",pos=3,cex=1.5)
text(2.5,0.1,labels=expression(alpha/2),pos=3,cex=1.5)
text(-2.5,0.1,labels=expression(alpha/2),pos=3,cex=1.5)
arrows(-2.1,0.01,-2.5,0.1)
arrows(2.1,0.01,2.5,0.1)
text(4,0,labels="z",pos=1)
text(-1.96,0,labels=expression(-z[alpha/2]),pos=1,cex=1.5)
text(1.96,0,labels=expression(z[alpha/2]),pos=1,cex=1.5)

x = 本益比
basicStats(x)
n = length(x)
x1 = x[(n-100+1):n]
length(x1)
mean(x1)
sd(x1)
se1 = sd(x1)/sqrt(100)
# H0: mu >= 18
18-qnorm(0.05)*se1 # critical value of normal
z1 = (mean(x1)-18)/se1 # test statistic
z1
pnorm(z1) # p_value
pnorm(mean(x1),mean=18,sd= se1)# p_value

# H0:mu=15
15+qnorm(0.025)*se1 # critical value of normal
z2 = (mean(x1)-15)/se1 # test statistic
z2
2*(1-pnorm(z2)) # p_value

# 95%信賴區間估計
lower = mean(x1) - qnorm(0.025)*se1
lower
upper = mean(x1) + qnorm(0.025)*se1
upper
 
# 利用整個樣本期間的標準差
se = sd(x)/sqrt(100)

# H0: mu >= 18
z3 = (mean(x1)-18)/se # test statistic
z3
pnorm(mean(x1),18,se) # p_value

# H0: mu = 15
z4 = (mean(x1)-15)/se # test statistic
z4
2*(1-pnorm(mean(x1),15,se)) # p_value

# 95%信賴區間估計
lower = mean(x1) - qnorm(0.025)*se
lower
upper = mean(x1) + qnorm(0.025)*se
upper



