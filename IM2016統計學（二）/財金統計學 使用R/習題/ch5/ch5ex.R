# ch 5
# 1-1
# ex3
# exchange rates 1/2/2002-7/10/2014
exch = read.table("c:\\meiyih\\Finstats\\ch5\\exch.txt", header=T)
attach(exch)
names(exch)
x = 人民幣
xr = 100*diff(log(x))
tail(xr)
xr1 = round(tail(xr),2)
xr1
p1 = mean(as.numeric(xr > 0))
p1
p2 = mean(as.numeric(xr <= -0.03))
p2

n = 1000
set.seed(1234)
x = sample(xr,n,replace=T)
pbar1 = mean(as.numeric(x > 0))
pbar1
pbar2 = mean(as.numeric(x <= -0.03))
pbar2
N = 10000
pbar1 = numeric(N)
pbar2 = numeric(N)
for(i in 1:N)
{
 x = sample(xr,n,replace=T)
 pbar1[i] = mean(as.numeric(x > 0))
 pbar2[i] = mean(as.numeric(x <= -0.03))
}
windows()
par(mfrow=c(2,1))
plot(density(pbar1),xlab=expression(bar(p)[1]),main="日對數報酬率大於0抽樣分配",lwd=2)
points(p1,0,lwd=3,pch=18)
text(p1,0,labels=expression(p[1]),pos=3,cex=1.5)
mean(pbar1)-p1
plot(density(pbar2),xlab=expression(bar(p)[2]),main="日對數報酬率小於等於-0.03%抽樣分配",lwd=3)
mean(pbar2)-p2
points(p2,0,lwd=2,pch=18)
text(p2,0,labels=expression(p[2]),pos=3,cex=1.5)


# ex6
set.seed(12345)
N = 100
# x = rnorm(N,0,2)
x = runif(N,0,4) # 介於0與4之間的均等分配
mu = mean(x)
sigma = sd(x)
T = 10000
n = 50
xbar = numeric(T)
for(i in 1:T)
{
 x1 = sample(x,n,replace=F)
 xbar[i] = mean(x1)
}
windows()
plot(density(xbar),xlab=expression(bar(x)),main="樣本平均數的抽樣分配 (抽出不放回)",lwd=3)
x2 = sort(xbar)
lines(x2,dnorm(x2,mu,sigma/sqrt(n)),lty=2,col="red",lwd=3)
# 校正後
corrected = sqrt((N-n)/(N-1))*sigma/sqrt(n)
lines(x2,dnorm(x2,mu,corrected),lty=30,col="blue",lwd=3)
legend("topleft",c("實際","無調整","調整"),lty=c(1,2,30),col=c("black","red","blue"),lwd=3,bty="n")

# 1-2
# ex1
mu = round(mean(xr),4) # xr是日對數報酬率序列
sigma = round(sd(xr),4)
n = 100
sxbar = sigma/sqrt(n)
1-pnorm(-0.0248,mu,sxbar)
z = (-0.0248-mu)/sxbar
1-pnorm(z)
pnorm(mu+0.02,mu,sxbar)-pnorm(mu-0.02,mu,sxbar)
z1 = 0.02/sxbar
z2 = (-0.02)/sxbar
pnorm(z1)-pnorm(z2)

# ex4
summary(xr)
x = seq(-0.045,0.03,length=length(xr))
windows()
plot(x,dnorm(x,mu,sxbar),type="l",xlab=expression(bar(x)),ylab="",lwd=2,frame.plot=F,
      axes=F,ylim=c(-1,50))
points(mu,0,lwd=2,pch=18)
text(mu,0,labels=expression(mu),pos=1,cex=1.5)
abline(h=0)
points(mu+0.02,0,lwd=2,pch=18)
points(mu-0.02,0,lwd=2,pch=18)
segments(mu+0.02,0,mu+0.02,40,lty=2,lwd=2)
segments(mu-0.02,0,mu-0.02,40,lty=2,lwd=2)
segments(mu,0,mu,40,lty=1,lwd=2)
text(mu+0.02,0,labels=expression(mu+0.02),pos=1,cex=1.5)
text(mu-0.02,0,labels=expression(mu-0.02),pos=1,cex=1.5)
arrows(mu,15,mu+0.02,15,code=3)
arrows(mu,13,mu-0.02,13,code=3)
text(mu+0.008,40,labels="最大抽樣誤差",pos=3,cex=1.5)
arrows(mu+0.009,40,mu+0.009,15,lty=2)
arrows(mu+0.009,40,mu-0.01,13,lty=2)

