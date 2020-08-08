# properties of b0 and b1
# if x is stochastic variable
windows()
par(mfrow=c(4,2))
T = 1000
n = 10
beta0 = 2
beta1 = 4
b1 = numeric(T)
b1_stat = numeric(T)
for(i in 1:T)
{
 x = runif(n)
 y = beta0 + beta1*x + runif(n,-2,2)
 model1 = lm(y~x)
 b1[i] = coef(model1)[2]
 res = residuals(model1)
 s2 = sum(res*res)/(n-2)
 sx = sum((x-mean(x))^2)
 b1_stat[i] = (b1[i]-beta1)/sqrt(s2/sx)
}
plot(density(b1),xlab=expression(b[1]), lwd=2,
  main=expression(paste(b[1],"的抽樣分配 (n = 10, 非常態,隨機)")))
abline(v=mean(b1),col="red",lty=2)
abline(v=beta1)
plot(density(b1_stat),xlab=expression(t), lwd=2,
  main=expression(paste(b[1],"的檢定統計量 (n = 10, 非常態,隨機)")))
t1 = sort(b1_stat)
lines(t1,dt(t1,(n-2)),lty=2,col="red", lwd=2)

n=300
for(i in 1:T)
{
 x = runif(n)
 y = beta0 + beta1*x + runif(n,-2,2)
 model1 = lm(y~x)
 b1[i] = coef(model1)[2]
 res = residuals(model1)
 s2 = sum(res*res)/(n-2)
 sx = sum((x-mean(x))^2)
 b1_stat[i] = (b1[i]-beta1)/sqrt(s2/sx)
}
plot(density(b1),xlab=expression(b[1]), lwd=2,
  main=expression(paste(b[1],"的抽樣分配 (n = 300, 非常態,隨機)")))
abline(v=mean(b1),col="red",lty=2)
abline(v=beta1)
plot(density(b1_stat),xlab=expression(t), lwd=2,
  main=expression(paste(b[1],"的檢定統計量 (n = 300, 非常態,隨機)")))
t1 = sort(b1_stat)
lines(t1,dt(t1,(n-2)),lty=2,col="red", lwd=2)


n = 10
for(i in 1:T)
{
 x = runif(n)
 y = beta0 + beta1*x + rnorm(n)
 model1 = lm(y~x)
 b1[i] = coef(model1)[2]
 res = residuals(model1)
 s2 = sum(res*res)/(n-2)
 sx = sum((x-mean(x))^2)
 b1_stat[i] = (b1[i]-beta1)/sqrt(s2/sx)
}
plot(density(b1),xlab=expression(b[1]), lwd=2,
  main=expression(paste(b[1],"的抽樣分配 (n = 10, 常態,隨機)")))
abline(v=mean(b1),col="red",lty=2)
abline(v=beta1)
plot(density(b1_stat),xlab=expression(t), lwd=2,
  main=expression(paste(b[1],"的檢定統計量 (n = 10, 常態,隨機)")))
t1 = sort(b1_stat)
lines(t1,dt(t1,(n-2)),lty=2,col="red",lwd=2)

n=300
for(i in 1:T)
{
 x = runif(n)
 y = beta0 + beta1*x + rnorm(n)
 model1 = lm(y~x)
 b1[i] = coef(model1)[2]
 res = residuals(model1)
 s2 = sum(res*res)/(n-2)
 sx = sum((x-mean(x))^2)
 b1_stat[i] = (b1[i]-beta1)/sqrt(s2/sx)
}
plot(density(b1),xlab=expression(b[1]), lwd=2,
  main=expression(paste(b[1],"的抽樣分配 (n = 300, 常態,隨機)")))
abline(v=mean(b1),col="red",lty=2)
abline(v=beta1)
plot(density(b1_stat),xlab=expression(t), lwd=2,
  main=expression(paste(b[1],"的檢定統計量 (n = 300, 常態,隨機)")))
t1 = sort(b1_stat)
lines(t1,dt(t1,(n-2)),lty=2,col="red",lwd=2)

# if x is not a stochastic variable
windows()
par(mfrow=c(4,2))
T = 1000
n = 10
beta0 = 2
beta1 = 4
b1 = numeric(T)
b1_stat = numeric(T)
x = runif(n)
for(i in 1:T)
{
 y = beta0 + beta1*x + runif(n,-2,2)
 model1 = lm(y~x)
 b1[i] = coef(model1)[2]
 res = residuals(model1)
 s2 = sum(res*res)/(n-2)
 sx = sum((x-mean(x))^2)
 b1_stat[i] = (b1[i]-beta1)/sqrt(s2/sx)
}
plot(density(b1),xlab=expression(b[1]), lwd=2,
  main=expression(paste(b[1],"的抽樣分配 (n = 10, 非常態)")))
