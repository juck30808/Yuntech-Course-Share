# population regression model
windows()
x = seq(1,5,by=1)
y = 2+3*x
sd = 0.8
plot(x,y,type="l",ylim=c(0,20),xlim=c(1,5), lwd=3)
abline(v=2,lty=2)
abline(h=8,lty=3)
x1 = seq(4,12,length=100)
y1 = dnorm(x1,8,sd)+2
lines(y1,x1, lwd=3, col="red")
abline(v=3,lty=2)
abline(h=11,lty=3)
x2 = seq(6,14,length=100)
y2 = dnorm(x1,9,sd)+3
lines(y2,x2, lwd=3, col="orange")
abline(v=4,lty=2)
abline(h=14,lty=3)
x3 = seq(10,18,length=100)
y3 = dnorm(x1,8,sd)+4
lines(y3,x3, lwd=3, col="blue")
points(2,8,lwd=2)
points(3,11,lwd=2)
points(4,14,lwd=2)
arrows(4.5,5,3.5,12)
text(4.5,4.5,"•¿≈È∞j¬k®Áº∆")
text(4.5,3.5,expression(paste("E[y|x] = ", beta[0]+beta[1]*x)))
arrows(1.5,1.5,2,8)
text(1.5,1.5,labels="E[y|x=2]",pos=1) 
