# 1.1
# ex5
#45、48、47.5以及46
p = c(45,48,47.5,46)
n = length(p)
ma = numeric(n-1)
for(i in 2:n)
{
 ma[i-1] = (p[i-1]+p[i])/2
}
ma

# ex6
#1/4/2005-4/28/2015
# ex1
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
T = length(p)
n = 30
map = numeric(T-n+1)
length(map)
for(i in 1:length(map))
{
 h = i
 k = n+i-1
 map[i] = mean(p[h:k])
}
windows()
par(mfrow=c(1,2))
plot(p,type="l",xlab="Time",ylab="日收盤價",main="大立光日收盤價與30日均線",lwd=2)
zeros = rep(0,n-1) # rep表示重複,即0重複n-1次
map1 = c(zeros,map)
lines(1:T,map1,lty=2,col="red",lwd=2)
legend("topleft","30日均線",col=c("red"),lty=2,bty="n",lwd=2)
plot(p,type="l",xlab="Time",ylab="日收盤價",xlim=c((T-99),T),lwd=2,
    main="大立光日收盤價與30均限線 (最近100個交易日)")
lines(1:T,map1,lty=2,col="red",lwd=2)
legend("bottomleft","30日均線",col=c("red"),lty=2,bty="n",lwd=2)

# ex7
T = length(p)
rt = 100*(p[2:T]-p[1:(T-1)])/p[1:(T-1)]
index = rt > 0.5
index 
pbar = mean(as.numeric(index))
pbar

# ex8
N = 10000
n = 1000
pbar = numeric(N)
for(i in 1:N)
{
 rt1 = sample(rt,n,replace=T)
 pbar[i] = mean(as.numeric(rt1 > 0.5))
}
windows()
hist(rt1,breaks=100,prob=T,xlab="",main=expression(paste("估計的",bar(p),"分配")),lwd=2)
lines(density(rt1),lty=2,col="red",lwd=2)
points(mean(pbar),0,lwd=3,pch=18)

# 1.2
# ex4
quantile(rt,c(0.01,0.99))

# 2
# 2-1
# ex1-2
# 16、17、16.5、16.8以及16.7
P = c(16,17,16.5,16.8,16.7)
T = length(P)
# 對數報酬率
lr = 100*(log(P[2:T])-log(P[1:(T-1)]))
lr
lr1 = 100*(diff(log(P)))
lr1
s2 = var(lr1)
s2
# 簡單報酬率
r = 100*((P[2:T]-P[1:(T-1)])/P[1:(T-1)])
r
s2a = var(r)
s2a
# 三日移動樣本變異數
n = 3
T1 = length(lr1)
mas2 = numeric(T1-n+1)
for(i in 1:(T1-n+1))
{
 mas2[i] = sum(lr1[i+2]+lr1[i+1]+lr1[i])/(n-1)
}
mas2

# ex 4,5
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
lrt = 100*(diff(log(p)))
T = length(p)
rt = 100*((p[2:T]-p[1:(T-1)])/p[1:(T-1)])
s2_lrt = var(lrt)
s2_lrt
s2 = var(rt)
s2

T = length(rt)
n = 30
mas2_lrt = numeric(T-n+1)
for(i in 1:(T-n+1))
{
 h = i
 k = n+i-1
 mas2_lrt[i] = var(lrt[h:k])
}
windows()
plot(mas2_lrt,xlab="Time",ylab="移動變異數",main="大立光對數日報酬率之移動變異數 (n = 30)",lwd=2)
abline(h=var(lrt),lty=2,col="red")

# 2-2
# ex1
# 1/4/2000-7/10/2014
# 台積電 (TSMC) 日收盤價 (除權息調整後)
tsmcpper = read.table("c:\\meiyih\\finstats\\ch1\\tsmcpper.txt") # 讀取資料
tsmcp = tsmcpper[,1] # 令第一行為股價
rt = 100*diff(log(tsmcp))
T = length(rt)
n = 250
rt1 = rt[(T-n+1):T]
length(rt1)
vol = sd(rt1)*sqrt(250)
vol
n = 500
rt2 = rt[(T-n+1):T]
length(rt2)
vol2 = sd(rt2)*sqrt(250)
vol2
n = 1250
rt3 = rt[(T-n+1):T]
length(rt3)
vol3 = sd(rt3)*sqrt(250)
vol3

