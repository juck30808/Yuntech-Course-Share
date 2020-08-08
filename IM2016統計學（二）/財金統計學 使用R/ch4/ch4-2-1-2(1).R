# Daily TSMC
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\finstats\\ch4\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))
library(fBasics)
basicStats(tsmc.r)
windows()
#par(mfrow=(2,1))
mu = mean(tsmc.r)
sigma = sd(tsmc.r)
x = seq(min(tsmc.r),max(tsmc.r), length=100)
plot(x,dnorm(x,mu,sigma), type="l", main="常態分配與柴比雪夫定理之比較",lwd=3)
k = sqrt(2)
lower = mu-k*sigma
upper = mu+k*sigma
i = x >= lower & x <= upper
polygon(c(lower,x[i],upper), c(0,dnorm(x[i],mu,sigma),0),col="light blue")
pnorm(upper,mu,sigma)-pnorm(lower,mu,sigma)
sigma1 = 4.48
lines(x,dnorm(x,mu,sigma1), lty=2, col="blue",lwd=3)
pnorm(upper,mu,sigma1)-pnorm(lower,mu,sigma1)
abline(v=2,lty=3)
abline(v=mu,lty=3)
text(mu,0, labels=expression(mu),pos=4)
arrows(0,0.03,2,0.03,code=3, col="tomato")
arrows(0,0.05,upper,0.05,code=3, col="black")
arrows(-4,0.15,1,0.05,lty=4,col="black")
text(-4,0.15,labels=expression(paste("寬度為",sqrt(2)*sigma)),pos=3)
arrows(4,0.15,1,0.03,lty=4,col="red")
text(4,0.15,labels=expression(paste("寬度小於",sqrt(2)*sigma)),pos=3,col="red")






