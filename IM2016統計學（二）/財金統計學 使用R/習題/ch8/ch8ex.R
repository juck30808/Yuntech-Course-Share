# ch8
# 1-1
# ex1
# Monthly TSMC and TWI
# 1/2000-6/2014
tsmcm = read.table("c:\\meiyih\\Finstats\\ch7\\tsmcm.txt", header=T)
attach(tsmcm)
names(tsmcm)
tsmc.r = 100*diff(log(收盤價))
twim = read.table("c:\\meiyih\\Finstats\\ch7\\twim.txt", header=T)
attach(twim)
names(twim)
# interest rates 1/2000-6/2014
# 央行一個月期存款牌告利率01/00-05/14
int = read.table("c:\\meiyih\\Finstats\\ch7\\interestrate.txt")
int = int[,1]
twi.r = 100*diff(log(收盤價_TW))
length(twi.r)
windows()
par(mfrow=c(2,2))
acf(tsmc.r)
acf(twi.r)
pacf(tsmc.r)
pacf(twi.r)

# ex2
# 1982:1-2015:5
infun = read.table("c:\\meiyih\\Finstats\\ex\\ch7\\infun.txt")
inf = infun[,1]
un = infun[,2]
windows()
par(mfrow=c(2,2))
acf(inf,main="通貨膨脹率之估計的自我相關圖",lwd=2)
acf(un,main="失業率之估計的自我相關圖",lwd=2)
pacf(inf,main="通貨膨脹率之估計的偏自我相關圖",lwd=2)
pacf(un,main="失業率之估計的偏自我相關圖",lwd=2)

# ex4
dun = 100*diff(log(un)) # un表示失業率序列
T = length(dun)
duna = dun[2:T] # 二月開始
dunb = dun[1:(T-1)]
summary(lm(duna~dunb))
resa = residuals(lm(duna~dunb))
windows()
par(mfrow=c(2,1))
acf(resa)
pacf(resa)
# 季節虛擬變數
# 1981:1-2015:5
# 共413個觀察值即 (2014-1981+1)*12+5
Q1 = rep(c(1,rep(0,11)),(round(length(un)/12,0)+1))
length(Q1)
Q1 = c(Q1,1,rep(0,4))
length(Q1)
allQ = embed(Q1,13) # Q1之遞延落後1:12期
allQ[1:13,]
Q1 = allQ[,1]
length(Q1)
Q2 = allQ[,2];Q3 = allQ[,3];Q4 = allQ[,4];Q5 = allQ[,5];Q6 = allQ[,6];
Q7 = allQ[,7];Q8 = allQ[,8];Q9 = allQ[,9];Q10 = allQ[,10];Q11 = allQ[,11];
Q12 = allQ[,12];
# try
lm(un~Q1+Q2+Q3+Q4+Q5+Q6+Q7+Q8+Q9+Q10+Q11+Q12-1)
# AR(1)
Q1a = Q1[2:T];Q2a = Q2[2:T];Q3a = Q3[2:T];Q4a = Q4[2:T];Q5a = Q5[2:T];Q6a = Q6[2:T];
Q7a = Q7[2:T];Q8a = Q8[2:T];Q9a = Q9[2:T];Q10a = Q10[2:T];Q11a = Q11[2:T];Q12a = Q12[2:T];
summary(lm(duna~dunb+Q1a+Q2a+Q3a+Q4a+Q5a+Q6a+Q7a+Q8a+Q9a+Q10a+Q11a+Q12a-1))

# 1-2-1
# ex1
# 1961:1-2014:2
GDP = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\GDP.txt")
GDP = GDP[,1]
m = length(GDP)
ya = 100*((GDP[5:m]-GDP[1:(m-4)])/GDP[1:(m-4)])
T = length(ya)
T
trend = 1:T
res = residuals(lm(ya~trend))
# model1 1:31
k = 2
Fp = numeric(148)
F = numeric(148)
for(i in 1:148)
{
n1 = i+30
n2 = T-n1
chya = ya[1:n1]
trend1 = trend[1:n1]
model1 = lm(chya~trend1)
res1 = residuals(model1)
SSE1 = sum(res1*res1)
chyb = ya[(n1+1):n2]
trend1 = trend[(n1+1):n2]
model2 = lm(chyb~trend1)
res2 = residuals(model2)
SSE2 = sum(res2*res2)
SSE = sum(res*res)
Fn = (SSE-SSE1-SSE2)/k
Fd = (SSE1+SSE2)/(n1+n2-2*k)
f = Fn/Fd
F[i] = f
Fp[i] = 1-pf(f,k,n1+n2-2*k)
}
windows()
par(mfrow=c(2,1))
plot(F,type="l",main="F檢定統計量值",lwd=2)
abline(h=0,col="red")
plot(Fp,type="l",main="F檢定統計量值所對應之p值",lwd=2)
abline(h=0.05,col="red")

