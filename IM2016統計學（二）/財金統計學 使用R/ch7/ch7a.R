# ch 7
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
windows()
par(mfrow=c(2,1))
plot(x,y,type="p",xlab="TWI月超額報酬率",ylab="TSMC月超額報酬率", lwd=3,
    main="TSMC與TWI月超額報酬率之間的散佈圖")
abline(lm(y~x),col="red", lwd=3)
x1 = x[1:10]
y1 = y[1:10]
plot(x1,y1,type="p",xlab="TWI月超額報酬率",ylab="TSMC月超額報酬率", lwd=3,
    main="樣本與母體迴歸線",ylim=c(-30,20))
model = lm(y1~x1)
abline(model,col="red",lwd=3)
x2 = seq(-20,20,length=n)
lines(x2,(1+1.5*x2),lwd=3)
points(x[7],y[7],pch=20)
yhat = fitted.values(model)[7]
points(x[7],yhat,pch=20)
points(x[9],y[9],pch=20)
arrows(-18,0,-18,(1+1.5*(-18)))
text(-18,0,labels=expression(paste("E[y|x] = ",beta[0]+beta[1]*x)),pos=3)
yhat3 = fitted.values(model)[3]
arrows(x[3],12,x[3],yhat3)
text(x[3],12,labels=expression(paste(hat(y)," = ",b[0]+b[1]*x)),pos=3)
segments(x[7],y[7],x[7],yhat,lty=2,col="blue")
arrows(-3,10,x[7],y[7],lty=2,col="blue")
arrows(-3,10,x[7],yhat,lty=2,col="blue")
text(-3,10,labels="e",pos=4)
arrows(-9,10,x[9],y[9],lty=4,col="steelblue")
arrows(-9,10,x[9],(1+1.5*x[9]),lty=4,col="steelblue")
segments(x[9],y[9],x[9],(1+1.5*x[9]),lty=4,col="steelblue")
text(-9,10,labels=expression(epsilon),pos=4)
points(x[9],(1+1.5*x[9]),pch=20)
