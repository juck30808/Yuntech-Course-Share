# ex
# 1-1-1
# ex1
library(fGarch)
x = rstd(100,mean=0,sd=1,nu=5)
windows()
plot(x,type="p",lwd=2)

# ex2
qstd(0.01,mean=0,sd=1,nu=5)
qstd(0.99,mean=0,sd=1,nu=5)

# ex3
x = rstd(100,mean=0.5,sd=2,nu=8)

# ex4
qt(0.01,5)
qt(0.99,5)

# ex5
pstd(-2,mean=0.5,sd=2,nu=8)

# 2-1
# ex2,3
T = 20
x = 13
p = seq(0.01,0.99,length=100)
lnL = x*log(p) + (T-x)*log((1-p))
windows()
par(mfrow=c(3,1))
plot(p,lnL,type="l",lwd=2,main="二項式分配的對數概似函數",ylim=c(-60,5))
abline(h=max(lnL),lty=2,col="red",lwd=2)
lnL1 = dbinom(x,T,p,log=T) # 注意取過對數
plot(p,lnL1,type="l",lwd=2,ylim=c(-50,10))
abline(h=max(lnL1),lty=2,col="red",lwd=2)
lnL2 = (1/T)*dbinom(x,T,p,log=T)
plot(p,lnL2,type="l",lwd=2,ylim=c(-2.5,0.5))
abline(h=max(lnL2),lty=2,col="red",lwd=2)

# ex5
set.seed(1234)
x = rpois(500,3)
lambda = seq(1,6,length=100)
y = numeric(100)
y1 = numeric(100)
for(i in 1:100)
{
y[i] = sum(dpois(x,lambda[i],log=T))
y1[i] = mean(dpois(x,lambda[i],log=T))
}
windows()
par(mfrow=c(2,1))
plot(lambda,y,type="l",lwd=2,ylim=c(-1600,-900),main="卜瓦松分配之對數概似函數",
     xlab=expression(lambda))
abline(h=max(y),lty=2,col="red")
plot(lambda,y1,type="l",lwd=2,ylim=c(-3,-1.5),xlab=expression(lambda))
abline(h=max(y1),lty=2,col="red")

# ex6


# 2-2
# ex1


# 2-4-2
# ex1
# 1/4/2005-4/28/2015
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
y = 100*diff(log(p))
T = length(y)
library(MASS)
fitnorm = fitdistr(y,"normal")
fitnorm
summary(fitnorm)
fitnorm$estimate
sqrt(diag(fitnorm$vcov))
fitnorm$loglik # 對數概似值
# 常態
mlogN = function(b,x) 
{
 sum(-dnorm(x,mean=b[1],sd=b[2],log = TRUE))
}
b = c(mean(y),sd(y))
start = b
model_N = optim(start, mlogN, x=y, method="BFGS", hessian=T)
model_N
-model_N$value # 與fitnorm$loglik相同
# 檢定
# (39) 式 => thetahat/sqrt(I(-1)/T)
thetahat = model_N$par
H = -model_N$hessian/T #以平均數表示 
Inform = -H
invI = 1/Inform
se = sqrt(diag(invI)/T)
se  # 與sqrt(diag(fitnorm$vcov))相同
thetahat # 與fitnorm比較
# H0:mu=0
# 傳統做法
ybar = mean(y)
sigmahat = sd(y) 
N1 = ybar/(sigmahat/sqrt(T)) # 檢定統計量 
N1
# ML
N2 = thetahat[1]/se[1]
N2
2*(1-pnorm(N2)) # p-value
# H0:sigma=0
sigmahat
thetahat[2]
N3 = thetahat[2]/se[2]
N3
2*(1-pnorm(N3)) # p-value

# ex2
fitt = fitdistr(y,"t")
fitt
summary(fitt)
thetahat = fitt$estimate # 估計的位置,尺度與自由度
se = fitt$sd # 估計的標準誤
# H0: mu = 0 # 母體位置
N1 = thetahat[1]/se[1]
2*(1-pnorm(N1))
# H0: sigma = 0 # 母體尺度
N2 = thetahat[2]/se[2]
2*(1-pnorm(N2))
# H0: nu = 0
N3 = thetahat[3]/se[3]
2*(1-pnorm(N3))

