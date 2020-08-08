# Monthly TSMC and TWI
# 1/2000-6/2014
tsmcm = read.table("c:\\meiyih\\Finstats\\ch7\\tsmcm.txt", header=T)
attach(tsmcm)
names(tsmcm)
tsmc.r = 100*diff(log(收盤價))
twim = read.table("c:\\meiyih\\Finstats\\ch7\\twim.txt", header=T)
attach(twim)
names(twim)
# interest rates 1/2000-6/2014
# 央行一個月期存款牌告利率01/00-05/14
int = read.table("c:\\meiyih\\Finstats\\ch7\\interestrate.txt")
int = int[,1]
twi.r = 100*diff(log(收盤價_TW))
length(twi.r)

# 超額報酬率
n = length(int)
int = int[2:n]/12 # 年率轉為月率

y = tsmc.r-int
x = twi.r-int
n = length(y)
n
x1 = x[1:5]
y1 = y[1:5]
data = round(cbind(x1,y1),0)
data
windows()
plot(data,xlab="",ylab="",ylim=c(-9,6),xlim=c(-13,6),axes=F,type="n")
y = data[,2]
x = data[,1]
abline(lm(y~x),lwd=3) # 畫出迴歸線
points(x[1],y[2],pch=20,cex=2)
points(x[2],y[2],pch=20,cex=2)
points(x[3],y[3],pch=20,cex=2)
points(x[4],y[4],pch=20,cex=2)
points(x[5],y[5],pch=20,cex=2)
abline(h=-8.5,v=-12.5)
xbar = mean(x)
ybar = mean(y)
segments(xbar,-8.5,xbar,6,lty=2)
text(xbar,-8.5,labels=expression(bar(x)),pos=1,cex=1.5)
segments(-12.5,ybar,6,ybar,6,lty=2)
text(-12.5,ybar,labels=expression(bar(y)),pos=2,cex=1.5)
segments(x[4],-8.5,x[4],y[4],lty=4,col="steelblue")
arrows(-8,3,x[4],ybar,lty=3,col="red",lwd=2)
arrows(-8,3,x[4],y[4],lty=3,col="red",lwd=2)
text(-8,3,labels="SST",pos=2,cex=1.5)
yhat = fitted.values(lm(y~x))[4]
arrows(-9,1,x[4],yhat,lty=4,col="blue",lwd=2)
arrows(-9,1,x[4],y[4],lty=4,col="blue",lwd=2)
text(-9,1,labels="SSE",pos=2,cex=1.5)
text(-9,1,labels=expression(e[i]),pos=1,cex=1.5)
arrows(5,1,x[4],yhat,lty=18,col="green",lwd=2)
arrows(5,1,x[4],ybar,lty=18,col="green",lwd=2)
text(5,1,labels="SSR",pos=4,cex=1.5)
text(x[4],-8.5,labels=expression(x[i]),pos=1,cex=1.5)
yhat1 = fitted.values(lm(y~x))[5]
arrows(0,5,x[5],yhat1,lwd=2)
text(0,5,labels=expression(paste(hat(y)," = ",b[0]+b[1]*x)),pos=3,cex=1.5)
text(x[4],y[4],labels=expression(paste("(",x[i],",",y[i],")")),pos=4,cex=1.5)
arrows(5,-5,x[4],yhat,lty=12,lwd=2)
text(5,-5,labels=expression(hat(y[i])),pos=1,cex=1.5)
text(6,-8.5,labels="x",pos=1,cex=1.5)
text(-12.5,6,labels="y",pos=2,cex=1.5)

xbar
ybar
x
y
(x[1]-xbar)*(y[1]-ybar)
(x[2]-xbar)*(y[2]-ybar)
(x[3]-xbar)*(y[3]-ybar)
(x[4]-xbar)*(y[4]-ybar)
(x[5]-xbar)*(y[5]-ybar)
sxy = sum((x-xbar)*(y-ybar))
sxy
(x[1]-xbar)^2
(x[2]-xbar)^2
(x[3]-xbar)^2
(x[4]-xbar)^2
(x[5]-xbar)^2
sx = sum((x-xbar)^2)
sx
b1 = sxy/sx
b1 
b0 = ybar-b1*xbar
b0