# ex3
#1/4/2005-4/28/2015
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
x = 100*diff(log(p))
n = length(x)
xa = x[(n-500):n]
n1 = length(xa)
xa1 = xa[2:n1]^2
xa2 = xa[1:(n1-1)]^2
summary(lm(xa1~xa2))
res = residuals(lm(xa1~xa2))
ya1 = xa1[1:250]
yb1 = xa2[1:250]
summary(lm(ya1~yb1))
res1 = residuals(lm(ya1~yb1))
ya2 = xa1[251:500]
yb2 = xa2[251:500]
summary(lm(ya2~yb2))
res2 = residuals(lm(ya2~yb2))
SSEu = sum(res*res)
SSEr = sum(res1*res1)+sum(res2*res2)
F = ((SSEu-SSEr)/2)/(SSEr/(500-4))
F
1-pf(F,2,496)

# ex5
T = length(un)
T
n = 210
unall = embed(un,4)
una = unall[,1]
un1 = unall[,2]
un2 = unall[,3]
un3 = unall[,4]
#un5 = unall[,5]
summary(lm(una~un1))
windows()
plot(una,type="l")
dummy = c(rep(0,n),rep(1,length(una)-n))
summary(lm(una~un1+dummy))
summary(lm(una~un1+dummy*un1+dummy+un2+un2*dummy+un3+un3*dummy))

# 1-2-2
# ex1
x = seq(-3,3,length=100)
y = 1/(1+exp(-x))
windows()
plot(x,y,type="l",lwd=2)
lines(x,pnorm(x),lty=2,col="red",lwd=2)
legend("topleft",c("羅吉斯函數","標準常態之CDF"),lty=1:2,col=c("black","red"),
       lwd=2,bty="n")

# ex2
library(fGarch)
windows()
plot(x,y,type="l",lwd=2)
lines(x,pstd(x,mean=0,sd=1,nu=3),lty=2,lwd=2,col="red")
lines(x,pstd(x,mean=0,sd=1,nu=5),lty=3,lwd=2,col="blue")
lines(x,pstd(x,mean=0,sd=1,nu=10),lty=4,lwd=2,col="green")
legend("topleft",c("羅吉斯函數","標準化t分配之CDF (自由度為3)","標準化t分配之CDF (自由度為5)",
     "標準化t分配之CDF (自由度為10)"),lty=1:4,col=c("black","red","blue","green"),lwd=2,bty="n")


# 2-1
# ex1
#1/4/2005-4/28/2015
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
x = 100*diff(log(p))
xall = embed(x,2)
xa = xall[,1]
xa1 = xall[,2]
modela = lm(xa~xa1)
summary(modela)
resa = residuals(modela)
Box.test(resa,lag=1, type="Ljung-Box")
Box.test(resa, lag=5, type="Ljung-Box")
Box.test(resa,lag=10, type="Ljung-Box")
Box.test(resa, lag=15, type="Ljung-Box")
Box.test(resa, lag=20, type="Ljung-Box")

# 序列相關檢定
library(lmtest)
bgtest(modela,order=1,type="F")
bgtest(modela,order=5,type="F")
bgtest(modela,order=10,type="F")
bgtest(modela,order=15,type="F")
bgtest(modela,order=20,type="F")

# ex3
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
x = 100*diff(log(p))
xall = embed(x,2)
xa = xall[,1]
xa1 = xall[,2]
modela = lm(xa~xa1)
e = residuals(modela)
ea = e[2:length(e)]
e1 = e[1:(length(e)-1)]
xaa1 = xa1[2:length(e)]
summary(lm(ea~xaa1+e1))
R2 = 0.0005818
F = (R2/1)/((1-R2)/(length(ea)-2))
F
1-pf(F,1,length(ea)-2)
bgtest(modela,order=1,type="F")

# ex4
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
x = 100*diff(log(p))
ax = abs(x)
axall = embed(ax,2)
axa = axall[,1]
axa1 = axall[,2]
modela = lm(axa~axa1)
summary(modela)

resa = residuals(modela)
Box.test(resa,lag=1, type="Ljung-Box")
Box.test(resa, lag=5, type="Ljung-Box")
Box.test(resa,lag=10, type="Ljung-Box")
Box.test(resa, lag=15, type="Ljung-Box")
Box.test(resa, lag=20, type="Ljung-Box")

