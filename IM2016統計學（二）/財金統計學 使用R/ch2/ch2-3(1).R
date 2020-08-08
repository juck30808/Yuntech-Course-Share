TWIm = read.table("c:\\meiyih\\Finstats\\ch2\\TWIm.txt",header=T)#此檔內有名稱
names(TWIm) # TWIm內有各序列名稱
attach(TWIm) # 接近此檔案
TSMCm = read.table("c:\\meiyih\\Finstats\\ch2\\TSMCm.txt",header=T)
names(TSMCm)
attach(TSMCm)
積股利 = 積本益比/積收盤價
積股利 = 1/積股利
price = 積收盤價
T = length(price)
div = 積股利
lr = 100*(log(price[2:T]+div[2:T])-log(price[1:(T-1)]))
股利 = 本益比/收盤價
股利 = 1/股利
price = 收盤價
div = 股利 
T = length(price)
lr.TWI = 100*(log(price[2:T]+div[2:T])-log(price[1:(T-1)]))
tu = 積週轉率

# Skewness and Kurtosis
# 偏
library(fGarch)
windows()
par(mfrow = c(3, 2))
set.seed(123)
r = rsnorm(n = 1000, xi=2)
plot(r, type = "l", ylab="", xlab="", main = "右偏之觀察值", col = "steelblue",lwd=2)
hist(r, n = 25, prob=T, border="white", col="steelblue",main="右偏分配",lwd=2)   
#box()
x = seq(min(r), max(r), length = 201)
lines(x, dnorm(x), lwd = 2)
legend("topright",c("標準常態"),col="black", lty=1, bty="n",lwd=2)
# Plot ECDF and compare with true CDF:
plot(sort(r), (1:1000/1000),type="l", main = "CDF", col = "gray74", ylab = "CDF",
          xlab="",lwd=2)        
lines(x, pnorm(x), lwd = 2,lty=2)
legend("topleft",c("右偏","標準常態"),col=c("gray74","black"), lty=1:2, bty="n",lwd=2)

# Compute quantiles:
round(qsnorm(psnorm(q = seq(-1, 5, by = 0.03))), digits = 2)

r = rsnorm(n = 1000, xi=-2)
plot(r, type = "l", ylab="", xlab="", main = "左偏之觀察值", col = "tomato",lwd=2)
hist(r, n = 25, prob=T, border="white", col="forestgreen",main="左偏分配",lwd=2)    
#box()
x = seq(min(r), max(r), length = 201)
lines(x, dnorm(x), lwd = 2)
legend("topleft",c("標準常態"),col="black", lty=1, bty="n",lwd=2)

# Plot ECDF and compare with true CDF:
plot(sort(r),(1:1000/1000),type="l", main = "CDF", col = "tomato", ylab = "CDF",
          xlab="",lwd=2)        
lines(x, pnorm(x), lwd=2, col="dark gray",lty=2)
legend("topleft",c("左偏","標準常態"),col=c("tomato","dark gray"),lty=1:2,bty="n",lwd=2)

# Compute quantiles:
round(qsnorm(psnorm(q = seq(-1, 5, by = 0.03))), digits = 2)

# 偏且高峰 
windows()
par(mfrow = c(3, 2))
set.seed(123)
r = rsstd(n = 1000,nu=3,xi=2)
plot(r, type = "l", main = "右偏高峰之觀察值", col = "steelblue",lwd=2)
r = (r-mean(r))/sd(r) # 標準化
hist(r, n = 100, probability = TRUE, border = "white", col = "steelblue",lwd=2,
      xlim=c(-2,6),main="右偏高峰之分配")
#box()
x = seq(min(r), max(r), length = 201)
lines(x, dnorm(x), lwd = 2)
legend("topright",c("標準常態"),col="black", lty=1, bty="n",lwd=2)

# Plot ECDF and compare with true CDF:
plot(sort(r), (1:1000/1000),type="l", main = "CDF", col = "forestgreen", ylab = "CDF",
          xlab="",lwd=2)        
lines(x, psnorm(x), lwd = 2, col="red",lty=2)
legend("topleft",c("右偏高峰","標準常態"),col=c("forestgreen","red"), lty=1:2, bty="n",lwd=2)

r = rsstd(n = 1000,nu=3,xi=-2)
plot(r, type = "l", main = "左偏高峰之觀察值", col = "royalblue",lwd=2)
r = (r-mean(r))/sd(r)
hist(r, n = 100, probability = TRUE, border = "white", col = "gold",lwd=2,
       main="左偏高峰之分配")
#box()
x = seq(min(r), max(r), length = 201)
lines(x, dnorm(x), lwd = 2)
legend("topleft",c("標準常態"),col="black",lty=1,bty="n",lwd=2)

# Plot ECDF and compare with true CDF:
plot(sort(r), (1:1000/1000), main = "CDF",type="l", col = "tomato", ylab = "CDF",lwd=2,
          xlab="")        
lines(x, psnorm(x), lwd = 2,lty=2)
legend("topleft",c("左偏高峰","標準常態"),col=c("tomato","black"),lty=1:2, bty="n",lwd=2)


# Compute quantiles:
round(qsstd(psstd(q = seq(-1, 5, by = 1))), digits = 6)

# Compute skewness and kurtosis
library(moments)
skewness(lr)
kurtosis(lr)
skewness(lr.TWI)
kurtosis(lr.TWI)
skewness(tu)
kurtosis(tu)

windows()
par(mfrow=c(2,1))
hist(lr, main="TSMC日報酬率的次數分配", col="steelblue",
       border = "white", xlab="")
hist(lr.TWI, main="TWI日報酬率的次數分配", col="forestgreen",
       xlab="",border = "white")
