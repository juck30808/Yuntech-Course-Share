# ex
# 1-1
# ex1
rchisq(10,4)
rchisq(100,4)
rchisq(10,10)
rchisq(100,10)

# ex2
1-pchisq(23,6)

# ex3
qchisq(0.12,20)

# ex4
x = seq(0,50,length=100)
windows()
plot(x,dchisq(x,20),type="l",ylab="PDF",main="自由度為20的卡方分配之PDF",lwd=2)

# ex5
# Daily TSMC and TWI
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch6\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))
twi = read.table("c:\\meiyih\\Finstats\\ch6\\TWI.txt", header=T)
attach(twi)
names(twi)
# exchange rates 1/2/2002-7/10/2014
exch = read.table("c:\\meiyih\\Finstats\\ch6\\exch.txt", header=T)
attach(exch)
names(exch)

p = 收盤價_TW
twi.r = 100*diff(log(p))
n = 30
set.seed(1234)
x = sample(twi.r,n,replace=T)
s2 = var(x)
s2
# 90%
alpha = 0.1
lower = (n-1)*s2/qchisq(1-(alpha/2),(n-1))
upper = (n-1)*s2/qchisq(alpha/2,(n-1))
lower
upper

# ex6
# H0: sigma2 >= 5
chi = (n-1)*s2/5
chi
pchisq(chi,(n-1))
qchisq(0.05,(n-1))

# ex7
# H0:sigma <= 1.5
chi = (n-1)*s2/1.5^2
chi
1-pchisq(chi,(n-1))
qchisq(0.95,(n-1))

# 1-2
# ex2
lambda1 = 0.94
lambda2 = 0.96
n = 20
weight1 = (1-lambda1)/(lambda1*(1-lambda1^n))
weight2 = (1-lambda2)/(lambda2*(1-lambda2^n))
weighta = numeric(n)
weightb = numeric(n)
for(i in 1:n)
{
weighta[i] = (lambda1^i)*weight1
weightb[i] = (lambda2^i)*weight2
}
windows()
plot(1:n,weighta,type="l",lwd=2,xlab="",ylab="",xlim=c(0,22),ylim=c(0.02,0.1),
   main=expression(paste("不同",lambda,"值之比較")))
lines(1:n,weightb,lty=2,col="red",lwd=2)
leg1 = c(expression(lambda==0.94),expression(lambda==0.96))
legend("topright",leg1,col=c("black","red"),lty=1:2,bty="n",lwd=2)
sum(weighta)
sum(weightb)

# ex3
# #1/4/2005-4/28/2015
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
xr = 100*diff(log(p))
xr1 = xr[(length(xr)-250):length(xr)]
length(xr1)
lambda = 0.94
sigma2hat_1 = var(xr1[1:(length(xr1)-1)])
sigma2hat = (1-lambda)*xr1[250]^2 + lambda*sigma2hat_1
sigma2hat
var(xr)

# 2-1-1
# ex1
p = 收盤價
p_T = 收盤價_TW
tsmc.r = 100*diff(log(p))
twi.r = 100*diff(log(p_T))
n = 50
set.seed(123)
yr = sample(tsmc.r,n,replace=T)
set.seed(1234)
xr = sample(twi.r,n,replace=T) 
cor(xr,yr) # 樣本相關係數
ybar = round(mean(yr),4)
xbar = round(mean(xr),4)
ybar
xbar
round(sd(tsmc.r),4)
round(sd(twi.r),4)
round(sd(yr),4)
round(sd(xr),4)

# ex4
y = 新台幣
x = 人民幣
yr = 100*diff(log(y))
xr = 100*diff(log(x))
cor(yr,xr)
n = 100
set.seed(12345)
yr1 = sample(yr,n,replace=T)
set.seed(12345)
xr1 = sample(xr,n,replace=T)
cor(yr1,xr1)
ybar = mean(yr1)
xbar = mean(xr1)
sy = sd(yr1)
sx = sd(xr1)
sy = round(sy,4)
sx = round(sx,4)
ybar = round(ybar,4)
xbar = round(xbar,4)
sxy = sqrt((sy^2)/n + (sx^2)/n)
z1 = (ybar-xbar)/sxy
z1
2*(1-pnorm(z1)) # p_value, 雙尾
zr = yr-xr
zbar = mean(zr)
sz = sd(zr)
z2 = zbar/sz
z2
2*(1-pnorm(z2)) # p_value, 雙尾