# ex2
n = 250
volall = numeric(T-n+1)
for(i in 1:(T-n+1))
{
 h = i
 k = n+i-1
 volall[i] = sd(rt[h:k])*sqrt(250)
}
windows()
hist(volall,breaks=100,xlab="波動率",main="TSMC波動率之次數分配 (250日)",lwd=2)
summary(volall)
hisvol = hist(volall,plot=FALSE)
hisvol

# ex4
# 1/4/2005-4/28/2015
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
lrt = 100*(diff(log(p)))
T = length(lrt)
n = 250
volall = numeric(T-n+1)
for(i in 1:(T-n+1))
{
 h = i
 k = n+i-1
 volall[i] = sd(lrt[h:k])*sqrt(250)
}
windows()
hist(volall,breaks=100,xlab="波動率",main="LARGAN波動率之次數分配 (250日)",lwd=2)
summary(volall)
hisvol = hist(volall,plot=FALSE)
hisvol

# 2-3
# ex2
# 0.03%、0.025%、0.015%與-0.02%
r = c(0.03,0.025,0.015,-0.02)
n = 4
skewness(r)
rbar = mean(r)
skew1 = sum(((r-rbar)^3))/n
sigma2 = sum((r-rbar)^2)/n
skew2 = sigma2^(3/2)
skew = skew1/skew2
skew
library(moments) # 注意應使用moments程式套件
skewness(r)
kurtosis(r)
kurt1 = sum(((r-rbar)^4))/n
kurt2 = sigma2^2
kurt = kurt1/kurt2
kurt

# ex3
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
lrt = 100*(diff(log(p)))
skewness(lrt)
kurtosis(lrt)

# ex4
set.seed(12345)
x = rnorm(1000)
skewness(x)
kurtosis(x)

# ex5
# 1/4/2005-4/28/2015
zrt = (lrt-mean(lrt))/sd(lrt) # 標準化
windows()
plot(density(zrt),xlab="標準化後之日對數報酬率",main="大立光日對數報酬率與常態分配之比較",lwd=2)
z = sort(zrt)
lines(z,dnorm(z),lty=2,col="blue",lwd=2)
legend("topleft",c("大立光日對數報酬率之估計PDF","標準常態分配之PDF"),lty=1:2,lwd=2,
       col=c("black","blue"),bty="n")

# ex9
windows()
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
plot(density(p),xlab="大立光日收盤價",main="大立光日收盤價序列之估計的PDF",lwd=2)
skewness(p)
kurtosis(p)

# ex11
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
lrt = 100*diff(log(p))
n = 250
N = 10000
kur = numeric(N)
for(i in 1:N)
{
 r1 = sample(lrt,n,replace=T)
 kur[i] = kurtosis(r1)
}
windows()
plot(density(kur),xlab="峰態係數",main="大立光日報酬率之估計的峰態係數分配",lwd=2)

