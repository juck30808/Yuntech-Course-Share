# 虛假迴歸與相關
set.seed(123543)
u = rnorm(500)
y = cumsum(u)
set.seed(123)
u1 = rnorm(500)
x = cumsum(u1)
cor(x,y)
cor(u,u1)
model = lm(y~x)
summary(model)
trend = 1:500
t1 = -20+0.08*trend+u
windows()
plot(y,type="l",xlab="",ylab="",main="確定趨勢與隨機趨勢的區別",lwd=2)
lines(t1,lty=1,col="red",lwd=2)
legend("topleft",c("隨機趨勢","確定趨勢"),lty=c(1,1),col=c("black","red"),
      lwd=2,bty="n")

windows()
layout(matrix(c(1,1,2,3),2,2,byrow=TRUE))
plot(y,type="l",ylim=c(-15,40),main="(a) 二隨機漫步之走勢",lwd=2)
lines(x,lty=1,col="red",lwd=2)
plot(x,y,type="p",main="(b) 二隨機漫步之散佈圖",lwd=2)
abline(lm(y~x),col="red")

T = 1000
tstat = numeric(T)
n = 200
for(i in 1:T)
{
u = rnorm(n)
y = cumsum(u)
u1 = rnorm(n)
x = cumsum(u1)
model = lm(y~x)
b1 = coef(model)[2]
sb1 = sqrt(vcov(model)[2,2])
tstat[i] = b1/sb1
}
plot(density(tstat),type="l",xlim=c(-20,20),ylim=c(0,0.45),main=expression
              (paste("(c) ",b[1]," 的抽樣分配")),xlab="",lwd=2)   
x = seq(-4,4,length=n)
lines(x,dt(x,(n-2)),lty=1,col="red",lwd=2)
quantile(tstat,c(0.01,0.05,0.1))