abline(v=mean(b1),col="red",lty=2)
abline(v=beta1)
plot(density(b1_stat),xlab=expression(t), lwd=2,
  main=expression(paste(b[1],"的檢定統計量 (n = 10, 非常態)")))
t1 = sort(b1_stat)
lines(t1,dt(t1,(n-2)),lty=2,col="red",lwd=2)

n=300
x = runif(n)
for(i in 1:T)
{
 #x = runif(n)
 y = beta0 + beta1*x + runif(n,-2,2)
 model1 = lm(y~x)
 b1[i] = coef(model1)[2]
 res = residuals(model1)
 s2 = sum(res*res)/(n-2)
 sx = sum((x-mean(x))^2)
 b1_stat[i] = (b1[i]-beta1)/sqrt(s2/sx)
}
plot(density(b1),xlab=expression(b[1]), lwd=2,
  main=expression(paste(b[1],"的抽樣分配 (n = 300, 非常態)")))
abline(v=mean(b1),col="red",lty=2)
abline(v=beta1)
plot(density(b1_stat),xlab=expression(t),lwd=2,
  main=expression(paste(b[1],"的檢定統計量 (n = 300, 非常態)")))
t1 = sort(b1_stat)
lines(t1,dt(t1,(n-2)),lty=2,col="red",lwd=2)


n = 10
x = runif(n)
for(i in 1:T)
{
 #x = runif(n)
 y = beta0 + beta1*x + rnorm(n)
 model1 = lm(y~x)
 b1[i] = coef(model1)[2]
 res = residuals(model1)
 s2 = sum(res*res)/(n-2)
 sx = sum((x-mean(x))^2)
 b1_stat[i] = (b1[i]-beta1)/sqrt(s2/sx)
}
plot(density(b1),xlab=expression(b[1]),lwd=2,
  main=expression(paste(b[1],"的抽樣分配 (n = 10, 常態)")))
abline(v=mean(b1),col="red",lty=2)
abline(v=beta1)
plot(density(b1_stat),xlab=expression(t),lwd=2,
  main=expression(paste(b[1],"的檢定統計量 (n = 10, 常態)")))
t1 = sort(b1_stat)
lines(t1,dt(t1,(n-2)),lty=2,col="red",lwd=2)

n=300
x=runif(n)
for(i in 1:T)
{
 #x = runif(n)
 y = beta0 + beta1*x + rnorm(n)
 model1 = lm(y~x)
 b1[i] = coef(model1)[2]
 res = residuals(model1)
 s2 = sum(res*res)/(n-2)
 sx = sum((x-mean(x))^2)
 b1_stat[i] = (b1[i]-beta1)/sqrt(s2/sx)
}
plot(density(b1),xlab=expression(b[1]),lwd=2,
  main=expression(paste(b[1],"的抽樣分配 (n = 300, 常態)")))
abline(v=mean(b1),col="red",lty=2)
abline(v=beta1)
plot(density(b1_stat),xlab=expression(t),lwd=2,
  main=expression(paste(b[1],"的檢定統計量 (n = 300, 常態)")))
t1 = sort(b1_stat)
lines(t1,dt(t1,(n-2)),lty=2,col="red",lwd=2)


# 
#  誤差項存在自我相關
windows()
par(mfrow=c(4,2))
T = 1000
n = 10
beta0 = 2
beta1 = 4
b1 = numeric(T)
b1_stat = numeric(T)
for(i in 1:T)
{
  y = numeric(n)
  u = numeric(n)
  x = runif(n)
  for(j in 2:n)
  {
   u[j] = u[(j-1)]*0.5 + runif(1,-2,2)
  }
  for(j in 1:n)
  { 
   y[j] = beta0 + beta1*x[j] + u[j]
  }
 model1 = lm(y~x)
 b1[i] = coef(model1)[2]
 res = residuals(model1)
 s2 = sum(res*res)/(n-2)
 sx = sum((x-mean(x))^2)
 b1_stat[i] = (b1[i]-beta1)/sqrt(s2/sx)
}
plot(density(b1),xlab=expression(b[1]), lwd=2,
  main=expression(paste(b[1],"的抽樣分配 (n = 10, 非常態,相關)")))