# 2-4
# 2-4-1-1
# ex1
TWIm = read.table("c:\\meiyih\\Finstats\\ch2\\TWIm.txt",header=T)#此檔內有名稱
names(TWIm) # TWIm內有各序列名稱
attach(TWIm) # 接近此檔案
TSMCm = read.table("c:\\meiyih\\Finstats\\ch2\\TSMCm.txt",header=T)
names(TSMCm)
attach(TSMCm)
積股利 = 積本益比/積收盤價
積股利 = 1/積股利
price = 積收盤價
T = length(price)
div = 積股利
lr = 100*(log(price[2:T]+div[2:T])-log(price[1:(T-1)]))
股利 = 本益比/收盤價
股利 = 1/股利
price = 收盤價
div = 股利 
T = length(price)
lr.TWI = 100*(log(price[2:T]+div[2:T])-log(price[1:(T-1)]))
T = length(lr.TWI)
n = 5
y = lr[(T-4):T]
x = lr.TWI[(T-4):T]
y = round(y,2)
x = round(x,2)
y
x
windows()
plot(x,y,type="p",lwd=2)
points(x,y,lwd=2,pch=18)
abline(h=mean(y),lty=2)
text(4.45,mean(y),labels=expression(bar(y)),pos=3)
abline(v=mean(x),lty=2)
text(mean(x),5.8,labels=expression(bar(x)),pos=4)
ybar = mean(y)
xbar = mean(x)
sxy = sum((x-xbar)*(y-ybar))/(n-1)
sxy
cov(x,y)
sx = sd(x)
sy = sd(y)
rxy = sxy/(sx*sy)
rxy
cor(x,y)

# ex3,4
price = 積收盤價
per =  積本益比
cov(price,per)
cor(price,per)
積股利 = 積本益比/積收盤價
積股利 = 1/積股利
price = 積收盤價
T = length(price)
div = 積股利
lr = 100*(log(price[2:T]+div[2:T])-log(price[1:(T-1)]))
per1 = per[2:T]
cov(lr,per1)
cor(lr,per1)

# ex5
x = c(2,4,6)
y = c(4,8,12)
windows()
plot(x,y,type="p",xlim=c(0,8),ylim=c(0,14),lwd=2)
points(x,y,lwd=2,pch=18)
segments(1,2,8,16)
cov(x,y)
cor(x,y)

# 2-4-1-2
# ex1
windows()
plot(c(0,1),c(1,0),xlim=c(-1,2),ylim=c(-1,2),frame.plot=F,xlab="",ylab="",axes=F)
abline(v=0,h=0)
x = seq(-1,2.5,length=100)
lines(x,-x+1,lty=2)
points(0,1,lwd=2,pch=18)
text(0,1,labels="A (0,1)",pos=4)
points(1,0,lwd=2,pch=18)
text(1,0,labels="B (1,0)",pos=1)
text(2,0,labels="x",pos=1)
text(0,2,labels="y",pos=2)

w = 0.5
A = c(0,1)
B = c(1,0)
C = w*A+(1-w)*B
points(C[1],C[2],lwd=2,pch=18)
text(C[1],C[2],labels="C",pos=4)
w = 2/3
D = w*A+(1-w)*B
points(D[1],D[2],lwd=2,pch=18)
text(D[1],D[2],labels="D",pos=4)
w=-1/3
E = w*A+(1-w)*B
points(E[1],E[2],lwd=2,pch=18)
text(E[1],E[2],labels="E",pos=4)

# ex2
library(plotrix)
plot(c(0,10),c(0,10),type="n",xlab="風險",ylab="報酬",main="投資人的無異曲線")
draw.circle(0,10,8,lwd=2)
draw.circle(0,10,6,lwd=2)
draw.circle(0,10,4,lwd=2)
draw.circle(0,10,2,lwd=2)

# ex3
y = lr
x = lr.TWI
mx = mean(x)
my = mean(y)
sdx = sd(x)
sdy = sd(y)
w = seq(-0.5,1.5,length=100)
mp = w*mx+(1-w)*my
rho = cor(y,x)
sdxy = rho*sdx*sdy
varp = w^2*sdx^2+(1-w)^2*sdy^2+2*w*(1-w)*sdxy
sdp = sqrt(varp)
windows()
plot(sdp,mp,type="l",xlim=c(6,10),ylim=c(0,10),xlab="風險",ylab="報酬",lwd=3,
     main="為何可以有資產組合?",frame.plot=F,axes=T)
