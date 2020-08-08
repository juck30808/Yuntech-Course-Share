# 1-1-1
# ex2
x = seq(-5,5,length=100)
fx = function(x) -x^2 + 2*x - 4
fxp = function(x) x^2 - 2*x + 4 # -fx
windows()
par(mfrow=c(2,1))
plot(x,fx(x),type="l",lwd=2)
re = optimize(fxp,interval=c(-5,5))
abline(v=re$minimum,lty=2)
abline(h=-re$objective,lty=2)
plot(x,fxp(x),type="l",lwd=2)
re = optimize(fxp,interval=c(-5,5))
abline(v=re$minimum,lty=2)
abline(h=re$objective,lty=2)

# ex3
x = seq(-2, 2, by = 0.0001)
f.x = fx(x)
ind = which(f.x == max(f.x))
c(x[ind],f.x[ind])
 
# 1-2
# ex1
library(quantmod)
gold1 = getMetals(c("gold","XAU"),base.currency = "CHF",
            from="2011-01-01",to="2015-06-30") # 以瑞士法郎計價
gold1
gprice1 = XAUCHF
ex = getFX("USD/CHF",from="2011-01-01",to="2015-06-30")
ex
usd = USDCHF
head(gprice1)
head(usd)
tail(gprice1)
tail(usd)
windows()
par(mfrow=c(2,1))
plot(usd,ylab="",main="美元價位 (以瑞士法郎表示) 之時間走勢")
plot(gprice1,ylab="",main="黃金價位 (以瑞士法郎表示) 之時間走勢")

y = 100*diff(log(as.numeric(gprice1))) # 
x = 100*diff(log(as.numeric(usd)))
cor(x,y)
data = cbind(x,y)
library(QRM)
model1 = fit.norm(data)
model1
library(mvtnorm)
lla = function(par)
{ 
  mux = par[1]
  muy = par[2]
  sigma0 = c(par[3],par[4],par[4],par[5])
  sigma = matrix(sigma0,2,2)
  sum(dmvnorm(data,mean=c(mux,muy),sigma=sigma, log=T))
}
omega = cov(data)
start = c(mean(y),mean(x),var(y),cov(y,x),var(x))
model2 = optim(start,lla ,hessian = TRUE,method="BFGS",control=list(fnscale=-1))
model2
model2$par
model1$Sigma

# 黑森矩陣為負定?
T = length(y)
H = model2$hessian/T
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
H = model2$hessian/T
Inform = -H
invI = 1/Inform
se = sqrt(invI/T)
se = diag(se)
se

x = seq(-2,2,length=100)
y = seq(-2,2,length=100)
mu = model1$mu
sigma = model1$Sigma
fXY = function(x,y) dmvnorm(cbind(x,y),mean=mu,sigma=sigma,log=F)
Z = outer(x,y,fXY)
windows()
persp(x,y,Z, theta=-30, phi=30, ticktype="simple",main="黃金與美元日報酬率之聯合常態PDF")
       
windows()
image(x,y,Z,col = topo.colors(12),lwd=2)
contour(x,y,Z,add=T,lwd=2)

# ex3
y = 100*diff(log(as.numeric(gprice1))) # 
x = 100*diff(log(as.numeric(usd)))
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
model3 = optim(start,llb,hessian = TRUE,method="BFGS",control=list(fnscale=-1))
model3

# 計算標準誤
T = length(zx)
H = model3$hessian/T
Inform = -H
invI = 1/Inform
se = sqrt(invI/T)
se = diag(se)
se
Z = (model3$par-0.5)/se
Z

# ex4
# 計算區域機率
# Using mvtnorm library
library(mvtnorm)
model1
mu = model1$mu
sigma = model3$Sigma
pmvnorm(lower=c(-2,-2),upper=c(2,2),mean=mu,sigma=sigma)

# ex5
# portfolio p
# 70%Gold, 30%USD
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

# ex6
gold2 = getMetals(c("gold","XAU"),base.currency = "TWD",
            from="2011-01-01",to="2015-06-30") # 以新台幣計價
gprice2 = XAUTWD
ex = getFX("USD/TWD",from="2011-01-01",to="2015-06-30")
ntd = USDTWD
windows()
par(mfrow=c(2,1))
plot(ntd,ylab="",main="美元價位 (以新台幣表示) 之時間走勢")
plot(gprice2,ylab="",main="黃金價位 (以新台幣表示) 之時間走勢")
y = 100*diff(log(as.numeric(gprice2))) # 
x = 100*diff(log(as.numeric(ntd)))
cor(x,y)

