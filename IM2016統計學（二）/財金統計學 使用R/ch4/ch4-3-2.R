tsmc = read.table("c:\\meiyih\\finstats\\ch4\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(Μ絃基),1)
tsmc.2r = 100*diff(log(Μ絃基),2)
tsmc.5r = 100*diff(log(Μ絃基),5)
tsmc.10r = 100*diff(log(Μ絃基),10)
library(fGarch)
model1 = stdFit(tsmc.r)
model1
param1 = model1$par
model2 = stdFit(tsmc.2r)
param2 = model2$par
model5 = stdFit(tsmc.5r)
param5 = model5$par
model10 = stdFit(tsmc.10r)
param10 = model10$par

# VaR
y = tsmc.r
nu=param1[3]
mu = param1[1]
sigma = param1[2]
alpha = 0.05
mean(y)+sd(y)*qnorm(alpha) # normal
quantile(y,alpha) # 龟悔 (だ计)
mu+sigma*qt(alpha,nu)/sqrt(nu/(nu-2)) #程兜ボㄏノ︳璸lambda
# mu + sigma*qstd(alpha,mean=0,sd=1,nu=nu) # 夹非てtだ皌

alpha = 0.01
mean(y)+sd(y)*qnorm(alpha)
quantile(y,alpha)# 龟悔 (だ计)
mu+sigma*qt(alpha,nu)/sqrt(nu/(nu-2))
# mu + sigma*qstd(alpha,mean=0,sd=1,nu=nu)

alpha = 0.001
mean(y)+sd(y)*qnorm(alpha)
quantile(y,alpha)
mu+sigma*qt(alpha,nu)/sqrt(nu/(nu-2))
# mu + sigma*qstd(alpha,mean=0,sd=1,nu=nu)
library(VaRES)
#dnormal(y,mu=mean(y),sigma=sd(y))
#pnormal(y,mu=mean(y),sigma=sd(y))
varnormal(alpha,mu=mean(y),sigma=sd(y),lower.tail=T)
mu+sigma*varT(alpha,n=nu,lower.tail=T)/sqrt(nu/(nu-2))


y = tsmc.2r
nu=param2[3]
mu = param2[1]
sigma = param2[2]
alpha = 0.05
mean(y)+sd(y)*qnorm(alpha) # normal
quantile(y,alpha) # 龟悔(だ计)
mu+sigma*qt(alpha,nu)/sqrt(nu/(nu-2)) # t distribution

alpha = 0.01
mean(y)+sd(y)*qnorm(alpha)
quantile(y,alpha)
mu+sigma*qt(alpha,nu)/sqrt(nu/(nu-2))

alpha = 0.001
mean(y)+sd(y)*qnorm(alpha)
quantile(y,alpha)
mu+sigma*qt(alpha,nu)/sqrt(nu/(nu-2))


y = tsmc.5r
nu=param5[3]
mu = param5[1]
sigma = param5[2]
alpha = 0.05
mean(y)+sd(y)*qnorm(alpha) # normal
quantile(y,alpha) # 龟悔 (だ计)
mu+sigma*qt(alpha,nu)/sqrt(nu/(nu-2)) # t distribution

alpha = 0.01
mean(y)+sd(y)*qnorm(alpha)
quantile(y,alpha)
mu+sigma*qt(alpha,nu)/sqrt(nu/(nu-2))

alpha = 0.001
mean(y)+sd(y)*qnorm(alpha)
quantile(y,alpha)
mu+sigma*qt(alpha,nu)/sqrt(nu/(nu-2))

y = tsmc.10r
nu=param10[3]
mu = param10[1]
sigma = param10[2]
alpha = 0.05
mean(y)+sd(y)*qnorm(alpha) # normal
quantile(y,alpha) # 龟悔 (だ计)
mu+sigma*qt(alpha,nu)/sqrt(nu/(nu-2)) # t distribution

alpha = 0.01
mean(y)+sd(y)*qnorm(alpha)
quantile(y,alpha)
mu+sigma*qt(alpha,nu)/sqrt(nu/(nu-2))

alpha = 0.001
mean(y)+sd(y)*qnorm(alpha)
quantile(y,alpha)
mu+sigma*qt(alpha,nu)/sqrt(nu/(nu-2))



# ES︳璸
y = tsmc.r
nuhat=param1[3]
muhat = param1[1]
sigmahat = param1[2]
alpha = 0.05
var1 = varnormal(alpha,mu=0,sigma=1,lower.tail=T)
var1
esnormal(alpha,mu=mean(y),sigma=sd(y))
mean(y)-sd(y)*dnorm(var1)/alpha

# tだ皌
qt05 = qt(0.05,df=nuhat)
-(muhat+sigmahat*(dt(qt05,df=nuhat)/0.05)*((nuhat+qt05^2)/(nuhat-1)))

index = y < quantile(y,alpha)
es = mean(y[index])
es

alpha = 0.01
esnormal(alpha,mu=mean(y),sigma=sd(y))

qt01 = qt(alpha,df=nuhat)
-(muhat+sigmahat*(dt(qt01,df=nuhat)/0.01)*((nuhat+qt01^2)/(nuhat-1)))

index = y < quantile(y,alpha)
mean(y[index])

alpha = 0.001
esnormal(alpha,mu=mean(y),sigma=sd(y))
qt001 = qt(alpha,df=nuhat)
-(muhat+sigmahat*(dt(qt001,df=nuhat)/alpha)*((nuhat+qt001^2)/(nuhat-1)))
index = y < quantile(y,alpha)
mean(y[index])

y = tsmc.2r
nuhat = param2[3]
muhat = param2[1]
sigmahat = param2[2]

alpha = 0.05
var1 = varnormal(alpha,mu=0,sigma=1,lower.tail=T)
esnormal(alpha,mu=mean(y),sigma=sd(y))
mean(y)-sd(y)*dnorm(var1)/alpha
qt05 = qt(0.05,df=nuhat)
-(muhat+sigmahat*(dt(qt05,df=nuhat)/0.05)*((nuhat+qt05^2)/(nuhat-1)))
index = y < quantile(y,alpha)
es = mean(y[index])
es

alpha = 0.01
esnormal(alpha,mu=mean(y),sigma=sd(y))
qt01 = qt(alpha,df=nuhat)
-(muhat+sigmahat*(dt(qt01,df=nuhat)/0.01)*((nuhat+qt01^2)/(nuhat-1)))
index = y < quantile(y,alpha)
mean(y[index])

alpha = 0.001
esnormal(alpha,mu=mean(y),sigma=sd(y))
qt001 = qt(alpha,df=nuhat)
-(muhat+sigmahat*(dt(qt001,df=nuhat)/alpha)*((nuhat+qt001^2)/(nuhat-1)))
index = y < quantile(y,alpha)
mean(y[index])

y = tsmc.5r
nuhat = param5[3]
muhat = param5[1]
sigmahat = param5[2]

alpha = 0.05
var1 = varnormal(alpha,mu=0,sigma=1,lower.tail=T)
esnormal(alpha,mu=mean(y),sigma=sd(y))
mean(y)-sd(y)*dnorm(var1)/alpha
qt05 = qt(0.05,df=nuhat)
-(muhat+sigmahat*(dt(qt05,df=nuhat)/0.05)*((nuhat+qt05^2)/(nuhat-1)))
index = y < quantile(y,alpha)
es = mean(y[index])
es

alpha = 0.01
esnormal(alpha,mu=mean(y),sigma=sd(y))
qt01 = qt(0.01,df=nuhat)
-(muhat+sigmahat*(dt(qt01,df=nuhat)/0.01)*((nuhat+qt01^2)/(nuhat-1)))
index = y < quantile(y,alpha)
mean(y[index])

alpha = 0.001
esnormal(alpha,mu=mean(y),sigma=sd(y))
qt001 = qt(0.001,df=nuhat)
-(muhat+sigmahat*(dt(qt001,df=nuhat)/0.001)*((nuhat+qt001^2)/(nuhat-1)))
index = y < quantile(y,alpha)
mean(y[index])

y = tsmc.10r
nuhat = param10[3]
muhat = param10[1]
sigmahat = param10[2]
alpha = 0.05
var1 = varnormal(alpha,mu=0,sigma=1,lower.tail=T)
esnormal(alpha,mu=mean(y),sigma=sd(y))
mean(y)-sd(y)*dnorm(var1)/alpha
qt05 = qt(0.05,df=nuhat)
-(muhat+sigmahat*(dt(qt05,df=nuhat)/0.05)*((nuhat+qt05^2)/(nuhat-1)))
index = y < quantile(y,alpha)
es = mean(y[index])
es

alpha = 0.01
esnormal(alpha,mu=mean(y),sigma=sd(y))
qt01 = qt(0.01,df=nuhat)
-(muhat+sigmahat*(dt(qt01,df=nuhat)/0.01)*((nuhat+qt01^2)/(nuhat-1)))
index = y < quantile(y,alpha)
mean(y[index])

alpha = 0.001
esnormal(alpha,mu=mean(y),sigma=sd(y))
qt001 = qt(0.001,df=nuhat)
-(muhat+sigmahat*(dt(qt001,df=nuhat)/0.001)*((nuhat+qt001^2)/(nuhat-1)))
index = y < quantile(y,alpha)
mean(y[index])


y = tsmc.2r
esnormal(alpha,mu=mean(y),sigma=sd(y))
-4.380815*sqrt(2)
y = tsmc.5r
esnormal(alpha,mu=mean(y),sigma=sd(y))
-4.380815*sqrt(5)