draw.circle(4,18,5,lty=2,lwd=2)
#draw.circle(4,18,5.4,lty=2)
draw.circle(4,18,6,lty=2,lwd=2)
draw.circle(4,18,6.4,lty=2,lwd=2)
draw.circle(4,18,4,lty=2,lwd=2)
draw.circle(4,18,4.4,lty=2,lwd=2)
#draw.circle(4,18,5.8,lty=2)
draw.circle(4,18,5.6,lty=2,lwd=2)
points(7.15,5.08,lwd=2,pch=18)
text(7.15,5.08,labels="A",pos=3)
abline(v=5,h=0)
points(sdy,my,lwd=2,pch=18)
text(sdy,my,labels="TSMC",pos=1)
points(sdx,mx,lwd=2,pch=18)
text(sdx,mx,labels="TWI",pos=1)

# ex4
windows()
plot(sdp,mp,type="l",xlim=c(0,10),ylim=c(0,10),xlab="風險",ylab="報酬",
     main="為何可以有資產組合?",frame.plot=F,axes=F,lwd=3)
rf = 2/12 # 無風險利率
points(0,rf,lwd=2,pch=18)
x = seq(0,10,length=100)
y = 0.71*x+rf
lines(x,y,lty=2)
points(7.7,5.6,lwd=2,pch=18)
draw.circle(-4,10,8,lwd=2)
draw.circle(-4,10,11.99,lwd=2)
draw.circle(-4,10,9.55,lwd=2)
points(1.2,1,lwd=2,pch=18)
points(7.15,5.08,lwd=2,pch=18)
text(7.15,5.08,labels="A",pos=4)
text(7.7,5.6,labels="B",pos=1)
text(1.2,1,labels="C",pos=1)
abline(v=0,h=0)
points(sdy,my,lwd=2,pch=18)
text(sdy,my,labels="TSMC",pos=1)
points(sdx,mx,lwd=2,pch=18)
text(sdx,mx,labels="TWI",pos=1)
text(0,rf,labels=expression(r[f]),pos=2,cex=1.5)

# ex5
windows()
plot(sdp,mp,type="l",xlim=c(0,10),ylim=c(0,10),xlab="風險",ylab="報酬",
     main="為何可以有資產組合?",frame.plot=T,axes=T,lwd=3)
text(7.7,5.6,labels="B",pos=1)
points(7.7,5.6,lwd=2,pch=18)
abline(h=mp[45],lty=2)
abline(h=mp[96],lty=2)
abline(v=sdp[45],lty=2,col="red")
mp[45]
mp[96]
sdp[45]
w = seq(-0.5,1.5,length=100)
w1 = w[45]
mp1 = w1*mx+(1-w1)*my
mp1
varp1 = w1^2*sdx^2+(1-w1)^2*sdy^2+2*w1*(1-w1)*sdxy
sdp1 = sqrt(varp1)
sdp1  
min(sdp)
abline(v=sdp[70],lty=2)
sdp[70]
mp[70]
w1 = w[70]
mp1 = w1*mx+(1-w1)*my
mp1
varp1 = w1^2*sdx^2+(1-w1)^2*sdy^2+2*w1*(1-w1)*sdxy
sdp1 = sqrt(varp1)
sdp1  

# 本章習題
# ch2
# ex2
GDP = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\GDP.txt")
GDP = GDP[,1]
m = length(GDP)
gdpr1 = 100*((GDP[5:m]-GDP[1:(m-4)])/GDP[1:(m-4)])
x = gdpr1[154:length(gdpr1)]  # 2000:1-2014:2

T = 10000
xbar = numeric(T)
xsd = numeric(T)
windows()
par(mfrow=c(2,2))
n = 30
for(i in 1:T)
{
xbar[i] = mean(sample(x,n,replace=T))
xsd[i] = sd(sample(x,n,replace=T))
}
hist(xbar,breaks=100,prob=T,xlab="",main="名目經濟成長率之樣本平均抽樣分配, n = 30")
lines(density(xbar), col="red", lty=2)
hist(xsd,breaks=100,prob=T,xlab="",main="名目經濟成長率之樣本變異抽樣分配, n = 30")
lines(density(xsd), col="red", lty=2)

