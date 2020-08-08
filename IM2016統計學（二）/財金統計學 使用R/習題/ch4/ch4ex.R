#ex
# 4-1-1
# ex2
x = 6
n = 10
p = 1/6
dbinom(x,n,p)
choose(n,x)*(p^x)*(1-p)^(n-x)
pbinom(x,n,p)-pbinom((x-1),n,p)

# ex3
n = 100
x = 30
p = 0.25
pbinom(x,n,p)
x = 10
1-pbinom(x,n,p)

# ex7
n = 10
x = 5
p1 = 0.9
p2 = 0.2
set.seed(123)
x1 = rbinom(x,n,p1)
x1
x2 = rbinom(x,n,p2)
x2

# 4-1-2
# ex1
lambda = (3.2326/7)*10
dpois(4,lambda)
ppois(3,lambda)
1-ppois(5,lambda)

# ex2
set.seed(123)
x = rpois(5,lambda)
x
dpois(x,lambda)
p = ppois(x,lambda)
p
qpois(p,lambda)

# 4-2-1-1
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
twi.10r = diff(log(pT),10)*100
mu = mean(twi.10r)
sigma = sd(twi.10r)
pnorm(2,mu,sigma)-pnorm(-2,mu,sigma)
pnorm(5,mu,sigma)
1-pnorm(-1.5,mu,sigma)
# 用標準常態
z1 = (2-mu)/sigma
z2 = (-2-mu)/sigma
pnorm(z1)-pnorm(z2)
z3 = (5-mu)/sigma
pnorm(z3)
z4 = (-1.5-mu)/sigma
1-pnorm(z4)
# ex2
q = qnorm(0.8,mu,sigma)
q
# q1 = (x-mu)/sigma
q1 = qnorm(0.8)
# x = mu+q1*sigma
mu+q1*sigma

# ex4
quantile(twi.10r,0.8)

# ex5
# 1981:1-2015:5
CPI = read.table("c:\\meiyih\\finstats\\ex\\ch1\\cpi.txt")
cpi = CPI[,1]
T = length(cpi)
T
infl = 100*((cpi[13:T]-cpi[1:(T-12)])/cpi[1:(T-12)])
mu = mean(infl)
sigma = sd(infl)
mu
sigma
windows()
plot(density(infl),xlab="通貨膨脹率",main="通貨膨脹率之實際與常態分配",lwd=3)
abline(v = mu,lty=2)
x = sort(infl)
lines(x,dnorm(x,mu,sigma),lty=2,col="red",lwd=3)
legend("topright",c("實際的分配","常態分配"),lty=1:2,col=c("black","red"),bty="n",lwd=3)


# ex7
# 1962Q1-2015Q1 
EG = read.table("c:\\meiyih\\finstats\\ex\\ch4\\EG.txt")
y = EG[,1]
mu = mean(y)
sigma = sd(y)
windows()
plot(density(y),xlab="經濟成長率",main="經濟成長率之實際與常態分配",lwd=3)
y1 = sort(y)
lines(y1,dnorm(y1,mu,sigma),lty=2,col="red",lwd=3)
abline(v=mu,lty=2)
legend("topright",c("實際的分配","常態分配"),lty=1:2,col=c("black","red"),bty="n",lwd=3)


# 2-1-2
# ex1
twi.10r = 100*diff(log(T收盤價),10)
mu = mean(twi.10r)
sigma = sd(twi.10r)
upper = mu+2*sigma
lower = mu-2*sigma
upper
lower
# ex2
pnorm(upper,mu,sigma)-pnorm(lower,mu,sigma)
# ex3
upper1 = mu+sqrt(3)*sigma
lower1 = mu-sqrt(3)*sigma
upper1
lower1

# 2-1-3
# ex2
mu = mean(twi.10r)
sigma = sd(twi.10r)
upper = mu+3*sigma
lower = mu-3*sigma
windows()
plot(twi.10r,type="p",ylab="保有10天的對數報酬率",xlab="Time",lwd=2,
    main="TWI保有10天的對數報酬率之異常值")