# 1-3
# ex3
library(quantmod)
gold1 = getMetals(c("gold","XAU"),base.currency = "CHF",
            from="2011-01-01",to="2015-06-30") # 以瑞士法郎計價
gold1
gprice1 = XAUCHF
ex = getFX("USD/CHF",from="2011-01-01",to="2015-06-30")
ex
usd = USDCHF
gold2 = getMetals(c("gold","XAU"),base.currency = "TWD",
            from="2011-01-01",to="2015-06-30") # 以新台幣計價
gprice2 = XAUTWD
ex = getFX("USD/TWD",from="2011-01-01",to="2015-06-30")
ntd = USDTWD
y = 100*diff(log(as.numeric(gprice2))) # 
x = 100*diff(log(as.numeric(ntd)))
y1 = 100*diff(log(as.numeric(gprice1))) # 
x1 = 100*diff(log(as.numeric(usd)))

n = 200
w = seq(-0.5,1.5,length=n)
mu = numeric(n)
sigma = numeric(n)
mu1 = numeric(n)
sigma1 = numeric(n)
for(j in 1:n)
{
 p = w[j]*x + (1-w[j])*y
 mu[j] = mean(p)
 sigma[j] = sd(p)
 p1 = w[j]*x1 + (1-w[j])*y1
 mu1[j] = mean(p1)
 sigma1[j] = sd(p1)
}
windows()
plot(sigma,mu,type="l",xlab=expression(sigma),ylab=expression(mu),main="黃金與美元有效的資產組合",lwd=2)
lines(sigma1,mu1,lty=2,col="red")
legend("topright",c("以新台幣計價","以瑞士法郎計價"),lty=1:2,col=c("black","red"),lwd=2,bty="n")


# 1-2
# ex1
# ex2
fx = function(x) exp(-x) + x^4
x = seq(-3,4,length=100)
windows()
plot(x,fx(x),type="l",lwd=2)

f1 = function(x) -exp(-x) + 4*x^3
f2 = function(x) exp(-x) + 12*x^2
x = c(0.5,rep(1,9))
for(i in 1:9)
{
x[i+1] = x[i] - f1(x[i])/f2(x[i])
}
data.frame(x,fx(x),f1(x),f2(x))

# ex3
library(maxLik)
loglik = function(param) {
  mu = param[1]
  sigma = param[2]
  ll = sum(dnorm(x,mu,sigma,log=T))
}
N = 1000
x = rnorm(N,1,2) # use mean=1, sd=2
model = maxNR(loglik, start=c(0,1)) # 使用錯的期初值
model
summary(model)
modela = maxLik(loglik, start=c(0,1))
summary(modela)
#估計的標準誤
H = model$hessian/N
Inform = -H
invI = 1/Inform
se = sqrt(invI/N)
diag(se)

activePar(model)
# 只允許第二個參數值變動
modela = maxNR(loglik, start=1:2, activePar=c(FALSE,TRUE))
summary(modela) # result should be around (1,0)
activePar(modela)

#
modelb = maxNR(loglik, start=c(0,1), print.level=2)
summary(modelb)
numericHessian(loglik, t0=c(1,2))


# ex4
library(mvtnorm)
library(maxLik)
y = 100*diff(log(as.numeric(gprice2))) # 
x = 100*diff(log(as.numeric(ntd)))
data = cbind(x,y)
llt = function(par)
{ 
  mux = par[1]
  muy = par[2]
  sigma0 = c(par[3],par[4],par[4],par[5])
  sigma = matrix(sigma0,2,2)
  sum(dmvt(data,delta=c(mux,muy),sigma=sigma, df=par[6], log=T))
}
start = c(mean(y),mean(x),var(y),cov(y,x),var(x),5)
modelc = maxNR(llt,start=start)
summary(modelc)
modeld = maxLik(llt,start=start)
summary(modeld)

# 2-2
# ex1