# 序列相關檢定
bgtest(modela,order=1,type="F")
bgtest(modela,order=5,type="F")
bgtest(modela,order=10,type="F")
bgtest(modela,order=15,type="F")
bgtest(modela,order=20,type="F")

# ex6
N = 10000
n = 501
beta0 = 2
beta1 = 0.8
set.seed(123)
b1 = numeric(N)
tstat = numeric(N)
corr = numeric(N)
for(j in 1:N)
{
u = rnorm(n)
x = rnorm(n-1)
u1 = numeric(n)
for(i in 2:n)
{
u1[i] = 0.9*u1[i-1] + u[i]
}
y = beta0 + beta1*x + u1[2:n]
corr[j] = cor(x,u1[2:n])
model = lm(y~x)
b1[j] = coef(model)[2]
tstat[j] = (b1[j]-beta1)/sqrt(diag(vcov(model))[2])
}
windows()
par(mfrow=c(3,1))
plot(density(b1),lwd=2,xlab=expression(b[1]),
      main=expression(paste(b[1],"的抽樣分配")))
plot(density(tstat),lwd=2,xlab="t檢定統計量",main="t檢定統計量的抽樣分配")
t = sort(tstat)
lines(t,dt(t,n-3),lty=2,lwd=2,col="red")
legend("topright",c("估計的t檢定統計量抽樣分配","t分配"),lty=1:2,lwd=2,col=c("black","red"),bty="l")
plot(corr,type="p",ylab="樣本相關係數",ylim=c(0,0.2),main="自變數與誤差項之樣本相關係數")

# ex7
N = 10000
n = 501
beta0 = 2
beta1 = 0.8
set.seed(123)
b1 = numeric(N)
tstat = numeric(N)
for(j in 1:N)
{
u = rnorm(n)
x = u[1:n-1]
u1 = numeric(n)
for(i in 2:n)
{
u1[i] = 0.9*u1[i-1] + u[i]
}
y = beta0 + beta1*x + u1[2:n]
model = lm(y~x)
b1[j] = coef(model)[2]
tstat[j] = (b1[j]-beta1)/sqrt(diag(vcov(model))[2])
}
windows()
par(mfrow=c(2,1))
plot(density(b1),lwd=2,xlab="",main="")
plot(density(tstat),lwd=2,xlab="",main="",ylim=c(0,0.7))
t = sort(tstat)
lines(t,dt(t,n-3),lty=2,lwd=2,col="red")
cor(x,u1[2:n])

# ex8
library(lmtest)
library(sandwich)
N = 10000
n = 1002
beta0 = 0.3
beta1 = 0.5
beta2 = 0.2
b1 = numeric(N)
tstat = numeric(N)
bgpvalue = numeric(N)
for(j in 1:N)
{
y = numeric(n)
for(i in 3:n)
{
 y[i] = beta0 + beta1*y[i-1] + beta2*y[i-2] + rnorm(1)
}
yall = embed(y,3)
ya = yall[,1]
ya1 = yall[,2]
ya2 = yall[,3]
model = lm(ya~ya1)
b1[j] = coef(model)[2]
tstat[j] = (b1[j]-beta1)/sqrt(diag(vcov(model))[2])
# LM檢定之p值,k=1
model1 = bgtest(model,order=1,type="F")
bgpvalue[j] = as.numeric(model1$p.value)
}
windows()
par(mfrow=c(3,1))
plot(density(b1),lwd=2,xlab=expression(b[1]),
      main=expression(paste(b[1],"的抽樣分配")))
points(beta1,0,lwd=4,col="red")
arrows(0.53,8,beta1,0)
text(0.53,8,labels=expression(beta[1]),pos=3)
plot(density(tstat),lwd=2,xlab="t檢定統計量",main="t檢定統計量的抽樣分配",
        xlim=c(-1,10),ylim=c(0,0.5))
t = sort(tstat)
lines(t,dt(t,n-3),lty=2,lwd=2,col="red")
legend("topright",c("估計的t檢定統計量抽樣分配","t分配"),lty=1:2,lwd=2,col=c("black","red"),bty="n")
plot(bgpvalue,type="p",xlab="",ylab="",main="BG之LM檢定之p值 (k=1)")
 
# 2-2
# ex1
library(sandwich)
library(lmtest)
n = 100
beta0 = 2
beta1 = 4
set.seed(1234)
x = rnorm(n,3,2)
u = rnorm(n)
y = beta0 + beta1*x + x*u
model = lm(y~x)
res = residuals(model)
bptest(model)
ones = rep(1,n)
x = cbind(ones,x)
X = matrix(x,n,2)
y = matrix(y,n,1)
res2 = res*res
omegahat = diag(res2)
omegahat1 = t(X)%*%omegahat%*%X
varb = solve(t(X)%*%X)%*%omegahat1%*%solve(t(X)%*%X)
varb
se = sqrt(varb)[2,2]
se
coeftest(model,df = Inf, vcov = vcovHC(model, type = "HC0"))