# ex3
library(fGarch)
fitNt = stdFit(y)
summary(fitNt)
fitNt
fitNt$par
fitNt$objective
# 使用optim
mlogt = function(b, x) 
{
 sum(-dstd(x,mean=b[1],sd=b[2],nu = b[3],log = TRUE))
}
b = c(mean(y),sd(y1),3)
start = b
model_t = optim(start, mlogt, x=y, method="BFGS", hessian=T)
model_t
-model_t$value 
thetahat = model_t$par
H = -model_t$hessian/T # 以平均數表示
Inform = -H
invI = 1/Inform
se = sqrt(diag(invI)/T)
se   
thetahat  
# H0: mu = 0
N1 = thetahat[1]/se[1]
2*(1-pnorm(N1))
# H0: sigma = 0
N2 = thetahat[2]/se[2]
2*(1-pnorm(N2))
# H0: nu = 0
N3 = thetahat[3]/se[3]
2*(1-pnorm(N3))

# ex4
summary(y)
# 計算-2%與2%之間的機率
thetahat = fitt$estimate # 估計的位置,尺度與自由度
mu = as.numeric(thetahat[1])
lambda = as.numeric(thetahat[2])
nu = as.numeric(thetahat[3])
upper = (2-mu)/lambda
lower = (-2-mu)/lambda
pt(upper,nu)-pt(lower,nu)

fitNt$par
mu1 = as.numeric(fitNt$par[1])
sigma = as.numeric(fitNt$par[2])
nu1 = as.numeric(fitNt$par[3])
pstd(2,mean=mu1,sd=sigma,nu=nu1)-pstd(-2,mean=mu1,sd=sigma,nu=nu1)

# 變異數(nu/(nu-2))lambda^2
sigma2 = (nu/(nu-2))*lambda^2
sqrt(sigma2)
sd(y)
sigma




# 3-1
# ex1
library(quantmod)
gold = getMetals(c("gold","XAU"),from="2011-01-01",to="2015-06-30")
gold
gprice = XAUUSD
ex = getFX("USD/EUR",from="2011-01-01",to="2015-06-30")
ex 
eur = USDEUR
ex1 = getFX("USD/CNY",from="2011-01-01",to="2015-06-30")
ex1
cny = USDCNY
ex2 = getFX("USD/JPY",from="2011-01-01",to="2015-06-30")
ex2
jpy = USDJPY
windows()
par(mfrow=c(2,2))
plot(gprice,main="黃金價格之時間走勢")
plot(eur,main="美元兌歐元匯率之時間走勢")
plot(cny,main="美元兌人民幣匯率之時間走勢")
plot(jpy,main="美元兌日圓匯率之時間走勢")
library(fBasics)
y1 = as.numeric(gprice)
y1r = 100*diff(log(y1))
basicStats(y1r)
y2 = as.numeric(eur)
y2r = 100*diff(log(y2))
basicStats(y2r)
y3 = as.numeric(cny)
y3r = 100*diff(log(y3))
basicStats(y3r)
y4 = as.numeric(jpy)
y4r = 100*diff(log(y4))
basicStats(y4r)

all = cbind(gprice,eur,cny,jpy)
write.table(all,"c:\\meiyih\\Finstats\\ex\\ch9\\gold.txt")

# ex2
library(fGarch)
?rsnorm

# ex3
# 1981:1-2015:5
CPI = read.table("c:\\meiyih\\finstats\\ex\\ch1\\cpi.txt")
cpi = CPI[,1]
T = length(cpi)
T
infl = 100*((cpi[13:T]-cpi[1:(T-12)])/cpi[1:(T-12)])
library(fGarch)
library(fBasics)
basicStats(infl)
model = snormFit(infl)
model 
y = infl
T = length(y)
mlogsn = function(b, x) 
{
 sum(-dsnorm(x,mean=b[1],sd=b[2],xi = b[3],log = TRUE))
}
b = c(mean(y),sd(y),1)
start = b
model_sn = optim(start, mlogsn, x=y, method="BFGS", hessian=T)
model_sn
-model_sn$value 
thetahat = model_sn$par
H = -model_sn$hessian # 以平均數表示
Inform = -H
invI = 1/Inform
se = sqrt(diag(Inform)/T)
se   
thetahat  
# H0: mu = 0
N1 = thetahat[1]/se[1]
2*(1-pnorm(N1))
# H0: sigma = 0
N2 = thetahat[2]/se[2]
2*(1-pnorm(N2))
# H0: xi = 0
N3 = thetahat[3]/se[3]
2*(1-pnorm(N3))
windows()
par(mfrow=c(2,1))
plot(density(y),type="l",ylab="",xlab="",main="通貨膨脹率序列偏態常態分配")
param = model$par
x = sort(infl)
T = length(x)
x1 = seq(min(x), max(x), length=T)
lines(x1, dsnorm(x1,mean=param[1],sd=param[2],xi=param[3]),lwd=2,
       lty=2,col="red")