LLa = numeric(10)
theta0 = matrix(rep(0,40),20,2)
model = lm(y~x-1) # 不包含常數項之簡單迴歸估計
res = residuals(model)
s2 = sum(res*res)/(T-1)
theta0[1,1] = 0.1  # beta1之期初值 # 或使用as.numeric(coef(model)[1])
theta0[1,2] = 1 # sigma2之期初值 # 或使用s2
for(i in 2:20)
{
  beta  = theta0[(i-1),1]
  sig2  = abs(theta0[(i-1),2]) 
  G = matrix(c(0,0),2,1)
  G[1,1] = sum((y-beta*x)*x)/sig2
  G[2,1] = -0.5*T/sig2 + 0.5*sum((y-beta*x)^2)/sig2^2
  invI = matrix(c(0,0,0,0),2,2)
  invI[1,1] = sig2/sum(x^2)
  invI[1,2] = 0
  invI[2,1] = 0
  invI[2,2] = (2*sig2^2)/T
  theta0[i,] = theta0[(i-1),] + invI%*%G
  LLa[i] = -0.5*log(2*pi)-0.5*log(theta0[i,2])-
           0.5*mean((y-theta0[i,1]*x)*2)/theta0[i,2]
}
LLa
theta0

# ex2
library(maxLik)
n = 100  
#T = length(x)
beta1 = 0.5
sigma2 = 2
set.seed(123)
x = rnorm(n)
#set.seed(1234)
y = beta1*x+sqrt(sigma2)*rnorm(n)
u = y-beta1*x
LL = function(theta)
{
 beta1 = theta[1]
 sigma2 = theta[2]
 dnorm(u,mean=0,sd=sqrt(sigma2),log=T)
}
Grad = function(theta)
{
 beta1 = theta[1]
 sigma2 = theta[2]
 G = cbind(u*x/sigma2,-1/sigma2 + (u^2)/(2*sigma2^2))
 return(G)
}
b1 = as.numeric(coef(lm(y~x-1)))
res = residuals(lm(y~x-1))
s2 = sum(res^2)/(n-1)
thetahat = c(b1,s2)
modelc = maxBHHH(LL,start=thetahat)
modelc
summary(modelc)
modeld = maxLik(logLik=LL,grad=Grad, start = thetahat,method="BHHH")
summary(modeld)



library(fGarch)
x = garchSim(garchSpec(model=list(omega = 0.1,alpha =0.15, beta= 0.8),rseed=100),n=1000)
mu = mean(x)
# 計算對數概似函數
garch_loglik = function(theta)
{
# 參數值
alpha0 = theta[1]
alpha1 = theta[2]
beta1 = theta[3]
# Volatility and loglik initialisation
loglik = 0
h = var(x)
# Start of the loop
for (i in 2:length(x))
   {
       h = alpha0 + alpha1*(x[i-1])^2+beta1*h
       loglik = loglik + dnorm(x[i],mu,sqrt(h),log=TRUE)
   }
print(theta) # 列出所有的估計參數值
return(-loglik)
}
#參數值有上下限之BFGS方法
theta0 = c(0.2,0.2,0.7) # 期初值
optim(theta0, garch_loglik, gr = NULL, method = "L-BFGS-B",lower=c(0,0,0),upper=c(1,1,1))
garchFit(~garch(1,1),data = x)

# ex4

# 計算對數概似函數
garcht_loglik = function(theta)
{
# 參數值
alpha0 = theta[1]
alpha1 = theta[2]
beta1 = theta[3]
nu = theta[4]
# 期初值
loglik = 0
h = var(x)
# Start of the loop
for (i in 2:length(x))
   {
       h = alpha0 + alpha1*(x[i-1])^2+beta1*h
       loglik = loglik + dstd(x[i],mean = mu,sd = sqrt(h),nu = nu,log=TRUE)
   }
print(theta) # 列出所有的估計參數值
return(-loglik)
}
#參數值有上下限之BFGS方法
theta0 = c(0.2,0.2,0.7,4) # 期初值
optim(theta0, garcht_loglik, gr = NULL, method = "L-BFGS-B",lower=c(0,0,0,2),upper=c(1,1,1,Inf))
garchFit(~garch(1,1),data = x, cond.dist="std")

# 3-1
# ex1
library(fGarch)
x = garchSim(garchSpec(model=list(omega = 0.1,alpha =0.15, beta= 0.8),rseed=100),n=1000)
mu = mean(x)
# 計算對數概似函數
garch_loglik = function(theta)
{
# 參數值
alpha0 = theta[1]
alpha1 = theta[2]
beta1 = theta[3]
# Volatility and loglik initialisation
loglik = 0
h = var(x)
# Start of the loop
for (i in 2:length(x))
   {
       h = alpha0 + alpha1*(x[i-1])^2+beta1*h
       loglik = loglik + dnorm(x[i],mu,sqrt(h),log=TRUE)
   }
print(theta) # 列出所有的估計參數值
return(-loglik)
}
#參數值有上下限之BFGS方法
theta0 = c(0.2,0.2,0.7) # 期初值
optim(theta0, garch_loglik, gr = NULL, method = "L-BFGS-B",lower=c(0,0,0),upper=c(1,1,1))
garchFit(~garch(1,1),data = x)
optim(theta0,garch_loglik)