abline(h=upper,lty=2,col="red",lwd=2)
abline(h=lower,lty=2,col="red",lwd=2)
arrows(2000,upper,2000,upper+3)
arrows(2000,lower,2000,lower-3)
sum(as.numeric(twi.10r > upper))
sum(as.numeric(twi.10r < lower))

# ex3
y = EG[,1]
mu = mean(y)
sigma = sd(y)
yt = ts(y,start=c(1962,1),frequency=4)
yt
upper = mu+3*sigma
lower = mu-3*sigma
windows()
ts.plot(yt,type="p",ylab="經濟成長率",ylim=c(-10,21),lwd=2,
     main="經濟成長率的異常值")
abline(h=upper,lty=2,col="tomato",lwd=2)
abline(h=lower,lty=2,col="tomato",lwd=2)
points(2008.75,yt[188],lwd=2,pch=18,col="red")
arrows(1999.25,-8,2008.75,yt[188])
text(1999.25,-8,labels="異常值",pos=2)

# 2-2
# ex2
# lambda2 = var(x)*(nu-2)/nu
n = 5000
nu = 5
set.seed(123)
x = rt(n,nu)
lambda2 = var(x)*(nu-2)/nu
t = (x-mean(x))/sqrt(lambda2)
windows()
x1 = sort(t)
plot(density(x1),type="l",xlab=expression(t),ylab="Density",lwd=2,ylim=c(0,0.6),
  xlim=c(-4,4),
     main="(校正後) t分配與標準常態分配 (自由度為5)")
x2 = (x-mean(x))/sd(x)
x2 = sort(x2)
lines(density(rnorm(n)),lty=2,col="red",lwd=2)
lines(density(x2),lty=30,col="blue",lwd=2)
legend("topright",c("按照尺度標準化之t分配","標準常態","按照標準差標準化之t分配"),lty=c(1,2,30),
      col=c("black","red","blue"),bty="n",lwd=2)

# ex3
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\finstats\\ch4\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
p = 收盤價
tsmcr = 100*diff(log(p))
mu = mean(tsmcr)
sigma = sd(tsmcr)
nu = 4
# 使用尺度標準化
# sigma轉成尺度
# 變異數 = 尺度*nu/(nu-2)
# 尺度 = 變異數*(nu-2)/nu
lambda2 = var(tsmcr)*(nu-2)/nu
lambda = sqrt(lambda2)
# 介於-1.5與1.5之間的機率
t1a = (-1.5-mu)/lambda
t1b = (1.5-mu)/lambda
pt(t1b,nu)-pt(t1a,nu) # 0.6222
# 小於-6.5的機率
t2 = (-6.5-mu)/lambda
pt(t2,nu) # 0.0062

# 常態分配
z1a = (-1.5-mu)/sigma
z1b = (1.5-mu)/sigma
pnorm(z1b)-pnorm(z1a) # 0.5166
z2 = (-6.5-mu)/sigma
pnorm(z2) # 0.0011

# 使用fGarch
library(fGarch)
?rstd
pstd(z1b,mean=0,sd=1,nu=nu)-pstd(z1a,mean=0,sd=1,nu=nu) # 用標準差標準化, 0.6222
pstd(1.5,mean=mu,sd=sigma,nu=nu)-pstd(-1.5,mean=mu,sd=sigma,nu=nu) # 0.6222
pstd(-6.5,mean=mu,sd=sigma,nu=nu) # 0.0062
pstd(z2,mean=0,sd=1,nu=nu) # 0.0062

windows()
nu = 5
n = 5000
t = rstd(n,nu=5)
plot(density(t),main="相同型式標準化之t分配 (自由度為5) 與常態分配",xlab="t",lwd=2)
lines(density(rnorm(n)),lty=2,col="red",lwd=2)
legend("topright",c("t分配","標準常態"),lty=1:2,col=c("black","red"),bty="n")

