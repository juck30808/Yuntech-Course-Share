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
twi.r = twi.r[124:length(twi.r)] # 6/23/2000-7/10/2014
tsmc.r = tsmc.r[124:length(tsmc.r)]

# nonnormality and fat tails

windows()
par(mfrow=c(3,2))
plot(density(twi.r),type="l",xlab="對數報酬率",main="TWI之估計密度與常態",lwd=2)
x1 = sort(twi.r)
lines(x1,dnorm(x1,mean(x1),sd(x1)),lty=2,col="red",lwd=2)
plot(density(tsmc.r),type="l",xlab="對數報酬率",main="TSMC之估計密度與常態")
x2 = sort(tsmc.r)
lines(x2,dnorm(x2,mean(x2),sd(x2)),lty=2,col="red",lwd=2)
plot(density(twi.r),type="l",xlim=c(-7,-2),ylim=c(-0.01,0.1),xlab="對數報酬率",
       main="TWI之估計密度與常態 (左尾)",lwd=2)
lines(x1,dnorm(x1,mean(x1),sd(x1)),lty=2,col="red",lwd=2)
plot(density(tsmc.r),type="l",xlim=c(-7,-2),ylim=c(-0.01,0.1),xlab="對數報酬率",
       main="TSMC之估計密度與常態 (左尾)",lwd=2)
lines(x2,dnorm(x2,mean(x2),sd(x2)),lty=2,col="red",lwd=2)
plot(density(twi.r),type="l",xlim=c(2,7),ylim=c(-0.01,0.1),xlab="對數報酬率",
      main="TWI之估計密度與常態 (右尾)",lwd=2)
lines(x1,dnorm(x1,mean(x1),sd(x1)),lty=2,col="red",lwd=2)
plot(density(tsmc.r),type="l",xlim=c(2,7),ylim=c(-0.01,0.1),xlab="對數報酬率",
    main="TSMC之估計密度與常態 (右尾)",lwd=2)
lines(x2,dnorm(x2,mean(x2),sd(x2)),lty=2,col="red",lwd=2)

library(fBasics)
basicStats(twi.r)
basicStats(tsmc.r)
twi.r = (twi.r-mean(twi.r))/sd(twi.r)
tsmc.r = (tsmc.r-mean(tsmc.r))/sd(tsmc.r)

quantile(twi.r,c(0.0001,0.001,0.01,0.1))
quantile(tsmc.r,c(0.0001,0.001,0.01,0.1))
qnorm(c(0.0001,0.001,0.01,0.1))
quantile(twi.r,c(0.9999,0.999,0.99,0.9))
quantile(tsmc.r,c(0.9999,0.999,0.99,0.9))
qnorm(c(0.9999,0.999,0.99,0.9))
