# exchange rates 1/2/2002-7/10/2014
exch = read.table("c:\\meiyih\\Finstats\\ch6\\exch.txt", header=T)
attach(exch)
names(exch)
# F distribution
windows()
par(mfrow=c(2,1))
T = 10000
F1 = numeric(T)
n1 = 20
n2 = 25
sigma1 = sqrt(2)
sigma2 = 1
set.seed(123)
for(i in 1:T)
{
x1 = rnorm(n1,0,sigma1)
x2 = rnorm(n2,0,sigma2)
F1[i] = (var(x1)/sigma1^2)/(var(x2)/sigma2^2)
}
plot(density(F1),type="l",axes=F,xlab="",ylab="",ylim=c(-0.7,1),lwd=2,
     main="F distribution") 
x = sort(F1)
lines(x,df(x,(n1-1),(n2-1)),lty=2,col="red",lwd=2)
lower = qf(0.025,(n1-1),(n2-1))
upper = qf(0.975,(n1-1),(n2-1))
points(lower,0,pch=20)
points(upper,0,pch=20)
i = x <= lower
polygon(c(0,x[i],lower),c(0,df(x[i],(n1-1),(n2-1)),0),col="green")
i = x >= upper
polygon(c(upper,x[i],5),c(0,df(x[i],(n1-1),(n2-1)),0),col="green")
text(lower,0,labels=expression(F[list(1-alpha/2,v[1],v[2])]),pos=1,cex=1.5)
text(upper,0,labels=expression(F[list(alpha/2,v[1],v[2])]),pos=1,cex=1.5)
text(5.4,0,labels=expression(F==frac(sigma[2]^2,sigma[1]^2)*frac(s[1]^2,s[2]^2)),pos=1,cex=1.5)
abline(h=0)

x = 新台幣
y = 人民幣
xr = 100*(diff(log(x)))
yr = 100*(diff(log(y)))
var(xr)
var(yr)
n = length(xr)
xr1 = xr[(n-499):n]
yr1 = yr[(n-499):n]
var(xr1)
var(yr1)
m = length(xr1)

T = 10000
F1 = numeric(T)
n1 = m
n2 = m
sigma1 = sd(xr)
sigma2 = sd(yr)
set.seed(232)
for(i in 1:T)
{
x1 = rnorm(n1,0,sigma1)
x2 = rnorm(n2,0,sigma2)
F1[i] = (var(x1)/sigma1^2)/(var(x2)/sigma2^2)
}
plot(density(F1),type="l",axes=F,xlab="",ylim=c(-3,5),main="",ylab="",lwd=2)
x = sort(F1)
lines(x,df(x,(n1-1),(n2-1)),lty=2,col="red",lwd=2)
lower = qf(0.025,(n1-1),(n2-1))
upper = qf(0.975,(n1-1),(n2-1))
points(lower,0,pch=20)
points(upper,0,pch=20)
i = x <= lower
polygon(c(0,x[i],lower),c(0,df(x[i],(n1-1),(n2-1)),0),col="green")
i = x >= upper
polygon(c(upper,x[i],5),c(0,df(x[i],(n1-1),(n2-1)),0),col="green")
text(lower,0,labels=expression(F[list(0.975,499,499)]),pos=1,cex=1.5)
text(upper,0,labels=expression(F[list(0.025,499,499)]),pos=1,cex=1.5)
text(1.4,0,labels=expression(F==frac(sigma[2]^2,sigma[1]^2)*frac(s[1]^2,s[2]^2)),pos=1,cex=1.5)
abline(h=0)

lower*var(yr1)/var(xr1)
upper*var(yr1)/var(xr1)

f = var(xr1)/var(yr1)
f
qf(0.95,(n1-1),(n2-1))
1-pf(f,(n1-1),(n2-1))
