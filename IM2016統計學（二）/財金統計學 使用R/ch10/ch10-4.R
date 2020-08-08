 
# Sharpe ratio distribution
# ch 7
# Monthly TSMC and TWI
# 1/2000-6/2014
library(fBasics)
tsmcm = read.table("c:\\meiyih\\Finstats\\ch7\\tsmcm.txt", header=T)
attach(tsmcm)
names(tsmcm)
tsmc.r = diff(log(收盤價))
twim = read.table("c:\\meiyih\\Finstats\\ch7\\twim.txt", header=T)
attach(twim)
names(twim)
# interest rates 1/2000-6/2014
# 央行一個月期存款牌告利率01/00-05/14
int = read.table("c:\\meiyih\\Finstats\\ch7\\interestrate.txt")
int = int[,1]
twi.r = diff(log(收盤價_TW))
length(twi.r)

# 超額報酬率
n = length(int)
int = int[2:n]/1200 # 年率轉為月率
y = tsmc.r-int
x = twi.r-int
n = length(y)
n

# SR1 
ybar = mean(y)
xbar = mean(x)
sigmayhat = sd(tsmc.r)*sqrt((n-1)/n)
sigmaxhat = sd(twi.r)*sqrt((n-1)/n)
SRyhat = ybar/sigmayhat
SRxhat = xbar/sigmaxhat
Vyiid = 1+0.5*SRyhat^2
Vxiid = 1+0.5*SRxhat^2
SRyhat
SRxhat
se1y = sqrt(Vyiid/n)
se1x = sqrt(Vxiid/n)
# SR1之95%信賴區間估計值
upper1y = SRyhat + qnorm(0.975)*se1y
lower1y = SRyhat + qnorm(0.025)*se1y
upper1y
lower1y
upper1x = SRxhat + qnorm(0.975)*se1x
lower1x = SRxhat + qnorm(0.025)*se1x
upper1x
lower1x

# SR2
gamma3y = as.numeric(skewness(tsmc.r))
gamma4y = as.numeric(kurtosis(tsmc.r)) # excess
Vy = 1+0.5*SRyhat^2 - gamma3y*SRyhat + (gamma4y/sigmayhat)*SRyhat^2
gamma3x = as.numeric(skewness(twi.r))
gamma4x = as.numeric(kurtosis(twi.r)) # excess
Vx = 1+0.5*SRxhat^2 - gamma3x*SRxhat + (gamma4x/sigmayhat)*SRxhat^2
se2y = sqrt(Vy/n)
se2x = sqrt(Vx/n)
# SR2之95%信賴區間估計值
upper2y = SRyhat + qnorm(0.975)*se2y
lower2y = SRyhat + qnorm(0.025)*se2y
upper2y
lower2y
upper2x = SRxhat + qnorm(0.975)*se2x
lower2x = SRxhat + qnorm(0.025)*se2x
upper2x
lower2x

# 1/4/1996-6/30/2014
int = read.table("c:\\meiyih\\Finstats\\ch10\\interestrate.txt")
intr = int[,1] # 年利率
intr = (intr/1200)/30 # 日利率
num = int[,2] # 每月交易日的天數
p = read.table("c:\\meiyih\\Finstats\\ch10\\tsmctwip.txt") # 12/30/1995 -
p1 = p[,1] # the closing prices of TSMC
p2 = p[,2] # the closing prices of TWI
y = diff(log(p1))
x = diff(log(p2))
length(y)
sum(num)

# 計算日利率
daily = rep(intr[1],num[1])
daily
T = length(intr)
for(i in 2:T)
{
 x1 = rep(intr[i],num[i])
 daily = c(daily,x1)
}
length(daily)

# Excess returns
ey = y-daily
ex = x-daily

basicStats(ey)
basicStats(ex)

