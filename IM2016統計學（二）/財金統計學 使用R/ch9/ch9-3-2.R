# FS偏態t分配
library(fGarch)
?dsstd
windows()
par(mfrow=c(2,2))
x = seq(-4,4,length=1000)
plot(x,dsstd(x,mean=0,sd=1,nu=5,xi=2),type="l",ylab="",main="FS偏態t分配 (不同位置)",lwd=2)
lines(x,dsstd(x,mean=1,sd=1,nu=5,xi=2),lty=2,col="red",lwd=2)
lines(x,dsstd(x,mean=-1,sd=1,nu=5,xi=2),lty=3,col="blue",lwd=2)
ex = expression(mu==0,mu==1,mu==-1)
legend("topright",ex,lty=1:3,col=c("black","red","blue"),bty="n",lwd=2)

plot(x,dsstd(x,mean=0,sd=2,nu=5,xi=2),type="l",ylab="",main="FS偏態t分配 (不同尺度)",ylim=c(0,0.6),lwd=2)
lines(x,dsstd(x,mean=0,sd=1,nu=5,xi=2),lty=2,col="red",lwd=2)
lines(x,dsstd(x,mean=0,sd=3,nu=5,xi=2),lty=3,col="blue",lwd=2)
ex = expression(sigma==2,sigma==1,sigma==3)
legend("topright",ex,lty=1:3,col=c("black","red","blue"),bty="n",lwd=2)

plot(x,dsstd(x,mean=0,sd=1,nu=5,xi=2),type="l",ylab="",main="FS偏態t分配 (不同自由度)",ylim=c(0,0.8),lwd=2)
lines(x,dsstd(x,mean=0,sd=1,nu=3,xi=2),lty=2,col="red",lwd=2)
lines(x,dsstd(x,mean=0,sd=1,nu=7,xi=2),lty=3,col="blue",lwd=2)
ex = expression(nu==5,nu==3,nu==7)
legend("topright",ex,lty=1:3,col=c("black","red","blue"),bty="n",lwd=2)

plot(x,dsstd(x,mean=0,sd=1,nu=5,xi=1),type="l",ylab="",main="FS偏態t分配 (不同偏態)",ylim=c(0,0.6),lwd=2)
lines(x,dsstd(x,mean=0,sd=1,nu=5,xi=0.5),lty=2,col="red",lwd=2)
lines(x,dsstd(x,mean=0,sd=1,nu=5,xi=2),lty=3,col="blue",lwd=2)
ex = expression(xi==1,xi==0.5,xi==2)
legend("topright",ex,lty=1:3,col=c("black","red","blue"),bty="n",lwd=2)

# GH偏態t分配
library(SkewHyperbolic)
?dskewhyp
windows()
par(mfrow=c(2,2))
x = seq(-4,4,length=1000)
plot(x,dskewhyp(x,mu=0,delta=1,beta=0,nu=5),type="l",ylab="",main="GH偏態t分配 (不同位置)",lwd=2)
lines(x,dskewhyp(x,mu=1,delta=1,beta=0,nu=5),lty=2,col="red",lwd=2)
lines(x,dskewhyp(x,mu=-1,delta=1,beta=0,nu=5),lty=3,col="blue",lwd=2)
ex = expression(mu==0,mu==1,mu==-1)
legend("topright",ex,lty=1:3,col=c("black","red","blue"),bty="n",lwd=2)

plot(x,dskewhyp(x,mu=0,delta=2,beta=0,nu=5),type="l",ylab="",main="GH偏態t分配 (不同尺度)",ylim=c(0,0.85),lwd=2)
lines(x,dskewhyp(x,mu=0,delta=1,beta=0,nu=5),lty=2,col="red",lwd=2)
lines(x,dskewhyp(x,mu=0,delta=3,beta=0,nu=5),lty=3,col="blue",lwd=2)
ex = expression(delta==2,delta==1,delta==3)
legend("topright",ex,lty=1:3,col=c("black","red","blue"),bty="n",lwd=2)

plot(x,dskewhyp(x,mu=0,delta=1,beta=0,nu=5),type="l",ylab="",main="GH偏態t分配 (不同偏態)",ylim=c(0,0.85),lwd=2)
lines(x,dskewhyp(x,mu=0,delta=1,beta=2,nu=5),lty=2,col="red",lwd=2)
lines(x,dskewhyp(x,mu=0,delta=1,beta=-2,nu=5),lty=3,col="blue",lwd=2)
ex = expression(beta==0,beta==2,beta==-2)
legend("topright",ex,lty=1:3,col=c("black","red","blue"),bty="n",lwd=2)

