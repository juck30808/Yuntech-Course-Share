# ch 5
# Daily TSMC
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch4\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))
# pbar抽樣分配
windows()
par(mfrow=c(2,1))
T = 100000
n = 5000
pbar = numeric(T)# pbar內共有T個元素,其皆為0
#x1 = numeric(T)
for(i in 1:T)
{
x = runif(n,-0.5,0.5)
index = x > 0
pbar[i] = mean(as.numeric(index))
#x1[i] = median(x)
}
hist(pbar, breaks=100, probability=T, xlab=expression(bar(p)),lwd=2,
     main="樣本比率的抽樣分配")
X = density(pbar)
lines(X$x,X$y,lty=2,col="red",lwd=3)
#lines(density(x1), lty=3, col="blue")
legend("topleft",c("樣本比率的抽樣分配"),lty=2,col=c("red"), bty="n",lwd=3)
abline(v=mean(pbar),lty=3,col="blue",lwd=2)
points(0.5,0,pch=20,col="red")
text(0.5,0.1,expression(p),col="red",pos=4)

sepbar = sqrt(pbar*(1-pbar)/n) # 樣本比率的標準誤
spbar = (pbar-0.5)/sepbar # 標準化
hist(spbar, breaks=100, probability=T, xlab=expression(z),
     main="樣本比率的抽樣分配")
X = density(spbar)
lines(X$x,X$y,lty=2,col="red",lwd=3)
z=seq(-3,3,length=100000)
lines(z,dnorm(z),col="blue",lty=3,lwd=3)
legend("topleft",c("樣本比率的抽樣分配","標準常態分配"),lty=2:3,col=c("red",
       "blue"),bty="n",lwd=3)
#write.table(tsmc.r,"g:\\stat\\ch5\\tsmc_r.txt") # 存檔

# 股價淨值比與報酬率
x = 股價淨值比
x = x[2:length(x)]
length(x)
length(tsmc.r)
x = x[271:length(x)] #1/2/2001-7/10/2014
r = tsmc.r[271:length(tsmc.r)]
x = x[1:(length(x)-1)]
r = r[2:length(r)] # 報酬率落後1日
cor((x-mean(x)),r) # 相關係數
windows()
plot((x-mean(x)),r,type="p",xlab="超額股價淨值比",ylab="對數報酬率",
          main="TSMC對數報酬率與超額淨值比之散佈圖",lwd=3)
abline(h=mean(r),col="red")
abline(v=mean(x-mean(x)),col="red")
length(x)
length(r)
i = (x-mean(x))<0 # 超額淨值比小於0
r1 = r[i] # 對應至報酬率
r1 
index = r1 > 0 #報酬率>0
pbar = mean(as.numeric(index))
pbar
length(r1)

T = 10000
n = 100
pbar1 = numeric(T)
set.seed(123456)
for(i in 1:T)
{
  r2 = sample(r1,n,replace=T)
  index = r2 > 0
  pbar1[i] = mean(as.numeric(index))
}
windows()
plot(density(pbar1),xlab=expression(bar(p)), main="報酬率大於0的抽樣分配",lwd=3)
abline(v = mean(pbar1))
z = sort(pbar1)
lines(z,dnorm(z,mean(pbar1),sd(pbar1)), lty=2, col="red",lwd=3)
legend("topleft",c("估計密度","常態"),lty=1:2,col=c("black","red"),bty="n",lwd=3)
a = mean(pbar1)-0.1
b = mean(pbar1)+0.1
x = dnorm(z,mean(pbar1),sd(pbar1))
i = z >= a & z <= b
polygon(c(a,z[i],b),c(0,x[i],0),
     density=c(10,20), angle=c(-45,45), col="green")
points(pbar,0,pch=20)
text(pbar,0,labels=expression(p),pos=3)
text(a,0,labels=expression(p-0.1),pos=3)
points(a,0,pch=20)
points(b,0,pch=20)
text(b,0,labels=expression(p+0.1),pos=3)
lines(z,dnorm(z,mean(pbar1),sd(pbar1)), lty=2, col="red")

# 0.9568121
pnorm(b,mean=mean(pbar1),sd=sd(pbar1))-pnorm(a,mean=mean(pbar1),sd=sd(pbar1))



x = 本益比
p = 收盤價
div = x/p;div = 1/div
windows()
plot(div,type="l")
x = div
library(fBasics)
basicStats(x)
length(x)
length(p)
q05 = quantile(x,0.5)
cor((x-q05),p)
windows()
plot((x-q05),p, type="p")
abline(h=mean(p))
abline(v=0)
es = x-q05
i = es > 0
p1 = p[i]
p1
i1 = p1 < mean(p)
pbar = mean(as.numeric(i1))
pbar
