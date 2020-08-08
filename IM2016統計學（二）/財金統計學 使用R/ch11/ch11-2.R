# ch11-2
# 線性轉換
J1 = cbind(c(1,2),c(2,4))
J1

library(shape)
library(plotrix)
windows()
#par(mfrow=c(1,2))
plot(c(-5,10),c(10,-5),xlab="",ylab="",type="n",frame.plot=F,axes=F)
Arrows(-5,0,10,0,arr.type="curved",code=2,lwd=2)
text(10,0,labels="x",pos=1,lwd=2)
Arrows(0,-5,0,10,arr.type="curved",code=2,lwd=2)
text(0,10,labels="y",pos=2,lwd=2)
points(2,1,lwd=4,pch=20)
text(2,1,labels="(2,1)",pos=4,lwd=4)
points(4,8,lwd=4,pch=20)
text(4,8,labels="(4,8)",pos=4,lwd=4)
segments(0,0,2,1,lty=2,lwd=2)
segments(0,0,5,10,lty=2,lwd=2)
points(1,2,lwd=4,pch=20)
text(1,2,labels="(1,2)",pos=4,lwd=4)
points(5,10,lwd=4,pch=20)
text(5,10,labels="(5,10)",pos=4,lwd=4)
points(1,-1/2,lwd=4,pch=20)
text(1,-1/2,labels="(1,-1/2)",pos=4,lwd=4)
segments(0,0,4,-2,lty=4,lwd=2,col="red")
draw.circle(0,0,1,lty=3)

windows()
x = seq(-1,1,length=100)
y1 = sqrt(1-x^2)
y2 = -sqrt(1-x^2)
plot(c(x,x),c(y1,y2),xlim=c(-2,2),ylim=c(-2,2),type="l",frame.plot=F,axes=F,xlab="",ylab="")
Arrows(-2,0,2,0,arr.type="curved",code=2,lwd=2)
text(2,0,labels="x",pos=1,lwd=2)
Arrows(0,-2,0,2,arr.type="curved",code=2,lwd=2)
text(0,2,labels="y",pos=2,lwd=2)
points(1/sqrt(5),2/sqrt(5),lwd=4,pch=20)
points(1/sqrt(5),-2/sqrt(5),lwd=4,pch=20)
Arrows(0,0,2/sqrt(5),4/sqrt(5),arr.type="curved",code=2,lty=2)
Arrows(0,0,2/sqrt(5),-4/sqrt(5),arr.type="curved",code=2,lty=2)
text(1/sqrt(5),2/sqrt(5),labels=expression(paste("(",1/sqrt(5),",",2/sqrt(5),")")),pos=3)
text(1/sqrt(5),-2/sqrt(5),labels=expression(paste("(",1/sqrt(5),",",-2/sqrt(5),")")),pos=1)


# J1與J2
J1 = cbind(c(1,2),c(2,4))
J1
det(J1)
eigen(J1)$values
w1 = eigen(J1,symmetric=F)$vectors[,1]
w2 = eigen(J1,symmetric=F)$vectors[,2]
sum(w1*w2)

J2 = matrix(c(2,-2,-1,3),2,2)
J2
det(J2)
eigen(J2)$values
w1 = eigen(J2,symmetric=F)$vectors[,1]
w2 = eigen(J2,symmetric=F)$vectors[,2]
sum(w1*w2)

# Daily TSMC and TWI
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch6\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))
twi = read.table("c:\\meiyih\\Finstats\\ch6\\TWI.txt", header=T)
attach(twi)
names(twi)
twi.r = 100*diff(log(收盤價_TW))
y = tsmc.r
x = twi.r
data = cbind(x,y)
# 共變異數矩陣sigma
sigma = cov(data)
round(sigma,4)
det(sigma)
# 特性向量所構成的矩陣omega
omega = eigen(sigma,symmetric=F)$vectors
#omega = cbind(-omega[,1],omega[,2])
v1 = omega[,1]
v2 = omega[,2]