N = 5000
n = 100
beta0 = 2
beta1 = 4
b1 = numeric(N)
tstat = numeric(N)
set.seed(1234)
for(i in 1:N)
{
y = numeric(n)
x = matrix(rnorm(n,3,2),n,1)
u = matrix(rnorm(n),n,1)
y = beta0 + beta1*x + x*u
ones = matrix(rep(1,n),n,1)
X = cbind(ones,x)
b = solve(t(X)%*%X)%*%t(X)%*%y
res = y-X%*%b
res2 = as.numeric(res*res)
omegahat = diag(res2)
omegahat1 = t(X)%*%omegahat%*%X
varb = solve(t(X)%*%X)%*%omegahat1%*%solve(t(X)%*%X)
se = sqrt(varb)[2,2]
b1[i] = b[2]
tstat[i] = (b[2]-beta1)/se
}
windows()
par(mfrow=c(2,1))
plot(density(b1),xlab="",lwd=2,main=expression(paste(b[1],"的抽樣分配")))
abline(v=beta1,lty=2)
plot(density(tstat),ylim=c(0,0.5),xlab="",lwd=2,main="t檢定統計量的抽樣分配")
t = sort(tstat)
lines(t,dt(t,(n-2)),lty=2,col="red",lwd=2)
abline(v=0,lty=2)
legend("topleft",c("t分配"),lty=2,lwd=2,col=c("red"),bty="n")

# ex3
library(lmtest)
library(sandwich)
n = 1002
beta0 = 0.8
beta1 = 0.7
w0 = 0.8
alpha0 = 0.5
# try
set.seed(23556)
u = rnorm(n)
y = numeric(n)
for(i in 2:n)
{
 w1 = sqrt(w0 + alpha0*y[i-1]^2)
y[i] = beta0 + beta1*y[i-1] + u[i]*w1
}
y1 = y[502:n] # 捨棄前501個模擬值
T1 = length(y1)
ya = y1[2:T1]
ya1 = y1[1:T1-1]
T = length(ya1)
model = lm(ya~ya1) 
b1 = coef(model)[2]
res = residuals(model)
ones = rep(1,T)
x = cbind(ones,ya1)
Z = matrix(res*x,T,2)
X = matrix(x,T,2)
varb = solve(t(X)%*%X)%*%(t(Z)%*%Z)%*%solve(t(X)%*%X)
coeftest(model,df = Inf, vcov = vcovHC(model, type = "HC0"))
t = b1/sqrt(varb[2,2])
t
# Monte Carlo simulations
N = 10000
n = 2002
b1 = numeric(N)
tstat = numeric(N)
for(j in 1:N)
{
  u = rnorm(n)
  y = numeric(n)
  for(i in 2:n)
  {
      w1 = sqrt(w0 + alpha0*y[i-1]^2)
      y[i] = beta0 + beta1*y[i-1] + u[i]*w1
  }
      y1 = y[1002:n] # 捨棄前1001個模擬值
      T1 = length(y1)
      ya = y1[2:T1]
      ya1 = y1[1:T1-1]
      T = length(ya1)
      model = lm(ya~ya1) 
      b1[j] = coef(model)[2]
      res = residuals(model)
      ones = rep(1,T)
      x = cbind(ones,ya1)
      Z = matrix(res*x,T,2)
      X = matrix(x,T,2)
      varb = solve(t(X)%*%X)%*%(t(Z)%*%Z)%*%solve(t(X)%*%X)
      tstat[j] = (b1[j]-beta1)/sqrt(varb[2,2])
}
windows()
par(mfrow=c(2,1))
plot(density(b1),lwd=2,xlab="",main=expression(paste("估計的",b[1],"的抽樣分配")))
plot(density(tstat),lwd=2,xlab="",main="t檢定統計量之抽樣分配")
t = sort(tstat)
lines(t,dt(t,T-2),lty=2,lwd=2,col="red")
legend("topright",c("t分配"),lty=2,col=c("red"),lwd=2,bty="l")



