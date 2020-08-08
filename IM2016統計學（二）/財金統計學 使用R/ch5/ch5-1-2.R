# exchange rates 1/2/2002-7/10/2014
exch = read.table("c:\\meiyih\\Finstats\\ch5\\exch.txt", header=T)
attach(exch)
names(exch)
tai.r = 100*diff(log(新台幣))
# Applications
T = 10000
n = 100
xbar = numeric(T)
set.seed(12345)
for(i in 1:T)
{
  xbar[i] = mean(sample(tai.r,n,replace=T))
}
windows()
plot(density(xbar),xlab=expression(paste(bar(x)," (%)")), lwd=3,ylim=c(-1,18),
      main="樣本平均數的抽樣分配:匯率報酬率 n = 100")
sd(tai.r)
mean(tai.r)
mean(xbar)
sd(xbar)
sd(tai.r)/sqrt(n)
points(mean(tai.r),0,pch=20,lwd=2)
text(mean(tai.r),0,labels=expression(mu),pos=4,cex=1.5)
lines(sort(xbar),dnorm(sort(xbar),mean(tai.r),(sd(tai.r)/sqrt(n))),col="red",
       lty=2,lwd=3)
legend("topleft",c("估計密度","常態"),lty=1:2,col=c("black","red"),bty="n",lwd=3)
i = sort(xbar) >= (mean(tai.r)-0.06) & sort(xbar) <= (mean(tai.r)+0.06)
x = sort(xbar)
a = (mean(tai.r)-0.06)
b = (mean(tai.r)+0.06)
polygon(c(a,x[i],b),c(0,dnorm(x[i],mean(tai.r),(sd(tai.r)/sqrt(n))),0),
     density=c(10,20), angle=c(-45,45), col="green")
abline(v=mean(tai.r))      
lines(sort(xbar),dnorm(sort(xbar),mean(tai.r),(sd(tai.r)/sqrt(n))),col="red",
       lty=2)
points(a,0,pch=20)
text(a,0,labels=expression(paste(mu-0.06)),pos=1,cex=1.5)
text(b,0,labels=expression(paste(mu+0.06)),pos=1,cex=1.5)
points(b,0,pch=20)
abline(v=(mean(tai.r)+0.03), lty=3,lwd=2)
pnorm(3)-pnorm(-3)
