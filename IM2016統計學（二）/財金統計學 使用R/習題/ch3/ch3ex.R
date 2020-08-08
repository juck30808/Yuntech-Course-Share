# ex
# 1-1
# ex2
x = c(2945,3065,3145,3115,3200,3200)
y = c(92.1,92,93.3,94.6,94.7,93.6)
index1 = x > 3000
index2 = y > 93
index1
index2
i = as.numeric(index1)
j = as.numeric(index2)
i
j
pbar1 = mean(i)
pbar2 = mean(j)
pbar1
pbar2


#1/4/2005-4/28/2015
# ex3
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
pbar = mean(as.numeric(p>2000))
pbar

# ex5
x = c(1,2,3,4,5,6,6,6,1)
N = 10000
n = 1000
pbar = numeric(N)
for(i in 1:N)
{
 x1 = sample(x,n,replace=T)
 pbar[i] = mean(as.numeric(x1 == 6))
}
windows()
plot(density(pbar),xlab=expression(bar(p)),main="出現6點的機率分配",lwd=3)
abline(v=mean(pbar),lty=2)

# 2-1
# ex1
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
T = length(p)
p1 = p[(T-149):T]
summary(p1)
index1 = p1 <= 2500 | p1 >= 3000
index2 = p1 <= 2500
index3 = p1 >= 3000
PA = mean(as.numeric(index2))
PB = mean(as.numeric(index3))
PAUB = mean(as.numeric(index1))
PA
PB
PAUB
index4 = p1 > 2500 & p1 < 3000
PAB = mean(as.numeric(index4))
PAB

index5 = p1 <= 2500 | p1 >= 3000
PAUB1 = mean(as.numeric(index5))
PAUB1

# ex5
largan = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\largan.txt")
p = largan[,1]
lr = 100*diff(log(p))
summary(lr)
pbar = mean(as.numeric(lr < 0))
pbar
pbar1 = mean(as.numeric(lr < 1))
pbar1
pbar2 = mean(as.numeric(lr < 2))
pbar2

# 2-2
# ex1
Q = read.table("c:\\meiyih\\finstats\\ex\\ch3\\larganq.txt")
q = Q[,1] # 成交量
length(q)
length(lr) # lr為大立光日對數報酬率序列
q1 = q[2:length(q)]
summary(q1)
q1Q = quantile(q1,c(0.25,0.5,0.75))
q1Q
Q1 = q1Q[1]; Q2 = q1Q[2]; Q3 = q1Q[3]
# AQ1
index1 = lr >= 0 & q1 <= Q1
sum(as.numeric(index1))
index2 = lr < 0 & q1 <= Q1
sum(as.numeric(index2))
#AQ2
index3 = lr >= 0 & q1 > Q1 & q1 <= Q2
sum(as.numeric(index3))
index4 = lr < 0 & q1 > Q1 & q1 <= Q2
sum(as.numeric(index4))
#AQ3
index5 = lr >= 0 & q1 > Q2 & q1 <= Q3
sum(as.numeric(index5))
index6 = lr < 0 & q1 > Q2 & q1 <= Q3
sum(as.numeric(index6))
#AQ4
index7 = lr >= 0 & q1 > Q3
sum(as.numeric(index7))
index8 = lr < 0 &  q1 > Q3
sum(as.numeric(index8))


# 3-1-1
# ex1
T = length(lr) # lr為日報酬率序列
lr1 = lr[(T-199):T]
his = hist(lr1,plot=FALSE)
his