# ex2
# 計算對數概似函數
garcht_loglik = function(theta)
{
# 參數值
alpha0 = theta[1]
alpha1 = theta[2]
beta1 = theta[3]
nu = theta[4]
# 期初值
loglik = 0
h = var(x)
# Start of the loop
for (i in 2:length(x))
   {
       h = alpha0 + alpha1*(x[i-1])^2+beta1*h
       loglik = loglik + dstd(x[i],mean = mu,sd = sqrt(h),nu = nu,log=TRUE)
   }
print(theta) # 列出所有的估計參數值
return(-loglik)
}
#參數值有上下限之BFGS方法
theta0 = c(0.2,0.2,0.7,4) # 期初值
optim(theta0, garcht_loglik, gr = NULL, method = "L-BFGS-B",lower=c(0,0,0,2),upper=c(1,1,1,Inf))
garchFit(~garch(1,1),data = x, cond.dist="std")
optim(theta0,garcht_loglik)

# ex3
fxy = function(x,y) 2.5*(x-1)^2 + 5*y^2
x = seq(-5,5,length=100)
y = seq(-5,5,length=100)
z = outer(x,y,fxy)
windows()
persp(x,y,z, theta=-30, phi=30,ticktype="detailed")

# 計算最小值
fx = function(x) 2.5*(x[1]-1)^2 + 5*x[2]^2
optim(c(0,0),fx)

# ex4
library(maxLik)
nfx = function(x) -2.5*(x[1]-1)^2 - 5*x[2]^2
maxNM(start=c(0,0),nfx)

# 3-2
# ex1,2
N = 10000
T = 200
mu = 2
sigma2 = 4
nxbar = numeric(N)
for(i in 1:N)
{
 x = rnorm(T,mu,sqrt(sigma2))
 nxbar[i] = 1/mean(x)
}
mean(nxbar) # 可與1/mu=2比較
var(nxbar)
# "真實的"變異數
(1/mu^4)*(sigma2/T)
stand = (nxbar-1/mu)/sd(nxbar)
windows()
plot(density(stand),lwd=2)
lines(sort(stand),dnorm(sort(stand)),lty=2,lwd=2,col="red")

# ex3
library(mvtnorm)
sigma = matrix(c(5,3,3,4),2,2)
sigma
sigmaxy = sigma[2,1]
sigma2x = sigma[1,1]
sigma2y = sigma[2,2]
rxy = sigmaxy/(sqrt(sigma2x)*sqrt(sigma2y))
rxy # 約為0.6708
mux = 1
muy = 2
# 利用可列斯基拆解模擬出二相關序列
X = rmvnorm(n=500, mean=c(1,2), sigma=sigma, method="chol")
# colnames(X) = c("x","y")
colMeans(X)
var(X)
# 計算xbar/ybar之變異數
sigmaxybar = (1/muy^2 )*(sigma2x/T) + (mux^2/muy^4)*(sigma2y/T) - 
       2*(mux/muy^3)*rxy*(sqrt(sigma2x)*sqrt(sigma2y))/T
sigmaxybar
xbar = colMeans(X)[1]
xbar
ybar = colMeans(X)[2]
ybar
sxy = var(X)[2,1]
s2x = var(X)[1,1]
s2y = var(X)[2,2]
rsxy = sxy/(sqrt(s2x)*sqrt(s2y))
# 計算xbar/ybar之變異數
sxybar = (1/ybar^2 )*(s2x/T) + (xbar^2/ybar^4)*(s2y/T) - 
            2*(xbar/ybar^3)*rsxy*(sqrt(s2x)*sqrt(s2y))/T
sxybar