# 2-1-2
# ex1
p = 收盤價
p_T = 收盤價_TW
tsmc.r = 100*diff(log(p))
twi.r = 100*diff(log(p_T))
n = 7
m = 8
set.seed(1234)
yr = sample(tsmc.r,n,replace=T)
set.seed(123)
xr = sample(twi.r,m,replace=T)
yr = round(yr,4)
xr = round(xr,4)
ybar = mean(yr)
xbar = mean(xr)
ybar
xbar

# ex3
# ex4
y = 新台幣
x = 人民幣
yr = 100*diff(log(y))
xr = 100*diff(log(x))
n = 5
m = 6
set.seed(1234)
yr = sample(yr,n,replace=T)
set.seed(123)
xr = sample(xr,m,replace=T)
yr = round(yr,4)
xr = round(xr,4)
yr
xr
ybar = mean(yr)
xbar = mean(xr)
ybar
xbar

# 2-2-1
# ex1
p = 收盤價
y = 100*diff(log(p))
length(y)
summary(y)
i = y >= 1
sum(as.numeric(i))
pbar1 = mean(as.numeric(i))
pbar1
j = y <= -1
sum(as.numeric(j))
pbar2 = mean(as.numeric(j))
pbar2

sp2 = sqrt(pbar2*(1-pbar2)/length(y))
upper = pbar2 + qnorm(0.975)*sp2
lower = pbar2 + qnorm(0.025)*sp2
upper
lower

# ex2
z = (pbar2-0.3)/sp2
z
pnorm(z)

# ex3
N = 10000
pbar1 = numeric(N)
pbar2 = numeric(N)
n = 5000
for(i in 1:N)
{
x = runif(n,-0.1,0.9)
pbar1[i] = mean(as.numeric(x <= 0))
y = runif(n,-0.01,0.99)
pbar2[i] = mean(as.numeric(y <= 0))
}
windows()
par(mfrow=c(2,1))
plot(density(pbar1),lwd=2,xlab=expression(bar(p)),
   main=expression(paste(p==0.1,"之",bar(p),"的抽樣分配")))
x = sort(pbar1)
lines(x,dnorm(x,mean(pbar1),sd(pbar1)),lty=2,lwd=2,col="red")
plot(density(pbar2),lwd=2,xlab=expression(bar(p)),
   main=expression(paste(p==0.01,"之",bar(p),"的抽樣分配")))
y = sort(pbar2)
lines(y,dnorm(y,mean(pbar2),sd(pbar2)),lty=2,lwd=2,col="red")

# ex4
x = 新台幣
xr = 100*diff(log(x))
length(xr)
summary(xr)
i = xr <= -0.1
sum(as.numeric(i))
j = xr >= 0.1
sum(as.numeric(j))
pbar = mean(as.numeric(j))
pbar

# 2-2-2
# ex1
p = 收盤價
p_T = 收盤價_TW
tsmc.r = 100*diff(log(p))
twi.r = 100*diff(log(p_T))
n = 1000
set.seed(1234)
y = sample(tsmc.r,n,replace=T)
summary(y)
pbar1 = mean(as.numeric(y > 1.2))
pbar1
set.seed(123345)
x = sample(twi.r,n,replace=T)
summary(x)
pbar2 = mean(as.numeric(x > 1.2))
pbar2
cor(y,x)
pbar = (n*pbar1+n*pbar2)/(n+n)
sxy = sqrt(pbar*(1-pbar)*(2/n))
# test statistic
z = (pbar1-pbar2)/sxy
z
# ex2
# H0: p1 - p2 >= 0.1 
z = (pbar1-pbar2-0.1)/sxy
z

