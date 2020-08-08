# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch4\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
# VR ratio testing
windows()
par(mfrow=c(2,2))
T = 10000
VR2 = numeric(T)
n = 1001
p = numeric(n)
c = 0.05
set.seed(123)
for(j in 1:T)
{
     for(i in 2:n)
     {
     p[i] = p[i-1]+exp(c+rnorm(1))
     }
     chat = (p[n]-p[1])/(n-1)
     sigma1 = 0
     for(i in 2:n)
     {
      sigma = (p[i]-p[i-1]-chat)^2
      sigma1 = sigma1+sigma
      }
      sigma12 = sigma1/(n-1)
      sigma2 = 0
      for(i in 1:((n-1)/2))
      {
      sigma = (p[(2*i+1)]-p[(2*i+1-2)]-2*chat)^2
      sigma2 = sigma2+sigma
      }
      sigma22 = sigma2/(n-1)
VR2[j] = sqrt((n-1))*((sigma12/sigma22)-1)/sqrt(2)
}
den = density(VR2)
x = den$x
x = sort(x)
plot(density(VR2),xlab="",main="持有期間為2期之VR比率檢定之漸近分配",xlim=c(-3,3),lwd=2)
lines(x,dnorm(x),lty=2,col="red",lwd=2)
quantile(VR2,c(0.025,0.975))

T = 10000
VR3 = numeric(T)
n = 1001
p = numeric(n)
c = 0.05
q = 3
set.seed(123)
for(j in 1:T)
{
     for(i in 2:n)
     {
     p[i] = p[i-1]+exp(c+rnorm(1))
     }
     chat = (p[n]-p[1])/(n-1)
     sigma1 = 0
     for(i in 2:n)
     {
      sigma = (p[i]-p[i-1]-chat)^2
      sigma1 = sigma1+sigma
      }
      sigma12 = sigma1/(n-1)
      sigma2 = 0
      for(i in 1:((n-1)/3))
      {
      sigma = (p[(q*i+1)]-p[(q*i+1-q)]-q*chat)^2
      sigma2 = sigma2+sigma
      }
      sigma22 = sigma2/(n-1)
VR3[j] = sqrt((n-1))*((sigma12/sigma22)-1)/sqrt(2*(q-1))
}
den = density(VR3)
x = den$x
x = sort(x)
plot(density(VR3),xlab="",main="持有期間為3期之VR比率檢定之漸近分配",xlim=c(-3,3),lwd=2)
lines(x,dnorm(x),lty=2,col="red",lwd=2)
quantile(VR3,c(0.025,0.975))

T = 10000
VR5 = numeric(T)
n = 1001
p = numeric(n)
c = 0.05
q = 5
set.seed(123)
for(j in 1:T)
{
     for(i in 2:n)
     {
     p[i] = p[i-1]+exp(c+rnorm(1))
     }
     chat = (p[n]-p[1])/(n-1)
     sigma1 = 0
     for(i in 2:n)
     {
      sigma = (p[i]-p[i-1]-chat)^2
      sigma1 = sigma1+sigma
      }
      sigma12 = sigma1/(n-1)
      sigma2 = 0
      for(i in 1:((n-1)/q))
      {
      sigma = (p[(q*i+1)]-p[(q*i+1-q)]-q*chat)^2
      sigma2 = sigma2+sigma
      }
      sigma22 = sigma2/(n-1)
VR5[j] = sqrt((n-1))*((sigma12/sigma22)-1)/sqrt(2*(q-1))
}
den = density(VR5)
x = den$x
x = sort(x)
plot(density(VR5),xlab="",main="持有期間為5期之VR比率檢定之漸近分配",xlim=c(-3,3),lwd=2)
lines(x,dnorm(x),lty=2,col="red",lwd=2)
quantile(VR5,c(0.025,0.975))

