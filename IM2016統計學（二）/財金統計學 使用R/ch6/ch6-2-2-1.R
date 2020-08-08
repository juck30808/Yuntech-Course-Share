# exchange rates 1/2/2002-7/10/2014
exch = read.table("c:\\meiyih\\Finstats\\ch6\\exch.txt", header=T)
attach(exch)
names(exch)
# 人民幣與港幣的例子
china = 人民幣
tai = 新台幣
tai_chi = tai/china
hk = 港幣
tai_hk = tai/hk
tcr = 100*(diff(log(tai_chi)))
thr = 100*(diff(log(tai_hk)))
library(fBasics)
basicStats(tai_chi)
basicStats(tcr)
basicStats(tai_hk)
basicStats(thr)
windows()
par(mfrow=c(2,1))
plot(tai_chi,type="l",xlab="time",ylab="匯率",main="人民幣對台幣匯率時間走勢",lwd=2)
plot(tai_hk,type="l",xlab="time",ylab="匯率",main="港幣對台幣匯率時間走勢",lwd=2)

i = tcr >= 0.1
pbar_tc = mean(as.numeric(i))
pbar_tc

pbar_tc+qnorm(0.05)*sqrt(pbar_tc*(1-pbar_tc)/length(tcr))
pbar_tc+qnorm(0.95)*sqrt(pbar_tc*(1-pbar_tc)/length(tcr))
z3 = (pbar_tc-0.3)/sqrt(pbar_tc*(1-pbar_tc)/length(tcr))
z3
2*pnorm(z3)

i = thr >= 0.1 
pbar_th = mean(as.numeric(thr[i]))
pbar_th

# 樣本比率的抽樣分配
windows()
par(mfrow=c(2,2))
n = 300
T = 10000
t = numeric(T)
three = c(1,2,3)
for(i in 1:T)
{
x = sample(three,n,replace=T)
index = x == 3
pbar = mean(as.numeric(index))
t[i] = (pbar-(1/3))/sqrt(pbar*(1-pbar)/n)
}
plot(density(t),type="l", xlab=expression(bar(p)),main=expression(paste("(a) "
     ,bar(p)," 的抽樣分配")),lwd=2)  
p1 = seq(-4,4,length=1000)
lines(p1,dnorm(p1),lty=2,col="red",lwd=2)

n = length(tcr)
T = 10000
t = numeric(T)
for(i in 1:T)
{
x = sample(three,n,replace=T)
index = x == 3
pbar = mean(as.numeric(index))
t[i] = (pbar-(1/3))/sqrt(pbar*(1-pbar)/n)
}
plot(density(t),type="l",axes=T,frame.plot=T,xlab=expression(bar(p)), ylim=c(-0.1,0.4),lwd=2,
     main=expression(paste("(b) ",H[0]:p," = 0.3")))
p1 = seq(-4,4,length=1000)
lines(p1,dnorm(p1),lty=2,col="red",lwd=2)
a = qnorm(0.05)
b = qnorm(0.95)
index = p1 <= a
polygon(c(-4,p1[index],a),c(0,dnorm(p1[index]),0),col="grey")
index = p1 >= b
polygon(c(b,p1[index],4),c(0,dnorm(p1[index]),0),col="grey")
points(a,0,pch=20)
text(a,0,labels=expression(-z[alpha/2]),pos=1,cex=1.5)
points(b,0,pch=20)
text(b,0,labels=expression(z[alpha/2]),pos=1,cex=1.5)
segments(z3,0,z3,0.3)

n = length(tcr)
T = 10000
three = c(1,2,3)
t = numeric(T)
for(i in 1:T)
{
x = sample(three,n,replace=T)
index = x == 3
pbar = mean(as.numeric(index))
t[i] = (pbar-(1/3))/sqrt(pbar*(1-pbar)/n)
}
plot(density(t),type="l",axes=T,frame.plot=T,xlab=expression(bar(p)), ylim=c(-0.1,0.4),lwd=2,
     main=expression(paste("(c) ",H[0]:p >= 0.3)))
p1 = seq(-4,4,length=1000)
lines(p1,dnorm(p1),lty=2,col="red",lwd=2)
a = qnorm(0.1)
index = p1 <= a
polygon(c(-4,p1[index],a),c(0,dnorm(p1[index]),0),col="grey")
points(a,0,pch=20)
text(a,0,labels=expression(-z[alpha]),pos=1,cex=1.5)
segments(z3,0,z3,0.3)

n = length(tcr)
T = 10000
pbar = numeric(T)
for(i in 1:T)
{
x = sample(three,n,replace=T)
index = x == 3
pbar[i] = mean(as.numeric(index))
}
spbar = (pbar-mean(pbar))/sd(pbar)
plot(density(spbar),type="l",axes=T,frame.plot=T,xlab=expression(bar(p)), ylim=c(-0.1,0.4),
     main=expression(paste("(d) ",H[0]:p <= 0.25)),lwd=2)
p1 = seq(-4,4,length=1000)
lines(p1,dnorm(p1),lty=2,col="red",lwd=2)
a = qnorm(0.90)
index = p1 >= a
polygon(c(a,p1[index],4),c(0,dnorm(p1[index]),0),col="grey")
points(a,0,pch=20)
text(a,0,labels=expression(z[alpha]),pos=1,cex=1.5)
z4 = (pbar_tc-0.25)/sqrt(pbar_tc*(1-pbar_tc)/length(tcr))
segments(z4,0,z4,0.3)
1-pnorm(z4)
