# 預測股價的走勢: 一個公平的遊戲? 明日股價不是上升就是下降
# random walk, 隨機漫步
set.seed(589)
x = sample(c(-1,1), 1000, replace = TRUE) #股價上升得1,下跌得-1
x
x1 = cumsum(x)
x1
x1[length(x1)] # 最後第1000天的損益 P$L

windows()
par(mfrow=c(2,1))
plot(cumsum(x), type = 'l', main="Random Walk",lwd=2)

T = 10000
y = numeric(10000) 
for(i in 1:T) 
{
 x = cumsum(sample(c(-1,1), 1000, replace = TRUE)) 
 y[[i]] = x[length(x)] 
 }
hist(y, main = "損益之直方圖",col = "lightblue", breaks = 100, prob=T,lwd=2)
abline(v = 0, col = "red", lwd = 2)
library(fBasics)
basicStats(y)

# 20條隨機漫步的模擬
T = 1000
c = 0.01
t = 1:T
pt1 = c*t + cumsum(rnorm(T)) # cumsum表示累加
pt2 = c*t + cumsum(rnorm(T))
pt3 = c*t + cumsum(rnorm(T))
pt4 = c*t + cumsum(rnorm(T))
pt5 = c*t + cumsum(rnorm(T))
pt6 = c*t + cumsum(rnorm(T))
pt7 = c*t + cumsum(rnorm(T))
pt8 = c*t + cumsum(rnorm(T))
pt9 = c*t + cumsum(rnorm(T))
pt10 = c*t + cumsum(rnorm(T))
pt11 = c*t + cumsum(rnorm(T))
pt12 = c*t + cumsum(rnorm(T))
pt13 = c*t + cumsum(rnorm(T))
pt14 = c*t + cumsum(rnorm(T))
pt15 = c*t + cumsum(rnorm(T))
pt16 = c*t + cumsum(rnorm(T))
pt17 = c*t + cumsum(rnorm(T))
pt18 = c*t + cumsum(rnorm(T))
pt19 = c*t + cumsum(rnorm(T))
pt20 = c*t + cumsum(rnorm(T))

windows()
plot(pt1,type="l", ylim=c(-100,100), xlab="", ylab="", lwd=2,
          main="隨機漫步的模擬")
lines(pt2,lty=2,col="2", lwd=2)
lines(pt3,lty=3,col="3", lwd=2)
lines(pt4,lty=4,col="4", lwd=2)
lines(pt5,lty=5,col="5", lwd=2)
lines(pt6,lty=6,col="6", lwd=2)
lines(pt7,lty=7,col="7", lwd=2)
lines(pt8,lty=8,col="8", lwd=2)
lines(pt9,lty=9,col="9", lwd=2)
lines(pt10,lty=10,col="10", lwd=2)
lines(pt11,lty=11,col="11", lwd=2)
lines(pt12,lty=12,col="12", lwd=2)
lines(pt13,lty=13,col="13", lwd=2)
lines(pt14,lty=14,col="14", lwd=2)
lines(pt15,lty=15,col="15", lwd=2)
lines(pt16,lty=16,col="16", lwd=2)
lines(pt17,lty=17,col="17", lwd=2)
lines(pt18,lty=18,col="18", lwd=2)
lines(pt19,lty=19,col="19", lwd=2)
lines(pt20,lty=20,col="20", lwd=2)