# 1-3
# ex1
# Daily TSMC
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\finstats\\ch4\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
TWI = read.table("c:\\meiyih\\Finstats\\ch4\\TWI1.txt",header=T)
attach(TWI)
names(TWI)
pT = T收盤價
p = 收盤價
tsmc.r = 100*diff(log(p))
twi.r = 100*diff(log(pT))
y = tsmc.r
x = twi.r
cor(y,x)
windows()
plot(x,y,type="p",xlab="TWI日對數報酬率",ylab="TSMC日對數報酬率",lwd=2,
     main="TSMC與TWI日對數報酬率之間的散佈圖")
abline(v=mean(x),h=mean(y))
es = x-mean(x)
i = es > 0
y1 = y[i]
y1
i1 = y1 < mean(y)
pbar = mean(as.numeric(i1))
p = pbar
# ex2
T = 10000
N = length(y1)
n = 100
pbar1 = numeric(T)
for(i in 1:T)
{
 ya = sample(y1,n,replace=T)
 j = ya < mean(y)
 pbar1[i] = mean(as.numeric(j))
}
windows()
plot(density(pbar1),xlab=expression(bar(p)),lwd=3,
      main="TSMC日對數報酬率小於其平均數比率的抽樣分配 (抽出放回)")
h = sort(pbar1)
pstar = mean(pbar)
sigma = sqrt(pstar*(1-pstar)/n)
lines(h,dnorm(h,p,sigma),lty=2,col="red",lwd=3)
legend("topright",c("估計密度","常態"),lty=1:2,col=c("black","red"),bty="n",lwd=3)

# ex3
n = 500
pbar2 = numeric(T)
for(i in 1:T)
{
 ya = sample(y1,n,replace=F)
 j = ya < mean(y)
 pbar2[i] = mean(as.numeric(j))
}
windows()
plot(density(pbar2),xlab=expression(bar(p)),lwd=3,
      main="TSMC日對數報酬率小於其平均數比率的抽樣分配 (抽出不放回) (抽出500個樣本)")
h = sort(pbar2)
pstar = mean(pbar2)
sigma = sqrt(pstar*(1-pstar)/n)
sigma1 = sqrt((N-n)/(N-1))*sqrt(pstar*(1-pstar)/n)
lines(h,dnorm(h,p,sigma),lty=2,col="red",lwd=3)
lines(h,dnorm(h,p,sigma1),lty=30,col="blue",lwd=3)
abline(v=pstar)
points(p,0,lwd=2,pch=18)
legend("topright",c("估計密度","無調整常態","有調整常態"),lty=c(1,2,30),
     col=c("black","red","blue"),bty="n",lwd=3)

# 2-1
# ex1
# 1/4/2005-4/28/2015
# ex1
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1] # 日收盤價
r = 100*diff(log(p))
p1 = p[(length(p)-9):length(p)]
r1 = r[(length(r)-9):length(r)]
p1
round(r1,2)
# ex4
t = 250
m = length(r)-t+1 # 總共有m個預測值
rollr = numeric(m)
for(i in 0:(m-1))
{
  r1 = (i+1):(t+i)
  rollr[(i+1)] = var(r[r1])
}
windows()
r1 = r[(t+1):length(r)] # 從251開始
length(r1)
plot(r1^2,xlab="Time",ylab="日波動率",lty=18,lwd=2,ylim=c(0,60),
    main="日波動率的實現值與預測值")
rollr1 = rollr[1:(length(rollr)-1)] # 最後一個無實現值
length(rollr1)
lines(1:length(rollr1),rollr1,lty=18,lwd=3,col="red")
legend("topleft",c("實現值","預測值"),lty=18,col=c("black","red"),lwd=2,bty="n")
# 絕對與平方誤差
MAE = mean(abs(rollr1-r1^2))
MSE = mean((rollr1-r1^2)^2)
# 一般絕對與平方誤差
s2bar = mean(r1^2)
MAE1 = mean(abs(s2bar-r1^2))
MSE1 = mean((s2bar-r1^2)^2)
MAE
MAE1
MSE
MSE1

