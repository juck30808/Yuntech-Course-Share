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

# 常態分配的特徵
set.seed(123)
x = rnorm(10000)
basicStats(x)
windows()
z = seq(-4,4,length=1000)
plot(z,dnorm(z),type="h", col="green",  frame.plot=F, ylim=c(0,0.43),ylab="",lwd=3)
mtext("(標準) 常態分配特徵", cex=3)
i = z >= -1 & z <= 1
polygon(c(-1,z[i],1),c(0,dnorm(z[i]),0),density=c(10,20), angle=c(-45,45), 
      col="red")
points(0,dnorm(0),cex=2, pch=20)
points(0,0,cex=2,pch=20)
text(0,0,labels=expression(mu),pos=3,cex=2)
text(0.122,dnorm(0.0),labels=expression(frac(1,sqrt(2*pi))),pos=4,cex=2)
j = z >= -2 & z <= 2
polygon(c(-2,z[j],2),c(0,dnorm(z[j]),0),density=c(10,20), angle=c(-0,0), 
      col="black")
segments(0,0,0,dnorm(0),lty=3,col="steelblue")
points(-1,dnorm(-1),cex=2,pch=20)
text(-1,0,labels=expression(mu-sigma),pos=2,cex=2)
points(1,dnorm(1),cex=2,pch=20)
text(1,0,labels=expression(mu+sigma),pos=4,cex=2)
points(-1,0,cex=2,pch=20)
points(1,0,cex=2,pch=20)

pnorm(1)-pnorm(-1)
pnorm(2)-pnorm(-2)
pnorm(3)-pnorm(-3)

#basicStats(tsmc.r)
mu = mean(tsmc.r)
sigma = sd(tsmc.r)
pnorm(6,mu,sigma)-pnorm(-2,mu,sigma)
pnorm(-6,mu,sigma)
x = tsmc.r
index.l = x <= (mu-3*sigma)  
index.u = x >= (mu+3*sigma)
pbar.l = mean(as.numeric(index.l))
pbar.l
pbar.u = mean(as.numeric(index.u))
pbar.u
cor(x[index.l],x[index.u])
(1-(pnorm(3)-pnorm(-3)))
length(x[index.l])
length(x[index.u])
length(tsmc.r)*(1-(pnorm(3)-pnorm(-3)))

mu.T = mean(twi.r)
sigma.T = sd(twi.r)
y = twi.r
Tindex.l = y <= (mu.T-3*sigma.T)  
Tindex.u = y >= (mu.T+3*sigma.T)
Tpbar.l = mean(as.numeric(Tindex.l))
Tpbar.l
Tpbar.u = mean(as.numeric(Tindex.u))
Tpbar.u
cor(y[Tindex.l][-1],y[Tindex.u]) # 除去y的第一個資料
length(y[Tindex.l])
length(y[Tindex.u])

cor(x,y)
lo = as.numeric(index.l) == 1 & as.numeric(Tindex.l) == 1
lo
cor(x[lo],y[lo])
up = as.numeric(index.u) == 1 & as.numeric(Tindex.u) == 1
cor(x[up],y[up])

windows()
plot(twi.r,tsmc.r, type="p",xlab="加權指數日報酬率",ylab="台積電日報酬率",frame.plot=F,lwd=2)
mtext("加權指數與台積電日報酬率之間之散佈圖",cex=2, col="steelblue")
abline(lm(tsmc.r~twi.r), col="red")
abline(v=(mean(twi.r)-3*sd(twi.r)), lty=2, col="blue")
abline(v=(mean(twi.r)+3*sd(twi.r)), lty=2, col="blue")
abline(h=(mean(tsmc.r)-3*sd(tsmc.r)), lty=2, col="blue")
abline(h=(mean(tsmc.r)+3*sd(tsmc.r)), lty=2, col="blue")




