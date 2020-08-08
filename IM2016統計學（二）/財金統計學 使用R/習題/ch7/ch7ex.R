# ch7
# 1

# ex3
n = 100
beta0 = 2
beta1 = 3
windows()
x = seq(1,5,by=1)
y = beta0 + beta1*x
plot(x,y,type="l",ylim=c(0,20),xlim=c(1,5), lwd=3)
x1 = seq(2,16,length=n)
y1 = dnorm(x1,8,1) + 2
lines(y1,x1,col="red", lwd=3)
segments(2,8,2.4,8,lty=2, col="blue")
abline(v=2)
x2 = seq(2,16,length=n)
y2 = dnorm(x1,11,2) + 3
lines(y2,x2,col="red",lwd=3)
segments(3,11,3.2,11,lty=2, col="blue")
abline(v=3)
x3 = seq(2,16,length=n)
y3 = dnorm(x1,14,0.5) + 4
lines(y3,x3,col="red",lwd=3)
segments(4,14,4.8,14,lty=2, col="blue")
abline(v=4)

# 1-1
# ex1
x = 1:5
y = c(2,4,6.5,7.3,12)
x
y
windows()
plot(x,y,type="p",cex=2,pch=18)
abline(lm(y~x),col="steelblue",lwd=3)
# ex3
# 1982:1-2015:5
infun = read.table("c:\\meiyih\\Finstats\\ex\\ch7\\infun.txt")
inf = infun[,1]
un = infun[,2]
windows()
par(mfrow=c(3,1))
plot(inf,type="l",lwd=2)
plot(un,type="l",lwd=2)
plot(un,inf,type="p",lwd=2)
y = inf[(length(inf)-5):length(inf)]
x = un[(length(un)-5):length(un)]
y
x
windows()
plot(x,y,type="p",pch=18,lwd=2,xlab="失業率",ylab="通貨膨脹率")
abline(lm(y~x),col="tomato",lwd=2)

y = inf[(length(inf)-100):length(inf)]
x = un[(length(un)-100):length(un)]
y
x
windows()
plot(x,y,type="p",pch=18,lwd=2,xlab="失業率",ylab="通貨膨脹率")
abline(lm(y~x),col="tomato",lwd=2)

#1-3
# ex2
N = 5000
n = 1000
beta0 = 2
beta1 = 4
b1 = numeric(N)
tstat = numeric(N)
set.seed(1234)
for(i in 1:N)
{
y = numeric(n)
x = rnorm(n,3,2)
u = rnorm(n)
y = beta0 + beta1*x + x*u
model = lm(y~x)
b1[i] = coef(model)[2]
res = residuals(model)
s2 = sum(res*res)/(n-2)
se = sqrt(s2/sum((x-mean(x))^2))
tstat[i] = (b1[i]-beta1)/se
}
windows()
par(mfrow=c(2,1))
plot(density(b1),xlab="",lwd=2,main=expression(paste(b[1],"的抽樣分配")))
abline(v=beta1,lty=2)
plot(density(tstat),ylim=c(0,0.5),xlab="",lwd=2,main="t檢定統計量的抽樣分配")
t = sort(tstat)
lines(t,dt(t,(n-2)),lty=2,col="red",lwd=2)
abline(v=0,lty=2)

# 1-4
# ex4
# 1982:1-2015:5
infun = read.table("c:\\meiyih\\Finstats\\ex\\ch7\\infun.txt")
inf = infun[,1]
un = infun[,2]
windows()
layout(matrix(c(1,2,3,3), 2, 2, byrow = TRUE))
plot(inf,type="l",lwd=2,main="通貨膨脹率之時間走勢")
plot(un,type="l",lwd=2,main="失業率之時間走勢")
plot(un,inf,type="p",lwd=2,main="通貨膨脹率與失業率之散佈圖",xlab="失業率",ylab="通貨膨脹率")
abline(lm(inf~un),lty=2,col="red",lwd=2)
y = inf
x = un
b1 = sum((y-mean(y))*(x-mean(x)))/sum((x-mean(x))^2)
b1
b0 = mean(y)-b1*mean(x)
b0
yhat = b0+b1*x
res = y-yhat
s2 = sum(res*res)/(length(inf)-2)
seb1 = sqrt(s2/sum((x-mean(x))^2))
seb1
tstatb1 = b1/seb1
tstatb1
model = lm(inf~un)
summary(model)
anova(model)