# 3-1
# ex2
p = largan[,1] # 日收盤價
r = 100*diff(log(p))
set.seed(12345)
n = 150
r1 = sample(r,n,replace=T)
xbar = mean(r1)
xbar
sigma = sd(r)
sigma
s = sd(r1)
s

# 3-1-1
# ex1
# ex2
xbar = 17.51
sigma = 3.23
n = 200
# H0:mu <= 17
alpha = 0.01
zalpha = qnorm((1-alpha))
17+zalpha*sigma/sqrt(n)
# 檢定統計量
z = (xbar-17)/(sigma/sqrt(n))
z
zalpha 
# p_value
1-pnorm(17.51,17,sigma/sqrt(n))
1-pnorm(z)
# ex3
xbar = 21.5
sigma = 2.5
n = 50
# H0:mu = 20
alpha = 0.1
# mu之1-alpha的信賴區間估計值
zalpha1 = qnorm(alpha/2)
lower = xbar+zalpha1*sigma/sqrt(n)
zalpha2 = qnorm(1-(alpha/2))
upper = xbar+zalpha2*sigma/sqrt(n)
lower
upper
# 臨界值法
crit = 20+zalpha2*sigma/sqrt(n)
crit
xbar
# 檢定統計量
z = (xbar-20)/(sigma/sqrt(n))
z
zalpha2
# p_value
2*(1-pnorm(xbar,20,sigma/sqrt(n)))
2*(1-pnorm(z))
round(2*(1-pnorm(z)),5)

# ex4
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1] # 日收盤價
r = 100*diff(log(p))
r1 = r[(length(r)-59):length(r)]
length(r1)
xbar = mean(r1)
xbar
sigma = sd(r)
sigma
n = 60
# H0:mu = 0.3
z = (xbar-0.3)/(sigma/sqrt(n))
z
# ex5
z = (xbar-1)/(sigma/sqrt(n))
z
# ex6
z = (xbar-1.5)/(sigma/sqrt(n))
z
pnorm(z)
# ex7
alpha = 0.01
upper = xbar + qnorm(0.995)*sigma/sqrt(n)
lower = xbar + qnorm(0.005)*sigma/sqrt(n)
upper
lower
# ex8
# 1981:1-2015:5
CPI = read.table("c:\\meiyih\\finstats\\ex\\ch1\\cpi.txt")
cpi = CPI[,1]
T = length(cpi)
pit = 100*((cpi[13:T]-cpi[1:(T-12)])/cpi[1:(T-12)])
xbar = mean(pit)
xbar
n = length(pit)
n
s = sd(pit)
s
z = (xbar-1.8)/(s/sqrt(n))
z

# 3-1-2
# ex1
x = pit[(length(pit)-10):length(pit)]
x = round(x,2)
x
xbar = mean(x)
n = 11
s = sd(x)
se = s/sqrt(n)
# H0: mu >= 0.5
t = (xbar-0.5)/se
t
# ex3
xbar+qt(0.95,10)*se
xbar+qt(0.05,10)*se
# ex4
# H0: mu = 1
t = (xbar-1)/se
t
pt(t,10)


# ex2
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1] # 日收盤價
per = largan[,2] # 本益比
r = 100*diff(log(p))
set.seed(123)
n = 20
per1 = sample(per,n,replace=T)
per1
xbar = mean(per1)
s = sd(per1)
xbar
s
se = s/sqrt(n)
t = (xbar-18)/se
t

# ex5
t = (xbar-29)/se
t

