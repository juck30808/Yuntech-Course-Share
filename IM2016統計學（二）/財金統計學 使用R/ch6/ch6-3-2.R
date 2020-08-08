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

# ANOVA
windows()
par(mfrow=c(2,1))
x = seq(-3,3,length=1000)
plot(x,dnorm(x),type="l",axes=F,frame.plot=F,ylim=c(-0.1,0.4),xlim=c(-4,4),
     ylab="",lwd=2,xlab="")
x2 = x+1
x1 = x-1
lines(x2,dnorm(x2,1),type="l",col="blue",lwd=2)
lines(x1,dnorm(x1,-1),type="l",col="blue",lwd=2)
abline(h=0,lwd=2)
segments(0,0,0,dnorm(0))
segments(-1,0,-1,dnorm(-1,-1))
segments(1,0,1,dnorm(1,1))
text(0,0,labels=expression(mu[1]),pos=1,cex=1.5)
text(-1,0,labels=expression(mu[2]),pos=1,cex=1.5)
text(1,0,labels=expression(mu[3]),pos=1,cex=1.5)
text(4,0,labels=expression(bar(x)),pos=1,cex=1.5)
points(-3.5,0,pch=20)
points(3.5,0,pch=20)
points(0.5,0,pch=20)
text(-3.5,0,labels=expression(bar(x)[2]),pos=1,cex=1.5)
text(3.5,0,labels=expression(bar(x)[3]),pos=1,cex=1.5)
text(0.5,0,labels=expression(bar(x)[1]),pos=1,cex=1.5)

plot(x,dnorm(x),type="l",axes=F,frame.plot=F,ylim=c(-0.1,0.4),xlim=c(-4,4),
     ylab="",lwd=2,xlab="")
abline(h=0,lwd=2)
points(-1.5,0,pch=20)
points(1.5,0,pch=20)
points(0.5,0,pch=20)
text(-1.5,0,labels=expression(bar(x)[2]),pos=1,cex=1.5)
text(1.5,0,labels=expression(bar(x)[3]),pos=1,cex=1.5)
text(0.5,0,labels=expression(bar(x)[1]),pos=1,cex=1.5)
segments(0,0,0,dnorm(0))
points(0,0,pch=20)
#arrows(0,-0.2,0,0)
text(0,0,labels=expression(paste(mu[1]," = ",mu[2]," = ",mu[3])),pos=1,cex=1.5)
text(4,0,labels=expression(bar(x)),pos=1,cex=1.5)

x1 = 新台幣
x2 = 日圓
x3 = 港幣
x4 = 人民幣
x5 = 歐元
x6 = 澳幣
x1r = 100*diff(log(x1))
x2r = 100*diff(log(x2))
x3r = 100*diff(log(x3))
x4r = 100*diff(log(x4))
x5r = 100*diff(log(x5))
x6r = 100*diff(log(x6))
mean(x1r)
mean(x2r)
mean(x3r)
mean(x4r)
mean(x5r)
mean(x6r)

T = 10000
n = 100
m1 = numeric(T)
m2 = numeric(T)
m3 = numeric(T)
m4 = numeric(T)
m5 = numeric(T)
m6 = numeric(T)
for(i in 1:T)
{
m1[i] = mean(sample(x1r,n,replace=T))
m2[i] = mean(sample(x2r,n,replace=T))
m3[i] = mean(sample(x3r,n,replace=T))
m4[i] = mean(sample(x4r,n,replace=T))
m5[i] = mean(sample(x5r,n,replace=T))
m6[i] = mean(sample(x6r,n,replace=T))
}
windows()
plot(density(m1),type="l",xlim=c(-0.2,0.2),ylim=c(0,150),lwd=2,xlab="")
lines(density(m2),lty=2,col="2",lwd=2)
lines(density(m3),lty=3,col="3",lwd=2)
lines(density(m4),lty=4,col="4",lwd=2)
lines(density(m5),lty=5,col="5",lwd=2)
lines(density(m6),lty=6,col="6",lwd=2)
legend("topright",c("新台幣","日圓","港幣","人民幣","歐元","澳幣"),lty=1:6,
    col=c("1","2","3","4","5","6"),bty="n",lwd=2)

T = 10000
n = 100
m1 = numeric(T)
m5 = numeric(T)
m6 = numeric(T)
set.seed(123)
for(i in 1:T)
{
m1[i] = mean(sample(x1r,n,replace=T))
m5[i] = mean(sample(x5r,n,replace=T))
m6[i] = mean(sample(x6r,n,replace=T))
}
windows()
plot(density(m2),type="l",xlim=c(-0.2,0.2),ylim=c(0,7),xlab="",lwd=2)
#lines(density(m2),lty=2,col="2",lwd=2)
#lines(density(m3),lty=3,col="3",lwd=2)
#lines(density(m4),lty=4,col="4",lwd=2)
lines(density(m5),lty=5,col="5",lwd=2)
lines(density(m6),lty=6,col="6",lwd=2)
legend("topright",c("日圓","歐元","澳幣"),lty=c(1,5,6),col=c("1","5","6"),lwd=2,
     bty="n")
