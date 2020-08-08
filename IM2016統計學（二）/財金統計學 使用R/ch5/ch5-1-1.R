# ch 5
# Daily TSMC
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch4\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))
# exchange rates 1/2/2002-7/10/2014
exch = read.table("c:\\meiyih\\Finstats\\ch5\\exch.txt", header=T)
attach(exch)
names(exch)
tai.r = 100*diff(log(新台幣))
length(tai.r)
index = tai.r > 0
sum(as.numeric(index))
sum(as.numeric(index))/length(tai.r)
pbar = mean(as.numeric(index))
pbar

library(fBasics)
basicStats(tai.r)

tai.2r = 100*diff(log(新台幣),2)
var(tai.2r)/(2*var(tai.r))
tai.10r = 100*diff(log(新台幣),10)
var(tai.10r)/(10*var(tai.r))

# CLT
#母體為均等分配
n = c(1,3,10,30)
N = 1000
windows()
par(mfcol=c(4,3))
mu = 0.5
sigma = 1/sqrt(12)
for(i in n)
{
 r = runif(i*N)
 x = matrix(r,N,i) # N列i行的矩陣
 x = (apply(x,1,sum)-i*mu)/(sigma*sqrt(i)) # apply(x,1,mean) 計算x內每列之加總
 hist(x, col="light blue",prob=T,main=paste("n = ",i), 
        ylim=c(0,max(0.4, density(x)$y)),xlab=expression(bar(x)),lwd=2)
 lines(density(x), col="red", lwd=3)
 x1 = sort(x)
 lines(x1,dnorm(x1), col="blue", lwd=3, lty=3)
}
#母體為指數分配
mu = 1
sigma = 1
for(i in n)
{
 r = rexp(i*N)
 x = matrix(r,N,i) # N列i行的矩陣
 x = (apply(x,1,sum)-i*mu)/(sigma*sqrt(i)) # apply(x,1,mean) 計算x內每列之加總
 hist(x, col="light blue", prob=T, main=paste("n = ",i), 
       ylim=c(0,max(0.4, density(x)$y)), xlab=expression(bar(x)),lwd=2)
 lines(density(x), col="red", lwd=3)
 x1 = sort(x)
 lines(x1,dnorm(x1), col="blue", lwd=3, lty=3)
}
#母體為標準常態分配
mu = 0
sigma = 1
for(i in n)
{
 r = rnorm(i*N)
 x = matrix(r,N,i) # N列i行的矩陣
 x = (apply(x,1,sum)-i*mu)/(sigma*sqrt(i)) # apply(x,1,sum) 計算x內每列之加總
 hist(x, col="light blue", prob=T, main=paste("n = ",i), 
       ylim=c(0,max(0.4, density(x)$y)),xlab=expression(bar(x)),lwd=2)
lines(density(x), col="red", lwd=3)
x1 = sort(x)
lines(x1,dnorm(x1), col="blue", lwd=3, lty=3)
}

# 樣本平均數與中位數的抽樣分配
windows()
par(mfrow=c(2,1))
T = 100000
n = 50
xbar = numeric(T) # xbar內的元素全為0
x1 = numeric(T)
for(i in 1:T)
{
x = runif(n)
xbar[i] = mean(x)
x1[i] = median(x)
}
hist(xbar, breaks=100, probability=T, xlab=expression(bar(x)),
     main="樣本平均數與中位數的抽樣分配 n = 50",lwd=2)
X = density(xbar)
lines(X$x,X$y,col="red",lwd=3)
lines(density(x1), lty=2, col="blue",lwd=3)
legend("topleft",c("平均數","中位數"),lty=1:2,col=c("red","blue"), bty="n",lwd=3)
abline(v=mean(x1),lty=3,col="blue",lwd=2)
points(0.5,0,pch=20,col="red")
text(0.5,0.1,expression(mu),col="red",pos=4)

n = 200
xbar1 = numeric(T) # xbar內的元素全為0
x2 = numeric(T)
for(i in 1:T)
{
x = runif(n)
xbar1[i] = mean(x)
x2[i] = median(x)
}
hist(xbar1, breaks=100, probability=T, xlab=expression(bar(x)),
     main="樣本平均數與中位數的抽樣分配 n = 200",lwd=2)
X = density(xbar1)
lines(X$x,X$y,col="red",lwd=3)
lines(density(x2), lty=2, col="blue",lwd=3)
legend("topleft",c("平均數","中位數"),lty=1:2,col=c("red","blue"), bty="n",lwd=3)
abline(v=mean(x2),lty=3,col="blue",lwd=2)
points(0.5,0,pch=20,col="red")
text(0.5,0.1,expression(mu),col="red",pos=4)
abline(v=mean(xbar1),lty=2, col="red")
mean(xbar)
mean(xbar1)
mean(x1)
mean(x2)
sd(xbar)
sd(xbar1)
sd(x1)
sd(x2)