# 模擬ARCH(2)
library(fGarch)
N = 10000
n = 2001
tstat1 = numeric(N)
for(i in 1:N)
{
spec = garchSpec(model = list(omega = 0.3, alpha = c(0.5,0.2), beta = 0))
simu = garchSim(spec, n = n)
y = simu^2
ya = y[2:n]
ya1 = y[1:(n-1)]
model = lm(ya~ya1)
b1[i] = coef(model)[2]
tstat[i] = (b1[i]-0.5)/sqrt(diag(vcov(model))[2])
seNW = coeftest(model,vcov = NeweyWest)[2,2] 
tstat1[i] = (b1[i]-0.5)/seNW
}
windows()
par(mfrow=c(3,1))
plot(density(b1),lwd=2,main=expression(paste("估計的",b[1],"的抽樣分配")),xlab="")
abline(v=mean(b1))
points(0.5,0,pch=20,col="red",lwd=3)
plot(density(tstat),lwd=2,ylim=c(0,0.5),main="t檢定統計量之抽樣分配",xlab="")
t = sort(tstat)
lines(t,dt(t,n-3),lty=2,lwd=2,col="red")
legend("topright",c("t分配"),lty=2,col=c("red"),lwd=2,bty="l")
plot(density(tstat1),lwd=2,ylim=c(0,0.5),main="校正後t檢定統計量之抽樣分配",xlab="")
t = sort(tstat1)
lines(t,dt(t,n-3),lty=2,lwd=2,col="red")
legend("topright",c("t分配"),lty=2,col=c("red"),lwd=2,bty="l")
 
# ex4
# Newey-West estimator
n = 2001
beta0 = 0.8
beta1 = 0.7
w0 = 0.8
alpha0 = 0.5
# try
set.seed(23556)
u = rnorm(n)
y = numeric(n)
for(i in 2:n)
{
 w1 = sqrt(w0 + alpha0*y[i-1]^2)
y[i] = beta0 + beta1*y[i-1] + u[i]*w1
}
y1 = y[1000:n] # 捨棄前1000個模擬值
T1 = length(y1)
ya = y1[2:T1]
ya1 = y1[1:T1-1]
T = length(ya1)
model = lm(ya~ya1) 
res = residuals(model)
ones = rep(1,T)
x = cbind(ones,ya1)
X = matrix(x,T,2)
resX  = res*X
XXinv = solve(t(X)%*%X)

# 首次估計P
P = floor(4*(T/100)^(2/9)) # P = 1 
J0 = t(resX) %*% resX
J1 = 0
for (j in 1:P)
{
    Gj = t(resX[(j+1):T,]) %*% resX[1:(T-j),]
    J0 = J0 + Gj + t(Gj)
    J1 = J1 + 2*j*Gj  
}
# P之更新
cols = ncol(X) # 共有cols行
i  = rbind(1, rep(1, cols-1))
v0 = t(i) %*% J0 %*% i
v1 = t(i) %*% J1 %*% i
P  = floor(1.1447*((v1/v0)^2*T)^(1/3))
# 計算 Newey-West 估計式
JT = t(resX) %*% resX
for (j in 1:P) 
{
    Gj = t(resX[(j+1):T,]) %*% resX[1:(T-j),]
    JT = JT + c(1-j/(P+1))*(Gj + t(Gj))  
} 
varNW = XXinv %*% JT %*% XXinv
seNW = sqrt(diag(varNW)[2])
seNW
# 比較
coeftest(model,vcov = NeweyWest)[2,2] 

# ex5
library(lmtest)
library(sandwich)
beta0 = 0.8
beta1 = 0.7
w0 = 0.8
alpha0 = 0.5
N = 10000
n = 2002
b1 = numeric(N)
tstat = numeric(N)
tstat1 = numeric(N)
tstat2 = numeric(N)
set.seed(1234)
for(j in 1:N)
{
  u = rnorm(n)
  y = numeric(n)
  for(i in 2:n)
  {
      w1 = sqrt(w0 + alpha0*y[i-1]^2)
      y[i] = beta0 + beta1*y[i-1] + u[i]*w1
  }
      y1 = y[1002:n] # 捨棄前1001個模擬值
      T1 = length(y1)
      ya = y1[2:T1]
      ya1 = y1[1:T1-1]
      T = length(ya1)
      model = lm(ya~ya1) 
      b1[j] = coef(model)[2]
      res = residuals(model)
      ones = rep(1,T)
      x = cbind(ones,ya1)
      Z = matrix(res*x,T,2)
      X = matrix(x,T,2)
      varb = solve(t(X)%*%X)%*%(t(Z)%*%Z)%*%solve(t(X)%*%X)
      tstat[j] = (b1[j]-beta1)/sqrt(diag(varb)[2])
      seNW = coeftest(model,vcov = NeweyWest)[2,2]
      tstat1[j] = (b1[j]-beta1)/seNW
      tstat2[j] = (b1[j]-beta1)/sqrt((vcov(model)[2,2]))
}
windows()
par(mfrow=c(2,1))
plot(density(b1),lwd=2,xlab="",main=expression(paste("估計的",b[1],"的抽樣分配")))
plot(density(tstat),lwd=2,xlab="",main="t檢定統計量之抽樣分配")
lines(density(tstat1),lwd=2,lty=2,col="blue")
lines(density(tstat2),lwd=2,lty=3,col="green")
t = sort(tstat)
lines(t,dt(t,T-2),lty=2,lwd=2,col="red")
legend("topleft",c("White校正後之t分配","Newey-West校正後之t分配","OLS之t分配","t分配"),lty=1:4,
       col=c("black","blue","green","red"),lwd=2,bty="n")