abline(v=mean(b1),col="red",lty=2)
abline(v=beta1)
plot(density(b1_stat),xlab=expression(t),lwd=2,
  main=expression(paste(b[1],"的檢定統計量 (n = 10, 非常態,相關)")))
t1 = sort(b1_stat)
lines(t1,dt(t1,(n-2)),lty=2,col="red",lwd=2)

n=300
for(i in 1:T)
{
  y = numeric(n)
  u = numeric(n)
  x = runif(n)
  for(j in 2:n)
  {
   u[j] = u[(j-1)]*0.5 + runif(1,-2,2)
  }
  for(j in 1:n)
  { 
   y[j] = beta0 + beta1*x[j] + u[j]
  }
 model1 = lm(y~x)
 b1[i] = coef(model1)[2]
 res = residuals(model1)
 s2 = sum(res*res)/(n-2)
 sx = sum((x-mean(x))^2)
 b1_stat[i] = (b1[i]-beta1)/sqrt(s2/sx)
}
plot(density(b1),xlab=expression(b[1]), lwd=2,
  main=expression(paste(b[1],"的抽樣分配 (n = 300, 非常態,相關)")))
abline(v=mean(b1),col="red",lty=2)
abline(v=beta1)
plot(density(b1_stat),xlab=expression(t), lwd=2,
  main=expression(paste(b[1],"的檢定統計量 (n = 300, 非常態,相關)")))
t1 = sort(b1_stat)
lines(t1,dt(t1,(n-3)),lty=2,col="red",lwd=2)


n = 10
for(i in 1:T)
{
  y = numeric(n)
  u = numeric(n)
  x = runif(n)
  for(j in 2:n)
  {
   u[j] = u[(j-1)]*0.5 + rnorm(1)
  }
  for(j in 1:n)
  { 
   y[j] = beta0 + beta1*x[j] + u[j]
  }
  
 model1 = lm(y~x)
 b1[i] = coef(model1)[2]
 res = residuals(model1)
 s2 = sum(res*res)/(n-3)
 sx = sum((x-mean(x))^2)
 b1_stat[i] = (b1[i]-beta1)/sqrt(s2/sx)
}
plot(density(b1),xlab=expression(b[1]),lwd=2,
  main=expression(paste(b[1],"的抽樣分配 (n = 10, 常態,相關)")))
abline(v=mean(b1),col="red",lty=2)
abline(v=beta1)
plot(density(b1_stat),xlab=expression(t),lwd=2,
  main=expression(paste(b[1],"的檢定統計量 (n = 10, 常態,相關)")))
t1 = sort(b1_stat)
lines(t1,dt(t1,(n-3)),lty=2,col="red",lwd=2)

n=300
for(i in 1:T)
{
  y = numeric(n)
  u = numeric(n)
  x = runif(n)
  for(j in 2:n)
  {
   u[j] = u[(j-1)]*0.5 + rnorm(1)
  }
  for(j in 2:n)
  { 
   y[j] = beta0 + beta1*x[j] + u[j]
  }
 model1 = lm(y~x)
 b1[i] = coef(model1)[2]
 res = residuals(model1)
 s2 = sum(res*res)/(n-3)
 sx = sum((x-mean(x))^2)
 b1_stat[i] = (b1[i]-beta1)/sqrt(s2/sx)
}
plot(density(b1),xlab=expression(b[1]),  lwd=2,
  main=expression(paste(b[1],"的抽樣分配 (n = 300, 常態,相關)")))
abline(v=mean(b1),col="red",lty=2)
abline(v=beta1)
plot(density(b1_stat),xlab=expression(t), lwd=2,
  main=expression(paste(b[1],"的檢定統計量 (n = 300, 常態,相關)")))
t1 = sort(b1_stat)
lines(t1,dt(t1,(n-3)),lty=2,col="red",lwd=2)

