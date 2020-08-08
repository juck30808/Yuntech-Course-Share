# ch3

# 擲一個銅板
set.seed(123) # 模擬的源頭
n = 5
x = sample(c(0,1), n, replace=T)
x
pbar = mean(x)
pbar

set.seed(123)
n = 10
x = sample(c(0,1), n, replace=T)
x
pbar = mean(x)
pbar

set.seed(123)
n = 100
x = sample(c(0,1), n, replace=T)
pbar = mean(x)
pbar

set.seed(123)
n = 10000
x = sample(c(0,1), n, replace=T)
pbar = mean(x)
pbar

set.seed(123)
n = 100000
x = sample(c(0,1), n, replace=T)
pbar = mean(x)
pbar

set.seed(123)
n = 10000000
x = sample(c(0,1), n, replace=T)
pbar = mean(x)
pbar

# pbar 的抽樣分配: Central Limit Theorem or Law of Large Number
windows()
N = 100000
par(mfrow=c(2,2))
n = 10 
pbar = numeric(N) # storing space
for(i in 1:N)
{
 x = sample(c(0,1), n, replace=T)
 pbar[i] = mean(x)
}
hist(pbar, border="pink", prob=T, col="gray", xlab=expression(bar(p)),
      main="正面出現的機率:n = 10",lwd=2) 
lines(density(pbar), lty=2, col="blue",lwd=2)

n = 30 
pbar = numeric(N) # storing space
for(i in 1:N)
{
 x = sample(c(0,1), n, replace=T)
 pbar[i] = mean(x)
}
hist(pbar, breaks=100, border="pink", prob=T, col="green", xlab=expression(bar(p)),
    main="正面出現的機率:n = 30",lwd=2) 
lines(density(pbar), lty=2, col="red",lwd=2)

n = 100 
pbar = numeric(N) # storing space
for(i in 1:N)
{
 x = sample(c(0,1), n, replace=T)
 pbar[i] = mean(x)
}
hist(pbar, breaks=100,border="pink", prob=T, col="gray",xlab=expression(bar(p)),
     main="正面出現的機率:n = 100",lwd=2) 
lines(density(pbar), lty=2, col="red",lwd=2)

n = 10000 
pbar = numeric(N) # storing space
for(i in 1:N)
{
 x = sample(c(0,1), n, replace=T)
 pbar[i] = mean(x)
}
hist(pbar, breaks=100, prob=T, border="pink", col="gray",xlab=expression(bar(p)),
          main="正面出現的機率:n = 10000",lwd=2) 
lines(density(pbar), lty=2, col="blue",lwd=2)
sd = 0.5/sqrt(n)
abline(v =(0.5+1.96*sd), lty=2)
abline(v =(0.5-1.96*sd), lty=2)
text(0.5,0,labels=expression(p), pos=3)