# 2-3
# ex2
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
x = 100*diff(log(p))
y = x^2
T = length(y)
ya = y[2:T]
ya1 = y[1:T-1]
x1 = x[1:T-1]
model = lm(ya~x1)
library(lmtest)
resettest(model,power=2,type="fitted")
resettest(model,power=2:3,type="fitted")

# ex3
model1 = lm(ya~ya1)
resettest(model1,power=2,type="fitted")
resettest(model1,power=2:3,type="fitted")

# ex4
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
x = 100*diff(log(p))
y = x^2
T = length(y)
ya = y[2:T]
ya1 = y[1:T-1]
model1 = lm(ya~ya1)
fit = fitted(model1)
fit2 = fit^2
fit3 = fit^3
library(car) # 使用 "car" 程式套件
model2 = lm(ya~ya1+fit2+fit3)
linearHypothesis(model2,c("fit2=0","fit3=0"))
# anova
anova(model1,model2)
# using F test
SSEr = sum(residuals(model1)^2)
SSEu = sum(residuals(model2)^2)
T = length(ya)
F = ((SSEr-SSEu)/2)/(SSEu/(T-4))
F
1-pf(F,2,T-4)
# 使用RESET檢定
resettest(model1,power=2:3,type="fitted")

# ex5
model3 = lm(ya~ya1+fit2)
anova(model1,model3)
summary(model3)

# 2-4-1
# ex1
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
x = 100*diff(log(p))
T = length(x)
ya = x[2:T]
ya1 = x[1:T-1]
model = lm(ya~ya1)
library(fBasics)
res = residuals(model)
resn = res/sd(res)
windows()
ksnormTest(resn) # 於fBasics內
ks.test(resn,"pnorm")
Fx = ecdf(resn)
sFx = sort(Fx(resn))
x = sort(resn)
plot(x,sFx,type="l",ylab="",xlab="",main="估計殘差值之實際與理論CDF",lwd=2)
lines(x,pnorm(x),lty=1,col="red",lwd=2) 
legend("topleft",c("實際","理論"),lty=c(1,1),col=c("black","red"),bty="n",lwd=2)
D = sFx-pnorm(x)
max(abs(D))
   
# ex2
Fx = ecdf(resn)
sFx = sort(Fx(resn))
library(fGarch)
D = sFx-pstd(x,mean=0,sd=1,nu=T)
max(abs(D))

D1 = sFx-pt(x,T)
max(abs(D1))

# 2-4-2
# ex2
set.seed(1234)
x = rnorm(1000)
x[500] = 10
library(fBasics)
basicStats(x)
jarqueberaTest(x)

largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
x = 100*diff(log(p))
T = length(x)
ya = x[2:T]
ya1 = x[1:T-1]
model = lm(ya~ya1)
summary(model)
res = residuals(model)
windows()
plot(res,type="l",ylab="",main="大立光日對數報酬率之AR(1)模型之殘差值序列")
points(259,res[259],lwd=4,col="red")
points(943,res[943],lwd=4,col="red")
points(1384,res[1384],lwd=4,col="red")

i = res >= 6.97
as.numeric(i)
res[259]
res[943]
min(res)
j = res <= -7.6
as.numeric(j)
res[1384]

basicStats(res)
basicStats(res[-c(1384,259,943)])
jarqueberaTest(res)
jarqueberaTest(res[-c(1384,259,943)])

# 8-3-1
# ex1
# Binary dependent variable
twi = read.table("c:\\meiyih\\Finstats\\ch8\\twi.txt",header=T)
tsmc = read.table("c:\\meiyih\\Finstats\\ch8\\tsmc.txt",header=T)
names(twi)
attach(twi)
ptwi = 收盤價_TW 
names(tsmc)
attach(tsmc)
pd = 收盤價
divd = 本益比/收盤價
divd = 1/divd
tsmcr = 100*diff(log(pd))
names(twi)
attach(twi)
twir = 100*diff(log(收盤價_TW))
T = length(pd)
T
pd1 = pd[(T-250+1):T] # 7/8/2013-7/10/2014
divd1 = divd[(T-250+1):T]