#  誤差項存在自我相關
#  x為y之遞延落後一期
windows()
par(mfrow=c(4,2))
T = 1000
n = 10
beta0 = 0.2
beta1 = 0.5
b0 = numeric(T)
b1 = numeric(T)
for(i in 1:T)
{
  y = numeric(n)
  u = numeric(n)
  for(j in 2:n)
  {
   u[j] = u[(j-1)]*0.5 + runif(1,-2,2)
  }
  for(j in 2:n)
  { 
   y[j] = beta0 + beta1*y[(j-1)] + u[j]
  }
 y1 = y[1:(n-1)]
 x = y[2:n]
 model1 = lm(y1~x)
 b0[i] = coef(model1)[1]
 b1[i] = coef(model1)[2]
}
plot(density(b0),xlab=expression(b[0]), lwd=2,
  main=expression(paste(b[0],"的抽樣分配 (n = 10, 非常態,相關)")))
abline(v=mean(b0),col="red",lty=2)
abline(v=beta0)
plot(density(b1),xlab=expression(b[1]),  lwd=2,
  main=expression(paste(b[1],"的檢定統計量 (n = 10, 非常態,相關)")))
abline(v=mean(b1),col="red",lty=2)
abline(v=beta1)

n=300
for(i in 1:T)
{
  y = numeric(n)
  u = numeric(n)
  for(j in 2:n)
  {
   u[j] = u[(j-1)]*0.5 + runif(1,-2,2)
  }
  for(j in 2:n)
  { 
   y[j] = beta0 + beta1*y[(j-1)] + u[j]
  }
 y1 = y[1:(n-1)]
 x = y[2:n]
 model1 = lm(y1~x)
 b0[i] = coef(model1)[1]
 b1[i] = coef(model1)[2]
}
plot(density(b0),xlab=expression(b[0]),  lwd=2,
  main=expression(paste(b[0],"的抽樣分配 (n = 300, 非常態,相關)")))
abline(v=mean(b0),col="red",lty=2)
abline(v=beta0)
plot(density(b1),xlab=expression(b[1]), lwd=2,
  main=expression(paste(b[1],"的檢定統計量 (n = 300, 非常態,相關)")))
abline(v=mean(b1),col="red",lty=2)
abline(v=beta1)

n = 10
for(i in 1:T)
{
  y = numeric(n)
  u = numeric(n)
  for(j in 2:n)
  {
   u[j] = u[(j-1)]*0.5 + rnorm(1)
  }
  for(j in 2:n)
  { 
   y[j] = beta0 + beta1*y[(j-1)] + u[j]
  }
 y1 = y[1:(n-1)]
 x = y[2:n]
 model1 = lm(y1~x)
 b0[i] = coef(model1)[1]
 b1[i] = coef(model1)[2]
}
plot(density(b0),xlab=expression(b[0]), lwd=2,
  main=expression(paste(b[0],"的抽樣分配 (n = 10, 常態,相關)")))
abline(v=mean(b0),col="red",lty=2)
abline(v=beta0)
plot(density(b1),xlab=expression(b[1]), lwd=2,
  main=expression(paste(b[1],"的檢定統計量 (n = 10, 常態,相關)")))
abline(v=mean(b1),col="red",lty=2)
abline(v=beta1)

n=300
for(i in 1:T)
{
  y = numeric(n)
  u = numeric(n)
  for(j in 2:n)
  {
   u[j] = u[(j-1)]*0.5 + rnorm(1)
  }
  for(j in 2:n)
  { 
   y[j] = beta0 + beta1*y[(j-1)] + u[j]
  }
 y1 = y[1:(n-1)]
 x = y[2:n]
 model1 = lm(y1~x)
 b0[i] = coef(model1)[1]
 b1[i] = coef(model1)[2]
}
plot(density(b0),xlab=expression(b[0]), lwd=2,
  main=expression(paste(b[0],"的抽樣分配 (n = 300, 常態,相關)")))
abline(v=mean(b0),col="red",lty=2)
abline(v=beta0)
plot(density(b1),xlab=expression(b[1]), lwd=2,
  main=expression(paste(b[1],"的檢定統計量 (n = 300, 常態,相關)")))
abline(v=mean(b1),col="red",lty=2)
abline(v=beta1)

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
n = length(x)
model = lm(y~x)
summary(model)
b1 = as.numeric(coef(model)[2])
sb1 = sqrt(vcov(model)[2,2]) # standard error of b1
# H0:beta1=1
tb1 = (b1-1)/sb1
tb1
# p_value
2*(pt(tb1,(n-2)))
# beta的95%信賴區間
b1+qt(0.025,(n-2))*sb1
b1+qt(0.975,(n-2))*sb1

res = residuals(model)
s2 = sum((res*res))/(n-2)
s2
sqrt(s2) # standard error of regression
s2/var(y)