# ex5
N = 10000
T = 500
xybar = numeric(N)
sxybar = numeric(N)
for(i in 1:N)
{
X = rmvnorm(n=T, mean=c(1,2), sigma=sigma, method="chol")
xbar = colMeans(X)[1]
ybar = colMeans(X)[2]
sxy = var(X)[2,1]
s2x = var(X)[1,1]
s2y = var(X)[2,2]
rsxy = sxy/(sqrt(s2x)*sqrt(s2y))
# 計算xbar/ybar之變異數
sxybar[i] = (1/ybar^2 )*(s2x/T) + (xbar^2/ybar^4)*(s2y/T) - 
            2*(xbar/ybar^3)*rsxy*(sqrt(s2x)*sqrt(s2y))/T
xybar[i] = xbar/ybar
}
mean(xybar)
mux/muy
windows()
par(mfrow=c(2,1))
plot(density(xybar),xlab=expression(bar(x)/bar(y)),lwd=2,main=expression(paste(bar(x)/bar(y),"的抽樣分配")))
standxybar = (xybar-mux/muy)/sqrt(sxybar)
plot(density(standxybar),xlab="",main="上圖標準化後之分配",lwd=2)
lines(sort(standxybar),dnorm(sort(standxybar)),lty=2,col="red",lwd=2)



# 本章習題
# ex1
S0 = 21
K = 20
r = 0.1
sigma = 0.2345
t = 0.25 # 以年表示
d1 = (log(S0/K)+(r+sigma^2/2)*t)/(sqrt(t)*sigma)
d2 = d1 - sigma*sqrt(t)
C = S0*pnorm(d1)-(K*exp(-r*t))*pnorm(d2)
C

# ex2
# 波動率與C之間的關係
sigma = seq(0.05,0.65,length=100)
d1 = (log(S0/K)+(r+sigma^2/2)*t)/(sqrt(t)*sigma)
d2 = d1 - sigma*sqrt(t)
C1 = S0*pnorm(d1)-(K*exp(-r*t))*pnorm(d2)
windows()
plot(sigma,C1,type="l",lwd=2,xlab=expression(sigma),ylab="買權價格",main="波動率與買權價格之間的關係")
K = 21
d1 = (log(S0/K)+(r+sigma^2/2)*t)/(sqrt(t)*sigma)
d2 = d1 - sigma*sqrt(t)
C2 = S0*pnorm(d1)-(K*exp(-r*t))*pnorm(d2)
lines(sigma,C2,lty=2,lwd=2,col="red")
r = 0.2
K = 20
d1 = (log(S0/K)+(r+sigma^2/2)*t)/(sqrt(t)*sigma)
d2 = d1 - sigma*sqrt(t)
C3 = S0*pnorm(d1)-(K*exp(-r*t))*pnorm(d2)
lines(sigma,C3,lty=2,lwd=3,col="blue")
abline(h=C,v=0.2345,lty=30)
legend("topleft",c("其他情況不變","其他情況不變,K減少","其他情況不變,r上升"),lty=1:3,col=c("black",
       "red","blue"),lwd=2,bty="n")

# ex3
# 波動率之期初值
sigma = 0.10
sig = rep(0,20)
sig[1] = sigma
# Newton-Raphson method:
for(i in 2:100){
d1 = (log(S0/K)+(r+sigma^2/2)*t)/(sigma*sqrt(t))
d2 = d1-sigma*sqrt(t)
f = S0*pnorm(d1)-K*exp(-r*t)*pnorm(d2)-C
# d1對sigma微分
d1prime = (sqrt(t)/2)-(log(S0/K)+r*t)/(sqrt(t)*sigma^2)
# d2對sigma微分
d2prime = d1prime-sqrt(t)
# f對sigma微分
fprime = S0*dnorm(d1)*d1prime-K*exp(-r*t)*dnorm(d2)*d2prime
# 更新 sigma:
sigma = sigma - f/fprime
sig[i] = sigma
if(abs(sig[i]-sig[i-1]) < 0.00000001){sig = sig[1:i]; break}
}
sig

# ex5
# 殖利率的計算
F = 100000
intr = 0.1
disr = c(0.1,0.08,0.12) # 貼現率
I = F*intr # 利息
dis = 1+disr
P = I/dis + I/dis^2 + I/dis^3 + I/dis^4 + I/dis^5 + I/dis^6 + I/dis^7 + I/dis^8 + 
    I/dis^9 + (I+F)/dis^10
P

# ex6
disr = seq(0.05,0.4,length=100)
dis = 1+disr
P1 = I/dis + I/dis^2 + I/dis^3 + I/dis^4 + I/dis^5 + I/dis^6 + I/dis^7 + I/dis^8 + 
    I/dis^9 + (I+F)/dis^10