index = pd1 <= quantile(pd1,0.8)
pd1a = as.numeric(index)
modelpd1 = lm(pd1a~divd1)
summary(modelpd1)
library(lmtest)
library(sandwich)
# robust standard error of White
coeftest(modelpd1,df = Inf, vcov = vcovHC(modelpd1, type = "HC0"))

y = pd1a
x = divd1
modela = glm(y~x, family = binomial(link = "probit"))
summary(modela)
coeftest(modela,df = Inf, vcov = vcovHC(modela, type = "HC0"))


# 8-4
# ex1
library(lmtest)
library(sandwich)
# load cpi
# 1981M1-2014M7
cpi = read.table("c:\\meiyih\\Finstats\\ch8\\cpi.txt") 
cpi = cpi[,1] 
# load TSMC 月收盤價與益比
# 1994M9-2014M6
tsmc = read.table("c:\\meiyih\\Finstats\\ch8\\tsmcp.txt",header=T)
names(tsmc)
attach(tsmc)
tsmcp = TSMC
tsmcper = TSMC本益比
cpi1 = cpi[165:(length(cpi)-1)]
length(cpi1)
length(tsmcp)
# TSMC股利
tsmcdiv = tsmcper/tsmcp
tsmcdiv = 1/tsmcdiv
head(tsmcdiv)

# TWI
# 1981M1-2014M6
twi = read.table("c:\\meiyih\\Finstats\\ch8\\twip.txt",header=T)
names(twi)
attach(twi)
twip = TWI
twiper = TWI本益比
cpi2 = cpi[1:(length(cpi)-1)]
length(cpi2)
length(twip)
# TWI股利
# TSMC股利
twidiv = twiper/twip
twidiv = 1/twidiv
head(twidiv)

# 與TSMC同期之TWI
twip1 = twip[165:length(twip)]
length(twip1)
length(tsmcp)
length(cpi1)
length(tsmcdiv)

T = length(tsmcp)
k = 2
T1 = T-k
y1 = (tsmcp[(k+1):T]+tsmcdiv[(k+1):T]-tsmcp[1:T1])/tsmcp[1:T1]
x1 = (cpi1[(k+1):T]-cpi1[1:T1])/cpi1[1:T1]
x2 = (twip1[(k+1):T]-twip1[1:T1])/twip1[1:T1]
model = lm(y1~x1+x2)
summary(model)
res = residuals(model)
windows()
par(mfrow=c(2,1))
acf(res)
pacf(res)

y1a = y1[2:length(y1)]
y1a1 = y1[1:length(y1)-1]
x1a = x1[2:length(y1)]
x2a = x2[2:length(y1)]
modela = lm(y1a~y1a1+x1a+x2a)
summary(modela)
coeftest(modela,vcov=vcovHAC)
res = residuals(modela)
windows()
par(mfrow=c(2,1))
acf(res)
pacf(res)
bgtest(modela,order=1,type="F")
bgtest(modela,order=5,type="F")
bgtest(modela,order=10,type="F")


# the case 2
# the other cases
# the case of TSMC
T = length(tsmcp)
K = 101
K1 = K-1
tsmcb = numeric(K1)
tsmct1 = numeric(K1)
tsmct2 = numeric(K1)
for(i in 2:K)
{
k = i
T1 = T-k
y = (tsmcp[(k+1):T]+tsmcdiv[(k+1):T]-tsmcp[1:T1])/tsmcp[1:T1]
x = (cpi1[(k+1):T]-cpi1[1:T1])/cpi1[1:T1]
x1 = (twip1[(k+1):T]-twip1[1:T1])/twip1[1:T1]
h = length(y)
ya = y[i:h]
ya1 = y[(i-1):(h-1)]
xa = x[i:h]
x1a = x1[i:h]
model = lm(ya~xa+ya1+x1a)
model1 = coeftest(model,vcov=vcovHAC) 
tsmcb[(i-1)] = model1[2,1]
tsmct1[(i-1)] = model1[2,3]
se = model1[2,2]
tsmct2[(i-1)] = (tsmcb[(i-1)]-1)/se
}
windows()
par(mfcol=c(3,1))
plot(tsmcb,type="l",main="TSMC 情況2",ylab="",xlab="k",lwd=2)
abline(h=0,lty=2)
plot(tsmct1,type="l",ylab="",xlab="k",lwd=2)
abline(h=2,lty=2)
abline(h=-2,lty=2)
plot(tsmct2,type="l",ylab="",xlab="k",lwd=2)
abline(h=2,lty=2)
abline(h=-2,lty=2)