n = 50
for(i in 1:T)
{
xbar[i] = mean(sample(x,n,replace=T))
xsd[i] = sd(sample(x,n,replace=T))
}
hist(xbar,breaks=100,prob=T,xlab="",main="名目經濟成長率之樣本平均抽樣分配, n = 50")
lines(density(xbar), col="red", lty=2)
hist(xsd,breaks=100,prob=T,xlab="",main="名目經濟成長率之樣本變異抽樣分配, n = 50")
lines(density(xsd), col="red", lty=2)

# 1981:1-2014:7
cpi = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\cpi.txt")
cpi = cpi[,1]
lcpi = log(cpi)
n = length(cpi)
inf1 = 100*((cpi[13:n]-cpi[1:(n-12)])/cpi[1:(n-12)])
x = inf1
T = 10000
xbar = numeric(T)
xsd = numeric(T)
windows()
par(mfrow=c(2,2))
n = 30
for(i in 1:T)
{
xbar[i] = mean(sample(x,n,replace=T))
xsd[i] = sd(sample(x,n,replace=T))
}
hist(xbar,breaks=100,prob=T,xlab="",main="通貨膨脹率之樣本平均抽樣分配, n = 30")
lines(density(xbar), col="red", lty=2)
hist(xsd,breaks=100,prob=T,xlab="",main="通貨膨脹率之樣本變異抽樣分配, n = 30")
lines(density(xsd), col="red", lty=2)

n = 50
for(i in 1:T)
{
xbar[i] = mean(sample(x,n,replace=T))
xsd[i] = sd(sample(x,n,replace=T))
}
hist(xbar,breaks=100,prob=T,xlab="",main="通貨膨脹率之樣本平均抽樣分配, n = 50")
lines(density(xbar), col="red", lty=2)
hist(xsd,breaks=100,prob=T,xlab="",main="通貨膨脹率之樣本變異抽樣分配, n = 50")
lines(density(xsd), col="red", lty=2)

# ex3
TWIm = read.table("c:\\meiyih\\Finstats\\ch2\\TWIm.txt",header=T)
names(TWIm)
attach(TWIm) # 接近此檔案
price = 收盤價
# 轉成股利
股利 = 本益比/收盤價
股利 = 1/股利
div = 股利
T = length(price)
r = 100*(price[2:T]+div[2:T]-price[1:(T-1)])/price[1:(T-1)]
lr = 100*(log(price[2:T]+div[2:T])-log(price[1:(T-1)]))
T = length(lr)
library(fBasics)
basicStats(lr) # 峰態為超額峰態

