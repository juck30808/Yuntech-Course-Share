# sampling distribution of xbar
windows()
par(mfcol=c(2,1))
T = 5000
n = 30
t = numeric(T)
set.seed(1234)
for(i in 1:T)
{
  x = rnorm(n,2)  
  xbar = mean(x)
  s = sd(x)  
  t[i] = (xbar-2)/(s/sqrt(n))
}
plot(density(t),type="l",main=expression(paste(bar(x)," 的抽樣分配 (n = 30)")),
     xlab=expression(t),lwd=3)
xt = sort(t)
lines(xt,dt(xt,(n-1)),lty=2,col="red",lwd=3)
legend("topleft",c("估計密度","t分配"),lty=1:2,col=c("black","red"),bty="n",lwd=3)    
  
n = 10
t1 = numeric(T)
set.seed(1234)
for(i in 1:T)
{
  x = rnorm(n,2)
  xbar = mean(x)
  s = sd(x)
  t1[i] = (xbar-2)/(s/sqrt(n))
}
plot(density(t1),type="l",main=expression(paste(bar(x)," 的抽樣分配 (n = 10)")),
     xlab=expression(t),ylim=c(0,0.4),lwd=3)
xt1 = sort(t1)
lines(xt1,dt(xt1,(n-1)),lty=2,col="red",lwd=3)
legend("topleft",c("估計密度","t分配"),lty=1:2,col=c("black","red"),bty="n",lwd=3) 


# t distribution
#2.33、3.25、3.2、2.5、4.1、2.65、2.7、3.01、2.45、3.23
x = c(2.33,3.25,3.2,2.5,4.1,2.65,2.7,3.01,2.45,3.23)
n = length(x)
mean(x)
sd(x)
# 95% confident interval
# lower
mean(x)+qt(0.025,(n-1))*sd(x)/sqrt(n)
# upper
mean(x)+qt(0.975,(n-1))*sd(x)/sqrt(n)

# 90% confident interval
# lower
mean(x)+qt(0.05,(n-1))*sd(x)/sqrt(n)
# upper
mean(x)+qt(0.95,(n-1))*sd(x)/sqrt(n)

# 99% confident interval
# lower
mean(x)+qt(0.005,(n-1))*sd(x)/sqrt(n)
# upper
mean(x)+qt(0.995,(n-1))*sd(x)/sqrt(n)

# test statistic
(mean(x)-3.1)/(sd(x)/sqrt(n))
# p-value
pt(-0.94,(n-1))
# critical points
qt(0.05,(n-1))
qt(0.025,(n-1))
qt(0.005,(n-1))