# 3-2
# ex1
sigma = 3.66
n = 100
se = sigma/sqrt(n)
alpha = 0.05
# H0: mu >= 17
windows()
plot(c(16,18),c(-0.2,1.5),type="n",lwd=2,xlab="",ylab="",frame.plot=T,axes=T)
x = seq(16,18,length=100)
lines(x,dnorm(x,17,se),lwd=3)
segments(17,0,17,dnorm(17,17,se),lty=1)
abline(h=0,lwd=2)
points(17,0,lwd=2,pch=18)
text(17,0,labels=expression(mu==17),pos=1,cex=1.5)
crit = 17+qnorm(alpha)*se
points(crit,0,lwd=2,pch=18)
text(crit,0,labels=expression(17-z[alpha/2]*sigma[bar(x)]),pos=1,cex=1.5)
segments(crit,0,crit,1,lty=2)
# mu = 16.6
x1 = seq(14,18.5,length=100)
lines(x1,dnorm(x1,16.6,se),lwd=3,col="red",lty=2)
segments(16.6,0,16.6,dnorm(16.6,16.6,se),lty=18,col="red")
points(16.6,0,lwd=2,pch=18)
text(16.6,0,labels=expression(mu==16.6),pos=1,cex=1.5)
# mu = 16.8
x1 = seq(14,18.5,length=100)
lines(x1,dnorm(x1,16.8,se),lwd=3,col="blue",lty=18)
segments(16.8,0,16.8,dnorm(16.8,16.8,se),lty=18,col="blue")
points(16.8,0,lwd=2,pch=18)
text(16.8,0,labels=expression(mu==16.8),pos=1,cex=1.5)
text(18,0,labels=expression(bar(x)),pos=1,cex=1.5)
# type 2 error
mu = seq(15.5,17,length=100)
beta = numeric(100)
for(i in 1:100)
{
 beta[i] = 1-pnorm(crit,mu[i],se)
}
power = 1-beta
windows()
par(mfrow=c(2,1))
plot(mu,beta,type="l",xlab=expression(mu),ylab=expression(beta),lwd=3)
plot(mu,power,type="l",xlab=expression(mu),lwd=3)

n = 200
se1 = sigma/sqrt(n)
crit1 = 17+qnorm(alpha)*se1
beta1 = numeric(100)
for(i in 1:100)
{
 beta1[i] = 1-pnorm(crit1,mu[i],se1)
}
power1 = 1-beta1
windows()
par(mfrow=c(2,1))
plot(mu,beta,type="l",xlab=expression(mu),ylab=expression(beta),lwd=3,xlim=c(16,17))
lines(mu,beta1,lty=2,col="red",lwd=3)
plot(mu,power,type="l",xlab=expression(mu),lwd=3,xlim=c(16,17))
lines(mu,power1,lty=2,col="red",lwd=3)

# ex5
alpha = 0.05
sigma = 1.66
n = 100
se2 = sigma/sqrt(n)
crit2 = 17+qnorm(alpha)*se2
windows()
x = seq(15,20,length=100)
plot(x,dnorm(x,17,se2),type="l")
mu = seq(15.5,17,length=100)
beta2 = numeric(100)
for(i in 1:100)
{
 beta2[i] = 1-pnorm(crit2,mu[i],se2)
}
power2 = 1-beta2
windows()
par(mfrow=c(2,1))
plot(mu,beta,type="l",xlab=expression(mu),ylab=expression(beta),lwd=3,xlim=c(16,17))
lines(mu,beta2,lty=2,col="red",lwd=3)
plot(mu,power,type="l",xlab=expression(mu),lwd=3,xlim=c(16,17))
lines(mu,power2,lty=2,col="red",lwd=3)

# ex6
alpha = 0.01
sigma = 3.66
n = 100
se = sigma/sqrt(n)
crit3 = 17+qnorm(alpha)*se
mu = seq(15.5,17,length=100)
beta3 = numeric(100)
for(i in 1:100)
{
 beta3[i] = 1-pnorm(crit3,mu[i],se)
}
power3 = 1-beta3
windows()
par(mfrow=c(2,1))
plot(mu,beta,type="l",xlab=expression(mu),ylab=expression(beta),lwd=3,xlim=c(16,17))
lines(mu,beta3,lty=2,col="red",lwd=3)
plot(mu,power,type="l",xlab=expression(mu),lwd=3,xlim=c(16,17))
lines(mu,power3,lty=2,col="red",lwd=3)


# 本章習題
# ch5
# ex2
GDP = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\GDP.txt")
GDP = GDP[,1]
m = length(GDP)
gdpr1 = 100*((GDP[5:m]-GDP[1:(m-4)])/GDP[1:(m-4)])
x = gdpr1[154:length(gdpr1)]  # 2000:1-2014:2
library(fBasics)
basicStats(x) # 峰態為超額峰態

