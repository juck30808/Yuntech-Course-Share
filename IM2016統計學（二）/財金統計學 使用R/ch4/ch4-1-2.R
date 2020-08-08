# Daily TSMC
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\finstats\\ch4\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))
index = tsmc.r < 0
pbar = mean(as.numeric(index))
pbar
dbinom(3,10,pbar)

# Poisson Distribution
?rpois 
x = rpois(10,2) # lambda = 2
x
dpois(x,2)
p = ppois(x,2)
p
qpois(p,2)

windows()
x = rpois(10000,2)
par(mfrow=c(2,1))
plot(x,dpois(x,2),type="h", col="steelblue", lwd=40, ylab="機率",
     main=expression(paste("卜瓦松機率分配: ", lambda, " = 2")))
plot(c(0,10),c(0,1), xlab="x", ylab="累積機率", type="n",
   main=expression(paste("卜瓦松分配之累積機率: ", lambda, " = 2")),lwd=2)
x1 = sort(x)
lines(x1,ppois(x1,2),type="s",lwd=3)

tsmc.2r = 100*(diff(log(收盤價),2))
VR.2 = var(tsmc.2r)/(2*var(tsmc.r))
VR.2

tsmc.5r = 100*(diff(log(收盤價),5))
VR.5 = var(tsmc.5r)/(5*var(tsmc.r))
VR.5

tsmc.7r = 100*(diff(log(收盤價),7))
VR.7 = var(tsmc.7r)/(7*var(tsmc.r))
VR.7

tsmc.10r = 100*(diff(log(收盤價),10))
VR.10 = var(tsmc.10r)/(10*var(tsmc.r))
VR.10

# TSMC報酬率為負之分配
windows()
lambda = 0.4618*7
x = rpois(10000, lambda )
par(mfrow=c(2,1))
plot(x,dpois(x,lambda),type="h", col="tomato", lwd=50, ylab="機率",
     main="TSMC日股價下跌之機率分配 (每7個交易日)")
plot(c(0,12),c(0,1), xlab="x", ylab="累機機率",type="n", 
   main= "TSMC日股價下跌之累積機率分配 (每7個交易日)")
x1 = sort(x)
lines(x1,ppois(x1,lambda),type="s",lwd=3)

x = 0:12
dpois(x, lambda)