grid = (1:T)/(T+1)
qqplot(x,qsstd(grid,mean=param[1],sd=param[2],xi=param[3]), lwd=2,
       xlab="",ylab="", main="QQ plot")
q1 = qsnorm(c(0.25,0.75), mean=param[1],sd=param[2],xi=param[3])
lmfit1 = lm(q1~quantile(y,c(0.25,0.75)))
abline(lmfit1)

# 3-3
# ex2
library(SkewHyperbolic)
tsmctwi = read.table("c:\\meiyih\\Finstats\\ch9\\tsmctwi.txt",header=T)
names(tsmctwi)
attach(tsmctwi)
p1 = TSMC # 收盤價
# TSMC與t分配
# 不重疊 k=10
n = length(p1)
n
y2 = p1[11:n]
n = length(y2)
m = n/11
y10r = numeric(m)
for(i in 1:m)
{
h = 11*i 
j = 11*(i-1)+1
y10r[i] = (log(y2[h])-log(y2[j]))*100
}
fit = stdFit(y10r)
fit
param = fit$par
param[1]+param[2]*qstd(0.01,mean=param[1],sd=param[2],nu=param[3])
param[1]+param[2]*qstd(0.001,mean=param[1],sd=param[2],nu=param[3])
fit1 = sstdFit(y10r)
fit1
param1 = fit1$estimate
param1[1]+param1[2]*qsstd(0.01,mean=param1[1],sd=param1[2],nu=param1[3],xi=param1[4])
param1[1]+param1[2]*qsstd(0.001,mean=param1[1],sd=param1[2],nu=param1[3],xi=param1[4])
fit2 = skewhypFit(y10r)
fit2
param2 = fit2$param
param2[1]+param2[2]*qskewhyp(0.01,mu=param2[1],delta=param2[2],beta=param2[3],nu=param2[4])
param2[1]+param2[2]*qskewhyp(0.001,mu=param2[1],delta=param2[2],beta=param2[3],nu=param2[4])

# ex3
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
p = as.numeric(cny)
# LARGAN與t分配
# 不重疊 
k=10
n = length(p)
n
y2 = p[(k+1):n]
n = length(y2)
m = n/(k+1)
y10r = numeric(m)
for(i in 1:m)
{
h = (k+1)*i 
j = (k+1)*(i-1)+1
y10r[i] = (log(y2[h])-log(y2[j]))*100
}
windows()
par(mfcol=c(2,3))
plot(density(y10r),type="l",ylab="",xlab="",main="LARGAN (k=5) (不重疊), 實際與t分配",lwd=2)
fit = stdFit(y10r)
fit
param = fit$par
x = sort(y10r)
T = length(x)
x1 = seq(min(x), max(x), length=T)
lines(x1, dstd(x1,mean=param[1],sd=param[2],nu=param[3]),lty=2,col="red",lwd=2)
grid = (1:T)/(T+1)
qqplot(x,qstd(grid,mean=param[1],sd=param[2],nu=param[3]),lwd=2,
       xlab="",ylab="", main="QQ plot")
q1 = qstd(c(0.25,0.75), mean=param[1],sd=param[2],nu=param[3])
lmfit1 = lm(q1~quantile(y10r,c(0.25,0.75)))
abline(lmfit1)
basicStats(y10r)
model1 = fit
model1
AIC1 = -2*model1$objective + 2*3
BIC1 = -2*model1$objective + log(T)*3
AIC1
BIC1