T = length(inf)
inf1 = inf[2:T]
un1 = un[1:(T-1)]
model1 = lm(inf1~un1)
summary(model1)
windows()
plot(un1,inf1,type="p",lwd=2,main="通貨膨脹率與失業率之散佈圖",xlab="失業率",ylab="通貨膨脹率")
abline(model1,lty=2,col="red",lwd=2)

# ex8
tsmc.r = 100*diff(log(收盤價))
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
y1 = y[2:n]
x1 = x[1:(n-1)]
summary(lm(y1~x1))

# 2-1
# ex1
y = tsmc.r-int
x = twi.r-int
T = length(y) # T = 173
y = matrix(y,T,1) # T by 1 vector
x = matrix(x,T,1)
dim(y)
dim(x)
# ex2
ones = matrix(rep(1,T),T,1)
X = cbind(ones,x)
dim(X)
b = solve(t(X)%*%X)%*%t(X)%*%y
b1 = b[2]
b1
dim(b1)

# 2-2
# ex1
library(tseries)
price.dow = get.hist.quote(instrument = "^DJI",start="2000-01-01",end="2015-06-30",
    quote="AdjClose",compression="m") # Dow Jones之調整後月股價
price.jap = get.hist.quote(instrument = "^N225",start="2000-01-01",end="2015-06-30",
    quote="AdjClose",compression="m") # 日本股價指數之調整後月股價
price.chi = get.hist.quote(instrument = "000001.SS",start="2000-01-01",end="2015-06-30",
    quote="AdjClose",compression="m") # 上海綜合股價指數之調整後月股價
price.twi = get.hist.quote(instrument = "^TWII",start="2000-01-01",end="2015-06-30",
    quote="AdjClose",compression="m") # 台灣加權股價指數之調整後月股價

head(price.dow)
tail(price.dow)
windows()
par(mfrow=c(2,2))
plot(price.dow,main="Dow Jones之調整後月股價時間走勢",ylab="",lwd=2)
plot(price.jap,main="日本股價指數之調整後月股價時間走勢",ylab="",lwd=2)
plot(price.chi,main="上海綜合股價指數之調整後月股價時間走勢",ylab="",lwd=2)
plot(price.twi,main="台灣加權股價指數之調整後月股價時間走勢",ylab="",lwd=2)

dow = as.numeric(price.dow)
jap = as.numeric(price.jap)
chi = as.numeric(price.chi)
twi = as.numeric(price.twi)

all = cbind(dow,jap,chi,twi)
cor(all)
lall = log(all)
cor(lall)
x = lall[,1]
y = lall[,2]
w = lall[,3]
z = lall[,4]

modelA = lm(z~x+y+w)
summary(modelA)
resa = residuals(modelA)

modelB = lm(z~x+y)
summary(modelB)
resb = residuals(modelB)

modelC = lm(z~x+w)
summary(modelC)
resc = residuals(modelC)

modelD = lm(z~y+w)
summary(modelD)
resd = residuals(modelD)

modelE = lm(z~x)
summary(modelE)
rese = residuals(modelE)

modelF = lm(z~y)
summary(modelF)
resf = residuals(modelF)

modelG = lm(z~w)
summary(modelG)
resg = residuals(modelG)

windows()
par(mfrow=c(4,2))
plot(resa,type="l",lwd=2,main="模型 A")
plot(resb,type="l",lwd=2,main="模型 B")
plot(resc,type="l",lwd=2,main="模型 C")
plot(resd,type="l",lwd=2,main="模型 D")
plot(rese,type="l",lwd=2,main="模型 E")
plot(resf,type="l",lwd=2,main="模型 F")
plot(resg,type="l",lwd=2,main="模型 G")