# H0: mu >= 4%
n = length(x)
xbar = mean(x)
s = sd(x)
sxbar = s/sqrt(n)
sxbar # standard error of xbar
windows()
y = seq(min(x),max(x),length=1000)
plot(c(2,6),c(-0.2,0.7),type="n",axes=T,frame.plot=T,ylab="",xlab="",lwd=2)
lines(y,dnorm(y,4,sxbar),lty=1,lwd=2)
points(4,0,pch=20)
text(4,0,labels=expression(paste(mu," = 4")),pos=1)
a = qnorm(0.05,4,sxbar)
i = y <= a
polygon(c(2,y[i],a),c(0,dnorm(y[i],4,sxbar),0),
     density=c(10,20), angle=c(-45,45), col="green")
abline(h=0,lwd=2)
segments(a,0,a,0.6)
lines(y,dnorm(y,4,sxbar),lty=1,lwd=2)
points(a,0,pch=20)
text(a,0,labels=expression(mu-z[alpha/2]*sigma[bar(x)]),pos=1)
text(2.5,0.5,labels="拒絕區",pos=2)
arrows(a,0.5,2.5,0.5)
text(6,0,labels=expression(bar(x)),pos=1)


xbar
n
sxbar
# alpha = 0.05, critical value
4 - qnorm(0.05,4,sxbar)*sxbar
xbar
# test statistic
z = (xbar-4)/sxbar
z 
# alpha = 0.05, critical value
qnorm(0.05)
# p value
pnorm(xbar,4,sxbar)
pnorm(z)
# not reject H0

# ex3
# H0: mu = 4%
# 95% confidence level
xbar-qnorm(0.025,xbar,sxbar)*sxbar
xbar+qnorm(0.975,xbar,sxbar)*sxbar
# alpha = 0.05, critical value
4 - qnorm(0.025,4,sxbar)*sxbar
xbar
# test statistic
z = (xbar-4)/sxbar
z 
# alpha = 0.05, critical value
qnorm(0.025)
# p value
2*(pnorm(xbar,4,sxbar))
2*pnorm(z)
# not reject H0

# ex4
# 1981:1-2014:7
cpi = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\cpi.txt")
cpi = cpi[,1]
lcpi = log(cpi)
n = length(cpi)
inf1 = 100*((cpi[13:n]-cpi[1:(n-12)])/cpi[1:(n-12)])
m = length(inf1)
sigma = sd(inf1)
x = inf1[(m-50+1):m]
basicStats(x)
n = 50
xbar = mean(x)
sigmaxbar = sigma/sqrt(n)

# H0: mu = 1%
alpha = 0.01
# (1-alpha) confidence value of mu
xbar - qnorm((alpha/2),1,sigmaxbar)*sigmaxbar
xbar + qnorm((1-(alpha/2)),1,sigmaxbar)*sigmaxbar
# not reject

# critical value
1+qnorm((1-(alpha/2)),1,sigmaxbar)*sigmaxbar
xbar
# not reject
# test statistic
z = (xbar-1)/sigmaxbar
z
# critical value
qnorm((1-(alpha/2)))
# not reject

# p value
(1-pnorm(xbar,1,sigmaxbar))*2
(1-pnorm(z))*2
# not reject

# ex5
windows()
plot(c(-1,3),c(-0.2,2),type="n",xlab="",ylab="",axes=F,frame.plot=F)
y = seq(0,2,length=100)
lines(y,dnorm(y,1,sigmaxbar),lty=1,lwd=2)
a = qnorm(0.05,1,sigmaxbar)
b = qnorm(0.95,1,sigmaxbar)
i = y >= a & y <= b
polygon(c(a,y[i],b),c(0,dnorm(y[i],1,sigmaxbar),0),col="tomato")
abline(h=0,lwd=2)
w = y+1
lines(w,dnorm(w,2,sigmaxbar),col="blue",lty=1,lwd=2)
w1 = y-1
lines(w1,dnorm(w1,0,sigmaxbar),col="green",lty=1,lwd=2)
points(1,0,pch=20)
text(1,0,labels=expression(paste(mu," = 1")),pos=1)
points(a,0,pch=20)
text(a,0,labels=expression(mu-z[alpha/2]*sigma[bar(x)]),pos=1)
points(b,0,pch=20)
text(b,0,labels=expression(mu+z[alpha/2]*sigma[bar(x)]),pos=1)
points(2,0,pch=20)
text(2,0,labels=expression(paste(mu," = 2")),pos=1)
points(0,0,pch=20)
text(0,0,labels=expression(paste(mu," = 0")),pos=1)
text(3,0,labels=expression(bar(x)),pos=1)