# 與FS偏態t分配
# 不重疊 k=10
#windows()
#par(mfcol=c(2,1))
plot(density(y10r),type="l",ylab="",xlab="",main="LARGAN (k=5) (不重疊), 實際與FS偏態t分配",lwd=2)
fit = sstdFit(y10r)
fit
param = fit$estimate
x = sort(y10r)
T = length(x)
x1 = seq(min(x), max(x), length=T)
lines(x1, dsstd(x1,mean=param[1],sd=param[2],nu=param[3],xi=param[4]),lwd=2,
       lty=2,col="red")
grid = (1:T)/(T+1)
qqplot(x,qsstd(grid,mean=param[1],sd=param[2],nu=param[3],xi=param[4]),lwd=2,
       xlab="",ylab="", main="QQ plot")
q1 = qsstd(c(0.25,0.75), mean=param[1],sd=param[2],nu=param[3],xi=param[4])
lmfit1 = lm(q1~quantile(y10r,c(0.25,0.75)))
abline(lmfit1)
model2 = fit
model2
AIC2 = -2*model2$minimum + 2*4
BIC2 = -2*model2$minimum + log(T)*4
AIC2
BIC2

# 與GH偏態t分配
# 不重疊 k=10

#windows()
#par(mfcol=c(2,1))
plot(density(y10r),type="l",ylab="",xlab="",main="LARGAN (k=5) (不重疊), 實際與GH偏態t分配",lwd=2)
fit = skewhypFit(y10r)
fit
param = fit$param
x = sort(y10r)
T = length(x)
x1 = seq(min(x), max(x), length=T)
lines(x1, dskewhyp(x1,mu=param[1],delta=param[2],beta=param[3],nu=param[4]),lwd=2,
       lty=2,col="red")
grid = (1:T)/(T+1)
qqplot(x,qskewhyp(grid,mu=param[1],delta=param[2],beta=param[3],nu=param[4]),lwd=2,
       xlab="",ylab="", main="QQ plot")
q1 = qskewhyp(c(0.25,0.75), mu=param[1],delta=param[2],beta=param[3],nu=param[4])
lmfit1 = lm(q1~quantile(y10r,c(0.25,0.75)))
abline(lmfit1)
model3 = fit
summary(model3)
like = model3$maxLik
like
AIC3 = 2*(like) + 2*4
BIC3 = 2*(like) + log(T)*4
AIC3
BIC3
AIC1
AIC2
BIC1
BIC2

# 4-1
# ex1
# ARCH(1) Model
p1 = TSMC # 收盤價
tsmcr = 100*diff(log(p1))
library(fGarch)
model = garchFit(~garch(1,0),data=tsmcr,include.mean=F)# 不包括平均數方程式之常數項
summary(model)
?garchFit
res = model@residuals
sigmahat = model@sigma.t
resS = res/sigmahat # 標準化
#診斷
Box.test(resS,lag=5, type="Ljung-Box")
Box.test(resS, lag=10, type="Ljung-Box")
Box.test(resS,lag=15, type="Ljung-Box")
Box.test(resS^2, lag=10, type="Ljung-Box")
Box.test(resS^2, lag=20, type="Ljung-Box")
# ARCH test
# order 1 # 再試其他
k = 1
resall = embed(resS,k+1)
e = resall[,1]^2
e1 = resall[,2]^2
#e2 = resall[,3]^2
summary(lm(e~e1)) # summary(lm(e~e1+e2))
R2 = 0.001065 # R2 = 0.02748
T = length(e)
chi = (T-k)*R2
chi
1-pchisq(chi,k)
F = (R2/k)/((1-R2)/(T-k-1))
F
1-pf(F,k,(T-k-1))

# ex2
model2 = garchFit(~garch(4,0),data=tsmcr,include.mean=F)
summary(model2)
?garchFit
fit = model2@fit$matcoef
fit
thetahat = fit[,1] # 第1行
thetahat
persist = sum(thetahat[2:5]) # 持續性
persist
as.numeric(thetahat[1]/(1-persist)) # 非條件變異數
sigma2hat = model2@h.t # 條件變異數
windows()
plot(sigma2hat,type="l",ylab=expression(sigma[t]^2),main="ARCH(4)之估計的條件變異數")