# 3-1-2
# ex3
p = largan[,1]
per = largan[,2]
T = length(p)
p1 = p[(T-9):T]
p1
# 股利
div = per/p; div = 1/div
# 保有5日的報酬率 (不重疊)
k = 5
m = round(T/k,0)
rt5_non = numeric(m)
for(i in 1:m)
{
 h = (i-1)*k + 1
 j = i*k 
 rt5_non[i] = log((p[j]+div[j])/p[h])*100
}
# 保有5日的報酬率 (重疊)
n = T-k+1
rt5 = numeric(n)
for(i in 1:n)
{
 h = i+k-1
 rt5[i] = log((p[h]+div[h])/p[i])*100
}
windows()
par(mfrow=c(2,1))
hist(rt5_non,breaks=100,prob=T,xlab="5日的報酬率",main="保有5日報酬率的機率分配之估計 (不重疊)",lwd=2)
lines(density(rt5_non),lty=2,col="red",lwd=2)
hist(rt5,breaks=100,prob=T,xlab="5日的報酬率",main="保有5日報酬率的機率分配之估計 (重疊)",lwd=2)
lines(density(rt5),lty=2,col="red",lwd=2)

# ex7
T = 200
t = 1:T
rt = numeric(T)
for(i in 1:T)
{
 rt[i] = 0.05*t[i] + rnorm(1)
}
windows()
plot(rt,type="l",xlab="Time",ylab="",lwd=2)
lines(t,0.05*t,lty=2,col="tomato",lwd=2)

# 3-2
# ex1
x = seq(0,1,length=100)
windows()
plot(x,dunif(x),type="l",main="均等分配之PDF",ylab="",xlim=c(-0.5,1.5),lwd=2)
polygon(c(0,x,1),c(0,dunif(x),0),col="tomato")
# ex2
windows()
plot(x,dunif(x),type="l",main="均等分配之PDF",ylab="",xlim=c(-0.5,1.5),lwd=2)
i = x <= 0.5
polygon(c(0,x[i],0.5),c(0,dunif(x[i]),0),col="tomato")
punif(0.5)

# 4-1
# ex1
T = 100
x = numeric(T)
x1 = numeric(T)
set.seed(578)
for(i in 2:T)
{
 x[i] = x[i-1] + runif(1,-1,1)
 x1[i] = x1[i-1] + rnorm(1)
}
windows()
par(mfrow=c(2,2))
plot(x,type="l",main="隨機漫步之模擬 (無常數項,誤差為均等分配)",lwd=2)
plot(x1,type="l",main="隨機漫步之模擬 (無常數項,誤差為標準常態分配)",lwd=2)

# ex2
c = 0
for(i in 2:T)
{
 x[i] = x[i-1] + exp(c+runif(1,-1,1))
 x1[i] = x1[i-1] + exp(c+rnorm(1))
}
plot(x,type="l",main="隨機漫步之模擬 (無常數項,誤差為指數型態均等分配)",lwd=2)
plot(x1,type="l",main="隨機漫步之模擬 (無常數項,誤差為指數型態標準常態分配)",lwd=2)
 
# ex6
p = largan[,1]
T = length(p)
simrt = numeric(T)
alpha = 0.2
set.seed(1234)
for(i in 2:T)
{
 simrt[i] = alpha*simrt[i-1] + 2*rnorm(1)
}
rt = diff(log(p))*100
windows()
par(mfrow=c(2,1))
plot(rt,type="l",xlab="Time",ylab="日對數報酬率",main="大立光日對數報酬率之時間走勢")
plot(simrt[2:T],type="l",xlab="Time",ylab="模擬值",main="日對數報酬率之模擬值")

# 4-2
# ex 2
p = largan[,1]
library(fBasics)
rt = 100*diff(log(p))
basicStats(rt)
rt10 = 100*diff(log(p),10)
basicStats(rt10)

VR10 = var(rt10)/(10*var(rt))
VR10

# 本章習題
# ch3
# ex 2
GDP = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\GDP.txt")
GDP = GDP[,1]
m = length(GDP)
gdpr1 = 100*((GDP[5:m]-GDP[1:(m-4)])/GDP[1:(m-4)])
x = gdpr1[154:length(gdpr1)]  # 2000:1-2014:2
windows()
par(mfrow=c(1,2))
hist(x,breaks=8,col="forestgreen",xlab="名目經濟成長率",main="名目經濟成長率的次數分配",lwd=2)
his = hist(x,breaks=8,plot=F)
prob = his$counts/length(x)
round(prob,2)

