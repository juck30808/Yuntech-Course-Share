tsmctwi = read.table("c:\\meiyih\\Finstats\\ch9\\tsmctwi.txt",header=T)
names(tsmctwi)
attach(tsmctwi)
p1 = TSMC # 收盤價
p2 = TWI # 收盤價
tsmcr = 100*diff(log(p1))
twir = 100*diff(log(p2))
# exchange rates
exch = read.table("c:\\meiyih\\Finstats\\ch6\\exch.txt",header=T)
attach(exch)
names(exch)
e1 = 新台幣

# 模擬GARCH(1,1)
T = 2000
Init = 1000 # 期初值可捨棄,相當於讓電腦"熱身"
garch1 = numeric(T)
garch2 = numeric(T)
set.seed(1234)
u1 = rnorm(Init+T)
u2 = rnorm(Init+T)
z1 = u1
z2 = u2
y1 = u1
y2 = u2
h1 = rep(0,Init+T)
h2 = rep(0,Init+T)
alpha0 = 0.05
alpha1 = c(0.3,0.34)
beta1 = c(0.3,0.65)
h1[1] = alpha0/(1-alpha1[1]-beta1[1]) # 條件變異數之期初值
h2[1] = alpha0/(1-alpha1[2]-beta1[2])
u1[1] = rnorm(1,0,sqrt(h1[1])) # 誤差項之期初值
u2[1] = rnorm(1,0,sqrt(h2[1]))

for(i in 2:(Init+T))
{
 h1[i] = alpha0 + alpha1[1]*u1[i-1]^2 + beta1[1]*h1[i-1]
 h2[i] = alpha0 + alpha1[2]*u2[i-1]^2 + beta1[2]*h2[i-1]
 u1[i] = z1[i]*sqrt(h1[i])
 u2[i] = z2[i]*sqrt(h2[i])
 y1[i] = u1[i]
 y2[i] = u2[i]
}
y1 = y1[(Init+1):(Init+T)]
y2 = y2[(Init+1):(Init+T)]
length(y1)
windows()
par(mfcol=c(4,2))
plot(y1,type="l",ylab="",main="GARCH 1",lwd=2)
plot(y1^2,type="l",ylab="序列平方",main="序列平方之走勢",lwd=2)
acf(y1,ylab="自我相關",main="序列之自我相關",lwd=2)
acf(y1^2,ylab="自我相關",main="序列平方之自我相關",lwd=2)
plot(y2,type="l",ylab="",main="GARCH 2",lwd=2)
plot(y2^2,type="l",ylab="序列平方",main="序列平方之走勢",lwd=2)
acf(y2,ylab="自我相關",main="序列之自我相關",lwd=2)
acf(y2^2,ylab="自我相關",main="序列平方之自我相關",lwd=2)

# Estimating the GARCH(1,1) model for TSMC
library(fGarch)
y = tsmcr
modela = garchFit(~garch(1,1),data=y,include.mean=F)
summary(modela)

# Likelihood function for a GARCH(1,1) model
lnlt = function( b,y )
{
b = abs(b)
T = length(y)
u = y   
h = sd(y)^2*rep(1,T)  
for (i in 2:T) {
    h[i] = b[1] + b[2]*u[i-1]^2 + b[3]*h[i-1]
  }
loglt = - 0.5*log( 2*pi ) - 0.5*log( h ) - 0.5*(u^2/h)
return(loglt)  
}
neglog = function( b,y ) 
{
logl = -mean( lnlt( b,y ) )  
return(logl)
}
# Estimating the GARCH(1,1) model
start = c(0.05,0.1,0.9)
modela1 = optim(start, neglog, y=y, method="BFGS", hessian=T)
summary(modela1)
theta = modela1$par
theta
lf = modela1$val
lf
hess = (modela1$hess)
hess = solve(hess) 
T = length(y)
lf = -lf
lf*T # 與modela比較
# 參數之標準誤
se = sqrt(diag((1/T)*hess))
se 



