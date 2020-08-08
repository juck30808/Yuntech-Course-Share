# multivariate normal distribution
# Using QRM library
library(QRM)
# ch 6
# Daily TSMC and TWI
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch6\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(Μ絃基))
twi = read.table("c:\\meiyih\\Finstats\\ch6\\TWI.txt", header=T)
attach(twi)
names(twi)
twi.r = 100*diff(log(Μ絃基_TW))
y = tsmc.r
x = twi.r
data = cbind(x,y)
model3 = fit.norm(data)
model3

apply(data,2,mean) # 璸衡︽ぇキА计
T = length(y)
apply(data,2,var)*((T-1)/T)
cov(data, )*((T-1)/T) # 璸衡跑计痻皚

?fit.norm
ll = function(par)
{ 
  mux = par[1]
  muy = par[2]
  sigma0 = c(par[3],par[4],par[4],par[5])
  sigma = matrix(sigma0,2,2)
  mean(dmnorm(data,mu=c(mux,muy),Sigma=sigma, log=T))# 猔種キА计ボ
}
omega = cov(data)
start = c(mean(y),mean(x),var(y),cov(y,x),var(x))
model4 = optim(start,ll ,hessian = TRUE,method="BFGS",control=list(fnscale=-1))
model4
model4$par
model3$Sigma
