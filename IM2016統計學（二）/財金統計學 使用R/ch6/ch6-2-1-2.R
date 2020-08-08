# ch 6
# Daily TSMC and TWI
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch6\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))
twi = read.table("c:\\meiyih\\Finstats\\ch6\\TWI.txt", header=T)
attach(twi)
names(twi)

tsmcx = 本益比

# 小樣本的情況
windows()
par(mfrow=c(2,2))
T = 10000
sigma1 = 2
sigma2 = 2
t12 = numeric(T)
n = 10
for(i in 1:T)
{
 x1 = rnorm(n,0,sigma1)
 x2 = rnorm(n,0,sigma2)
 xbar = mean(x1)-mean(x2)
 sd12 = sqrt((var(x1)/n)+(var(x2)/n))
 t12[i] = xbar/sd12
}
plot(density(t12),type="l",xlab=expression(bar(x)[1]-bar(x)[2]), 
     axes=T, ylim=c(-0.1,0.4), lwd=2,
     main=expression(paste("(a) ",sigma[1]^2," = ",sigma[2]^2)))
x = sort(t12)
lines(x,dt(x,(2*(n-1))),lty=2,col="red",lwd=2)

sigma1 = 2
sigma2 = 6
t12 = numeric(T)
n = 10
for(i in 1:T)
{
 x1 = rnorm(n,0,sigma1)
 x2 = rnorm(n,0,sigma2)
 xbar = mean(x1)-mean(x2)
 s2 = ((n-1)*var(x1)+(n-1)*var(x2))/(n+n-2)
 sd12 = sqrt(s2*(2/n))
 t12[i] = xbar/sd12
}
plot(density(t12),type="l",xlab=expression(bar(x)[1]-bar(x)[2]), 
     axes=T, ylim=c(-0.1,0.4), lwd=2,
     main=expression(paste("(b) ",sigma[1]," = 2, ",sigma[2]," = 6")))
x = sort(t12)
lines(x,dt(x,(2*(n-1))),lty=2,col="red",lwd=2)

sigma1 = 2
sigma2 = 16
t12 = numeric(T)
n = 10
for(i in 1:T)
{
 x1 = rnorm(n,0,sigma1)
 x2 = rnorm(n,0,sigma2)
 xbar = mean(x1)-mean(x2)
 s2 = ((n-1)*var(x1)+(n-1)*var(x2))/(n+n-2)
 sd12 = sqrt(s2*(2/n))
 #sd12 = sqrt((var(x1)/n)+(var(x2)/n))
 t12[i] = xbar/sd12
}
plot(density(t12),type="l",xlab=expression(bar(x)[1]-bar(x)[2]), 
      axes=T, ylim=c(-0.1,0.4), lwd=2,
     main=expression(paste("(c) ",sigma[1]," = 2, ",sigma[2]," = 16")))
x = sort(t12)
lines(x,dt(x,(2*(n-1))),lty=2,col="red",lwd=2)

sigma1 = 2
sigma2 = 36
ta = numeric(T)
tb = numeric(T)
df12 = numeric(T)
n = 10
for(i in 1:T)
{
 x1 = rnorm(n,0,sigma1)
 x2 = rnorm(n,0,sigma2)
 xbar = mean(x1)-mean(x2)
 s2 = ((n-1)*var(x1)+(n-1)*var(x2))/(n+n-2)
 sd12a = sqrt(s2*(2/n))
 sd12 = sqrt((var(x1)/n)+(var(x2)/n))
 t1 = xbar/sd12a
 t2 = xbar/sd12
 ta[i] = pt(t1,(2*(n-1)))
 df1 = ((var(x1)/n) + (var(x2)/n))^2
 df2 = ((var(x1)/n)^2)/(n-1)
 df3 = ((var(x2)/n)^2)/(n-1)
 df12 = df1/(df2+df3)
 tb[i] = pt(t2,df12)
}
plot(density(ta),type="l",xlab=expression(bar(x)[1]-bar(x)[2]), lwd=2,
 main=expression(paste("(d) ",sigma[1]," = 2, ",sigma[2]," = 36")))
lines(density(tb),lty=2,col="red",lwd=2)

xa = tsmcx[1:1200]
xb = tsmcx[1201:length(tsmcx)]
n = 10
set.seed(123)
xa1 = sample(xa,n,replace=T)
xb1 = sample(xb,n,replace=T)
mean(xa1)
mean(xb1)
mean(xa1)-mean(xb1)
s2 = ((n-1)*var(xa1)+(n-1)*var(xb1))/(n+n-2)
t1 = (mean(xa1)-mean(xb1)-25)/sqrt(s2*(2/n))
t1
2*(1-pt(t1,(2*(n-1))))
df1 = ((var(xa1)/n) + (var(xb1)/n))^2
df2 = ((var(xa1)/n)^2)/(n-1)
df3 = ((var(xb1)/n)^2)/(n-1)
df12 = df1/(df2+df3)
t2 = (mean(xa1)-mean(xb1)-25)/sqrt((var(xa1)/n)+(var(xb1)/n))
t2
2*(1-pt(t2,df12))

t1a = (mean(xa1)-mean(xb1)-30)/sqrt(s2*(2/n))
t1a
t2a = (mean(xa1)-mean(xb1)-30)/sqrt((var(xa1)/n)+(var(xb1)/n))
t2a

qt(0.95,(2*n-2))
qt(0.95,df12)