beta1 = pnorm(b,2,sigmaxbar)
beta1
power1 = 1-beta1

windows()
mu = seq(1,3,length=100)
power1 = numeric(100)
for(i in 1:100)
{
 beta_1 = pnorm(b,mu[i],sigmaxbar)
 power1[i] = 1-beta_1
}

mu = seq(-3,1,length=100)
power2 = numeric(100)
for(i in 1:100)
{
 beta_1 = 1-pnorm(a,mu[i],sigmaxbar)
 power2[i] = 1-beta_1
}
power = c(power2,power1)
plot(c(-1.5,3.5),c(-0.1,1),type="n",axes=F,frame.plot=F,xlab="",ylab="")
mu = seq(-1,3,length=200)
lines(mu,power,lty=1,lwd=2)
points(1,0.05,pch=1)
segments(-1.2,0,-1.2,1)
text(3.5,0,labels=expression(mu),pos=1)
segments(-1.2,0,3.5,0)
text(-1.2,1,labels="拒",pos=2)
text(-1.2,0.95,labels="絕",pos=2)
text(-1.2,0.9,labels=expression(H[0]),pos=2)
text(-1.2,0.85,labels="的",pos=2)
text(-1.2,0.8,labels="機",pos=2)
text(-1.2,0.75,labels="率",pos=2)
points(-1.2,0,pch=20)
text(-1.2,0,labels="0",pos=2)
text(1,0,labels="1",pos=1)
points(1,0,pch=20)

# ex6
# 5/20/1987-8/25/2014
oil = read.table("c:\\meiyih\\Finstats\\ex\\ch2\\data\\oild.txt")
oil = oil[,1]

# try again, VR ratio test
p = oil # TSMC
lp = log(p)
n = length(lp)
n

q = 2 # try 2,3,4,5
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

# ex7
# H0: mu >= 2.3
x = c(2.3,2,1.78,2.5,1.5,1.88)
n = length(x)
xbar = mean(x)
sxbar = sd(x)/sqrt(n)
plot(c(-5,5),c(-0.2,0.5),type="n",xlab="",ylab="",axes=T,frame.plot=T)
# test statistic
t = (xbar-2.3)/sxbar
y = seq(-5,5,length=1000)
lines(y,dt(y,(n-1)),lty=1,lwd=2)
abline(h=0,lwd=2)
a = qt(0.99,(n-1))
segments(a,0,a,0.4,lty=2)
text(a,0,labels=expression(t[list(0.01,5)]),pos=1)
text(5,0,labels="t",pos=1)
points(t,0,pch=20)

# ex8
# 1961:1-2014:2
GDP = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\GDP.txt")
GDP = GDP[,1]
m = length(GDP)
gdpr = 100*((GDP[5:m]-GDP[1:(m-4)])/GDP[1:(m-4)])
var(gdpr)
x = gdpr[154:length(gdpr1)]  # 2000:1-2014:2
library(fBasics)
basicStats(x) # 峰態為超額峰態
# H0: mu >= 4%
n = length(x)
sigma = sd(gdpr)
sigmaxbar = sigma/sqrt(n)

windows()
par(mfcol=c(2,2))
plot(c(-1,7),c(-0.1,0.5),type="n",xlab="",ylab="",axes=T,frame.plot=T,
     main="(a) 臨界值分析")
y = seq(1,7,length=1000)
lines(y,dnorm(y,4,sigmaxbar),lty=1,lwd=2)
abline(h=0,lwd=2)
a = qnorm(0.05,4,sigmaxbar)
points(a,0,pch=20)
i = y >= a
polygon(c(a,y[i],8),c(0,dnorm(y[i],4,sigmaxbar),0), col="orange",
density = c(10, 20), angle = c(-45, 45))
points(4,0,pch=20)
text(4,0,labels=expression(paste(mu," = 4")),pos=1)
y1 = y-2
lines(y1,dnorm(y1,2,sigmaxbar),lty=1,col="blue",lwd=2)
points(2,0,pch=20)
text(7,0,labels=expression(bar(x)),pos=1)
text(a,0,labels=expression(mu-z[alpha]*sigma[bar(x)]),pos=1)
text(0,-0.05,labels=expression(paste(mu," = 2")),pos=1)
arrows(0,-0.05,2,0,length=0.1)
segments(a,0,a,dnorm(a,2,sigmaxbar))