# ex3
# 1981:1-2014:7
cpi = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\cpi.txt")
cpi = cpi[,1]
lcpi = log(cpi)
n = length(cpi)
inf1 = 100*((cpi[13:n]-cpi[1:(n-12)])/cpi[1:(n-12)])
x = inf1
hist(x,breaks=8,col="tomato",xlab="通貨膨脹率",main="通貨膨脹率的次數分配",lwd=2)
his = hist(x,breaks=8,plot=F)
his
prob = his$counts/length(x)
round(prob,2)

# ex4
# 1/2/2002-8/29/2014 銀行間匯率
exch = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\exchangerate.txt", header=T)
names(exch)
attach(exch) # 接近exch
x = 新台幣 # 1美元等於?新台幣
y = 人民幣 # 1美元等於?人民幣
z = x/y # 1美元等於?新台幣
zr = 100*diff(log(z))
library(fBasics)
basicStats(zr) # 峰態為超額峰態

# ex5
# weekly data 1/1/2000-
twinasw = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\twinasdaqw.txt", header=T)
names(twinasw)
attach(twinasw)
price_w = NASDAQW
price_twiw = TWIW
T = length(TWIW)
twiwr = 100*((price_twiw[2:T]-price_twiw[1:(T-1)])/price_twiw[1:(T-1)])
naswr = 100*((price_w[2:T]-price_w[1:(T-1)])/price_w[1:(T-1)])
windows()
plot(naswr,twiwr,type="p",xlab="NASDAQ週報酬率",ylab="TWI週報酬率",lwd=2)
abline(lm(twiwr~naswr),col="red",lty=2)

cor(twiwr,naswr)
m = length(twiwr)
index = naswr > 0
n1 = sum(as.numeric(index))
index = naswr <= 0
n2 = sum(as.numeric(index))
round(c(n1,n2)/m,2)

index = twiwr > 0
m1 = sum(as.numeric(index))
index = twiwr <= 0
m2 = sum(as.numeric(index))
round(c(m1,m2)/m,2)

index = twiwr > 0 & naswr > 0
m1 = sum(as.numeric(index))
index = twiwr <= 0 & naswr <= 0
m2 = sum(as.numeric(index))
round(c(m1,m2)/m,2)

index = twiwr > 0 & naswr <= 0
m1 = sum(as.numeric(index))
index = twiwr <= 0 & naswr > 0
m2 = sum(as.numeric(index))
round(c(m1,m2)/m,2)

# if naswr > 0, then twiwr > 0
index = naswr > 0
pbar_nas = round(mean(as.numeric(index)),2)
pbar_nas
index = twiwr > 0 & naswr > 0
pbar_nastwi = round(mean(as.numeric(index)),2)
pbar_nastwi
pbar_nastwi/pbar_nas

# ex6
index = twiwr > 0
p_B = round(mean(as.numeric(index)),2)
p_Bc = 1-p_B

# information sets
index = twiwr > 0 & naswr <= 0
p_AcB = round(mean(as.numeric(index)),2)
p_Ac_B = p_AcB/p_B
p_Ac_B

index = twiwr <= 0 & naswr <= 0
p_AcBc = round(mean(as.numeric(index)),2)
p_Ac_Bc = p_AcBc/p_Bc
p_Ac_Bc

# prior prob
pB = 0.4
pBc = 0.6

#
pAc = pB*p_Ac_B + pBc*p_Ac_Bc
pAc
pB*p_Ac_B/pAc

# ex7
zr2 = 100*diff(log(z),2)
var(zr2)/(2*var(zr))

zr3 = 100*diff(log(z),3)
var(zr3)/(3*var(zr))

zr5 = 100*diff(log(z),5)
var(zr5)/(5*var(zr))