# ex7
T = 10000
mu = numeric(T)
sigma = mu
mu1 = mu
sigma1 = mu
for(i in 1:T)
{
x = rt(1000,4)
x1 = rstd(1000,0,1,4)
mu[i] = mean(x)
sigma[i] = sd(x)
mu1[i] = mean(x1)
sigma1[i] = sd(x1)

}
mean(mu)
mean(sigma)
mean(mu1)
mean(sigma1)

# 3-1-1
# ex1
set.seed(123)
x = rnorm(150)
Fx = ecdf(x)
x1 = sort(x)
Fx(x1) # 以函數型態表示

# ex2
T = length(infl) # infl為通貨膨脹率
pi1 = infl[(T-9):T]
round(pi1,2)
xbar = mean(infl)
sx = sd(infl)
fx = ecdf(infl)
windows()
plot(fx,xlab="通貨膨脹率",main="通貨膨脹率與常態分配之CDF",lwd=2)
x = rnorm(T,mean=xbar,sd=sx)
lines(sort(x),pnorm(sort(x),mean=xbar,sd=sx),lty=2,col="red",lwd=2)

# 3-1-2
# ex1
windows()
qqnorm(infl,datax=T,lwd=2,ylab="樣本",xlab="常態理論",main="通貨膨脹率之常態機率圖")
qqline(infl,datax=T,lwd=2,col="red",lty=2)

# ex2
y = EG[,1]
windows()
qqnorm(y,datax=T,lwd=2)
qqline(y,datax=T,lwd=2,lty=2,col="red")

# 3-1-3
# ex1
library(fGarch)
y = EG[,1] # 經濟成長率序列
?sstdFit
modela = sstdFit(y)
modela 
estimate = modela$estimate
windows()
par(mfcol=c(2,2))
plot(density(y), main="實證與理論的偏態t分配",xlab="經濟成長率",lwd=2,ylim=c(0,0.15))
n = length(y)
x1 = seq(min(y), max(y), length=n)
lines(x1, dsstd(x1,mean=estimate[1],sd=estimate[2],nu=estimate[3],xi=estimate[4]),lty=2,lwd=2,col="red")
grid = (1:n)/(n+1)
s_dx = sort(y)
qqplot(s_dx,qsstd(grid,mean=estimate[1],sd=estimate[2],nu=estimate[3],xi=estimate[4]), lwd=2,
       xlab="",ylab="", main="QQ 圖")
q1 = qsstd(c(0.25,0.75),mean=estimate[1],sd=estimate[2],nu=estimate[3],xi=estimate[4])
lmfit1 = lm(q1~quantile(y,c(0.25,0.75)))
abline(lmfit1,lty=2,lwd=2,col="red")

modelb = stdFit(y)
modelb 
estimate = modelb$par
plot(density(y), main="實證與理論的t分配",xlab="經濟成長率",lwd=2,ylim=c(0,0.15))
n = length(y)
x1 = seq(min(y), max(y), length=n)
lines(x1, dstd(x1,mean=estimate[1],sd=estimate[2],nu=estimate[3]),lty=2,lwd=2,col="red")
grid = (1:n)/(n+1)
s_dx = sort(y)
qqplot(s_dx,qstd(grid,mean=estimate[1],sd=estimate[2],nu=estimate[3]), lwd=2,
       xlab="",ylab="", main="QQ 圖")
q1 = qsstd(c(0.25,0.75),mean=estimate[1],sd=estimate[2],nu=estimate[3])
lmfit1 = lm(q1~quantile(y,c(0.25,0.75)))
abline(lmfit1,lty=2,lwd=2,col="red")