windows()
plot(disr,P1,type="l",xlab="殖利率",ylab="債券價格",main="債券價格與殖利率之間的關係",lwd=2)
intr = 0.15
I = F*intr # 利息
P2 = I/dis + I/dis^2 + I/dis^3 + I/dis^4 + I/dis^5 + I/dis^6 + I/dis^7 + I/dis^8 + 
    I/dis^9 + (I+F)/dis^10
lines(disr,P2,lty=2,lwd=2,col="red")
intr = 0.05
I = F*intr # 利息
P3 = I/dis + I/dis^2 + I/dis^3 + I/dis^4 + I/dis^5 + I/dis^6 + I/dis^7 + I/dis^8 + 
    I/dis^9 + (I+F)/dis^10
lines(disr,P3,lty=3,lwd=2,col="blue")
abline(h=P[2],v=0.08,lty=30)
legend("topright",c("票面利率:10%","票面利率:15%","票面利率:5%"),lty=1:3,lwd=2,col=c("black","red","blue"),
       bty="n")

# ex7
F = 100000
intr = 0.1
disr = seq(0.05,0.4,length=1000000) # 殖利率
I = F*intr # 利息
P = function(dis) I/dis + I/dis^2 + I/dis^3 + I/dis^4 + I/dis^5 + I/dis^6 + I/dis^7 + I/dis^8 + 
    I/dis^9 + (I+F)/dis^10
dis = 1+disr
#P(dis)
P1 = round(P(dis),0)
ind = which(113420 == P1)
disr[ind]

# ex8
price = 113420.16
disr = seq(0.05,0.4,length=100)
PA = function(dis) I/dis + I/dis^2 + I/dis^3 + I/dis^4 + I/dis^5 + I/dis^6 + I/dis^7 + I/dis^8 + 
    I/dis^9 + (I+F)/dis^10
dis = 1+disr
PA(dis)
yield = spline(PA(dis),disr,xout=price)
yield
windows()
plot(PA(dis),disr,type="l",lwd=2,xlab="債券價格",ylab="殖利率",main="債券價格與殖利率之間的關係")
abline(v=price,lty=30)
abline(h=yield,lty=30)

# ex9
# Daily TSMC
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\finstats\\ch4\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))
library(fBasics)
basicStats(tsmc.r)
# TWI
# 1/4/2000-7/10/2014
TWI = read.table("c:\\meiyih\\finstats\\ch4\\TWI1.txt",header=T)
attach(TWI)
names(TWI)
twi.r = 100*diff(log(T收盤價))
basicStats(twi.r)
indx = tsmc.r >= 2
p1 = mean(as.numeric(indx))
p1
# 二種計算標準差的方法
T = length(tsmc.r)
sd(as.numeric(indx))/sqrt(T)
sqrt(p1*(1-p1)/T)
xbar = p1
s2x = var(as.numeric(indx))
indy = twi.r >= 2
p2 = mean(as.numeric(indy))
p2
# 樣本相關係數
rsxy = cor(as.numeric(indx),as.numeric(indy))
# xbar/ybar
p1/p2
ybar = p2
s2y = p2*(1-p2)
sxybar = (1/ybar^2 )*(s2x/T) + (xbar^2/ybar^4)*(s2y/T) - 
            2*(xbar/ybar^3)*rsxy*(sqrt(s2x)*sqrt(s2y))/T
sxybar
# H0: ratio = 1
N1 = ((xbar/ybar)-1)/sqrt(sxybar)
N1
# H0: ratio = 2
N2 = ((xbar/ybar)-2)/sqrt(sxybar)
N2
2*(1-pnorm(N2))
 
# ex11
library(fGarch)
N = 10000
df = c(3,5,10,20)
xbar = matrix(4*N,N,4)
sigma = matrix(4*N,N,4)
for(j in 1:4)
{
for(i in 1:N)
  {
    x = rstd(1000,mean=2,sd=3,nu=df[j])
    model = stdFit(x)
    sigma[i,j] = as.numeric(model$par[2])
    xbar[i,j] = sd(x)
  }
}
var1 = apply(xbar,2,var)
var2 = apply(sigma,2,var)
bias1 = apply(xbar,2,mean) - 3
bias2 = apply(sigma,2,mean) - 3
MSE1 = bias1^2 + var1
MSE2 = bias2^2 + var2
MSE1
MSE2
windows()
par(mfrow=c(2,2))
for(j in 1:4)
{
plot(density(xbar[,j]),xlab=expression(hat(sigma)),lwd=2,
     main=paste("t分配標準差之估計,自由度 = ",df[j]))
lines(density(sigma[,j]),col="red",lwd=2,lty=2)
#legend("topright",c("以樣本標準差估計","以MLE估計"),lty=1:2,lwd=2,col=c("black",
       #"red"),bty="n")
}