# 下列二者是相同的
t(v1)%*%v2
sum(v1*v2)

# 下列二者是相同的
t(omega)
solve(omega)

# 單位矩陣
omega%*%t(omega)
t(omega)%*%omega

# 對角矩陣,對腳為特性根Lambda
Lambda = t(omega)%*%sigma%*%omega
round(Lambda,4)
lambda = eigen(sigma)$values
round(lambda,4)

# 下列二者是相同的
sigma%*%omega
omega%*%Lambda
# 下列二者是相同的 
omega%*%Lambda%*%t(omega)
sigma

# TSMC與TWI資料轉換
adata = data%*%omega
adata
omega%*%sigma%*%omega
cov(adata)

# 還原
t(omega)%*%cov(adata)%*%solve(omega)
sigma
head(adata%*%solve(omega))
tail(adata%*%solve(omega))
head(data)
tail(data)

library(shape)
library(plotrix)
windows()
plot(x,y,type="p",xlim=c(-12,12),ylim=c(-12,12),frame.plot=F,axes=F,
     xlab="",ylab="",main="TSMC與TWI日對數報酬率之 (旋轉) 散佈圖")
Arrows(-12,0,12,0,arr.type="curved",code=2,lwd=2)
points(lambda[1]*omega[1,1],lambda[1]*omega[2,1],lwd=8,pch=20,col="tomato")
text(12,0,labels="x",pos=1,lwd=2)
Arrows(0,-12,0,12,arr.type="curved",code=2,lwd=2)
text(0,12,labels="y",pos=2,lwd=2)
Arrows(-14*omega[1,1],-14*omega[2,1],14*omega[1,1],14*omega[2,1],arr.type="curved",
       code=3,lwd=2,col="red")
draw.ellipse(c(0,0),c(0,0),a=12,b=4, angle = c(64,64),border="red",lty=1)
Arrows(-12*omega[1,2],-12*omega[2,2],12*omega[1,2],12*omega[2,2],arr.type="curved",
       code=3,lwd=2,col="blue")
text(7.5,12,labels="U",pos=1,lwd=3,col="red")
text(-10,6,labels="V",pos=1,lwd=3,col="blue")
Arrows(10,-10,lambda[1]*omega[1,1],lambda[1]*omega[2,1],arr.type="curved",
      code=1,lty=2,col="tomato")
text(10,-10,labels=expression(lambda[1]*v[1]),pos=4)
points(lambda[2]*omega[1,2],lambda[2]*omega[2,2],lwd=8,pch=20,col="tomato")
text(-8,2,labels=expression(lambda[2]*v[2]),pos=2)
Arrows(-8,2,lambda[2]*omega[1,2],lambda[2]*omega[2,2],arr.type="curved",
      code=1,lty=2,col="tomato")

windows()
plot(adata[,1],adata[,2],xlab="經過轉換之TWI日對數報酬率",ylab="經過轉換之TSMC日對數報酬率",type="p",
     main="經過轉換之TSMC與TWI日對數報酬率之散佈圖")
abline(v=0,h=0)

# 可列斯基拆解
library(quantmod)
gold1 = getMetals(c("gold","XAU"),base.currency = "CHF",
            from="2011-01-01",to="2015-06-30") # 以瑞士法郎計價
gold1
gprice1 = XAUCHF
ex = getFX("USD/CHF",from="2011-01-01",to="2015-06-30")
ex
usd = USDCHF
head(gprice1)
head(usd)
tail(gprice1)
tail(usd)
windows()
par(mfrow=c(2,1))
plot(usd,ylab="",main="美元價位 (以瑞士法郎表示) 之時間走勢")
plot(gprice1,ylab="",main="黃金價位 (以瑞士法郎表示) 之時間走勢")

y = 100*diff(log(as.numeric(gprice1))) # 
x = 100*diff(log(as.numeric(usd)))

A = cov(cbind(x,y))
round(A,4)
?chol
U = chol(A)
L = t(U)
round(L,4)
round(U,4)
L%*%U