# ex2
# 1987:5-2015:5
cp30 = read.table("c:\\meiyih\\Finstats\\ex\\ch4\\cp30.txt")
cp30 = cp30[,1]
windows()
plot(cp30,type="l",xlab="Time",ylab="cp30",main="商業本票1-30天次級市場利率之時間走勢",lwd=2)
windows()
z = (cp30-mean(cp30))/sd(cp30)
qqnorm(z,datax=T,lwd=2,main="商業本票1-30天次級市場利率之QQ圖")
qqline(z,datax=T,lwd=2,col="red",lty=2)

# 3-2
# ex1
library(fGarch)
model1 = stdFit(tsmc.r)
param1 = model1$par
alpha = 0.05
mu+sigma*qt(alpha,nu)/sqrt(nu/(nu-2))
mu+sigma*qstd(alpha,mean=0,sd=1,nu=nu)

# ex4
N = 2000
n = c(100,1000,5000,10000)
set.seed(1234)
muhat = numeric(N)
sigmahat = numeric(N)
nuhat = numeric(N)
xbar = numeric(N)
s = numeric(N)
nu = 4
for(i in 1:N)
{
x = rt(n[4],nu)
xbar[i] = mean(x)
s[i] = sd(x)
modela = stdFit(x)
muhat[i] = as.numeric(modela$par[1])
sigmahat[i] = as.numeric(modela$par[2])
nuhat[i] = as.numeric(modela$par[3])
}
windows()
par(mfrow=c(3,1))
plot(density(muhat),xlab=expression(bar(x)),lwd=2,main="ML估計值與樣本平均數")
lines(density(xbar),lty=2,lwd=2,col="red")
legend("topleft",c("ML估計式","樣本平均數"),lty=1:2,lwd=2,
      col=c("black","red"),bty="n")
plot(density(sigmahat),xlab=expression(s),lwd=2,main="ML估計值與樣本標準差")
lines(density(s),lty=2,lwd=2,col="red")
legend("topleft",c("ML估計式","樣本標準差"),lty=1:2,lwd=2,
      col=c("black","red"),bty="n")
plot(density(nuhat),xlab=expression(nu),lwd=2,main="自由度ML估計值")
abline(v=nu,lty=2,col="red",lwd=2)

# 3-2-2
# ex1
library(VaRES) 
# TWI
# 1/4/2000-7/10/2014
TWI = read.table("c:\\meiyih\\finstats\\ch4\\TWI1.txt",header=T)
attach(TWI)
names(TWI)
twi.r = 100*diff(log(T收盤價))
y = twi.r
alpha = c(0.05,0.01,0.001)
z = (twi.r-mean(twi.r))/sd(twi.r)
?esnormal
esnormal(alpha,mu=0,sigma=1)
varz = qnorm(alpha)
-dnorm(varz)/alpha

# ex2
esnormal(alpha,mu=mean(y),sigma=sd(y))
mean(y)-sd(y)*dnorm(varz)/alpha

# ex3
modelt = stdFit(y)
param1t = modelt$par
nuhat = as.numeric(param1t)[3]
esT(alpha,n=nuhat)
# 計算t分配之ES
# (f(qt(alpha))/alpha)*((nu+qt(alpha)^2)/(nu-1))
qt05 = qt(0.05,df=nuhat)
qt01 = qt(0.01,df=nuhat)
qt001 = qt(0.001,df=nuhat)
-((dt(qt05,df=nuhat)/0.05)*((nuhat+qt05^2)/(nuhat-1)))
-((dt(qt01,df=nuhat)/0.01)*((nuhat+qt01^2)/(nuhat-1)))
-((dt(qt001,df=nuhat)/0.001)*((nuhat+qt001^2)/(nuhat-1)))
## -(mu + lambda*(f(qt(alpha))/alpha)*((nu+qt(alpha)^2)/(nu-1)))
muhat = as.numeric(param1t)[1]
sigmahat = as.numeric(param1t)[2]
-(muhat+sigmahat*(dt(qt05,df=nuhat)/0.05)*((nuhat+qt05^2)/(nuhat-1)))
-(muhat+sigmahat*(dt(qt01,df=nuhat)/0.01)*((nuhat+qt01^2)/(nuhat-1)))
-(muhat+sigmahat*(dt(qt001,df=nuhat)/0.001)*((nuhat+qt001^2)/(nuhat-1)))

 
# 本章習題
# ch4
# ex2
p = 0.6
n = 500
x = 300
pbinom(x,n,p)-pbinom((x-1),n,p)
1-pbinom(x,n,p)
choose(n,x)*(p^x)*(1-p)^(n-x)