# ex12,14
library(quantmod)
gold2 = getMetals(c("gold","XAU"),base.currency = "TWD",
            from="2011-01-01",to="2015-06-30") # 以新台幣計價
gprice2 = XAUTWD
ex = getFX("USD/TWD",from="2011-01-01",to="2015-06-30")
usd = USDTWD
windows()
par(mfrow=c(2,1))
plot(usd,ylab="",main="美元價位 (以新台幣表示) 之時間走勢")
plot(gprice2,ylab="",main="黃金價位 (以新台幣表示) 之時間走勢")
y = 100*diff(log(as.numeric(gprice2))) # 
x = 100*diff(log(as.numeric(usd)))
cor(x,y)

library(fGarch)
T = length(y)
# t分配估計黃金
modeltg = stdFit(y)
modeltg
loglik_stdg = function(beta) sum(- dstd(y, mean = beta[1],
      sd = beta[2], nu = beta[3], log = TRUE))
start = c(mean(y),sd(y),4)
fit_stdg = optim(start, loglik_stdg, hessian = T,
      method = "L-BFGS-B", lower = c(-0.1, 0.01, 2.1))
fit_stdg
AIC_stdg = 2*fit_stdg$value + 2 * 3
BIC_stdg = 2*fit_stdg$value + log(T) * 3
sd_stdg = sqrt(diag(solve(fit_stdg$hessian)))
fit_stdg$par
sd_stdg
AIC_stdg
BIC_stdg
 
modeltus = stdFit(x)
modeltus
loglik_stdus = function(beta) sum(- dstd(x, mean = beta[1],
      sd = beta[2], nu = beta[3], log = TRUE))
start = c(mean(x),sd(x),4)
fit_stdus = optim(start, loglik_stdus, hessian = T,
      method = "L-BFGS-B", lower = c(-0.1, 0.01, 2.1))
fit_stdus
AIC_stdus = 2*fit_stdus$value + 2 * 3
BIC_stdus = 2*fit_stdus$value + log(T) * 3
sd_stdus = sqrt(diag(solve(fit_stdus$hessian)))
fit_stdus$par
sd_stdus
AIC_stdus
BIC_stdus

# FS偏態t分配
modelFSg = sstdFit(y)
modelFSg
modelFSus = sstdFit(x)
modelFSus
loglik_sstdg = function(beta) sum(- dsstd(y, mean = beta[1],
      sd = beta[2], nu = beta[3], xi = beta[4], log = TRUE))
start = c(mean(y), sd(y), 5, 1)
fit_sstdg = optim(start, loglik_sstdg, hessian = T,
      method = "L-BFGS-B", lower = c(-0.1, 0.01, 2.1, -2))
fit_sstdg
AIC_sstdg = 2*fit_sstdg$value + 2 * 4
BIC_sstdg = 2*fit_sstdg$value + log(T) * 4
sd_sstdg = sqrt(diag(solve(fit_sstdg$hessian)))
fit_sstdg$par
sd_sstdg
AIC_sstdg
BIC_sstdg

loglik_sstdus = function(beta) sum(- dsstd(x, mean = beta[1],
      sd = beta[2], nu = beta[3], xi = beta[4], log = TRUE))
start = c(mean(x), sd(x), 5, 1)
fit_sstdus = optim(start, loglik_sstdus, hessian = T,
      method = "L-BFGS-B", lower = c(-0.1, 0.01, 2.1, -2))
fit_sstdus
AIC_sstdus = 2*fit_sstdus$value + 2 * 4
BIC_sstdus = 2*fit_sstdus$value + log(T) * 4
sd_sstdus = sqrt(diag(solve(fit_sstdus$hessian)))
fit_sstdus$par
sd_sstdus
AIC_sstdus
BIC_sstdus

# ex13
# try w = 0.7
library(fGarch)
w = 0.7
port = w*x+(1-w)*y
modela = stdFit(port)
modela
thetahat = as.numeric(modela$par)
nu = thetahat[3]
nu
sigma2 = thetahat[2]^2
sigma2
var(port)
mean(port)
mu = thetahat[1]
mu

