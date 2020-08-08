# skewness
library(fGarch)
windows()
par(mfrow=c(2,1))
x = seq(-4,4,length=100)
xia = 1.5 # xi > 1
xa = c(x[1:50]*xia,x[51:100]/xia)
plot(x,dnorm(x),type="l",main="偏的常態分配",ylab="",lwd=2)
lines(x,dnorm(xa),lty=2,col="green",lwd=2)
xib = 1/1.5 # xi < 1
xb = c(x[1:50]*xib,x[51:100]/xib)
lines(x,dnorm(xb),lty=3,col="red",lwd=2)
ed = expression(xi == 1, xi == 1.5, xi == 0.67)
legend("topright",ed,lty=1:3,col=c("black","green","red"),bty="n",lwd=2)

plot(x,dstd(x,nu=4),type="l",main="偏的t分配",ylab="",lwd=2)
lines(x,dstd(xa,nu=4),lty=2,col="steelblue",lwd=2)
lines(x,dstd(xb,nu=4),lty=3,col="tomato",lwd=2)
ed = expression(xi == 1, xi == 1.5, xi == 0.67)
legend("topright",ed,lty=1:3,col=c("black","steelblue","tomato"),bty="n",lwd=2)

# heavy-tail
y = seq(0,100,length=1000)
v = 1
-(v+1)
ty = y^(-(v+1))
windows()
plot(y,ty,type="l",ylim=c(0,0.0011),lwd=2,ylab="")
v = 2
ty = y^(-(v+1))
lines(y,ty,lty=2,col="orange",lwd=2)
theta = 1/2
zy = exp(-y/theta)
lines(y,zy,lty=3,col="red",lwd=2)
theta = 1/(1/3)
zy = exp(-y/theta)
lines(y,zy,lty=4,col="green",lwd=2)
ex = expression(nu == 1,nu == 2,theta == 0.5,theta == 1/3)
legend("topright",ex,lty=1:4,col=c("black","orange","red","green"),lwd=2)