# ex3
s2xy1 = pbar1*(1-pbar1)/n + pbar2*(1-pbar2)/n
sxy1 = sqrt(s2xy1)
z1 = (pbar1-pbar2-0.1)/sxy1
z1

# ex4
y = 新台幣
x = 人民幣
yr = 100*diff(log(y))
xr = 100*diff(log(x))
n = 1200
m = 1000
set.seed(12)
tai = sample(yr,n,replace=T)
summary(tai)
i = tai < 0
sum(as.numeric(i))/n
set.seed(1234)
chi = sample(xr,m,replace=T)
j = chi < 0
sum(as.numeric(j))/m

# 2-3
# ex1
x = rf(20,5,6)
x

# ex2
pf(5.6,10,7)

# ex3
qf(0.05,10,7)

# ex4
x = seq(0,10,length=100)
windows()
par(mfrow=c(2,1))
plot(x,df(x,8,9),type="l",main="F分配之PDF",ylab="",lwd=2)
plot(x,pf(x,8,9),type="l",main="F分配之CDF",ylab="",lwd=2)

# 3-1

# ex1
p = 收盤價
p_T = 收盤價_TW
tsmc.r = 100*diff(log(p))
twi.r = 100*diff(log(p_T))
q1 = quantile(tsmc.r,0.25)
q2 = quantile(tsmc.r,0.5)
q3 = quantile(tsmc.r,0.75)
y = tsmc.r
n1 = sum(as.numeric(y <= q1))
n1
length(y)*0.25
set.seed(123)
x = sample(twi.r,1000,replace=T)
n1 = sum(as.numeric(x <= q1))
n1
n2 = sum(as.numeric(x > q1 & x <= q2))
n2
n3 = sum(as.numeric(x > q2 & x <= q3))
n3
n4 = sum(as.numeric(x > q3))
n4
# ex2
y = tsmc.r
length(y)
y = y[2:length(y)]
T = length(y)
y1 = y[1:(T/2)]
y2 = y[((T/2)+1):T]
length(y1)
length(y2)
q1 = quantile(y1,0.25)
q2 = quantile(y1,0.5)
q3 = quantile(y1,0.75)
n1 = sum(as.numeric(y2 <= q1))
n1
n2 = sum(as.numeric(y2 > q1 & y2 <= q2))
n2
n3 = sum(as.numeric(y2 > q2 & y2 <= q3))
n3
n4 = sum(as.numeric(y2 > q3))
n4

# ex3
y = tsmc.r
y2 = y^2
q1 = quantile(y2,0.25)
q2 = quantile(y2,0.5)
q3 = quantile(y2,0.75)
n1 = sum(as.numeric(y <=0 & y2 <= q1))
n1
n2 = sum(as.numeric(y <=0 & y2 > q1 & y2 <= q2))
n2
n3 = sum(as.numeric(y <= 0 & y2 > q2 & y2 <= q3))
n3
n4 = sum(as.numeric(y <=0 & y2 > q3))
n4
length(y)
n1 + n2 + n3 + n4
sum(as.numeric(y <= 0))
sum(as.numeric(y > 0))
c1 = sum(as.numeric(y2 <= q1))
c1
c2 = sum(as.numeric(y2 > q1 & y2 <= q2))
c2
c3 = sum(as.numeric(y2 > q2 & y2 <= q3))
c3
c4 = sum(as.numeric(y2 > q3))
c4
c1-n1
c2-n2
c3-n3
c4-n4
M = as.table(rbind(c(587,460,471,437),c(319,446,435,468)))
dimnames(M) = list(news = c("正面","負面"),
                    vol = c("S","M","L","SL"))
M
Xsq = chisq.test(M)  # Prints test summary
Xsq
Xsq$observed   # observed counts (same as M)
Xsq$expected   # expected counts under the null

