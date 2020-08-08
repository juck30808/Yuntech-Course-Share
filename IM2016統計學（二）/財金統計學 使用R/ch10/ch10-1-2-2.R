# multivariate normal distribution
# Using QRM library
library(QRM)
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
twi.r = 100*diff(log(收盤價_TW))
y = tsmc.r
x = twi.r
data = cbind(x,y)
model3 = fit.norm(data)
model3

apply(data,2,mean) # 計算行之平均數
T = length(y)
apply(data,2,var)*((T-1)/T)
cov(data, )*((T-1)/T) # 計算共變數矩陣

?fit.norm
ll = function(par)
{ 
  mux = par[1]
  muy = par[2]
  sigma0 = c(par[3],par[4],par[4],par[5])
  sigma = matrix(sigma0,2,2)
  mean(dmnorm(data,mu=c(mux,muy),Sigma=sigma, log=T)) # 注意以平均數表示
}
omega = cov(data)
start = c(mean(y),mean(x),var(y),cov(y,x),var(x))
model4 = optim(start,ll ,hessian = TRUE,method="BFGS",control=list(fnscale=-1))
model4
model4$par
model3$Sigma

# 黑森矩陣為負定?
H = model4$hessian
H11 = H[1,1]
H11
H22 = H[1:2,1:2]
det(H22) # 行列式
H33 = H[1:3,1:3]
det(H33)
H44 = H[1:4,1:4]
det(H44)
H55 = H[1:5,1:5]
det(H55)


# 計算標準誤
# 負的黑森矩陣就是訊息矩陣
# 負的黑森矩陣倒數 (訊息矩陣的倒數)
H = model4$hessian #以平均數表示
Inform = -H
invI = 1/Inform
T = length(tsmc.r)
se = sqrt(invI/T)
se = diag(se)
se
sd(x)/sqrt(T)
sd(y)/sqrt(T)

# Using mvtnorm library
library(mvtnorm)
lla = function(par)
{ 
  mux = par[1]
  muy = par[2]
  sigma0 = c(par[3],par[4],par[4],par[5])
  sigma = matrix(sigma0,2,2)
  sum(dmvnorm(data,mean=c(mux,muy),sigma=sigma, log=T)) # 注意以總和表示
}
omega = cov(data)
start = c(mean(y),mean(x),var(y),cov(y,x),var(x))
model5 = optim(start,lla ,hessian = TRUE,method="BFGS",control=list(fnscale=-1))
model5
model5$par
model3$Sigma
model4$par
?dmvnorm
zx = (x-mean(x))/sd(x)
zy = (y-mean(y))/sd(y)
cor(zx,zy)
data1 = cbind(zy,zx)
llb = function(par)
{ 
  mux = 0
  muy = 0
  sigma0 = c(1,par[1],par[1],1)
  sigma = matrix(sigma0,2,2)
  sum(dmvnorm(data1,mean=c(mux,muy),sigma=sigma, log=T))
}
start = 0.5
model6 = optim(start,llb,hessian = TRUE,method="BFGS",control=list(fnscale=-1))
model6
# 計算標準誤
H = model6$hessian/T
Inform = -H
invI = 1/Inform
se = sqrt(invI/T)
se = diag(se)
se

y = tsmc.r
x = twi.r
 
x = seq(min(x),max(x),length=100)
y = seq(min(y),max(y),length=100)
mu = model3$mu
sigma = model3$Sigma
fXY = function(x,y) dmvnorm(cbind(x,y),mean=mu,sigma=sigma,log=F)
Z = outer(x,y,fXY)
windows()
persp(x,y,Z, theta=-30, phi=30, ticktype="simple",lwd=2)
windows()
image(x,y,Z,col = topo.colors(12),lwd=2)
contour(x,y,Z,add=T,lwd=2)

# 計算區域機率
# Using mvtnorm library
library(mvtnorm)
model3
mu = model3$mu
sigma = model3$Sigma
y = tsmc.r
x = twi.r
data = cbind(y,x)
summary(y)
summary(x)
# -1.15% < y < 1.15%
# -1% < x < 1%
?pmvnorm
pmvnorm(lower=c(-1,-1.15),upper=c(1,1.15),mean=mu,sigma=sigma)

# Computing VaR and ES
# normal VaR 
mu.hat = apply(data,2,mean)
sigma.hat = apply(data,2,sd)
q.05.norm = mu.hat + sigma.hat*qnorm(0.05)
q.01.norm = mu.hat + sigma.hat*qnorm(0.01)
q.05.norm 
q.01.norm

# normal ES
es.05.norm = -(mu.hat + sigma.hat*dnorm(qnorm(0.05))/0.05)
es.01.norm = -(mu.hat + sigma.hat*dnorm(qnorm(0.01))/0.01)
es.05.norm
es.01.norm

# portfolio p
# 70%TSMC, 30%TWI
# 視p為一個資產
p = 0.7*y+0.3*x
mup = mean(p)
sdp = sd(p)
q.05.norm.p = mup + sdp*qnorm(0.05)
q.01.norm.p = mup + sdp*qnorm(0.01)
q.05.norm.p
q.01.norm.p

# normal ES
es.05.norm.p = -(mup + sdp*dnorm(qnorm(0.05))/0.05)
es.01.norm.p = -(mup + sdp*dnorm(qnorm(0.01))/0.01)
es.05.norm.p
es.01.norm.p

# 比較
0.7*q.05.norm[1]+0.3*q.05.norm[2]
0.7*q.01.norm[1]+0.3*q.01.norm[2]
q.05.norm.p
q.01.norm.p

0.7*es.05.norm[1]+0.3*es.05.norm[2]
0.7*es.01.norm[1]+0.3*es.01.norm[2]
es.05.norm.p
es.01.norm.p

# 利用二元常態估計
model3
mup = model3$mu
sigmap = model3$Sigma
w = matrix(c(0.3,0.7),2,1)
muphat = mup%*%w
sigmaphat = t(w)%*%sigmap%*%w
muphat
mean(p)
var(p)
sigmaphat