# ex5
T = length(x)
X = matrix(lall[,1:3],T,3)
ones = matrix(rep(1,T),T,1)
X = cbind(ones,X)
b = solve(t(X)%*%X)%*%t(X)%*%matrix(z,T,1)
b
modelA
z = matrix(z,T,1)
res = z - X%*%b
s2 = t(res)%*%res/(T-4)
dim(s2)
s2 = as.numeric(s2)
dim(s2)
se2 = solve(t(X)%*%X)*s2
sqrt(se2)
sqrt(vcov(modelA))
t0 = b[1]/sqrt(se2)[1,1]
t0
t1 = b[2]/sqrt(se2)[2,2]
t1
t2 = b[3]/sqrt(se2)[3,3]
t2
t3 = b[4]/sqrt(se2)[4,4]
t3
summary(modelA)
# p-value of t3
2*(1-pt(t3,(T-4)))

# ex6
# try, VR ratio test
p = resa  
n = length(p)
n
q1 = 2:20
VRy = numeric(19)
for(j in 1:19)
{
q = q1[j]  
p = p
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
VRy[j] = sqrt((n-1))*((sigma12/sigma32)-1)/sqrt(h)
}
VRy
windows()
plot(2:20,VRy,type="l",lwd=2,ylab="",main="以VR檢定檢視模型A之殘差值序列")
abline(h=2,lty=2)
abline(h=-2,lty=2)

# ex8
resh = residuals(lm(x~w))
coef(lm(resg~resh))[2]
coef(modelC)[2]

# 3-2
zr = 100*diff(z) # 已取過對數
ecmA = resa[1:(length(resa)-1)]
summary(lm(zr~ecmA))
ecmB = resb[1:(length(resb)-1)]
summary(lm(zr~ecmB))
ecmC = resc[1:(length(resc)-1)]
summary(lm(zr~ecmC))
ecmD = resd[1:(length(resd)-1)]
summary(lm(zr~ecmD))
ecmE = rese[1:(length(rese)-1)]
summary(lm(zr~ecmE))
ecmF = resf[1:(length(resf)-1)]
summary(lm(zr~ecmF))
ecmG = resg[1:(length(resg)-1)]
summary(lm(zr~ecmG))

acf(zr)

# 3-3
# ex1
library(urca)
urx = ur.df(x,type="none",lags=0)
summary(urx)
ury = ur.df(y,type="none",lags=0)
summary(ury)
urw = ur.df(w,type="none",lags=0)
summary(urw)
urz = ur.df(z,type="none",lags=0)
summary(urz)
urresa = ur.df(resa,type="none",lags=0)
summary(urresa)
urresb = ur.df(resb,type="none",lags=0)
summary(urresb)
urresc = ur.df(resc,type="none",lags=0)
summary(urresc)
urresd = ur.df(resd,type="none",lags=0)
summary(urresd)
urrese = ur.df(rese,type="none",lags=0)
summary(urrese)
urresf = ur.df(resf,type="none",lags=0)
summary(urresf)
urresg = ur.df(resg,type="none",lags=0)
summary(urresg)

# ex2
# 1982:1-2015:5
infun = read.table("c:\\meiyih\\Finstats\\ex\\ch7\\infun.txt")
inf = infun[,1]
un = infun[,2]
summary(ur.df(inf,type="none",lags=0))
summary(ur.df(un,type="none",lags=0))
T = length(inf)
inf1 = inf[2:T]
un1 = un[1:(T-1)]
model1 = lm(inf1~un1)
summary(model1)
res = residuals(model1)
summary(ur.df(res,type="none",lags=0))

#本章習題

#ch7
#ex2
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
n = length(y)

# 同時期NAS與SP500
nas = read.table("c:\\meiyih\\Finstats\\ch7\\nas.txt")
sp500 = read.table("c:\\meiyih\\Finstats\\ch7\\sp500.txt")
sp500r = 100*diff(log(sp500[,1]))
nasr = 100*diff(log(nas[,1]))
z = sp500r-int
z1 = nasr-int
model = lm(y~x)
summary(model)
res = residuals(model)
s2 = sum((res*res))/(n-2)
s2
sqrt(s2)
s2/var(tsmc.r)
s2/var(y)

model1 = lm(y~x+z1)
summary(model1)
res1 = residuals(model1)
s21 = sum((res1*res1))/(n-3)
s21
sqrt(s21)
s21/var(tsmc.r)