T = 10000
VR5b = numeric(T)
n = 2001
p = numeric(n)
c = 0.05
q = 5
set.seed(123)
for(j in 1:T)
{
     for(i in 2:n)
     {
     p[i] = p[i-1]+exp(c+rnorm(1))
     }
     chat = (p[n]-p[1])/(n-1)
     sigma1 = 0
     for(i in 2:n)
     {
      sigma = (p[i]-p[i-1]-chat)^2
      sigma1 = sigma1+sigma
      }
      sigma12 = sigma1/(n-1)
      sigma2 = 0
      for(i in 1:((n-1)/q))
      {
      sigma = (p[(q*i+1)]-p[(q*i+1-q)]-q*chat)^2
      sigma2 = sigma2+sigma
      }
      sigma22 = sigma2/(n-1)
VR5b[j] = sqrt((n-1))*((sigma12/sigma22)-1)/sqrt(2*(q-1))
}
den = density(VR5b)
x = den$x
x = sort(x)
plot(density(VR5b),xlab="",main="持有期間為5期之VR比率檢定之漸近分配",xlim=c(-3,3),lwd=2)
lines(x,dnorm(x),lty=2,col="red",lwd=2)
quantile(VR5b,c(0.025,0.975))


# 校正
# VR ratio testing
windows()
par(mfrow=c(2,2))
VR2a = numeric(T)
n = 1001
p = numeric(n)
c = 0.05
q = 2
set.seed(123)
for(j in 1:T)
{
     for(i in 2:n)
     {
     p[i] = p[i-1]+exp(c+rnorm(1))
     }
     chat = (p[n]-p[1])/(n-1)
     sigma1 = 0
     for(i in 2:n)
     {
      sigma = (p[i]-p[i-1]-chat)^2
      sigma1 = sigma1+sigma
      }
      sigma12 = sigma1/((n-1)-1)
      sigma3 = 0
      for(i in q:(n-1))
      {
      sigma = (p[(i+1)]-p[((i+1)-q)]-q*chat)^2
      sigma3 = sigma3+sigma
      }
      m = q*((n-1)-q+1)*(1-(q/(n-1)))
      sigma32 = sigma3/m
      h = 2*((2*q)-1)*(q-1)/(3*q)
VR2a[j] = sqrt((n-1))*((sigma12/sigma32)-1)/sqrt(h)
}
den = density(VR2a)
x = den$x
x = sort(x)
plot(density(VR2a),xlab="",main="持有期間為2期之VR比率檢定之漸近分配",xlim=c(-3,3),lwd=2)
lines(x,dnorm(x),lty=2,col="red",lwd=2)
quantile(VR2a,c(0.025,0.975))


