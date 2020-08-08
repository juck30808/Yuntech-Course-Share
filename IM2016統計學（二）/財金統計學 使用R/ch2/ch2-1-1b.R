# 練習抽出放回動作
TSMCm = read.table("x:\\fsr\\ch2\\TSMCm.txt",header=T) # 此檔內有名稱
names(TSMCm) # TWIm內有各序列名稱
attach(TSMCm) # 接近此檔案
tu = 積週轉率
tu
head(tu)
n = length(tu)
?sample
tu1 = sample(tu,n,replace=T) # 注意replace須為T
head(tu1)
tu1 = sample(tu,n,replace=T)  
head(tu1)
set.seed(123)
tu1 = sample(tu,n,replace=T)  
head(tu1)
set.seed(123)
tu1 = sample(tu,n,replace=T)  
head(tu1)


N = 10000
n = 10
turo = numeric(N)
for(i in 1:N)
{
 turo[i] = mean(sample(tu,n,replace=T))
}
windows()
par(mfrow=c(2,2))
hist(turo, breaks=100, prob=T, main="(a) TSMC月平均週轉率分配 n=10")
abline(v=mean(tu), col="red")
lines(density(turo), lty=2, col="blue",lwd=2)
points(mean(turo),0, lwd=3)
mean(turo)-mean(tu)

n = 30
for(i in 1:N)
{
 turo[i] = mean(sample(tu,n,replace=T))
}
hist(turo, breaks=100, prob=T, main=" (b) TSMC月平均週轉率分配 n=30")
abline(v=mean(tu), col="red")
lines(density(turo), lty=2, col="blue",lwd=2)
points(mean(turo),0, lwd=3)
mean(turo)-mean(tu)

n = 100
for(i in 1:N)
{
 turo[i] = mean(sample(tu,n,replace=T))
}
hist(turo, breaks=100, prob=T, main=" (c) TSMC月平均週轉率分配 n=100")
abline(v=mean(tu), col="red")
lines(density(turo), lty=2, col="blue",lwd=2)
points(mean(turo),0, lwd=3)
mean(turo)-mean(tu)
 
n = 1000
for(i in 1:N)
{
 turo[i] = mean(sample(tu,n,replace=T))
}
hist(turo, breaks=100, prob=T, main=" (d) TSMC月平均週轉率分配 n=1000")
abline(v=mean(tu), col="red")
lines(density(turo), lty=2, col="blue",lwd=2)
points(mean(turo),0, lwd=3)
mean(turo)-mean(tu)
mean(tu)
 

windows()
hist(tu,main="TSMC月週轉率次數分配", xlab="",lwd=2)
abline(v=mean(tu), col="red",lty=2,lwd=2)
abline(v=median(tu), col="blue", lty=3,lwd=2)
his = hist(tu,plot=F)
his
abline(v=3.5, col="orange",lty=4,lwd=2)
legend("topright",c("mean","median","mode"), lty=c(2,3,4), lwd=2,
       col=c("red","blue","orange"), bty="n")

quantile(tu,prob=0.05)
quantile(tu,prob=0.65)
quantile(tu,prob=c(0.05,0.65))
quantile(tu,prob=c(0.25,0.5,0.75))
median(tu)
quantile(tu,prob=c(0.01,0.001,0.0001))