# ARCH(1) Model
p1 = TSMC # 收盤價
p2 = TWI # 收盤價
tsmcr = 100*diff(log(p1))
# ARCH(1)與 GARCH(1,1)之LR檢定
y = tsmcr
modelb = garchFit(~garch(1,0),data=y,include.mean=F) # ARCH(1)
summary(modelb) 
LL0 = -11370.13
modela = garchFit(~garch(1,1),data=y,include.mean=F) # GARCH(1,1)
summary(modela)
LL1 = -10962.12
LR = -2*(LL0-LL1)
LR
1-pchisq(LR,1)

# TWI
y1 = twir
modelc = garchFit(~garch(1,0),data=y1,include.mean=F)
summary(modelc)
LL0 = -9109.361
modeld = garchFit(~garch(1,1),data=y1,include.mean=F)
summary(modeld)
LL1 = -8605.441 
LR = -2*(LL0-LL1)
LR
1-pchisq(LR,1)

# 新台幣匯率序列
exr = 100*(diff(log(e1)))
x = exr
modele = garchFit(~garch(1,0),data=x,include.mean=F)
summary(modele)
LL0 = 247.296
modelf = garchFit(~garch(1,1),data=x,include.mean=F)
summary(modelf)
LL1 = 431.2438
LR = -2*(LL0-LL1)
LR
1-pchisq(LR,1)


# 利用GARCH(1,1)模型預測條件變異數
?garchFit
tsmcr.h = modela@h.t
head(tsmcr.h)    
tsmcr.sigma = modela@sigma.t
head(tsmcr.sigma)^2
windows()
par(mfrow=c(3,1))
plot(sqrt(tsmcr^2),type="p",main="TSMC之波動率:估計與實際",ylab="",lwd=2)
lines(1:length(tsmcr.h),sqrt(tsmcr.h),lty=2,col="red",lwd=2)
twir.h = modeld@h.t
plot(sqrt(twir^2),type="p",main="TWI之波動率:估計與實際",ylab="",lwd=2)
lines(1:length(twir.h),sqrt(twir.h),lty=2,col="red",lwd=2)
exr.h = modelf@h.t
plot(sqrt(exr^2),type="p",main="新台幣匯率之波動率:估計與實際",ylab="",lwd=2)
lines(1:length(exr.h),sqrt(exr.h),lty=2,col="red",lwd=2)

# try
sigma21 = sum(tsmcr^2)/length(tsmcr)
sigma21
tsmcr.h[1]
sigma22 = 0.0456+0.0612*tsmcr[1]^2+0.93*sigma21
sigma22
tsmcr.h[2]
sigma23 = 0.0456+0.0612*tsmcr[2]^2+0.93*sigma22
sigma23
tsmcr.h[3]

# 預期未來一期
T = length(tsmcr)
T
T1 = length(tsmcr.h)
T1
fore1 = 0.0456+0.0612*tsmcr[T]^2+0.93*tsmcr.h[T1]
fore1
sqrt(fore1)
fore2 = 0.0456+(0.0612+0.93)*fore1
fore2
sqrt(fore2)
fore3 = 0.0456+(0.0612+0.93)*fore2
fore3
sqrt(fore3)

# 使用predict指令
?predict
predict(modela,n.ahead=1)
as.numeric(predict(modela,n.ahead=1))
predict(modela,n.ahead=2)
predict(modela,n.ahead=3)

as.numeric(predict(modela,n.ahead=1))[3]

# (年) 波動率
sqrt(fore1)*sqrt(250)
sd(tsmcr)*sqrt(250)

# 每隔250日預期未來一期 (年) 波動率
y = tsmcr 
T = length(y)
t = 250
m = T-t+1
fore = numeric(m)
for(i in 1:m)
{
 h = i
 k = 250+i-1
 y1 = y[h:k]
 fit = garchFit(~garch(1,1),data=y1,include.mean=F)
 fore[i] = as.numeric(predict(fit,n.ahead=1))[3]*sqrt(250)
}
summary(fore)
windows()
par(mfrow=c(2,1))
hist(fore,breaks=100,main="TSMC (年) 預期波動率之次數分配 (每隔250個交易日)",xlab="",lwd=2)
hist(fore,breaks=100,prob=T, xlab="", lwd=2,
      main="TSMC (年) 預期波動率之機率分配 (每隔250個交易日)")
lines(density(fore),lty=2,col="red",lwd=2)
histo = hist(fore,breaks=100,plot=F)
histo
(170+171+188+197+214+220+216+161)
1537/4864