beta = 1-pnorm(a,2,sigmaxbar)
beta

plot(c(-1,7),c(-0.15,1.2),type="n",xlab="",ylab="",axes=F,frame.plot=F,
        main="(b) 效力曲線")
arrows(-0.5,-0.1,7,-0.1,length=0.1,lwd=2) # x axis
arrows(-0.5,-0.1,-0.5,1.2,length=0.1,lwd=2) # y axis
text(7,-0.1,labels=expression(mu),pos=1)
mu = seq(0,4,length=1000)
power = numeric(1000)
for(i in 1:1000)
{
 beta1 = 1-pnorm(a,mu[i],sigmaxbar)
 power[i] = 1-beta1
}
lines(mu,power,lty=1,lwd=2)
points(4,0.05,pch=1)
points(4,-0.1,pch=20)
text(4,-0.1,labels=expression(paste(mu," = 4")),pos=1)
points(-0.5,0.05,pch=20)
text(-0.5,0.05,labels="0.05",pos=2)


plot(c(-1,7),c(-0.1,1),type="n",xlab="",ylab="",axes=F,frame.plot=T,
         main="(c) n = 57 增加至 n = 200")
y = seq(1,7,length=1000)
n1 = 200
sigmaxbar1 = sigma/sqrt(n1)
lines(y,dnorm(y,4,sigmaxbar),lty=1,lwd=2)
lines(y,dnorm(y,4,sigmaxbar1),lty=1,col="tomato",lwd=2)
abline(h=0,lwd=2)
segments(a,0,a,0.8,lty=2)
a1 = qnorm(0.05,4,sigmaxbar1)
segments(a1,0,a1,0.8,lty=2,col="tomato")
arrows(a,0.5,a1,0.5,length=0.1)
text(7,0,labels=expression(bar(x)),pos=1)
text(4,0,labels=expression(paste(mu," = 4")),pos=1)
points(4,0,pch=20)
text(a,0,labels=expression(mu-z[alpha]*sigma[bar(x)]),pos=1)
legend("topleft",c("n = 57","n = 200"), lty=c(1,1),col=c("black","tomato"),
      bty="n",lwd=2)

plot(c(-1,7),c(-0.15,1.2),type="n",xlab="",ylab="",axes=F,frame.plot=F,
       main="(d) 不同樣本數n下之效力曲線")
arrows(-0.5,-0.1,7,-0.1,length=0.1,lwd=2) # x axis
arrows(-0.5,-0.1,-0.5,1.2,length=0.1,lwd=2) # y axis
text(-0.5,0.95,labels="0.95",pos=2)
points(-0.5,0.95,pch=20)
points(-0.5,0.05,pch=20)
text(-0.5,0.05,labels="0.05",pos=2)
text(7,-0.1,labels=expression(mu),pos=1)
mu = seq(0,4,length=1000)
power = numeric(1000)
for(i in 1:1000)
{
 beta1 = 1-pnorm(a,mu[i],sigmaxbar)
 power[i] = 1-beta1
}
lines(mu,power,lty=1,lwd=2)
points(4,0.05,pch=1)
segments(-0.5,0.95,7,0.95,lty=2,col="red",lwd=2)
n1 = 55
sigmaxbar1 = sigma/sqrt(n1)
power1 = numeric(1000)
a1 = qnorm(0.05,mu[i],sigmaxbar1)
for(i in 1:1000)
{
 beta1 = 1-pnorm(a1,mu[i],sigmaxbar1)
 power1[i] = 1-beta1
}
lines(mu,power1,lty=2,col="blue")
segments(2,-0.1,2,1.2,lty=2,lwd=2)
text(4,1.1,labels="n = 30",pos=3)
arrows(4,1.1,1.2,0.6,length=0.1)
text(2,-0.1,labels=expression(paste(mu," = 2")),pos=1)
text(4,-0.1,labels=expression(paste(mu," = 4")),pos=1)
points(4,-0.1,pch=20)