# 4-2
# ex1
# 1/3/2005- 4/28/2015
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
head(p)
length(p) # 2557
y = 100*diff(log(p))
model1 = garchFit(~garch(1,1),data=y,include.mean=F)
summary(model1)
sigmathat = model1@sigma.t
vol = sigmathat*sqrt(250)
head(vol)
length(vol) # 2556
windows()
plot(vol,type="l",ylab="波動率",lwd=2,main="以GARCH(1,1)估計而得之大立光波動率")
points(1691,vol[1691],lwd=4,col="red") # 10/25/2011
points(971,vol[971],lwd=4,col="red") # 10/4/2008
text(1691,vol[1691],labels="10/25/2011",pos=3)
text(971,vol[971],labels="10/4/2008",pos=4)
write.table(vol,"c:\\meiyih\\Finstats\\ex\\ch9\\vol.txt") #存檔

# ex7
library(quantmod)
gold = getMetals(c("gold","XAU"),from="2011-01-01",to="2015-06-30")
gold
gprice = XAUUSD
gprice = as.numeric(gprice)
gr = 100*diff(log(gprice))
model2 = garchFit(~garch(1,1),data=gr,include.mean=F)
summary(model2)
vol = sqrt(250)*model2@sigma.t
windows()
plot(vol,type="l",ylab="波動率",lwd=2,main="以GARCH(1,1)估計而得之黃金波動率")

# 4-3
# ex1
p1 = TSMC # 收盤價
p2 = TWI # 收盤價
tsmcr = 100*diff(log(p1))
twir = 100*diff(log(p2))
spec1 = ugarchspec(variance.model=list(model="sGARCH",garchOrder=c(1,1))
         ,mean.model=list(armaOrder=c(1,1),include.mean=T),
         distribution.model = "norm")
model1 = ugarchfit(spec1,data=tsmcr)
model1
# ex2
spec1 = ugarchspec(variance.model=list(model="sGARCH",garchOrder=c(1,1))
         ,mean.model=list(armaOrder=c(0,0),include.mean=F),
        distribution.model = "norm")
spec2 = ugarchspec(variance.model=list(model="gjrGARCH",garchOrder=c(1,1))
         ,mean.model=list(armaOrder=c(0,0),include.mean=F),
        distribution.model = "norm")
model.1 = ugarchfit(spec1,data=tsmcr)
model.1
model.2 = ugarchfit(spec2,data=tsmcr)
model.2
model.3 = ugarchfit(spec1,data=twir)
model.3
model.4 = ugarchfit(spec2,data=twir)
model.4

# 訊息衝擊曲線
ni3 = newsimpact(z=NULL,model.3)
ni4 = newsimpact(z=NULL,model.4)
windows()
plot(ni3$zx, ni3$zy, ylab=ni3$yexpr, xlab=ni3$xexpr, type="l", lwd=2,ylim=c(2,8),
      main = "訊息衝擊曲線")
lines(ni4$zx, ni4$zy,lty=2,col="red",lwd=2)
legend("top",c("GARCH(1,1)","GJRGARCH(1,1)"),lty=1:2,col=c("black","red"),bty="n",lwd=2)

# ex4
spec1 = ugarchspec(variance.model=list(model="sGARCH",garchOrder=c(1,1))
         ,mean.model=list(armaOrder=c(0,0),include.mean=F),
        distribution.model = "norm")
spec2 = ugarchspec(variance.model=list(model="gjrGARCH",garchOrder=c(1,1))
         ,mean.model=list(armaOrder=c(0,0),include.mean=F),
        distribution.model = "norm")
model.3 = ugarchfit(spec1,data=twir)
model.3
model.4 = ugarchfit(spec2,data=twir)
model.4
?ugarchfit
vol1 = sigma(model.3)
vol2 = sigma(model.4)
head(vol1)
head(vol2)
vol1 = as.numeric(vol1)*sqrt(250)
vol2 = as.numeric(vol2)*sqrt(250)
windows()
par(mfrow=c(2,1))
plot(vol1,type="l",ylab="波動率",lwd=2,main="以GARCH(1,1)估計而得之TWI波動率")
plot(vol2,type="l",ylab="波動率",lwd=2,main="以GJRGARCH(1,1)估計而得之TWI波動率")