model2 = lm(y~x+z)
summary(model2)
res2 = residuals(model1)
s22 = sum((res1*res1))/(n-3)
s22
sqrt(s22)
s22/var(y)
s22/var(tsmc.r)

# ex3
ly = log(收盤價)
div = 本益比/收盤價
div = 1/div
ldiv = log(div)
res = residuals(lm(ly~ldiv))
library(urca)
ur1 = ur.df(res,type="none",lags=0)
summary(ur1)
ur2 = ur.df(ly,type="none",lags=0)
summary(ur2)
ur3 = ur.df(ldiv,type="none",lags=0)
summary(ur3)

# ex4
all = cbind(收盤價,成交量,週轉率,股價淨值比)
lall = log(all)
?pairs
windows()
pairs(all,upper.panel=NULL)
cor(lall)

# ex5
y = lall[,1]
x1 = lall[,2]
x2 = lall[,3]
x3 = lall[,4]
library(urca)
x3 = x1 # x1,x2
ur1 = ur.df(x3,type="none",lags=0)
summary(ur1)
res1 = residuals(lm(y~x3))
summary(lm(y~x3))
ur1 = ur.df(res1,type="none",lags=0)
summary(ur1)

dy = diff(y)
dx3 = diff(x3)
res1 = res1[2:length(res1)]
m = length(dy)
dy1 = dy[2:m]
ecm = res1[1:(m-1)]
summary(lm(dy1~ecm))
dy2 = dy[3:m]
ecm1 = res1[2:(m-1)]
dy21 = dy[2:(m-1)]
dx21 = dx2[2:(m-1)]
summary(lm(dy2~ecm1+dy21+dx21))
summary(lm(dy2~ecm1))

# ex6
# 期貨分析 (台指2013/12月)
future = read.table("c:\\meiyih\\Finstats\\ex\\ch7\\future.txt")
bp = future[,1]
map = future[,2]
mip = future[,3]
cp = future[,4]
cp1 = future[,5]
basic = future[,6]
spot = future[,7]

windows()
par(mfrow=c(2,1))
ts.plot(bp, type="l", col="1", main="2013/12台指期貨走勢")
lines(1:length(bp),map, lty=2, col="2")
lines(1:length(bp),mip, lty=3, col="3")
lines(1:length(bp),cp, lty=4, col="4")
lines(1:length(bp),cp1, lty=5, col="5")
lines(1:length(spot),spot, lty=6, col="6")
legend("bottomright", c("開盤","最高","最小","收盤","結算","現貨"),
       lty=1:6, col=c("1","2","3","4","5","6"), bty="n")
ts.plot(basic,ylab="", main="基差")

# minimum variance hedge ratio
spot.r = diff(log(spot))
cp1.r = diff(log(cp1))
summary(lm(spot.r~cp1.r))
coefficients(lm(spot.r~cp1.r))[2]

# ex7
y = log(spot)
x = log(cp1)
model = lm(y~x)
summary(model)
res = residuals(model)
windows()
length(y)
plot(res,type="l")
ur1 = ur.df(res,type="none",lags=0)
summary(ur1)

dy = diff(y)
m = length(dy)
res = res[2:length(res)]
dy1 = dy[2:m]
ecm = res[1:(m-1)]
summary(lm(dy1~ecm))

dy2 = dy[3:m]
ecm1 = res[2:(m-1)]
dx = diff(x)
dx2 = dx[2:(m-1)]
dy21 = dy[2:(m-1)]
summary(lm(dy2~ecm1+dy21+dx2))

# ex8
head(basic)
y = spot
x = cp1
head((y-x))
ur1 = ur.df(basic,type="none",lags=0)
summary(ur1)
basic = basic[2:length(basic)]
ecmbasic = basic[1:(m-1)]
summary(lm(dy1~ecmbasic))