plot(x,dskewhyp(x,mu=0,delta=1,beta=0,nu=7),type="l",ylab="",main="GH偏態t分配 (不同自由度)",ylim=c(0,1.1),lwd=2)
lines(x,dskewhyp(x,mu=0,delta=1,beta=0,nu=5),lty=2,col="red",lwd=2)
lines(x,dskewhyp(x,mu=0,delta=1,beta=0,nu=8),lty=3,col="blue",lwd=2)
ex = expression(nu==7,nu==5,nu==8)
legend("topright",ex,lty=1:3,col=c("black","red","blue"),bty="n",lwd=2)

# 9/5/1994-7/10/2014
tsmctwi = read.table("c:\\meiyih\\Finstats\\ch9\\tsmctwi.txt",header=T)
names(tsmctwi)
attach(tsmctwi)
p1 = TSMC # 收盤價
p2 = TWI # 收盤價

# TSMC與t分配
# 不重疊 k=10
n = length(p1)
n
y2 = p1[11:n]
n = length(y2)
m = n/11
y10r = numeric(m)
for(i in 1:m)
{
h = 11*i 
j = 11*(i-1)+1
y10r[i] = (log(y2[h])-log(y2[j]))*100
}
windows()
par(mfcol=c(2,3))
plot(density(y10r),type="l",ylab="",xlab="",main="TSMC (k=10) (不重疊), 實際與t分配",lwd=2)
fit = stdFit(y10r)
fit
param = fit$par
x = sort(y10r)
T = length(x)
x1 = seq(min(x), max(x), length=T)
lines(x1, dstd(x1,mean=param[1],sd=param[2],nu=param[3]),lty=2,col="red",lwd=2)
grid = (1:T)/(T+1)
qqplot(x,qstd(grid,mean=param[1],sd=param[2],nu=param[3]), lwd=2,
       xlab="",ylab="", main="QQ plot")
q1 = qstd(c(0.25,0.75), mean=param[1],sd=param[2],nu=param[3])
lmfit1 = lm(q1~quantile(y10r,c(0.25,0.75)))
abline(lmfit1)
basicStats(y10r)
model1 = fit
model1
AIC1 = -2*model1$objective + 2*3
BIC1 = -2*model1$objective + log(T)*3
AIC1
BIC1

# TSMC與FS偏態t分配
# 不重疊 k=10
n = length(p1)
n
y2 = p1[11:n]
n = length(y2)
m = n/11
y10r = numeric(m)
for(i in 1:m)
{
h = 11*i 
j = 11*(i-1)+1
y10r[i] = (log(y2[h])-log(y2[j]))*100
}
#windows()
#par(mfcol=c(2,1))
plot(density(y10r),type="l",ylab="",xlab="",main="TSMC (k=10) (不重疊), 實際與FS偏態t分配",lwd=2)
fit = sstdFit(y10r)
fit
param = fit$estimate
x = sort(y10r)
T = length(x)
x1 = seq(min(x), max(x), length=T)
lines(x1, dsstd(x1,mean=param[1],sd=param[2],nu=param[3],xi=param[4]), lwd=2,
       lty=2,col="red")
grid = (1:T)/(T+1)
qqplot(x,qsstd(grid,mean=param[1],sd=param[2],nu=param[3],xi=param[4]), lwd=2,
       xlab="",ylab="", main="QQ plot")
q1 = qsstd(c(0.25,0.75), mean=param[1],sd=param[2],nu=param[3],xi=param[4])
lmfit1 = lm(q1~quantile(y10r,c(0.25,0.75)))
abline(lmfit1)
model2 = fit
model2
AIC2 = -2*model2$minimum + 2*4
BIC2 = -2*model2$minimum + log(T)*4
AIC2
BIC2

#TSMC與GH偏態t分配
# 不重疊 k=10
n = length(p1)
n
y2 = p1[11:n]
n = length(y2)
m = n/11
y10r = numeric(m)
for(i in 1:m)
{
h = 11*i 
j = 11*(i-1)+1
y10r[i] = (log(y2[h])-log(y2[j]))*100
}
#windows()
#par(mfcol=c(2,1))
plot(density(y10r),type="l",ylab="",xlab="",main="TSMC (k=10) (不重疊), 實際與GH偏態t分配",lwd=2)
fit = skewhypFit(y10r)
fit
param = fit$param
x = sort(y10r)
T = length(x)
x1 = seq(min(x), max(x), length=T)
lines(x1, dskewhyp(x1,mu=param[1],delta=param[2],beta=param[3],nu=param[4]),lwd=2,
       lty=2,col="red")
grid = (1:T)/(T+1)
qqplot(x,qskewhyp(grid,mu=param[1],delta=param[2],beta=param[3],nu=param[4]),lwd=2,
       xlab="",ylab="", main="QQ plot")