?choose
choose(6,2)
?factorial
factorial(5)

# ex3
mu = n*p
sigma = sqrt(n*p*(1-p))
pnorm(x,mu,sigma)-pnorm((x-1),mu,sigma)
1-pnorm((x+0.5),mu,sigma) # 不含x

# ex4
windows()
par(mfrow=c(2,2))
p = 0.3
n = 10
x = 1:100
n*p
#dbinom(x,n,p)
plot(x,dbinom(x,n,p),type="h",xlim=c(-5,20),ylab="",main="二項分配不漸近於常態分配, 
  p = 0.3, n = 10",lwd=2)
lines(x,dnorm(x,n*p,sqrt(n*p*(1-p))),lty=2,col="red",lwd=2)
abline(h=0)

p = 0.3
n = 100
x = 1:100
n*p
#dbinom(x,n,p)
plot(x,dbinom(x,n,p),type="h",ylab="",xlim=c(0,60),main="二項分配漸近於常態分配, lwd=2,
   p = 0.3, n = 100",lwd=2)
lines(x,dnorm(x,n*p,sqrt(n*p*(1-p))),lty=2,col="red",lwd=2)
abline(h=0)

p = 0.9
n = 30
x = 1:100
n*(1-p)
#dbinom(x,n,p)
plot(x,dbinom(x,n,p),type="h",xlim=c(20,35),ylab="",main="二項分配不漸近於常態分配,
  p = 0.9, n = 30",lwd=2)
lines(x,dnorm(x,n*p,sqrt(n*p*(1-p))),lty=2,col="red",lwd=2)
abline(h=0)

p = 0.6
n = 100
x = 1:100
n*p
n*(1-p)
#dbinom(x,n,p)
plot(x,dbinom(x,n,p),type="h",ylab="",xlim=c(40,80),main="二項分配漸近於常態分配, lwd=2,
  p = 0.6, n = 100",lwd=2)
lines(x,dnorm(x,n*p,sqrt(n*p*(1-p))),lty=2,col="red",lwd=2)
abline(h=0)

# ex6
n = 3000
p = 0.001
x = 3
n*p
n*(1-p)
pbinom(x,n,p)-pbinom((x-1),n,p)
pbinom(5,n,p)

# ex7
mu = n*p
ppois(x,mu)-ppois((x-1),mu)
ppois(5,mu)

# ex8
windows()
par(mfrow=c(2,1))
n = 3000
p = 0.001
mu = n*p
mu
x = 1:2000
plot(x,dbinom(x,n,p),type="h",xlim=c(0,15),ylab="",main="二項分配漸近於卜瓦松分配,
      n = 3000, p = 0.001",lwd=2)
abline(h=0)
lines(x,dpois(x,mu),lty=4,col="red",lwd=2)
legend("topright",c("Poissn Distribution"),lty=4,col="red",bty="n",lwd=2)

n = 30 
p = 0.2
mu = n*p
mu
n*(1-p)
x = 1:20
plot(x,dbinom(x,n,p),type="h",xlim=c(0,15),ylab="",main="二項分配不漸近於卜瓦松分配,
      n = 30, p = 0.2",lwd=2)
abline(h=0)
lines(x,dpois(x,mu),lty=4,col="red",lwd=2)
legend("topright",c("Poissn Distribution"),lty=4,col="red",bty="n",lwd=2)

# ex9
# 1/2/2002-8/29/2014 銀行間匯率
exch = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\exchangerate.txt", header=T)
names(exch)
attach(exch) # 接近exch
x = 新台幣 # 1美元等於?新台幣
y = 人民幣 # 1美元等於?人民幣
z = x/y # 1美元等於?新台幣
zr = 100*diff(log(z))
library(fBasics)
basicStats(x) # 峰態為超額峰態
xr = 100*diff(log(x))
x2r = 100*diff(log(x),2)
x3r = 100*diff(log(x),3)
x4r = 100*diff(log(x),4)
x5r = 100*diff(log(x),5)
basicStats(xr)
basicStats(x2r)
basicStats(x3r)
basicStats(x4r)
basicStats(x5r)
windows()
par(mfrow=c(2,1))
plot(x,type="l",xlab="time",ylab="匯率",main="新台幣對美元匯率時間走勢",lwd=2)
T = length(x)
set.seed(12)
u = rnorm(T)
u[1800] = -60
x1 = numeric(T)
for(i in 2:T)
{
x1[i] = x1[(i-1)] + u[i]
}
plot(x1,type="l",lwd=2)
text(2500,0,labels="外力之衝擊",pos=4)
arrows(2500,0,1800,-20)

windows()
par(mfrow=c(2,1))
plot(xr,type="l",xlab="time",ylab="匯率",main="新台幣對美元匯率變動率時間走勢",lwd=2)
T = length(x)
set.seed(12)
u = rnorm(T)
u[1800] = -30
x1 = numeric(T)
for(i in 2:T)
{
x1[i] = 0.5*x1[(i-1)] + u[i]
}
plot(x1,type="l",lwd=2)
text(2500,-20,labels="外力之衝擊",pos=4)
arrows(2500,-20,1800,-20)

# ex10,11
var(x2r)/(2*var(xr))
var(x3r)/(3*var(xr))
var(x4r)/(4*var(xr))
var(x5r)/(5*var(xr))

z.xr = (xr-mean(xr))/sd(xr)
windows()
par(mfrow=c(2,2))
qqnorm(z.xr, datax = T, ylab="實證值",xlab="理論值",main=" k = 1",ylim=c(-5,5),lwd=2)
qqline(z.xr, datax = T, distribution=qnorm,lwd=2)
z.x2r = (x2r-mean(x2r))/sd(x2r)
qqnorm(z.x2r, datax = T, ylab="實證值",xlab="理論值",main=" k = 2",ylim=c(-5,5),lwd=2)
qqline(z.x2r, datax = T, distribution=qnorm,lwd=2)
z.x3r = (x3r-mean(x3r))/sd(x3r)
qqnorm(z.x3r, datax = T, ylab="實證值",xlab="理論值",main=" k = 3",ylim=c(-5,5),lwd=2)
qqline(z.x3r, datax = T, distribution=qnorm,lwd=2)
z.x4r = (x4r-mean(x4r))/sd(x4r)
qqnorm(z.x4r, datax = T, ylab="實證值",xlab="理論值",main=" k = 4",ylim=c(-5,5),lwd=2)
qqline(z.x4r, datax = T, distribution=qnorm,lwd=2)
mtext("匯率變動率與標準常態分配,k表示保有天數", side = 3, outer=TRUE, line = -1)

library(fGarch)
windows()
par(mfcol=c(2,4))
model1 = stdFit(xr)
model1
y = xr
param1 = c(-0.0054, 0.2776, 2.742) # 按照model1內之$par
plot(density(y), main="實際與理論t分配 (k=1)", ylim=c(0,3),xlab="r",lwd=2)
n = length(y)
x1 = seq(min(y), max(y), length=n)
lines(x1, dstd(x1,mean=param1[1],sd=param1[2],nu=param1[3]),lty=2,col="red",lwd=2)
grid = (1:n)/(n+1)
s_dx = sort(y)
qqplot(s_dx,qstd(grid,mean=param1[1],sd=param1[2],nu=param1[3]),
       xlab="",ylab="", main="QQ 圖",lwd=2)
q1 = qstd(c(0.25,0.75), mean=param1[1],sd=param1[2],nu=param1[3])
lmfit1 = lm(q1~quantile(y,c(0.25,0.75)))
abline(lmfit1,lwd=2)

model2 = stdFit(x2r)
model2
y = x2r
param2 = c(-0.0081, 0.3826, 3.0356)
plot(density(y), main="實際與理論t分配 (k=2)", ylim=c(0,2),xlab="r",lwd=2)
n = length(y)
x1 = seq(min(y), max(y), length=n)
lines(x1, dstd(x1,mean=param2[1],sd=param2[2],nu=param2[3]),lty=2,col="red",lwd=2)
grid = (1:n)/(n+1)
s_dx = sort(y)
qqplot(s_dx,qstd(grid,mean=param2[1],sd=param2[2],nu=param2[3]),
       xlab="",ylab="", main="QQ 圖",lwd=2)
q1 = qstd(c(0.25,0.75), mean=param2[1],sd=param2[2],nu=param2[3])
lmfit1 = lm(q1~quantile(y,c(0.25,0.75)))
abline(lmfit1,lwd=2)

model3 = stdFit(x3r)
model3
param3 = c(-0.0126, 0.4745, 3.1409)
y = x3r
plot(density(y), main="實際與理論t分配 (k=3)", ylim=c(0,1.5),xlab="r",lwd=2)
n = length(y)
x1 = seq(min(y), max(y), length=n)
lines(x1, dstd(x1,mean=param3[1],sd=param3[2],nu=param3[3]),lty=2,col="red",lwd=2)
grid = (1:n)/(n+1)
s_dx = sort(y)
qqplot(s_dx,qstd(grid,mean=param3[1],sd=param3[2],nu=param3[3]),
       xlab="",ylab="", main="QQ 圖",lwd=2)
q1 = qstd(c(0.25,0.75), mean=param3[1],sd=param3[2],nu=param3[3])
lmfit1 = lm(q1~quantile(y,c(0.25,0.75)))
abline(lmfit1,lwd=2)

model4 = stdFit(x4r)
model4
param4 = c(-0.0154, 0.5560, 3.1934)
y = x4r
plot(density(y), main="實際與理論t分配 (k=4)", ylim=c(0,1.5),xlab="r",lwd=2)
n = length(y)
x1 = seq(min(y), max(y), length=n)
lines(x1, dstd(x1,mean=param4[1],sd=param4[2],nu=param4[3]),lty=2,col="red",lwd=2)
grid = (1:n)/(n+1)
s_dx = sort(y)
qqplot(s_dx,qstd(grid,mean=param4[1],sd=param4[2],nu=param4[3]),
       xlab="",ylab="", main="QQ 圖",lwd=2)
q1 = qstd(c(0.25,0.75), mean=param4[1],sd=param4[2],nu=param4[3])
lmfit1 = lm(q1~quantile(y,c(0.25,0.75)))
abline(lmfit1,lwd=2)
mtext("匯率變動率與t分配,k表示保有天數", side = 3, outer=TRUE, line = -1,cex=1)

# ex12
basicStats(xr)
model1 = stdFit(xr)
model1
param1 = c(-0.0054,0.2776,2.742)
windows()
par(mfrow=c(2,1))
den = density(xr)
x = den$x
y = den$y
plot(c(-1.5,1.5),c(-0.5,4),axes=F,type="n",xlab="",ylab="",main="日匯率變動率機率分配",
         ,frame.plot=F)
lines(x,y,lwd=2)
x1 = sort(x)
lines(x1,dnorm(x1,mean(xr),sd(xr)),col="red",lwd=2)
v = param1[3]
mu = param1[1]
sigma = param1[2]
dt1 = dstd(x1,mean=mu,sd=sigma,nu=v)
lines(x1,dt1,col="blue",lwd=2)
abline(h=0)
segments(-0.5,0,-0.5,2.1)
segments(0.5,0,0.5,2.1)
legend("topright",c("實際","常態","t分配"),col=c("black","red","blue"),lty=c(1,1,1),
       bty="n",lwd=2)
points(-0.5,0,pch=20)
points(0.5,0,pch=20)
text(-0.5,0,labels=expression(x[1]),pos=1)
text(0.5,0,labels=expression(x[2]),pos=1)
text(1.5,0,labels=expression(x),pos=1)
# 標準化
s.xr = (xr-mean(xr))/sd(xr)
model1a = stdFit(s.xr)
model1a
param1a = c(-0.0020,1.18838,2.742)
mua = param1a[1]
sigmaa = param1a[2]
va = param1a[3]
den1 = density(s.xr)
x2 = den1$x
y2 = den1$y
plot(c(-4,4),c(-0.3,1),axes=F,frame.plot=F,xlab="",ylab="", type="n",
            main="標準化後")
lines(x2,y2,lwd=2)
lines(sort(x2),dnorm(sort(x2)),col="red",lwd=2)
dt2 = dstd(sort(x2),mean=mua,sd=sigmaa,nu=va) 
lines(sort(x2),dt2,col="blue",lwd=2)
abline(h=0)
t1 = (-0.5-mean(xr))/sd(xr)
t2 = (0.5-mean(xr))/sd(xr)
segments(t1,0,t1,0.6)
segments(t2,0,t2,0.6)
legend("topright",c("實際","常態","t分配"),col=c("black","red","blue"),lty=c(1,1,1),
       bty="n",lwd=2)
points(t1,0,pch=20)
points(t2,0,pch=20)
text(t1,0,labels=expression(t[1]),pos=1)
text(t2,0,labels=expression(t[2]),pos=1)
text(4,0,labels=expression(t),pos=1)


# 機率值
pnorm(t2)-pnorm(t1) # 0.9676618
pnorm(0.5,mean(xr),sd(xr))-pnorm(-0.5,mean(xr),sd(xr)) # 0.9676618
pstd(0.5,mean=mu,sd=sigma,nu=v)-pstd(-0.5,mean=mu,sd=sigma,nu=v) # 0.9533916
t1a = (-0.5-mu)/sigma
t2a = (0.5-mu)/sigma
pstd(t2a,mean=0,sd=1,nu=v)-pstd(t1a,mean=0,sd=1,nu=v) # 0.9533916
lambda = sigma/sqrt((v/(v-2)))
t1b = (-0.5-mu)/lambda
t2b = (0.5-mu)/lambda
pt(t2b,v)-pt(t1b,v) # 0.9533916
# 實證機率值
Fx = ecdf(xr)
Fx
Fx(xr)
sort(xr) #找xr約為-0.5的位置大概位於第76個位置,另外找xr約為0.5的位置大概位於第3094個位置
sort(Fx(xr))[3094] - sort(Fx(xr))[76] # 0.9520505
t1 # -2.119588
t2 # 2.161774

Fzx = ecdf(z.xr)
Fzx
Fzx(z.xr)
sort(z.xr) #用相同的位置
sort(Fzx(z.xr))[3094] - sort(Fzx(z.xr))[76] # 0.9520505

# ex 23
N = 10000
xbar = numeric(N)
set.seed(1234)
T = 100
for(i in 1:N)
{
 x = sample(tsmc.r,T,replace=T)
 xbar[i] = mean(x)
}
s = sd(xbar)
mu = mean(xbar)
upper = mu+qnorm(0.975)*s
lower = mu+qnorm(0.025)*s
upper
lower
quantile(xbar,c(0.025,0.975))

# ex 26
# Daily TSMC
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch4\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))
summary(tsmc.r)
library(fGarch)
model = stdFit(tsmc.r)
model
b = as.numeric(model$par)
pstd(3,mean=b[1],sd=b[2],nu=b[3])-pstd(-1,mean=b[1],sd=b[2],nu=b[3])