# 本章習題

# 
# ex4
# 9/5/1994-7/10/2014
tsmctwi = read.table("c:\\meiyih\\Finstats\\ch9\\tsmctwi.txt",header=T)
names(tsmctwi)
attach(tsmctwi)
p1 = TSMC # 收盤價
p2 = TWI # 收盤價
tsmcr = 100*diff(log(p1))
twir = 100*diff(log(p2))
exch = read.table("c:\\meiyih\\Finstats\\ch6\\exch.txt",header=T)
attach(exch)
names(exch)
e1 = 新台幣
exr = 100*diff(log(e1))
y = tsmcr[1:length(tsmcr)]
y1 = twir[1:length(twir)]
y2 = exr[1:length(exr)]
library(rugarch)
args(ugarchfit)
?ugarchfit
spec1 = ugarchspec(variance.model=list(model="sGARCH",garchOrder=c(1,1)),
       mean.model=list(armaOrder=c(0,0),include.mean=F,archm=F,archpow=2),
       distribution.model = "norm")
model1 = ugarchfit(spec1,data=y)
model1
coef(model1)
persistence(model1)
residuals(model1,standardize=T) 
halflife(model1)

spec1a = ugarchspec(variance.model=list(model="sGARCH",garchOrder=c(1,1)),
       mean.model=list(armaOrder=c(0,0),include.mean=F,archm=F,archpow=2),
       distribution.model = "std")
model1a = ugarchfit(spec1a,data=y)
model1a
coef(model1a)
persistence(model1a)
residuals(model1a,standardize=T) 
halflife(model1a)
b = as.numeric(coef(model1a))
n = 1+(log(1/2)/(log(b[2]+b[3])))
n

# ex5
sigma2 = as.numeric(sigma(model1))
sigma2^2
max(sigma2^2)
coef(model1)
b = as.numeric(coef(model1))
#unconditional variance
b[1]/(1-(b[2]+b[3]))

sigma2a = as.numeric(sigma(model1a))
sigma2a^2
max(sigma2a^2)
coef(model1a)
ba = as.numeric(coef(model1a))
#unconditional variance
ba[1]/(1-(ba[2]+ba[3]))

# ex6
# ARCH-M Model
library(rugarch)
spec2 = ugarchspec(variance.model=list(model="sGARCH",garchOrder=c(8,0)),
       mean.model=list(armaOrder=c(0,0),include.mean=T,archm=T,archpow=2),
       distribution.model = "norm")
model2 = ugarchfit(spec2,data=y)
model2
coef(model2)
persistence(model2)
res = as.numeric(residuals(model2,standardize=T))
windows()
par(mfrow=c(2,1))
acf(res,lag.max =100)
pacf(res,lag.max =100)
halflife(model2)

# ex 7
# 5/15/1987-8/22/2014
oilw = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\oilw.txt")
oilw = oilw[,1]
windows()
plot(oilw,type="l",lwd=2)
oilwr = 100*diff(log(oilw))
model3 = ugarchfit(spec2,data=oilwr)
model3
# weekly data: 8/5/2002-8/25/2014
nasdaqgoldw = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\nasdaqgold.txt")
nasw = nasdaqgoldw[,1]
goldw = nasdaqgoldw[,2]
windows()
par(mfrow=c(2,1))
plot(nasw,type="l",lwd=2)
plot(goldw,type="l",lwd=2)
naswr = 100*diff(log(nasw))
goldwr = 100*diff(log(goldw))
spec3 = ugarchspec(variance.model=list(model="sGARCH",garchOrder=c(1,1)),
       mean.model=list(armaOrder=c(0,0),include.mean=F,archm=F,archpow=2),
       distribution.model = "std")
model4 = ugarchfit(spec3,data=goldwr)
model4
model5 = ugarchfit(spec3,data=oilwr)
model5

persistence(model4)
persistence(model5)
halflife(model4)
halflife(model5)

# ex8
spec4 = ugarchspec(variance.model=list(model="sGARCH",garchOrder=c(1,1)),
       mean.model=list(armaOrder=c(0,0),include.mean=F,archm=F,archpow=2),
       distribution.model = "std")