# ex9
# forward exchange rate and spot exchange rate
# 用遠期匯率估計即期匯率
# 4/1/2014-7/10/2014
# 買即期,遠30,遠60,遠90,遠180
# 賣即期,遠30,遠60,遠90,遠180
allex = read.table("c:\\meiyih\\Finstats\\ex\\ch7\\匯率.txt")
bs = allex[,1]
bf30 = allex[,2]
bf60 = allex[,3]
bf90 = allex[,4]
bf180 = allex[,5]
ss = allex[,6]
sf30 = allex[,7]
sf60 = allex[,8]
sf90 = allex[,9]
sf180 = allex[,10]

# s = b0+b1*f(-1)
ms = (bs+ss)/2
mf180 = (bf180+sf180)/2
n = length(ms)
ms_1 = ms[2:n]
mf180_1 = mf180[1:(n-1)]
windows()
par(mfrow=c(2,1))
plot(1:(n-1),ms_1,type="l",xlab="time",ylab="Spot and Forward rate",
     main="Time Series of forware and spot",lwd=2)
lines(1:(n-1),mf180_1, lty=2, col="blue",lwd=2)
legend("topright", c("Spot rate","Forward rate"), lty=1:2, col=c("1","4"),lwd=2)

plot(mf180_1,ms_1,main="forware and spot",xlab="遞延落後一期遠期匯率",
    ylab="即期匯率",lwd=2)
abline(lm(ms_1~mf180_1-1))
summary(lm(ms_1~mf180_1-1))
res = residuals(lm(ms_1~mf180_1-1))
windows()
par(mfrow=c(2,1))
plot(res,type="l",lwd=2)
abline(h=0,col="red")
ecm = ms_1-mf180_1
plot(ecm,type="l",lwd=2)
abline(h=mean(ecm),col="red")

# ex 13
N = 5000
T = 152
tstat = numeric(N)
t = 1:T
c = 0.05
for(j in 1:N)
{
   y = numeric(T)
   for(i in 2:T)
   {
     y[i] = c + y[(i-1)] + rnorm(1)
   }
 ya = y[3:T]-y[2:(T-1)]
 yb = y[2:(T-1)]
 model = lm(ya~yb)
 b = as.numeric(coef(model))[2]
 res = resid(model)
 s = sqrt(sum(res*res)/((T-2)-2))
 se = s/sqrt(sum((yb-mean(yb))^2))
 tstat[j] = b/se
}
windows()
plot(density(tstat))
quantile(tstat,c(0.01,0.05,0.1))
library(urca)
?ur.df
summary(ur.df(y[2:T],type="drift",lags=0))

# ex 14
T = 653
t = 1:T
t1 = 0.001
N = 10000
set.seed(123)
for(j in 1:N)
{
   y = numeric(T)
   for(i in 2:T)
   {
     y[i] = c + t1*t[i] + y[(i-1)] + rnorm(1)
   }
 ya = y[503:T]-y[502:(T-1)]
 yb = y[502:(T-1)]
 model = lm(ya~yb+t[503:T])
 b = as.numeric(coef(model))[2]
 res = resid(model)
 s = sqrt(sum(res*res)/((T-2)-3))
 se = sqrt(vcov(model)[2,2])
 tstat[j] = b/se
}
windows()
plot(density(tstat))
quantile(tstat,c(0.01,0.05,0.1))
summary(ur.df(y[503:T],type="trend",lags=0))

# ex 15
# TSMC monthly prices and dividends      
tsmcm = read.table("c:\\meiyih\\Finstats\\ch7\\tsmcm.txt", header=T)
attach(tsmcm)
names(tsmcm)
#1/2000-6/2014
y = 收盤價
x = 本益比
div = x/y
div = 1/div # 轉成股利
ly = log(y)
ldiv = log(div)
cor(ly,ldiv)
model = lm(ly~ldiv)
summary(model)
coef(model)
res = residuals(model)
library(urca)
summary(ur.df(ly,type="trend",lags=6,selectlags="AIC"))
summary(ur.df(ldiv,type="trend",lags=6,selectlags="AIC"))
summary(ur.df(res,type="trend",lags=6,selectlags="AIC"))
summary(ur.df(ly,type="drift",lags=6,selectlags="AIC"))
summary(ur.df(ldiv,type="drift",lags=6,selectlags="AIC"))
summary(ur.df(res,type="drift",lags=6,selectlags="AIC"))