n = 500
w = seq(-2,2,length=n)
mu = numeric(n)
sigma = numeric(n)
mu1 = numeric(n)
sigma1 = numeric(n)
nuhat = numeric(n)
for(j in 1:n)
{
 p = w[j]*x + (1-w[j])*y
 mu[j] = mean(p)
 sigma[j] = sd(p)
 model = stdFit(p)
 thetahat = as.numeric(model$par)
 mu1[j] = thetahat[1]
 sigma1[j] = thetahat[2]
 nuhat[j] = thetahat[3]
}
windows()
par(mfrow=c(2,1))
plot(sigma,mu,type="l",xlab=expression(sigma),ylab=expression(mu),lwd=2,xlim=c(0,4),
    ylim=c(-0.05,0.05),main="黃金與美元 (以新台幣計價)之資產組合")
lines(sigma1,mu1,lty=2,lwd=2,col="red")
legend(3,-0.01,c("以樣本統計量計算","MLE之估計"),lty=1:2,col=c("black","red"),lwd=2,bty="n")
plot(nuhat,type="l",xlab="",ylab=expression(nu),main="估計的自由度",ylim=c(1.5,3))
abline(h=2,lty=2)

# ex15
n = 500
w = seq(-2,2,length=n)
mu = numeric(n);sigma = numeric(n);mu1 = numeric(n);
sigma1 = numeric(n);mu2 = numeric(n);sigma2 = numeric(n);
nuhat1 = numeric(n);nuhat2 = numeric(n)
for(j in 1:n)
{
 p = w[j]*x + (1-w[j])*y
 mu[j] = mean(p)
 sigma[j] = sd(p)
 loglik_std = function(beta) sum(- dstd(p, mean = beta[1],
      sd = beta[2], nu = beta[3], log = TRUE))
 start = c(mean(p),sd(p),4)
 fit_std1 = optim(start, loglik_std, hessian = T,
      method = "L-BFGS-B", lower = c(-0.1, 0.01, 2.1))
 fit_std2 = optim(start, loglik_std, hessian = T,
      method = "L-BFGS-B", lower = c(-0.1, 0.01, 3))
 thetahat1 = as.numeric(fit_std1$par)
 thetahat2 = as.numeric(fit_std2$par)
 mu1[j] = thetahat1[1];sigma1[j] = thetahat1[2];
 mu2[j] = thetahat2[1];sigma2[j] = thetahat2[2];
 nuhat1[j] = thetahat1[3];nuhat2 = thetahat2[3]
}
windows()
par(mfrow=c(2,1))
plot(sigma,mu,type="l",xlab=expression(sigma),ylab=expression(mu),
    lwd=2,xlim=c(0,3.5),ylim=c(-0.06,0.06),main="黃金與美元 (以新台幣計價)之資產組合")
lines(sigma1,mu1,lty=2,lwd=2,col="red")
lines(sigma2,mu2,lty=3,lwd=2,col="blue")
legend(2.7,0,c("以樣本統計量計算","MLE:自由度最小值為 2.1","MLE:自由度最小值為 3"),lty=1:3,
      col=c("black","red","blue"),lwd=2,bty="n")
plot(nuhat1,type="l",xlab="",ylab=expression(nu),main="估計的自由度",ylim=c(2,5))
abline(h=3,lty=2,lwd=2)
legend("topleft",c("自由度最小值為2.1","自由度最小值為3"),lty=1:2,lwd=2,bty="n")

 








library(quantmod)
gold1 = getMetals(c("gold","XAU"),base.currency = "CHF",
            from="2011-01-01",to="2015-06-30") # 以瑞士法郎計價
gold1
gprice1 = XAUCHF
ex = getFX("USD/CHF",from="2011-01-01",to="2015-06-30")
ex
usd = USDCHF
gold2 = getMetals(c("gold","XAU"),base.currency = "TWD",
            from="2011-01-01",to="2015-06-30") # 以新台幣計價
gprice2 = XAUTWD
ex = getFX("USD/TWD",from="2011-01-01",to="2015-06-30")
ntd = USDTWD
y = 100*diff(log(as.numeric(gprice2))) # 
x = 100*diff(log(as.numeric(ntd)))
y1 = 100*diff(log(as.numeric(gprice1))) # 
x1 = 100*diff(log(as.numeric(usd)))



