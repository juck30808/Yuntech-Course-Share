# weekly data, 1/7/2000-7/4/2014
TSMCw = read.table("c:\\meiyih\\Finstats\\ch3\\TSMCw.txt", header=T)
names(TSMCw)
attach(TSMCw)
x = 收盤價
library(fBasics)
basicStats(x) # 基本統計量
#股利
div = 本益比/x
div = 1/div
n = length(div)
# 對數報酬率
xr = 100*(log(x[2:n]+div[2:n])-log(x[1:(n-1)]))
basicStats(xr)
windows()
par(mfrow=c(2,1))
hist(x,n=5, xlab="股價",ylab="次數",main="股價次數分配", border="pink",
            col="steelblue",lwd=2)
hist(xr,n=7, xlab="對數報酬率",ylab="次數", border="green",
           main="對數報酬率次數分配", col="red",lwd=2)
hp = hist(x,n=5,plot=F)
hp
pfi = round(hp$counts/n,2)
pfi
pmidi = hp$mids
pmidi
mean(x)
sum(pfi*pmidi)

m = length(xr)
hr = hist(xr,breaks=7,plot=F)
hr
rfi = round(hr$counts/m,2)
rfi
rmidi = hr$mids
rmidi
mean(xr)
sum(rmidi*rfi)

#週收盤價與週報酬率的時間走勢
windows()
par(mfrow=c(2,1))
plot(x,type="l",xlab="時間",ylab="股價", main="週收盤價的時間走勢",lwd=3)
abline(h=mean(x), lty=2, col="red")
plot(xr,type="l",xlab="時間",ylab="報酬率", main="週報酬率的時間走勢",lwd=2)
abline(h=mean(xr), lty=2, col="red",lwd=2)
abline(h=sd(xr), lty=30, col="blue",lwd=2)
legend("bottomright",c("平均數","標準差"),lty=c(2,30),lwd=2,bty="n",col=c("red","blue"))
        
p = pmidi
fp = pfi
windows()
par(mfrow=c(1,2))
barplot(fp,width=1,horiz=F,xlab="p",ylab=expression(f(p)), border="black",
     main="股價之直方圖", col="tomato",lwd=2)
r = rmidi
fr = rfi
barplot(fr,width=1,horiz=F,xlab="r",ylab=expression(f(r)), border="red",
     main="報酬率之直方圖", col="green",lwd=2)

# 面積表示機率
# plot density with shaded area showing Pr(-2 <= X <= 1)
lb = -2
ub = 1
x.vals = seq(-4, 4, length=150)
d.vals = dnorm(x.vals)
# plot normal density
windows()
plot(x.vals, d.vals, type="l", xlab="x", frame.plot = F,,main="面積表示機率",lwd=2,
            ylab=expression(f(x)))
i = x.vals >= lb & x.vals <= ub
# add shaded region between -2 and 1
polygon(c(lb, x.vals[i], ub), c(0, d.vals[i], 0), col="tomato")
rect(0.9,0,1.1,dnorm(1),lty=2)
rect(0.7,0,1.3,dnorm(1),lty=3)
text(2,0.3,labels=expression(f(x)),pos=4, cex=2)
arrows(2,0.3,0.75,0.3)

# Integration
?integrate
integrate(dnorm,-2,1)
pnorm(1)-pnorm(-2)