# 本章習題

#ch 8
# 1981M1-2014M7
# ex6
cpi = read.table("c:\\meiyih\\Finstats\\ch8\\cpi.txt") 
cpi = cpi[,1] 
T = length(cpi)
T
infl = (cpi[13:T]-cpi[1:(T-12)])/cpi[1:(T-12)]
infl = 100*infl
T1 = length(infl)
T1
# dummy variables
h = c(1,rep(0,11)) # rep 是指0重複11次
Q1 = rep(h,(T-7)/12)
Q1 = c(Q1,1,rep(0,6))
length(Q1)
Q = embed(Q1,13) #將Q1與其遞延落後1-13期合併
Q
Q1 = Q[,1]
length(Q1)
Q2 = Q[,2]
Q3 = Q[,3]
Q4 = Q[,4]
Q5 = Q[,5]
Q6 = Q[,6]
Q7 = Q[,7]
Q8 = Q[,8]
Q9 = Q[,9]
Q10 = Q[,10]
Q11 = Q[,11]
Q12 = Q[,12]

model = lm(infl~Q1+Q2+Q3+Q4+Q5+Q6+Q7+Q8+Q9+Q10+Q11+Q12-1)
summary(model)

# ex7,8
windows()
par(mfrow=c(2,1))
acf(infl)
pacf(infl)
infl1 = embed(infl,3)
ya = infl1[,1]
yb = infl1[,2]
yc = infl1[,3]
model = lm(ya~yb+yc)
summary(model)
res = residuals(model)
windows()
par(mfrow=c(3,1))
plot(res,type="l")
acf(res,lag.max=60)
pacf(res,lag.max=60)

#診斷
Box.test(res,lag=1, type="Ljung-Box")
Box.test(res, lag=5, type="Ljung-Box")
Box.test(res,lag=10, type="Ljung-Box")
Box.test(res, lag=15, type="Ljung-Box")
Box.test(res, lag=20, type="Ljung-Box")
 
# 序列相關檢定
bgtest(model,order=1,type="F")
bgtest(model,order=5,type="F")
bgtest(model,order=10,type="F")
bgtest(model,order=15,type="F")
bgtest(model,order=20,type="F")

# 變異數異質檢定
bptest(model)

#White test
res2 = res^2
w1 = yb+yc
w2 = yb*w1
w3 = yc*w1
model1 = lm(res2~w1+w2+w3)
summary(model1)
resa = residuals(model1)
n = length(res2)
SSEa = sum(resa^2)
SSTa = var(res2)*(n-1)
SSRa = SSTa-SSEa
R2 = SSRa/SSTa
R2
F = (R2/3)/((1-R2)/(n-3-1))
F
1-pf(F,3,(n-3-1))
chi = (n-3)*R2
chi    
1-pchisq(chi,3)

# Reset test
resettest(model,power=2,type="fitted")

# Normal distribution test
res1 = res
library(fBasics)
windows()
res1n = res1/sd(res1)
ksnormTest(res1n) # 於fBasics內
ks.test(res1n,"pnorm")
Fx = ecdf(res1n)
sFx = sort(Fx(res1n))
x = sort(res1n)
plot(x,sFx,type="l",ylab="",xlab="",main="AR(2)估計殘差值之實際與理論CDF")
lines(x,pnorm(x),lty=1,col="red") 
legend("topleft",c("實際","理論"),lty=c(1,1),col=c("black","red"),bty="n")
D = sFx-pnorm(x)
max(abs(D))
basicStats(res1)
jarqueberaTest(res1)
 
# ex10
#線性機率模型
ya
index = ya >= 2
yad = as.numeric(index)
windows()
par(mfrow=c(2,1))
plot(yb,yad,type="p",ylab="通貨膨脹率大於等於2%",xlab="通貨膨脹率落後1期",lwd=2)
modela = lm(yad~yb)
abline(modela,lwd=2)
summary(modela)

y = yad
x = yb
modelb = glm(y~x, family = binomial(link = "logit"))
summary(modelb)
plot(x,y,type="p",ylab="通貨膨脹率大於等於2%",xlab="通貨膨脹率落後1期",lwd=2)
fitted1 = fitted(modelb)
lines(sort(x),sort(fitted1),col="red",lwd=2)
# pseudo-Rsquare
1-modelb$deviance/modelb$null.deviance


