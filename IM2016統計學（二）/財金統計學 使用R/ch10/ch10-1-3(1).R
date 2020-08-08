library(QRM)
# Daily TSMC and TWI
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch6\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))
twi = read.table("c:\\meiyih\\Finstats\\ch6\\TWI.txt", header=T)
attach(twi)
names(twi)
twi.r = 100*diff(log(收盤價_TW))
y = tsmc.r
x = twi.r
data = cbind(x,y)
model3 = fit.norm(data)
model3

# Scatter plot of TSMC and TWI
windows()
par(mfrow=c(1,2))
plot(x,y,type="p",xlab="TWI",ylab="TSMC",main="TSMC與TWI日對數報酬率序列之間的散佈圖",lwd=2)
abline(v=-4,lty=2,col="red")
abline(v=4,lty=2,col="red")
abline(h=-5,lty=2,col="red")
abline(h=5,lty=2,col="red")

T = length(x)
model3
mu.M = model3$mu
sigma.M = model3$Sigma
simu = rmvnorm(T,mean=mu.M,sigma=sigma.M)
plot(simu[,1],simu[,2],type="p",xlab="模擬值",ylab="模擬值",main="依估計之二元常態分配模擬",lwd=2) 
abline(v=-4,lty=2,col="red")
abline(v=4,lty=2,col="red")
abline(h=-5,lty=2,col="red")
abline(h=5,lty=2,col="red")

# 二元變數t分配
model7 = fit.mst(data,method="BFGS")
model7
numt = model7$df
sigma.mt = model7$Sigma
cov.mt = model7$covariance
num = model7$df
(num/(num-2))*sigma.mt # 等於共變異數矩陣 cov.mt
apply(data,2,mean)
model7$mu

# 單一變數t分配
library(MASS)
modelt = fitdistr(y,"t")
summary(modelt)
modelt$estimate
modelt$sd
modelt$vcov
mean(y)
nu = as.numeric(modelt$estimate[3])
lambda = as.numeric(modelt$estimate[2])
(nu/(nu-2))*lambda^2
T = length(y)
var(y)*((T-1)/T)

# log likelihood function
library(mvtnorm)
?dmvt
llt = function(par)
{ 
  mux = par[1]
  muy = par[2]
  sigma0 = c(par[3],par[4],par[4],par[5])
  sigma = matrix(sigma0,2,2)
  sum(dmvt(data,delta=c(mux,muy),sigma=sigma, df=par[6], log=T))
}
omega = cov(data)
start = c(mean(y),mean(x),var(y),cov(y,x),var(x),5)
model8 = optim(start,llt ,hessian = TRUE,method="BFGS",control=list(fnscale=-1))
model8
model8$par
model7$mu
sigma.mt
num


# 計算TSMC之風險值
thetahat = as.numeric(modelt$estimate)
thetahat
mu = thetahat[1] # estimated location parameter
lambda = thetahat[2] # estimated scale parameter
nu = thetahat[3] # estimated df
# classic t quantiles
qt05 = qt(0.05, df=nu)
qt01 = qt(0.01, df=nu)
# Estimated t Quantiles for TSMC
VaRt05 = mu + lambda*qt05
VaRt01 = mu + lambda*qt01
VaRt05
VaRt01

# 計算TWI之風險值
x = twi.r
modelta = fitdistr(x,"t")
modelta
thetahata = as.numeric(modelta$estimate)
thetahata
mua = thetahata[1] # estimated location parameter
lambdaa = thetahata[2] # estimated scale parameter
nua = thetahata[3] # estimated df
# classic t quantiles
qt05 = qt(0.05, df=nua)
qt01 = qt(0.01, df=nua)
# Estimated t Quantiles for TWI
VaRt05a = mua + lambdaa*qt05
VaRt01a = mua + lambdaa*qt01
VaRt05a
VaRt01a

# 資產組合P
data2 = 0.7*y+0.3*x
modeltb = fitdistr(data2,"t")
modeltb
mub = thetahatb[1] # estimated location parameter
lambdab = thetahatb[2] # estimated scale parameter
nub = thetahatb[3] # estimated df
# classic t quantiles
qt05 = qt(0.05, df=nub)
qt01 = qt(0.01, df=nub)
# Estimated t Quantiles for TSMC
VaRt05b = mub + lambdab*qt05
VaRt01b = mub + lambdab*qt01
VaRt05b
VaRt01b

# 二元變數t分配
numt = model7$df
sigma.mt = model7$Sigma
mumt = model7$mu
qt05 = qt(0.05, df=numt)
qt01 = qt(0.01, df=numt)
w = matrix(c(0.7,0.3),2,1)
mu = mumt%*%w
lambda = sqrt(t(w)%*%sigma.mt%*%w)
VaRt05m = mu + lambda*qt05
VaRt01m = mu + lambda*qt01
VaRt05m
VaRt01m

# TSMC:ES
summary(modelt)
thetahat = as.numeric(modelt$estimate)
mut = thetahat[1]
lambdat = thetahat[2]
nut = thetahat[3]

# 計算t分配之ES
# mu + lambda*(f(qt(alpha))/alpha)*((nu+qt(alpha)^2)/(nu-1))
qt05 = qt(0.05,df=nut)
qt01 = qt(0.01,df=nut)
-(mut+lambdat*(dt(qt05,df=nut)/0.05)*((nut+qt05^2)/(nut-1)))
-(mut+lambdat*(dt(qt01,df=nut)/0.01)*((nut+qt01^2)/(nut-1)))

# TWI:ES
summary(modelta)
thetahata = as.numeric(modelta$estimate)
muta = thetahata[1]
lambdata = thetahata[2]
nuta = thetahata[3]
# 計算t分配之ES
# mu + lambda*(f(qt(alpha))/alpha)*((nu+qt(alpha)^2)/(nu-1))
qt05 = qt(0.05,df=nuta)
qt01 = qt(0.01,df=nuta)
-(muta+lambdata*(dt(qt05,df=nuta)/0.05)*((nuta+qt05^2)/(nuta-1)))
-(muta+lambdata*(dt(qt01,df=nuta)/0.01)*((nuta+qt01^2)/(nuta-1)))

# portfolio P:ES
numt = model7$df
sigma.mt = model7$Sigma
mumt = model7$mu
qt05 = qt(0.05, df=numt)
qt01 = qt(0.01, df=numt)
w = matrix(c(0.7,0.3),2,1)
mu = mumt%*%w
lambda = sqrt(t(w)%*%sigma.mt%*%w)
# 計算t分配之ES
# mu + lambda*(f(qt(alpha))/alpha)*((nu+qt(alpha)^2)/(nu-1))
qt05 = qt(0.05,df=numt)
qt01 = qt(0.01,df=numt)
-(mu+lambda*(dt(qt05,df=numt)/0.05)*((numt+qt05^2)/(numt-1)))
-(mu+lambda*(dt(qt01,df=numt)/0.01)*((numt+qt01^2)/(numt-1)))







