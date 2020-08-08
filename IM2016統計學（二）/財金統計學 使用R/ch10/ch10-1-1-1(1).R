# ch 10
# 10_1.R
x = seq(-2,2,length=100)
y = x^2+x-1
plot(x,y,type="l",lwd=2)
# using function
fx = function(x) x^2+x-1
sol = optimize(fx,interval=c(-2, 2))
sol
abline(h=sol$objective,lty=2,col="red")
points(sol$minimum,sol$objective,lwd=2,pch=18)
abline(v=1,lty=2)
abline(v=0,lty=2)
sol1 = optimize(fx,interval=c(0, 1))
sol1
abline(h=sol1$objective,lty=2,col="red")
points(sol1$minimum,sol1$objective,lwd=2,pch=18)
# direct maximization
# using Grid ¤Á¦¨®æ¤l
x = seq(-2, 2, by = 0.0001)
f.x = fx(x)
ind = which(f.x == min(f.x))
c(x[ind],f.x[ind]) 
