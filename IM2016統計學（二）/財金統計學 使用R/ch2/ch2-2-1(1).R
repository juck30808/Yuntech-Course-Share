TSMCm = read.table("x:\\fsr\\ch2\\TSMCm.txt",header=T)
names(TSMCm)
attach(TSMCm)
# 二種報酬率的計算
price = 積收盤價
積股利 = 積本益比/積收盤價
積股利 = 1/積股利

div = 積股利
T = length(price)
r1 = 100*(price[2:T]-price[1:(T-1)])/price[1:(T-1)]
lr1 = 100*diff(log((price)))
r = 100*(price[2:T]+div[2:T]-price[1:(T-1)])/price[1:(T-1)]
lr = 100*(log(price[2:T]+div[2:T])-log(price[1:(T-1)]))
T = length(lr)
windows()
par(mfrow=c(2,1))
plot(1:T,r,type="p", xlab="", lwd=2,pch=2,main="簡單報酬率與對數報酬率之比較 (含股利)",
      ylim=c(-40,40))
lines(1:T,lr, type="p", col="red",lwd=2)
legend("bottomright",c("簡單","對數"),col=c("black","red"), pch=c(2,1),
        bty="y")

plot(1:T,r1,type="p",xlab="", main="簡單報酬率與對數報酬率之比較 (不含股利)",lwd=2,pch=2,
      ylim=c(-40,40))
lines(1:T,lr1, type="p", col="red",lwd=2)
legend("bottomright",c("簡單","對數"),col=c("black","red"), pch=c(2,1),
        bty="y")


# 樣本變異數的抽樣分配
var1 = sum((lr-mean(lr))^2)/length(lr)
N = 10000
n = 50
VAR = numeric(N)
VAR1 = numeric(N)
set.seed(123)
for(i in 1:N)
{
  sample1 = sample(lr,n,replace=T)
  VAR[i] = var(sample1)
  VAR1[i] = sum((sample1-mean(sample1))^2)/n
}
windows()
par(mfrow=c(2,1))
hist(VAR,breaks=100,prob=T,xlab="",main="樣本變異數的抽樣分配",lwd=2)
abline(v=var1,col="red")
points(mean(VAR),0, lwd=3)
hist(VAR1,breaks=100,prob=T,xlab="",main="其他樣本變異數的抽樣分配",lwd=2)
abline(v=var1,col="red")
points(mean(VAR1),0, lwd=3)
var1
mean(VAR)
mean(VAR1)