# 3-2
# ex1
p = 收盤價
tsmc.r = 100*diff(log(p))
r = tsmc.r[24:length(tsmc.r)] #2/11/2000-7/10/2014
r1 = r[1:900]
r2 = r[901:1800]
r3 = r[1801:2700]
r4 = r[2701:3600]
T = 10000
n = 200
mr1 = numeric(T)
mr2 = numeric(T)
mr3 = numeric(T)
mr4 = numeric(T)
set.seed(234)
for(i in 1:T)
{
mr1[i] = mean(sample(r1,n,replace=T))
mr2[i] = mean(sample(r2,n,replace=T))
mr3[i] = mean(sample(r3,n,replace=T))
mr4[i] = mean(sample(r4,n,replace=T))
}
n = 5
set.seed(123)
mr1a = sample(mr1,n,replace=T)
set.seed(123)
mr2a = sample(mr2,n,replace=T)
set.seed(123)
mr3a = sample(mr3,n,replace=T)
set.seed(123)
mr4a = sample(mr4,n,replace=T)
round(mr1a,2)
round(mr2a,2)
round(mr3a,2)
round(mr4a,2)

# ex3
# #1/4/2005-4/28/2015
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
largan.r = 100*diff(log(p))
length(largan.r)/4
r = largan.r[1:length(largan.r)]
r1 = r[1:639]
r2 = r[640:1278]
r3 = r[1279:1917]
r4 = r[1918:2556]
T = 10000
n = 200
mr1 = numeric(T)
mr2 = numeric(T)
mr3 = numeric(T)
mr4 = numeric(T)
set.seed(234)
for(i in 1:T)
{
mr1[i] = mean(sample(r1,n,replace=T))
mr2[i] = mean(sample(r2,n,replace=T))
mr3[i] = mean(sample(r3,n,replace=T))
mr4[i] = mean(sample(r4,n,replace=T))
}
windows()
plot(density(mr1),xlab=expression(bar(x)),lwd=2,
     main="大立光四期樣本平均數之抽樣分配",ylim=c(0,2.5))
lines(density(mr2),lty=2,col="2",lwd=2)
lines(density(mr3),lty=3,col="3",lwd=2)
lines(density(mr4),lty=4,col="4",lwd=2)
legend("topleft",c("1期","2期","3期","4期"),lty=1:4,col=1:4,lwd=2,bty="n")

n = 5
set.seed(123)
mr1a = sample(mr1,n,replace=T)
n = 4
set.seed(123)
mr2a = sample(mr2,n,replace=T)
n = 6
set.seed(123)
mr3a = sample(mr3,n,replace=T)
n = 5
set.seed(123)
mr4a = sample(mr4,n,replace=T)
round(mr1a,2)
round(mr2a,2)
round(mr3a,2)
round(mr4a,2)

# 4-1-1
# ex1
p = 收盤價
tsmc.r = 100*diff(log(p))
y = tsmc.r[(length(tsmc.r)-7):length(tsmc.r)]
y2 = round(y,1)^2
y2
acfy = acf(y2,plot=F)
acfy
# lag 1
ybar = mean(y2)
y2a = y2[1:7]
y2b = y2[2:8]
y2a = y2a-ybar
y2b = y2b-ybar
sum(y2a*y2b)/sum((y2-ybar)^2)
# lag 2
y2a = y2[1:6]
y2b = y2[3:8]
y2a = y2a-ybar
y2b = y2b-ybar
sum(y2a*y2b)/sum((y2-ybar)^2)

# ex2,3
acfy2 = acf(tsmc.r^2,plot=F)
acfy2
n = length(tsmc.r)
sigma2 = 1/n
z = 0.182/sqrt(sigma2)
z
windows()
acf(tsmc.r^2)

# 4-1-2
# ex1

# 4-1-3
# ex2
y = 歐元
x = 人民幣
z = 新台幣
yr = 100*diff(log(y))
xr = 100*diff(log(x))
zr = 100*diff(log(z))
A = cbind(yr,xr,zr)
cor(A)
length(yr)/3
A1 = A[1:1045,]
A2 = A[1046:2090,]
A3 = A[2091:3135,]
cor(A1)
cor(A2)
cor(A3)


# 本章習題