model6 = ugarchfit(spec4,data=y)
model6
spec5 = ugarchspec(variance.model=list(model="sGARCH",garchOrder=c(1,1)),
       mean.model=list(armaOrder=c(0,0),include.mean=F,archm=F,archpow=2),
       distribution.model = "sstd")
model7 = ugarchfit(spec5,data=y)
model7
spec6 = ugarchspec(variance.model=list(model="sGARCH",garchOrder=c(1,1)),
       mean.model=list(armaOrder=c(0,0),include.mean=F,archm=F,archpow=2),
       distribution.model = "ghst")
model8 = ugarchfit(spec6,data=y)
model8
LLa = likelihood(model6)
LLb = likelihood(model7)
LLc = likelihood(model8)
chi1 = -2*(LLa-LLb)
chi1
1-pchisq(chi1,1)
chi2 = -2*(LLa-LLc)
chi2
1-pchisq(chi2,1)

# ex9
spec7 = ugarchspec(variance.model=list(model="iGARCH",garchOrder=c(1,1)),
       mean.model=list(armaOrder=c(0,0),include.mean=F,archm=F,archpow=2),
       distribution.model = "norm")
model9 = ugarchfit(spec7,data=y)
model9
spec8 = ugarchspec(variance.model=list(model="iGARCH",garchOrder=c(1,1)),
       mean.model=list(armaOrder=c(0,0),include.mean=F,archm=F,archpow=2),
       distribution.model = "norm",fixed.pars=list(omega=0))
model10 = ugarchfit(spec8,data=y)
model10

# ex10
?dlnorm
x = rlnorm(1000000,0,1)
mean(x)
exp(0.5)
var(x)
exp(1)*(exp(1)-1)
x = rlnorm(100,0,1)
windows()
par(mfrow=c(3,1))
plot(x,type="l",main="對數常態分配之模擬觀察值",lwd=2)
#p = sort(x)
p = seq(0,20,length=100)
plot(p,dlnorm(p,0,1),type="l",ylab="",main="對數常態分配之PDF",ylim=c(0,1.6),lwd=2)
lines(p,dlnorm(p,1,1),lty=2,col="blue",lwd=2)
lines(p,dlnorm(p,-1,1),lty=3,col="red",lwd=2)
d1 = expression(paste(mu==0,",",sigma==1))
d2 = expression(paste(mu==1,",",sigma==1))
d3 = expression(paste(mu==-1,",",sigma==1))
legend("topright",c(d1,d2,d3),lty=1:3,col=c("black","blue","red"),bty="n",lwd=2)
plot(p,dlnorm(p,0,1),ylab="",main="對數常態分配之PDF",type="l",ylim=c(0,1),lwd=2)
lines(p,dlnorm(p,0,1.5),lty=2,col="blue",lwd=2)
lines(p,dlnorm(p,0,0.5),lty=3,col="red",lwd=2)
d1 = expression(paste(mu==0,",",sigma==1))
d2 = expression(paste(mu==0,",",sigma==1.5))
d3 = expression(paste(mu==0,",",sigma==0.5))
legend("topright",c(d1,d2,d3),lty=1:3,col=c("black","blue","red"),bty="n",lwd=2)

# ex11
library(MASS)
model11 = fitdistr(p1,"lognormal")
model11
b = as.numeric(model11$estimate)
b
windows()
hist(p1,breaks=100,prob=T,main="TSMC收盤價之實際與理論")
lines(density(p1),lty=2,col="red")
lines(sort(p1),dlnorm(sort(p1),b[1],b[2]),lty=3,col="blue")
legend("topright",c("實際","理論 (對數常態)"),lty=2:3,col=c("red","blue"),bty="n")


# ex12
# Daily TSMC and TWI
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch6\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))
# Backtesting
# VaR用負值表示
library(fGarch)
y = tsmc.r
T = length(y)			
WE = 250 # estimation window length					
prob = 0.01 # probability					
l1 = WE*prob 	# expected number of violations			
value = 1   # portfolio value		 	
VaR = matrix(nrow=T,ncol=4) # matrix VaR forecast for 4 models	
lambda = 0.94;
s11 = var(y[1:30]);		
for(t in 2:WE) {
  s11 = lambda * s11 + (1-lambda) * y[t-1]^2
}
 