mean(m2)
s1 = var(m2)
mean(m5)
s2 = var(m5)
mean(m6)
s3 = var(m6)  

p = 收盤價
tsmc.r = 100*diff(log(p))
basicStats(tsmc.r)
r = tsmc.r[24:length(tsmc.r)] #2/11/2000-7/10/2014
r1 = r[1:900]
r2 = r[901:1800]
r3 = r[1801:2700]
r4 = r[2701:3600]

cor(r1,r2)
cor(r1,r3)
cor(r1,r4)
cor(r2,r3)
cor(r2,r4)
cor(r3,r4)
library(fBasics)
basicStats(r1)
basicStats(r2)
basicStats(r3)
basicStats(r4)

T = 10000
n = 200
mr1 = numeric(T)
mr2 = numeric(T)
mr3 = numeric(T)
mr4 = numeric(T)
set.seed(234)
for(i in 1:T)
{
mr1[i] = mean(sample(r1,n,replace=T))
mr2[i] = mean(sample(r2,n,replace=T))
mr3[i] = mean(sample(r3,n,replace=T))
mr4[i] = mean(sample(r4,n,replace=T))
}
windows()
plot(density(mr1),type="l",ylim=c(0,4),xlab="",main="估計密度機率函數",lwd=2)
lines(density(mr2),lty=2,col="2",lwd=2)
lines(density(mr3),lty=3,col="3",lwd=2)
lines(density(mr4),lty=4,col="4",lwd=2)
legend("topleft",c("1期","2期","3期","4期"),lty=1:4,col=c("1","2","3","4"),
       lwd=2, bty="n")
var(mr1)
var(mr2)
var(mr3)
var(mr4)
set.seed(123)
mr1 = sample(mr1,n,replace=T)
set.seed(123)
mr2 = sample(mr2,n,replace=T)
set.seed(123)
mr3 = sample(mr3,n,replace=T)
set.seed(123)
mr4 = sample(mr4,n,replace=T)
s12 = var(mr1)
s22 = var(mr2)
s32 = var(mr3)
s42 = var(mr4)
sp2 = (n-1)*(s12+s22+s32+s42)/(4*n-4)
MSE = sp2
x2bar = (mean(mr1)+mean(mr2)+mean(mr3)+mean(mr4))/4
MSTR = (((mean(mr1)-x2bar)^2) + ((mean(mr2)-x2bar)^2) + ((mean(mr2)-x2bar)^2) +
       ((mean(mr1)-x2bar)^2))/4
MSTR = MSTR*n
fstat = MSTR/MSE
fstat
k1 = (4*n)-4
k2 = 4-1
qf(0.95,k1,k2)
1-pf(fstat,k1,k2)

mean(mr1)-mean(mr2)+qnorm(0.25)*sqrt(MSE)*sqrt(2/n)
mean(mr1)-mean(mr2)+qnorm(0.975)*sqrt(MSE)*sqrt(2/n)

mean(mr1)-mean(mr3)+qnorm(0.25)*sqrt(MSE)*sqrt(2/n)
mean(mr1)-mean(mr3)+qnorm(0.975)*sqrt(MSE)*sqrt(2/n)

mean(mr1)-mean(mr4)+qnorm(0.25)*sqrt(MSE)*sqrt(2/n)
mean(mr1)-mean(mr4)+qnorm(0.975)*sqrt(MSE)*sqrt(2/n)

mean(mr2)-mean(mr3)+qnorm(0.25)*sqrt(MSE)*sqrt(2/n)
mean(mr2)-mean(mr3)+qnorm(0.975)*sqrt(MSE)*sqrt(2/n)

mean(mr2)-mean(mr4)+qnorm(0.25)*sqrt(MSE)*sqrt(2/n)
mean(mr2)-mean(mr4)+qnorm(0.975)*sqrt(MSE)*sqrt(2/n)

mean(mr3)-mean(mr4)+qnorm(0.25)*sqrt(MSE)*sqrt(2/n)
mean(mr3)-mean(mr4)+qnorm(0.975)*sqrt(MSE)*sqrt(2/n)


SSE = MSE*(4*n-4)
SSTR = MSTR*(4-1)
all = c(mr1,mr2,mr3,mr4)
SST = var(all)*(length(all)-1)
SSE
SSTR
SST
mean(all)
x2bar
sum((all-x2bar)^2)