q1 = qskewhyp(c(0.25,0.75), mu=param[1],delta=param[2],beta=param[3],nu=param[4])
lmfit1 = lm(q1~quantile(y10r,c(0.25,0.75)))
abline(lmfit1)
model3 = fit
summary(model3)
like = model3$maxLik
like
AIC3 = 2*(like) + 2*4
BIC3 = 2*(like) + log(T)*4
AIC3
BIC3

# exchange rates
exch = read.table("c:\\meiyih\\Finstats\\ch6\\exch.txt",header=T)
attach(exch)
names(exch)
e1 = 新台幣
# 新台幣匯率與t分配
# 不重疊 k=10
n = length(e1)
n
y2 = e1[2:n]
n = length(y2)
m = n/11
y10r = numeric(m)
for(i in 1:m)
{
h = 11*i 
j = 11*(i-1)+1
y10r[i] = (log(y2[h])-log(y2[j]))*100
}
windows()
par(mfcol=c(2,3))
plot(density(y10r),type="l",ylab="",xlab="",main="新台幣匯率 (k=10) (不重疊), 實際與t分配",lwd=2)
fit = stdFit(y10r)
fit
param = fit$par
x = sort(y10r)
T = length(x)
x1 = seq(min(x), max(x), length=T)
lines(x1, dstd(x1,mean=param[1],sd=param[2],nu=param[3]),lty=2,col="red",lwd=2)
grid = (1:T)/(T+1)
qqplot(x,qstd(grid,mean=param[1],sd=param[2],nu=param[3]),lwd=2,
       xlab="",ylab="", main="QQ plot")
q1 = qstd(c(0.25,0.75), mean=param[1],sd=param[2],nu=param[3])
lmfit1 = lm(q1~quantile(y10r,c(0.25,0.75)))
abline(lmfit1)
basicStats(y10r)
model4 = fit
model4
AIC4 = -2*model4$objective + 2*3
BIC4 = -2*model4$objective + log(T)*3
AIC4
BIC4

# 新台幣匯率與FS偏態t分配
# 不重疊 k=10
n = length(e1)
n
y2 = e1[2:n]
n = length(y2)
m = n/11
y10r = numeric(m)
for(i in 1:m)
{
h = 11*i 
j = 11*(i-1)+1
y10r[i] = (log(y2[h])-log(y2[j]))*100
}
#windows()
#par(mfcol=c(2,1))
plot(density(y10r),type="l",ylab="",xlab="",main="新台幣匯率 (k=10) (不重疊), 實際與FS偏態t分配",lwd=2)
fit = sstdFit(y10r)
fit
param = fit$estimate
x = sort(y10r)
T = length(x)
x1 = seq(min(x), max(x), length=T)
lines(x1, dsstd(x1,mean=param[1],sd=param[2],nu=param[3],xi=param[4]),lwd=2,
       lty=2,col="red")
grid = (1:T)/(T+1)
qqplot(x,qsstd(grid,mean=param[1],sd=param[2],nu=param[3],xi=param[4]),lwd=2,
       xlab="",ylab="", main="QQ plot")
q1 = qsstd(c(0.25,0.75), mean=param[1],sd=param[2],nu=param[3],xi=param[4])
lmfit1 = lm(q1~quantile(y10r,c(0.25,0.75)))
abline(lmfit1)
model5 = fit
model5
AIC5 = -2*model5$minimum + 2*4
BIC5 = -2*model5$minimum + log(T)*4
AIC5
BIC5

#新台幣匯率與GH偏態t分配
# 不重疊 k=10
n = length(e1)
n
y2 = e1[2:n]
n = length(y2)
m = n/11
y10r = numeric(m)
for(i in 1:m)
{
h = 11*i 
j = 11*(i-1)+1
y10r[i] = (log(y2[h])-log(y2[j]))*100
}
#windows()
#par(mfcol=c(2,1))
plot(density(y10r),type="l",ylab="",xlab="",main="新台幣匯率 (k=10) (不重疊), 實際與GH偏態t分配",lwd=2)
fit = skewhypFit(y10r)
fit
param = fit$param
x = sort(y10r)
T = length(x)
x1 = seq(min(x), max(x), length=T)
lines(x1, dskewhyp(x1,mu=param[1],delta=param[2],beta=param[3],nu=param[4]),lwd=2,
       lty=2,col="red")
grid = (1:T)/(T+1)
qqplot(x,qskewhyp(grid,mu=param[1],delta=param[2],beta=param[3],nu=param[4]),lwd=2,
       xlab="",ylab="", main="QQ plot")
q1 = qskewhyp(c(0.25,0.75), mu=param[1],delta=param[2],beta=param[3],nu=param[4])
lmfit1 = lm(q1~quantile(y10r,c(0.25,0.75)))
abline(lmfit1)
model6 = fit
summary(model6)
like = model6$maxLik
like
AIC6 = 2*(like) + 2*4
BIC6 = 2*(like) + log(T)*4
AIC6
BIC6