for (t in (WE+1):T){
	t1 = t-WE;								
	t2 = t-1;									
	window = y[t1:t2] 				
	s11	 = lambda * s11  + (1-lambda) * y[t-1]^2
	VaR[t,1] = qnorm(prob) * sqrt(s11) * value 
	VaR[t,2] = sd(window) * qnorm(prob)*value
	ys = sort(window)					
	VaR[t,3] = ys[l1]*value	
	g=garchFit(formula = ~ garch (1,1), window ,trace=FALSE, 
           include.mean=FALSE)
	par=g@fit$matcoef				
	s4=par[1]+par[2]*window[WE]^2+par[3]*g@h.t[WE]
	VaR[t,4] = sqrt(s4) * qnorm(prob) *  value
}
VaR = VaR[(WE+1):T,]
y = y[(WE+1):T]
length(y)
length(VaR[,1])
head(VaR)
T1 = length(y)
# etaMatrix
etaM = matrix(0,T1,4)
for(j in 1:4)
{
  for(i in 1:T1)
    {
      etaM[i,j] = as.numeric(y[i] <= VaR[i,j])
    }
}
v1 = apply(etaM,2,sum) # 行加總,實際違反的次數
v1
prob*T1 # 理論違反的次數
VRio = v1/(prob*T1)
VRio

v0 = T1-v1
v0
phat = v1/T1
phat
# 不受限制之對數概似值
LLU = v0*(1-phat)+v1*phat
LLU
# 受限制之對數概似值
LLR = v0*(1-prob)+v1*prob
LLR
LR = abs(2*(LLU-LLR))
LR
1-pchisq(LR,0.95)


# ex13
# ex12
# Daily TSMC and TWI
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch6\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))
# Backtesting
# VaR用負值表示
library(fGarch)
y = tsmc.r
T = length(y)			
WE = 500 # estimation window length					
prob = 0.01 # probability					
l1 = WE*prob 	# expected number of violations			
value = 1   # portfolio value		 	
VaR = matrix(nrow=T,ncol=4) # matrix VaR forecast for 4 models	
lambda = 0.94;
s11 = var(y[1:30]);		
for(t in 2:WE) {
  s11 = lambda * s11 + (1-lambda) * y[t-1]^2
}
 
for (t in (WE+1):T){
	t1 = t-WE;								
	t2 = t-1;									
	window = y[t1:t2] 
      model = stdFit(window)
      coef = as.numeric(model$par)
      nu = coef[3]
      xbar = coef[1]
      s = coef[2]				
	s11 = lambda*s11+(1-lambda)*y[t-1]^2
	VaR[t,1] = qstd(prob,mean=xbar,sd=s,nu=nu)*sqrt(s11)*value 
	VaR[t,2] = sd(window)*qstd(prob,mean=xbar,sd=s,nu=nu)*value
	ys = sort(window)					
	VaR[t,3] = ys[l1]*value	
	g=garchFit(formula=~garch(1,1),window ,trace=FALSE, 
           include.mean=FALSE)
	par=g@fit$matcoef				
	s4=par[1]+par[2]*window[WE]^2+par[3]*g@h.t[WE]
	VaR[t,4] = sqrt(s4)*qstd(prob,mean=xbar,sd=s,nu=nu)*value
}
VaR = VaR[(WE+1):T,]
y = y[(WE+1):T]
length(y)
length(VaR[,1])
head(VaR)
T1 = length(y)
# etaMatrix
etaM = matrix(0,T1,4)
for(j in 1:4)
{
  for(i in 1:T1)
    {
      etaM[i,j] = as.numeric(y[i] <= VaR[i,j])
    }
}
v1 = apply(etaM,2,sum) # 行加總,實際違反的次數
v1
prob*T1 # 理論違反的次數
VRio = v1/(prob*T1)
VRio

v0 = T1-v1
v0
phat = v1/T1
phat
# 不受限制之對數概似值
LLU = v0*(1-phat)+v1*phat
LLU
# 受限制之對數概似值
LLR = v0*(1-prob)+v1*prob
LLR
LR = (2*(LLU-LLR))
LR
1-pchisq(LR,0.95)






