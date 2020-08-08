# weekly data, 1/7/2000-7/4/2014
TSMCw = read.table("c:\\meiyih\\Finstats\\ch3\\TSMCw.txt", header=T)
names(TSMCw)
attach(TSMCw)
library(fBasics)
y = 週轉率
x = 收盤價
basicStats(y)
windows()
plot(y,x,main="TSMC:週收盤價與週轉率之間的散佈圖",xlab="週轉率",ylab="週收盤價",lwd=2)
abline(lm(x~y), col="red")
abline(v=mean(y), lty=2, col="blue")
abline(h=mean(x), lty=2, col="blue")

cor(x,y)

n = length(y)
index = y > mean(y)
pbar1 = mean(as.numeric(index))
round(pbar1,2)
round((pbar1*n),0)

index = y <= mean(y)
pbar2 = mean(as.numeric(index))
round(pbar2,2)
round((pbar2*n),0)

index = x > mean(x)
pbar3 = mean(as.numeric(index))
round(pbar3,2)
round((pbar3*n),0)

index = x <= mean(x)
pbar4 = mean(as.numeric(index))
round(pbar4,2)
round((pbar4*n),0)

index = x > mean(x) & y > mean(y)
pbar5 = mean(as.numeric(index))
round(pbar5,2)
round((pbar5*n),0)

index = x <= mean(x) & y > mean(y)
pbar6 = mean(as.numeric(index))
round(pbar6,2)
round((pbar6*n),0)

index = x > mean(x) & y <= mean(y)
pbar7 = mean(as.numeric(index))
round(pbar7,2)
round((pbar7*n),0)

index = x <= mean(x) & y <= mean(y)
pbar8 = mean(as.numeric(index))
round(pbar8,2)
round((pbar8*n),0)

# 週轉率低於其平均數的條件下，收盤價會高於其平均數的機率
# pbar2,pbar7
pbar7/pbar2