SRy = ey[1:length(ey)]
y1 = y[1:length(y)]
x1 = x[1:length(x)]
T = length(SRy)
SRx = ex[1:length(ex)]
n = 50
SRyhat = numeric(T/n)
SRxhat = numeric(T/n)
SRysigmahat1 = numeric(T/n)
SRxsigmahat1 = numeric(T/n)
SRysigmahat2 = numeric(T/n)
SRxsigmahat2 = numeric(T/n)
for(i in 1:(T/n))
{
  h = (i-1)*n + 1
  k = i*n
  aT = sqrt((n-1)/n)
  SRyhat[i] = mean(SRy[h:k])/(sd(y1[h:k])*aT)
  SRxhat[i] = mean(SRx[h:k])/(sd(x1[h:k])*aT)
  SRysigmahat1[i] =sqrt((1+0.5*SRyhat[i]^2)/n)
  SRxsigmahat1[i] =sqrt((1+0.5*SRxhat[i]^2)/n)
  gamma3yhat = as.numeric(skewness(y1[h:k]))
  gamma3xhat = as.numeric(skewness(x1[h:k]))
  gamma4yhat = as.numeric(kurtosis(y1[h:k])) # excess
  gamma4xhat = as.numeric(kurtosis(x1[h:k])) # excess
  Vyhat = (1+0.5*SRyhat[i]^2 - SRyhat[i]*gamma3yhat + 
            (gamma4yhat/(sd(y1[h:k])*aT))*SRyhat[i]^2)/n
  Vxhat = (1+0.5*SRxhat[i]^2 - SRxhat[i]*gamma3xhat + 
            (gamma4xhat/(sd(x1[h:k])*aT))*SRxhat[i]^2)/n
  SRysigmahat2[i] = sqrt(Vyhat)
  SRxsigmahat2[i] = sqrt(Vxhat)
}
zy1 = SRyhat/SRysigmahat1
zx1 = SRxhat/SRxsigmahat1
zy2 = SRyhat/SRysigmahat2
zx2 = SRxhat/SRxsigmahat2
zy2 = zy2[!is.na(zy2)]
zx2 = zx2[!is.na(zx2)]
windows()
par(mfrow=c(3,2))
acf(SRyhat,main=expression(paste("估計的",hat(SR),"之ACF (TSMC)")),lwd=2)
acf(SRxhat,main=expression(paste("估計的",hat(SR),"之ACF (TWI)")),lwd=2)
plot(density(zy1),xlab="SR",main= expression(paste(SR[1],"的抽樣分配 (TSMC) (50天)")),lwd=2)
z1 = sort(zy1)
lines(z1,dnorm(z1,mean(z1),sd(z1)),lty=2,col="blue",lwd=2)
abline(v=mean(zy1),lty=2)
abline(v=median(zy1),lty=2,col="red")
plot(density(zx1),xlab="SR",main= expression(paste(SR[1],"的抽樣分配 (TWI) (50天)")),lwd=2)
z2 = sort(zx1)
lines(z2,dnorm(z2,mean(z2),sd(z2)),lty=2,col="blue",lwd=2)
abline(v=mean(zx1),lty=2)
abline(v=median(zx1),lty=2,col="red")
plot(density(zy2),xlab="SR",main= expression(paste(SR[2],"的抽樣分配 (TSMC) (50天)")),lwd=2)
z3 = sort(zy2)
lines(z3,dnorm(z3,mean(z3),sd(z3)),lty=2,col="blue",lwd=2)
abline(v=mean(zy2),lty=2)
abline(v=median(zy2),lty=2,col="red")
plot(density(zx2),xlab="SR",main= expression(paste(SR[2],"的抽樣分配 (TWI) (50天)")),lwd=2)
z4 = sort(zx2)
lines(z4,dnorm(z4,mean(z4),sd(z4)),lty=2,col="blue",lwd=2)
abline(v=mean(zx2),lty=2)
abline(v=median(zx2),lty=2,col="red")

basicStats(SRyhat)
basicStats(SRxhat)