VR3a = numeric(T)
n = 1001
p = numeric(n)
c = 0.05
q = 3
set.seed(123)
for(j in 1:T)
{
     for(i in 2:n)
     {
     p[i] = p[i-1]+exp(c+rnorm(1))
     }
     chat = (p[n]-p[1])/(n-1)
     sigma1 = 0
     for(i in 2:n)
     {
      sigma = (p[i]-p[i-1]-chat)^2
      sigma1 = sigma1+sigma
      }
      sigma12 = sigma1/((n-1)-1)
      sigma3 = 0
      for(i in q:(n-1))
      {
      sigma = (p[(i+1)]-p[((i+1)-q)]-q*chat)^2
      sigma3 = sigma3+sigma
      }
      m = q*((n-1)-q+1)*(1-(q/(n-1)))
      sigma32 = sigma3/m
      h = 2*((2*q)-1)*(q-1)/(3*q)
VR3a[j] = sqrt((n-1))*((sigma12/sigma32)-1)/sqrt(h)
}
den = density(VR3a)
x = den$x
x = sort(x)
plot(density(VR3a),xlab="",main="持有期間為3期之VR比率檢定之漸近分配",xlim=c(-3,3),lwd=2)
lines(x,dnorm(x),lty=2,col="red",lwd=2)
quantile(VR3a,c(0.025,0.975))

 
VR5a = numeric(T)
n = 1001
p = numeric(n)
c = 0.05
q = 5
set.seed(123)
for(j in 1:T)
{
     for(i in 2:n)
     {
     p[i] = p[i-1]+exp(c+rnorm(1))
     }
     chat = (p[n]-p[1])/(n-1)
     sigma1 = 0
     for(i in 2:n)
     {
      sigma = (p[i]-p[i-1]-chat)^2
      sigma1 = sigma1+sigma
      }
      sigma12 = sigma1/((n-1)-1)
      sigma3 = 0
      for(i in q:(n-1))
      {
      sigma = (p[(i+1)]-p[((i+1)-q)]-q*chat)^2
      sigma3 = sigma3+sigma
      }
      m = q*((n-1)-q+1)*(1-(q/(n-1)))
      sigma32 = sigma3/m
      h = 2*((2*q)-1)*(q-1)/(3*q)
VR5a[j] = sqrt((n-1))*((sigma12/sigma32)-1)/sqrt(h)
}
den = density(VR5a)
x = den$x
x = sort(x)
plot(density(VR5a),xlab="",main="持有期間為5期之VR比率檢定之漸近分配",xlim=c(-3,3),lwd=2)
lines(x,dnorm(x),lty=2,col="red",lwd=2)
quantile(VR5a,c(0.025,0.975))

 
VR5ab = numeric(T)
n = 2001
p = numeric(n)
c = 0.05
q = 5
set.seed(123)
for(j in 1:T)
{
     for(i in 2:n)
     {
     p[i] = p[i-1]+exp(c+rnorm(1))
     }
     chat = (p[n]-p[1])/(n-1)
     sigma1 = 0
     for(i in 2:n)
     {
      sigma = (p[i]-p[i-1]-chat)^2
      sigma1 = sigma1+sigma
      }
      sigma12 = sigma1/((n-1)-1)
      sigma3 = 0
      for(i in q:(n-1))
      {
      sigma = (p[(i+1)]-p[((i+1)-q)]-q*chat)^2
      sigma3 = sigma3+sigma
      }
      m = q*((n-1)-q+1)*(1-(q/(n-1)))
      sigma32 = sigma3/m
      h = 2*((2*q)-1)*(q-1)/(3*q)
VR5ab[j] = sqrt((n-1))*((sigma12/sigma32)-1)/sqrt(h)
}
den = density(VR5ab)
x = den$x
x = sort(x)
plot(density(VR5ab),xlab="",main="持有期間為5期之VR比率檢定之漸近分配",xlim=c(-3,3),lwd=2)
lines(x,dnorm(x),lty=2,col="red",lwd=2)
quantile(VR5ab,c(0.025,0.975))

# try  VR ratio test
# try 4-1
p = 收盤價 # TSMC
lp = log(p)
n = length(lp)
n
lp = lp[512:n] # 12/26/2001-7/10/2014
n = length(lp)
n
q = 2  
lp = lp[2:n]
n = length(lp)
p = lp
chat = (p[n]-p[1])/(n-1)
sigma1 = 0
for(i in 2:n)
{
sigma = (p[i]-p[i-1]-chat)^2
sigma1 = sigma1+sigma
}
sigma12 = sigma1/(n-1)
sigma2 = 0
for(i in 1:((n-1)/2))
{
sigma = (p[(2*i+1)]-p[(2*i+1-2)]-2*chat)^2
sigma2 = sigma2+sigma
}
sigma22 = sigma2/(n-1)
VR = sqrt((n-1))*((sigma12/sigma22)-1)/sqrt(2)
VR


# try 4-2
q = 2 # 再改為3,4,5,6
p = lp
chat = (p[n]-p[1])/(n-1)
sigma1 = 0
for(i in 2:n)
{
sigma = (p[i]-p[i-1]-chat)^2
sigma1 = sigma1+sigma
}
sigma12 = sigma1/((n-1)-1)
sigma3 = 0
for(i in q:(n-1))
{
sigma = (p[(i+1)]-p[((i+1)-q)]-q*chat)^2
sigma3 = sigma3+sigma
}
m = q*((n-1)-q+1)*(1-(q/(n-1)))
sigma32 = sigma3/m
h = 2*((2*q)-1)*(q-1)/(3*q)
VR = sqrt((n-1))*((sigma12/sigma32)-1)/sqrt(h)
VR

 
 