# ch6
# ex2
GDP = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\GDP.txt")
GDP = GDP[,1]
m = length(GDP)
gdpr1 = 100*((GDP[5:m]-GDP[1:(m-4)])/GDP[1:(m-4)])
x = gdpr1[154:length(gdpr1)]  # 2000:1-2014:2
n = length(x)
library(fBasics)
basicStats(x) # 峰態為超額峰態
windows()
plot(c(0,100),c(-0.01,0.04),type="n",xlab="",ylab="",axes=T,frame.plot=T)
y = seq(0,100,length= 1000)
lines(y,dchisq(y,(n-1)),lty=1,lwd=2)
abline(h=0)
var(x)
## H0: sigma2 >= 25
alpha = 0.05
a = qchisq(alpha,(n-1))
segments(a,0,a,0.03)
i = y <= a
polygon(c(20,y[i],a),c(0,dchisq(y[i],(n-1)),0),col="orange")
points(a,0,pch=20)
text(a,0,labels=expression(chi[list(0.05,56)]^2),pos=1)
s2 = var(x)
# test statistic
chi = (n-1)*s2/25
chi
points(chi,0,pch=20)
# reject H0
pchisq(chi,(n-1))

# ex3
# 1981:1-2014:7
cpi = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\cpi.txt")
cpi = cpi[,1]
n = length(cpi)
inf = 100*diff(log(cpi),12)
basicStats(inf)
n = length(inf)
m = 50
x = inf[(n-m+1):n]
length(x)
s2 = var(x)

# H0: sigma2 = 2%
# 99% confidence interval
alpha = 0.01
(m-1)*s2/qchisq((1-(alpha/2)),(m-1))
(m-1)*s2/qchisq((alpha/2),(m-1))
# test statistic
chi = (m-1)*s2/2
chi
qchisq((alpha/2),(m-1))
# reject
# p value
2*pchisq(chi,(m-1))

# H0: sigma2 >= 2%
qchisq(alpha,(m-1))

# ex4
r = gdpr1
r = ts(r,start=c(1962,1),frequency=4)
n = length(r)
n
plot(r,type="l",ylab="名目經濟成長率",lwd=2)
r1 = r[1:147] # 1962:1-1998:3
r2 = r[148:n]
segments(c(1962,1),mean(r1),c(1998,3),mean(r1),lty=2,col="red")
segments(c(1998,4),mean(r2),c(2014,2),mean(r2),lty=2,col="blue")
abline(v=c(1998,4))

length(r2)

x1bar = mean(r1)
x2bar = mean(r2)
var1 = var(r1)
var2 = var(r2)
# 95% mu1-mu2 confidence level
s = sqrt((var1/length(r1))+(var2/length(r2)))
x1bar-x2bar +qnorm(0.025)*s
x1bar-x2bar +qnorm(0.975)*s
# test statistic
z = ((x1bar-x2bar)-11)/s
z
2*(1-pnorm(z))

# ex5
s21 = var1
s22 = var2
n1 = length(r1)
n2 = length(r2)
# 95% population variance ratio confidence interval
(s22/s21)*qf(0.025,(n1-1),(n2-1))
(s22/s21)*qf(0.975,(n1-1),(n2-1))
# reject
# test statistic
F = s21/s22
F
# critical value
qf(0.975,(n1-1),(n2-1))
# reject
# p value
2*(1-pf(F,(n1-1),(n2-1)))

# ex6
R1 = numeric(10000)
R2 = numeric(10000)
n = 50
set.seed(123)
for(i in 1:10000)
{
R1[i] = mean(sample(r1,n,replace=T))
R2[i] = mean(sample(r2,n,replace=T))
}
head(R1)
head(R2)

set.seed(1234)
n1 = 9
n2 = 8
r1a = sample(R1,n1,replace=T)
x1bar = mean(r1a)
x1bar
s12 = var(r1a)
r2a = sample(R2,n2,replace=T)
x2bar = mean(r2a)
x2bar
s22 = var(r2a)