# ex4,5
# 1/2/2002-8/29/2014 匯率
exch = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\exchangerate.txt", header=T)
names(exch)
attach(exch) # 接近exch
x = 新台幣 # 1美元等於?新台幣
y = 人民幣 # 1美元等於?人民幣
z = x/y # 1美元等於?新台幣
xr = 100*diff(log(x))
windows()
par(mfrow=c(3,1))
plot(xr,type="l",xlab="",ylab="daily log returns",main="新台幣對美元匯率日對數變動率
  之時間走勢")
xr = (xr-mean(xr))/sd(xr)
hist(xr,breaks=50,prob=T,xlab="標準化後對數報酬率",main="新台幣對美元匯率日對數變動率之直方圖與標
  準長態分配")
sxr = sort(xr)
lines(sxr,dnorm(sxr),col="red")
n = length(sxr)
plot(sxr, (1:n/n), main = "CDF", col = "tomato", ylab = "CDF",xlab="")                
lines(sxr, pnorm(sxr), lwd=2, col="dark gray")
legend("topleft",c("標準常態"),col="dark gray", lty=1, bty="n",lwd=2)

zr = 100*diff(log(z))
windows()
par(mfrow=c(3,1))
plot(zr,type="l",xlab="",ylab="daily log returns",main="新台幣對人民幣匯率日對數變動率
  之時間走勢")
zr = (zr-mean(zr))/sd(zr)
hist(zr,breaks=50,prob=T,xlab="標準化後對數報酬率",main="新台幣對人民幣匯率日對數變動率之直方圖與標
  準長態分配")
szr = sort(zr)
lines(szr,dnorm(szr),col="red")
n = length(szr)
plot(szr, (1:n/n), main = "CDF", col = "tomato", ylab = "CDF",xlab="")                
lines(szr, pnorm(szr), lwd=2, col="dark gray")
legend("topleft",c("標準常態"),col="dark gray", lty=1, bty="n",lwd=2)

# ex6
# 8/5/2002-8/25/2014 weekly data
twigold = read.table("c:\\meiyih\\Finstats\\ex\\ch2\\data\\twigold.txt", header=T)
names(twigold)
attach(twigold)
y = TWI
x = gold
y = 100*diff(log(y))
x = 100*diff(log(x))
mx = mean(x)
my = mean(y)
sdx = sd(x)
sdy = sd(y)

# efficient portfolio
# 沒有放空
w = seq(0,1,length=1000)
mp = w*mx+(1-w)*my
varp = w^2*sdx^2+(1-w)^2*sdy^2+2*w*(1-w)*cov(x,y)
sdp = sqrt(varp)
windows()
par(mfrow=c(2,1))
plot(sdp,mp,type="l",lwd=2, xlim=c(2,8), ylim=c(0,0.8),
     xlab=expression(sigma[p]), ylab=expression(mu[p]),main="效率前緣線 (沒有放空)")
points(sdx,mx,col="red", lwd=3)
text(sdx,mx, labels="Gold", pos=4, col="red")
points(sdy,my,col="blue",lwd=3)
text(sdy,my, labels="TWI", pos=4, col="blue")

# 有放空 
w = seq(-1,2,length=1000)
mp = w*mx+(1-w)*my
varp = w^2*sdx^2+(1-w)^2*sdy^2+2*w*(1-w)*cov(x,y)
sdp = sqrt(varp)
plot(sdp,mp,type="l",lwd=2, xlim=c(2,8),ylim=c(-0.2,1),
     xlab=expression(sigma[p]), ylab=expression(mu[p]),main="效率前緣線 (有放空)")
points(sdx,mx,col="red", lwd=3)
text(sdx,mx, labels="Gold", pos=3, col="red")
points(sdy,my,col="blue",lwd=3)
text(sdy,my, labels="TWI", pos=1, col="blue")

# ex7
T = 1000
w = seq(0,1,length=T)
meanp = numeric(T)
sigmap = numeric(T)
for(i in 1:T)
{
 w1 = w[i]
 meanp[i] = mean(w1*x+(1-w1)*y)
 sigmap[i] = sd(w1*x+(1-w1)*y)
}
windows()
plot(sigmap,meanp,type="l",lwd=2)

# ex8
# 8/30/2004-8/28/2014
dj = read.table("c:\\meiyih\\Finstats\\ex\\ch2\\data\\dowjones.txt")
dj = dj[,1]
dj
library(fBasics)
basicStats(dj)
dj = dj[!is.na(dj)] # remove NAs
windows()
plot(dj,type="l")
djr = 100*diff(log(dj))
basicStats(djr)
basicStats(rnorm(length(djr),mean(djr),sd(djr)))
windows()
hist(djr,breaks=100,prob=T,lwd=2)
sdjr = sort(djr)
lines(sdjr,dnorm(sdjr,mean(djr),sd(djr)), lty=2, col="red",lwd=2)

# ex9
# 5/20/1987-8/25/2014
oil = read.table("c:\\meiyih\\Finstats\\ex\\ch2\\data\\oild.txt")
oil = oil[,1]
oilr = 100*diff(log(oil))
windows()
hist(oilr,breaks=100,prob=T,lwd=2)
lines(sort(oilr),dnorm(sort(oilr),mean(oilr),sd(oilr)), lty=2, col="red",lwd=2)
basicStats(oilr)

quantile(oilr,c(0.0001,0.001,0.01))
quantile(djr,c(0.0001,0.001,0.01))

quantile(oilr,c(0.9999,0.999,0.99))
quantile(djr,c(0.9999,0.999,0.99))

# ex10
# 期貨分析 (台指2013/12月)
future = read.table("c:\\meiyih\\Finstats\\ex\\ch2\\data\\future.txt")
bp = future[,1]
map = future[,2]
mip = future[,3]
cp = future[,4]
cp1 = future[,5]
basic = future[,6]
spot = future[,7]
windows()
par(mfrow=c(2,1))
ts.plot(bp, type="l", col="1", main="2013/12台指期貨走勢",lwd=2)
lines(1:length(bp),map, lty=2, col="2")
lines(1:length(bp),mip, lty=3, col="3")
lines(1:length(bp),cp, lty=4, col="4")
lines(1:length(bp),cp1, lty=5, col="5")
lines(1:length(spot),spot, lty=6, col="6")
legend("bottomright", c("開盤","最高","最小","收盤","結算","現貨"),
       lty=1:6, col=c("1","2","3","4","5","6"), bty="n")
ts.plot(basic,ylab="", main="基差",lwd=2)

cor(cp,spot)
cor(cp1,spot)

cov(cp,spot)
cov(cp1,spot)

# ex11
twid = read.table("c:\\meiyih\\Finstats\\ex\\ch2\\data\\twid.txt")
twid = twid[,1]
# 9/1/2014 臺指選擇權波動率指數 (每分鐘) 8點46-13點45分
volatility = read.table("c:\\meiyih\\Finstats\\ex\\ch2\\data\\volatility.txt")
vol = volatility[,1]
range(vol)
max(vol)

length(vol)
windows()
hist(vol,breaks=20,xlab="",main="9/1/2014 臺指選擇權波動率指數之次數分配
 (每分鐘:8點46-13點45分)", col="steelblue",lwd=2)

# ex12
y = 100*diff(log(twid))
library(fTrading)
s250 = rollVar(y,250,unbiased = TRUE)
length(y)
length(s250)
s250 = sqrt(250)*sqrt(s250)
s15 = rollVar(y,15,,unbiased = TRUE)
s15 = sqrt(250)*sqrt(s15)
s30 = rollVar(y,30,,unbiased = TRUE)
s30 = sqrt(250)*sqrt(s30)
s20 = rollVar(y,20,,unbiased = TRUE)
s20 = sqrt(250)*sqrt(s20)

windows()
par(mfrow=c(2,2))
plot(s250,type="l",main="Volatility rate,n = 250",lwd=2)
tail(s250)
head(s250)
plot(s15,type="l",main="Volatility rate,n = 15",lwd=2)
tail(s15)
head(s15)

plot(s30,type="l",main="Volatility rate,n = 30",lwd=2)
tail(s30)
head(s30)

plot(s20,type="l",main="Volatility rate,n = 20",lwd=2)
tail(s20)
head(s20)

# ex13
four = read.table("c:\\meiyih\\Finstats\\ex\\ch2\\data\\four.txt", header=T)
names(four)
attach(four)
SP = 100*diff(log(sp500))
日經 = 100*diff(log(japan))
上綜 = 100*diff(log(china))
台灣 = 100*diff(log(taiwan))
x1 = 100*diff(log(sp500))
x2 = 100*diff(log(japan))
x3 = 100*diff(log(china))
x4 = 100*diff(log(taiwan))
all1 = cbind(SP,日經,上綜,台灣) # 行合併
all = cbind(x1,x2,x3,x4)
windows()
pairs(all1, col="tomato",lwd=2) # 成對之間的散佈圖
cor(all1)

# ex14
library(tseries)
port = portfolio.optim(all,pm=0.2)
port
weight = port$pw
oval = port$px
length(x1)
mean(x1)
mean(oval)
sd(oval)

T = 1000
mp = seq(0.1,0.2,length=T)
weights = matrix(0,T,4)
sdp = numeric(T)
for(i in 1:T)
{
 mp1 = mp[i]
 port = portfolio.optim(all,pm=mp1)
 weights[i,] = port$pw
 sdp[i] = port$ps
}
windows()
par(mfrow=c(2,1))
plot(sdp,mp,type="l",col="red",lwd=4)
plot(sdp,mp,type="l",ylim=c(-0.15,0.22),xlim=c(4.2,8),col="red",lwd=4)
points(sd(x1),mean(x1),pch=20)
text(sd(x1),mean(x1),labels="SP",pos=1)
points(sd(x2),mean(x2),pch=20)
text(sd(x2),mean(x2),labels="日經",pos=3)
points(sd(x3),mean(x3),pch=20)
text(sd(x3),mean(x3),labels="上綜",pos=1)
points(sd(x4),mean(x4),pch=20)
text(sd(x4),mean(x4),labels="台灣",pos=1)

all2 = all1[,1:3]
T = 1000
mp = seq(0.1,0.2,length=T)
weights = matrix(0,T,3)
sdp = numeric(T)
for(i in 1:T)
{
 mp1 = mp[i]
 port = portfolio.optim(all2,pm=mp1)
 weights[i,] = port$pw
 sdp[i] = port$ps
}
windows()
plot(sdp,mp,type="l",lwd=4)

# ex15
ftsem = read.table("c:\\meiyih\\Finstats\\ex\\ch2\\data\\ftsem.txt")
#names(ftsem)
ftse = ftsem[,1]
ftser = 100*diff(log(ftse))
all3 = cbind(all2,ftser)
windows()
pairs(all3,lwd=2)
cor(all3)

T = 1000
mp = seq(0.1,0.2,length=T)
weights = matrix(0,T,4)
sdp = numeric(T)
for(i in 1:T)
{
 mp1 = mp[i]
 port = portfolio.optim(all3,pm=mp1)
 weights[i,] = port$pw
 sdp[i] = port$ps
}
windows()
par(mfrow=c(2,1))
plot(sdp,mp,type="l",lwd=4)
plot(sdp,mp,type="l",xlim=c(3,8),ylim=c(-0.17,0.3),lwd=4)
points(sd(x1),mean(x1),pch=20)
text(sd(x1),mean(x1),labels="SP",pos=1)
points(sd(x2),mean(x2),pch=20)
text(sd(x2),mean(x2),labels="日經",pos=3)
points(sd(x3),mean(x3),pch=20)
text(sd(x3),mean(x3),labels="上綜",pos=1)
points(sd(ftser),mean(ftser),pch=20)
text(sd(ftser),mean(ftser),labels="FTSE",pos=1)

# ex16
all4 = cbind(x1,x3,x4,ftser)
T = 1000
mp = seq(0.1,0.4,length=T)
weights = matrix(0,T,4)
sdp = numeric(T)
for(i in 1:T)
{
 mp1 = mp[i]
 port = portfolio.optim(all4,pm=mp1,shorts=T)
 weights[i,] = port$pw
 sdp[i] = port$ps
}
windows()
par(mfrow=c(2,1))
plot(sdp,mp,type="l",lwd=4)
plot(sdp,mp,type="l",xlim=c(3,8),ylim=c(-0.17,0.4),lwd=4)
points(sd(x1),mean(x1),pch=20)
text(sd(x1),mean(x1),labels="SP",pos=1)
points(sd(x4),mean(x4),pch=20)
text(sd(x4),mean(x4),labels="台灣",pos=1)
points(sd(x3),mean(x3),pch=20)
text(sd(x3),mean(x3),labels="上綜",pos=1)
points(sd(ftser),mean(ftser),pch=20)
text(sd(ftser),mean(ftser),labels="FTSE",pos=1)