zr10 = 100*diff(log(z),10)
var(zr10)/(10*var(zr))

# ex8
# 5/15/1987-8/22/2014
oilw = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\oilw.txt")
oilw = oilw[,1]
oilwr = 100*diff(log(oilw))
oilw2r = 100*diff(log(oilw),2)
var(oilw2r)/(2*var(oilwr))

oilw5r = 100*diff(log(oilw),5)
var(oilw5r)/(5*var(oilwr))

# weekly data: 8/5/2002-8/25/2014
nasdaqgoldw = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\nasdaqgold.txt")
nasw = nasdaqgoldw[,1]
goldw = nasdaqgoldw[,2]
goldwr = 100*diff(log(goldw))

goldw2r = 100*diff(log(goldw),2)
var(goldw2r)/(2*var(goldwr))

goldw10r = 100*diff(log(goldw),10)
var(goldw10r)/(10*var(goldwr))

# ex9
x = naswr
y = twiwr
index = x > 0
pbar_x = mean(as.numeric(index))
pbar_x
index = x > 0 & y > 0
pbar_xy = mean(as.numeric(index))
pbar_xy
pbar_y_x = pbar_xy/pbar_x
pbar_y_x 

index = x > 0 & y <= 0
pbar_xyc = mean(as.numeric(index))
pbar_xyc
pbar_yc_x = pbar_xyc/pbar_x
pbar_yc_x 

pbar_xc = 1-pbar_x
pbar_xc

index = x<=0 & y<=0
pbar_ycxc = mean(as.numeric(index))
pbar_ycxc
pbar_yc_xc = pbar_ycxc/pbar_xc
pbar_yc_xc

index = x<=0 & y>0
pbar_yxc = mean(as.numeric(index))
pbar_yxc
pbar_y_xc = pbar_yxc/pbar_xc
pbar_y_xc

# ex10
# ex5
# weekly data 1/1/2000-
twinasw = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\twinasdaqw.txt", header=T)
names(twinasw)
attach(twinasw)
price_w = NASDAQW
price_twiw = TWIW
T = length(TWIW)
twiwr = 100*((price_twiw[2:T]-price_twiw[1:(T-1)])/price_twiw[1:(T-1)])
naswr = 100*((price_w[2:T]-price_w[1:(T-1)])/price_w[1:(T-1)])
x = naswr
y = twiwr
index = x > 0 & y > 0
y1 = y[index]
den = density(y1)
windows()
plot(c(-0.4,0.8),c(-30,40),axes=F,frame.plot=F,type="n",xlab="",ylab="")
den = density(y1)
lines((den$y+0.4),(den$x),lty=2,col="red",lwd=3)
abline(v=-0.2,h=-20)
index = x > 0 & y <= 0
y2 = y[index]
den1 = density(y2)
lines(den1$y,den1$x,lty=2,col="blue",lwd=3)
segments(0,-20,0,40,lty=2)
segments(0.4,-20,0.4,40,lty=2)
text(0,-20,labels="x = 0", pos=1,cex=2)
points(0,-20,pch=20)
text(0.4,-20,labels="x = 1", pos=1,cex=2)
points(0.4,-20,pch=20)
text(0.8,-20,labels="x",pos=1)
text(-0.2,40,labels="f(y|x)",pos=2)

# ex 18
N = 10000
n = 4000
library(moments)
skew = numeric(N)
kurt = numeric(N)
for(i in 1:N)
{
 x = rnorm(n)
 skew[i] = as.numeric(skewness(x))
 kurt[i] = as.numeric(kurtosis(x))
}
windows()
par(mfrow=c(2,1))
plot(density(skew),xlab="",main="模擬的偏態分配",lwd=3)
abline(v=mean(skew),lty=2,col="red")
plot(density(kurt),xlab="",main="模擬的峰態分配",lwd=3)
abline(v=mean(kurt),lty=2,col="red")