xbar = x1bar-x2bar - 10
s2 = ((n1-1)*s21+(n2-1)*s22)/(n1+n2-2)
sd12a = sqrt(s2*((1/n1)+(1/n2)))
sd12 = sqrt((s21/n1)+(s22/n2))
t1 = xbar/sd12a
t1
t2 = xbar/sd12
t2
pa = 2*(1-pt(t1,(2*(n-1)))) # p value
pa
df1 = ((s21/n1) + (s22/n2))^2
df2 = ((s21/n1)^2)/(n1-1)
df3 = ((s22/n2)^2)/(n2-1)
df12 = df1/(df2+df3)
pb = 2*(1-pt(t2,df12))
pb

# ex7
twi = read.table("c:\\meiyih\\Finstats\\ch6\\TWI.txt", header=T)
attach(twi)
names(twi)
# exchange rates 1/2/2002-7/10/2014
exch = read.table("c:\\meiyih\\Finstats\\ch6\\exch.txt", header=T)
attach(exch)
names(exch)

# MA and EWMA
p = 收盤價_TW
twi.r = 100*diff(log(p))
library(fBasics)
basicStats(twi.r)
T = length(twi.r)
windows()
par(mfrow=c(2,1))
plot(twi.r^2,type="p",xlab="time",ylab="", ylim=c(0,30),main="n = 250")
abline(h=var(twi.r), col="red")
ne = 250
T1 = T-ne+1
sigma = numeric(T1)
for(i in ne:T)
{
 i1 = i-ne+1
 sigma[i1] = var(twi.r[i1:i])
}
lines(ne:T,sigma, lty=2, col="green",lwd=3)
lambda = 0.94
var1 = var(twi.r[1:ne]) # initial variance
ewma = numeric(T1)
ewma[1] = var1
for(i in ne:(T-1))
{
 i1 = i-ne+1
 ewma[(i1+1)] = lambda*ewma[i1]+(1-lambda)*twi.r[(ne+i1-1)]^2
}
lines(ne:T,ewma, lty=4, col="blue",lwd=3)
legend("topright",c("移動平均","EWMA"),col=c("green","blue"),lty=c(2,4),bty="n",lwd=3)
 
tail(sigma)
tail(ewma)

plot(twi.r^2,type="p",xlab="time",ylab="", ylim=c(0,30),main="n = 500")
abline(h=var(twi.r), col="red")
ne = 500
T1 = T-ne+1
sigma = numeric(T1)
for(i in ne:T)
{
 i1 = i-ne+1
 sigma[i1] = var(twi.r[i1:i])
}
lines(ne:T,sigma, lty=2, col="green",lwd=3)
lambda = 0.94
var1 = var(twi.r[1:ne]) # initial variance
ewma = numeric(T1)
ewma[1] = var1
for(i in ne:(T-1))
{
 i1 = i-ne+1
 ewma[(i1+1)] = lambda*ewma[i1]+(1-lambda)*twi.r[(ne+i1-1)]^2
}
lines(ne:T,ewma, lty=2, col="blue",lwd=3)
legend("topright",c("移動平均","EWMA"),col=c("green","blue"),lty=c(2,4),bty="n",lwd=3)
tail(sigma)
tail(ewma)

# ex 12
e1 = 新台幣
e2 = 人民幣
summary(e1)
summary(e2)

e1r = 100*diff(log(e1))
e2r = 100*diff(log(e2))
T = length(e1r)
mean(e1r)
mean(e2r)
sd(e1r)
sd(e2r)
e1ra = mean(e1r[(T-50+1):T])
e1ra
sd(e1r[(T-50+1):T])
e2ra = mean(e2r[(T-50+1):T])
e2ra
sd(e2r[(T-50+1):T])

# ex 13
set.seed(12345)
x = sample(e1r,300,replace=T)
index = x >= 0
x = mean(as.numeric(index))
x
set.seed(12345)
x = sample(e2r,300,replace=T)
index = x >= 0
y = mean(as.numeric(index))
y

# ex 18
T = length(e1r)
T
e1rb = e1r[136:T]
length(e1rb)
e1rb1 = e1rb[1:1000]
e1rb2 = e1rb[1001:2000]
e1rb3 = e1rb[2001:3000]
set.seed(123)
sample(e1rb1,5,replace=T)
set.seed(123)
sample(e1rb2,5,replace=T)
set.seed(123)
sample(e1rb3,5,replace=T)




