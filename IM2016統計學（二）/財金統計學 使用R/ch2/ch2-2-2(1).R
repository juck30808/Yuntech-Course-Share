TSMCm = read.table("c:\\meiyih\\Finstats\\ch2\\TSMCm.txt",header=T)
names(TSMCm)
attach(TSMCm)
TWIm = read.table("c:\\meiyih\\Finstats\\ch2\\TWIm.txt",header=T)#此檔內有名稱
names(TWIm) # TWIm內有各序列名稱
attach(TWIm) # 接近此檔案

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
股利 = 本益比/收盤價
股利 = 1/股利

# volatility
sqrt(12)*sd(lr) # annual 年率化
sd(lr) # standard deviation
sqrt(12*var(lr))

# 計算移動平均股價
x = price
library(fTrading)
windows()
par(mfrow=c(2,2))
m = 5
x5 = SMA(x, n= 5) # 5月均線
T = length(x)
T1 = m:T
ts.plot(x[T1],ylab="股價",lwd=2)
lines(T1,x5, lty=2, col="red",lwd=2)
legend("topleft", c("TSMC股價","5月均線"), lty=1:2, col=c("black","red"),lwd=2)

m = 12
x12 = SMA(x, n= m) # 12月均線
T = length(x)
T1 = m:T
ts.plot(x[T1],ylab="股價",lwd=2)
lines(T1,x12, lty=2, col="red",lwd=2)
legend("topleft", c("TSMC股價","12月均線"), lty=1:2, col=c("black","red"),lwd=2)

m = 15
x15 = SMA(x, n= m) # 15月均線
T = length(x)
T1 = m:T
ts.plot(x[T1],ylab="股價",lwd=2)
lines(T1,x15, lty=2, col="red",lwd=2)
legend("topleft", c("TSMC股價","15月均線"), lty=1:2, col=c("black","red"),lwd=2)

m = 30
x30 = SMA(x, n= m) # 30月均線
T = length(x)
T1 = m:T
ts.plot(x[T1],ylab="股價",lwd=2)
lines(T1,x30, lty=2, col="red",lwd=2)
legend("topleft", c("TSMC股價","30月均線"), lty=1:2, col=c("black","red"),lwd=2)


# 存5月均線股價資料
#write.table(x5,"g:\\stat\\ch2\\TSMC_5ma.txt")

# 移動波動率
sdx = sd(lr)*sqrt(12)
windows()
par(mfrow=c(2,2))
m = 5
sdx5 = rollFun(lr, m, FUN=sd)*sqrt(12)
ts.plot(sdx5, main="TSMC:5月移動波動率",ylab="volatility",lwd=2)
abline(h=sdx, lty=2,lwd=2)

m = 25
sdx25 = rollFun(lr, m, FUN=sd)*sqrt(12)
ts.plot(sdx25, main="TSMC:25月移動波動率",ylab="volatility",lwd=2)
abline(h=sdx, lty=2,lwd=2)


m = 30
sdx30 = rollFun(lr, m, FUN=sd)
ts.plot(sdx30, main="TSMC:30月移動波動率",ylab="volatility",lwd=2)
abline(h=sdx, lty=2,lwd=2)

m = 50
sdx50 = rollFun(lr, m, FUN=sd)
ts.plot(sdx50, main="TSMC:50月移動波動率",ylab="volatility",lwd=2)
abline(h=sdx, lty=2,lwd=2)

# TWI
price = 收盤價
div = 股利 
T = length(price)
lr.TWI = 100*(log(price[2:T]+div[2:T])-log(price[1:(T-1)]))
mean(lr.TWI)*12
sd(lr.TWI)*sqrt(12)

# CV
100*(sd(lr)*sqrt(12))/(mean(lr)*12)
100*(sd(lr.TWI)*sqrt(12))/(mean(lr.TWI)*12)







