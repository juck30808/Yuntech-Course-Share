
# t distribution
?rt
# 古典t分配
set.seed(12345)
x = rt(1000,3)
library(fBasics)
basicStats(x)

# 標準t分配
library(fGarch)
?rstd
set.seed(12345)
x1 = rstd(1000,mean=0,sd=1,nu=3)
basicStats(x1)

# 古典與標準t分配之比較
x = seq(-4,4,length=100)
windows()
par(mfrow=c(2,1))
plot(x,dt(x,3),type="l",lwd=3,ylab="",xlab="t",ylim=c(0,.45),
          main="不同自由度下之t分配 (古典)")
lines(x,dt(x,8),lty=2,lwd=3,col=2)
lines(x,dt(x,30),lty=3,lwd=3,col=3)
lines(x,dnorm(x),lty=4,lwd=3,col=4)
leg = c(expression(nu == 3),expression(nu == 8),expression(nu == 30),
        expression(paste(nu == infinity,", 標準常態")))
legend("topright",leg,lty=1:4,col=1:4,lwd=3,bty="n")
plot(x,dstd(x,0,1,3),type="l",lwd=3,,ylab="",xlab="t",ylim=c(0,.7),
       main="不同自由度下之t分配 (標準)")
lines(x,dstd(x,0,1,8),lty=2,lwd=3,col=2)
lines(x,dstd(x,0,1,30),lty=3,lwd=3,col=3)
lines(x,dnorm(x),lty=4,lwd=3,col=4)
leg = c(expression(nu == 3),expression(nu == 8),expression(nu == 30),
        expression(paste(nu == infinity,", 標準常態")))
legend("topright",leg,lty=1:4,col=1:4,lwd=3,bty="n")

windows()
par(mfrow=c(2,1))
plot(x,dt(x,3),type="l",lwd=3,ylab="",xlab="t",ylim=c(0,.025),xlim=c(3,4),
          main="不同自由度下之標準t分配 (右尾)")
lines(x,dt(x,8),lty=2,lwd=3,col=2)
lines(x,dt(x,30),lty=3,lwd=3,col=3)
lines(x,dnorm(x),lty=4,lwd=3,col=4)
leg = c(expression(nu == 3),expression(nu == 8),expression(nu == 30),
        expression(paste(nu == infinity,", 標準常態")))
legend("topright",leg,lty=1:4,col=1:4,lwd=3,bty="n")
plot(x,dstd(x,0,1,3),type="l",lwd=3,,ylab="",xlab="t",ylim=c(0,.010),xlim=c(-3,-4),
       main="不同自由度下之標準t分配 (左尾)")
lines(x,dstd(x,0,1,8),lty=2,lwd=3,col=2)
lines(x,dstd(x,0,1,30),lty=3,lwd=3,col=3)
lines(x,dnorm(x),lty=4,lwd=3,col=4)
leg = c(expression(nu == 3),expression(nu == 8),expression(nu == 30),
        expression(paste(nu == infinity,", 標準常態")))
legend("topright",leg,lty=1:4,col=1:4,lwd=3,bty="n")


# 計算t分配之機率
# TWI
# 1/4/2000-7/10/2014
TWI = read.table("c:\\meiyih\\finstats\\ch4\\TWI1.txt",header=T)
attach(TWI)
names(TWI)
twi.r = 100*diff(log(T收盤價))
basicStats(twi.r)
stdFit(twi.r) # 最大概似估計
# -2.5%~2.5%
mu = mean(twi.r) # 0.002437791
sigma2 = var(twi.r) # 2.129958
nu = 3.1345 # 自由度
# 標準t分配
ta = (-2.5-mu)/sd(twi.r) # 標準化 (使用標準差)
tb = (2.5-mu)/sd(twi.r)
pstd(tb,0,1,nu) - pstd(ta,0,1,nu) # 0.9380312
pstd(2.5,mu,sqrt(sigma2),nu) - pstd(-2.5,mu,sqrt(sigma2),nu) # 0.9380312
# 古典t分配
lambda2 = sigma2*(nu-2)/nu
lambda = sqrt(lambda2) # 0.8780185
t1 = (-2.5-mu)/lambda # 標準化 (使用尺度)
t2 = (2.5-mu)/lambda
t3 = (-6.5-mu)/lambda
pt(t2,nu) - pt(t1,nu) # 0.9380312
# 常態分配
pnorm(2.5,mu,sqrt(sigma2)) - pnorm(-2.5,mu,sqrt(sigma2)) # 0.9132849
# 小於-6.5%
pstd(-6.5,mu,sqrt(sigma2),nu) # 0.002188545
pt(t3,nu) # 0.002188545
pnorm(-6.5,mu,sqrt(sigma2)) # 4.18605e-06


 