# ex9
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
twi.r = 100*diff(log(收盤價_TW))
T = length(twi.r)
twi1.r = twi.r[(T-100+1):T]
length(twi1.r)
summary(twi1.r)
var(twi1.r)
twi2.r = twi.r[(T-10+1):T]
length(twi2.r)
summary(twi2.r)
var(twi2.r)


# ex13
# Daily TSMC and TWI
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch6\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))
twi = read.table("c:\\meiyih\\Finstats\\ch6\\TWI.txt", header=T)
attach(twi)
names(twi)

library(moments)
?skewness
?kurtosis
kurtosis(rnorm(1000))
library(fBasics)
basicStats(tsmc.r)
?basicStats
skewness(tsmc.r)
kurtosis(tsmc.r)

N = 10000
T = 100
shat = numeric(N)
khat = numeric(N)
for(i in 1:N)
{
 x = rnorm(T)
 shat[i] = as.numeric(skewness(x))
 khat[i] = as.numeric(kurtosis(x))
}
# 標準化
 Sshat = shat/(sqrt(6/T))
 Skhat = (khat-3)/(sqrt(24/T))
windows()
par(mfrow=c(2,2))
hist(Sshat,breaks=100,prob=T,main="偏態之分配, T = 100",xlab="")
lines(density(Sshat),lty=2,col="red",lwd=2)
lines(sort(Sshat),dnorm(sort(Sshat)),lty=3,col="blue",lwd=2)
hist(Skhat,breaks=100,prob=T,main="峰態之分配, T = 100",xlab="")
lines(density(Skhat),lty=2,col="red",lwd=2)
lines(sort(Skhat),dnorm(sort(Skhat)),lty=3,col="blue",lwd=2)

T = 3000
shat = numeric(N)
khat = numeric(N)
for(i in 1:N)
{
 x = rnorm(T)
 shat[i] = as.numeric(skewness(x))
 khat[i] = as.numeric(kurtosis(x))
}
# 標準化
 Sshat = shat/(sqrt(6/T))
 Skhat = (khat-3)/(sqrt(24/T))
hist(Sshat,breaks=100,prob=T,main="峰態之分配, T = 3000",xlab="")
lines(density(Sshat),lty=2,col="red",lwd=2)
lines(sort(Sshat),dnorm(sort(Sshat)),lty=3,col="blue",lwd=2)
hist(Skhat,breaks=100,prob=T,main="峰態之分配, T = 3000",xlab="")
lines(density(Skhat),lty=2,col="red",lwd=2)
lines(sort(Skhat),dnorm(sort(Skhat)),lty=3,col="blue",lwd=2)

# ex14
sstar = as.numeric(skewness(tsmc.r))
kstar = as.numeric(kurtosis(tsmc.r))
N = 5000
T = length(tsmc.r)
skew = numeric(N)
kurt = numeric(N)
set.seed(123)
for(i in 1:N)
{
 x = sample(tsmc.r,T,replace=T)
 skew[i] = as.numeric(skewness(x))
 kurt[i] = as.numeric(skewness(x))
}
windows()
par(mfrow=c(2,2)) 
plot(density(skew),main="偏態之分配, T = 3623",xlab="",lwd=2)
points(sstar,0,lwd=2,pch=18)
points(mean(skew),0,lwd=2,pch=18,col="red")
plot(density(kurt),main="峰態之分配, T = 3623",xlab="",xlim=c(-0.5,2),lwd=2)
points(kstar,0,lwd=2,pch=18)
points(mean(kurt),0,lwd=2,pch=18,col="red")
Sskew = (skew-mean(skew))/sd(skew)
Skurt = (kurt-mean(kurt))/sd(kurt)
plot(density(Sskew),main="偏態之分配, T = 3623 (標準化)",xlab="",lwd=2)
lines(sort(Sskew),dnorm(sort(Sskew)),lty=2,col="red")
plot(density(Skurt),main="峰態之分配, T = 3623 (標準化)",xlab="",lwd=2)
lines(sort(Skurt),dnorm(sort(Sskew)),lty=2,col="red")
# 校正後的估計值
2*sstar-mean(skew)
2*kstar-mean(kurt)

# ex 17
oilr = 100*diff(log(oil))
length(oilr)
mean(oilr)
sd(oilr)
# 95% confidence interval
mean(oilr)+qnorm(0.975)*sd(oilr)/length(oilr)
mean(oilr)+qnorm(0.025)*sd(oilr)/length(oilr)





