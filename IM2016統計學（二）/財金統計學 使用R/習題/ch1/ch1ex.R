#ch1 
#13、13.5、13.25、12.5、15與17
p = c(13,13.5,13.25,12.5,15,17)
pbar = mean(p)
pbar
maxp = max(p)
maxp 
minp = min(p)
minp
range = maxp-minp
range

pbar1 = round(pbar,2);pbar1 #用分號可將二行寫成一行
p2 = sort(p);p2 #用分號可將二行寫成一行

p2[3:4]

lp = log(p);lp

# ex7
F = 100000
intr = 0.1
disr = c(0.1,0.08,0.12) # 貼現率
I = F*intr # 利息
dis = 1+disr
P = I/dis + I/dis^2 + I/dis^3 + I/dis^4 + (I+F)/dis^5
P

# ex8
intr = 0.05
n = 10
F = (1+intr)^n
F

# ex9
disr = 0.085# 試不同的利率
dis = 1+disr
tryP = I/dis + I/dis^2 + I/dis^3 + I/dis^4 + (I+F)/dis^5
tryP

# ex10
r = 0.05
t = 10
F = exp(r*t)
F

# ex11
pmt = 20000
i = 0.05/12
n = 24
pv = pmt*((1/i)-(1/(i*(1+i)^n)))
pv

# ex12
pmt = 20000
i = 0.08  # 試不同利率 # 約0.062747
dis = i/12
n = 24
trypv = pmt*((1/dis)-(1/(dis*(1+dis)^n)))
trypv

# 1.2
#1/4/2005-4/28/2015
# ex1
largan = read.table("c:\\meiyih\\Finstats\\exercises\\ch1\\largan.txt")
p = largan[,1]
per = largan[,2] # 本益比
# 時間圖
windows()
par(mfrow=c(2,1))
plot(p,type="l",xlab="Time",ylab="收盤價",main="大立光收盤價",lwd=2)
plot(per,type="l",xlab="Time",ylab="本益比",main="大立光本益比",lwd=2)
# scatter diagram
windows()
par(mfrow=c(2,1))
plot(per,p,type="p",main="大立光收盤價與本益比",xlab="本益比",ylab="收盤價")
# 轉成股利
div = per/p
div = 1/div
plot(div,p,type="p",main="大立光收盤價與預估股利",xlab="預估股利",ylab="收盤價")
abline(lm(p~div))

# ex2
x = c(1,3,2)
y = c(2,4,1)
windows()
par(mfrow=c(1,2))
plot(x,y,type="p",xlim=c(0,5),ylim=c(0,6))
plot(x,y,type="l",xlim=c(0,5),ylim=c(0,6)) # 三點用線連接

# ex4: trend
t = 1:10 #即1至10
y = 0.5+0.3*t
windows()
plot(t,y,type="l")

# ex5: cpi
# 1981:1-2015:5
CPI = read.table("c:\\meiyih\\finstats\\exercises\\ch1\\cpi.txt")
cpi = CPI[,1]
windows()
plot(cpi,type="l",xlab="Time",main="CPI之時間走勢圖",lwd=2)
T = length(cpi) #總共有T個CPI
T
t = 1:T # 趨勢線 
abline(lm(cpi~t),lty=2,lwd=2) # lty=2,表示虛線

# ex6
t = 1:20
intr = 0.05
y = exp(intr*t)
windows()
plot(t,y,type="l",lwd=2)
y1 = (1+intr)^t
lines(t,y1,lty=2,col="red",lwd=2)
legend("topleft",c("連續複利","年複利"),lty=1:2,col=c("black","red"),bty="n",lwd=2)

# ex7
p = largan[,1];per = largan[,2] # 本益比
n = length(p);p1 = p[(n-249):n]
div = per/p; div = 1/div
div1 = div[(n-249):n]; cYTM = 100*div1/p1 # 以百分比表示
length(cYTM)
windows()
plot(cYTM,type="l",xlab="Time",ylab="YTM",main="大立光預估的現金殖利率線",lwd=2)
abline(h=mean(cYTM),lty=2,col="blue") # 繪水平線 (平均數)

# 1.3
# ex4
T = length(cpi)
T
pit = 100*((cpi[13:T]-cpi[1:(T-12)])/cpi[1:(T-12)])
head(pit) # 首1-6
tail(pit) # 尾1-6
windows()
plot(pit,type="l",xlab="Time",ylab=expression(pi[t]),main="通貨膨脹率的時間走勢",lwd=2)

# ex5,6
p = largan[,1]
T = length(p)
T
rt = 100*((p[2:T]-p[1:(T-1)])/p[1:(T-1)])
windows()
par(mfrow=c(2,1))
plot(rt,type="l",xlab="Time",ylab="日報酬率",main="大立光日報酬率的時間走勢")
hist(rt,breaks=100,main="大立光日報酬率的直方圖",ylab="次數",lwd=2) #分成100組

# ex7
histpi = hist(pit,plot=FALSE)
histpi

# 1-4
# ex1
library(tseries)
price.ss = get.hist.quote(instrument = "000001.SS", start = "2000-01-01", 
    quote="AdjClose") # 上海綜合指數之調整後日股價
price.SZSA = get.hist.quote(instrument = "^SZSA", start = "2000-01-01", 
    quote="AdjClose") # 深圳A股指數之調整後日股價
head(price.ss)
tail(price.ss)
head(price.SZSA)
tail(price.SZSA)
windows()
par(mfrow=c(2,1))
plot(price.ss,type="l",ylab="收盤價",main="上海綜合指數日收盤價之時間走勢",lwd=2)
plot(price.SZSA,type="l",ylab="收盤價",main="深圳A股指數日收盤價之時間走勢",lwd=2)

# ex4
# 1/2/2004-6/25/2015
exch = read.table("c:\\meiyih\\FinStats\\exercises\\ch1\\exch.txt")
tai = exch[,2] # 新台幣兌美元匯率
chi = exch[,3] # 人民幣兌美元匯率
chi_tai = tai/chi # 人民幣兌新台幣
head(chi_tai)
tail(chi_tai)
windows()
par(mfrow=c(3,1))
plot(tai,type="l",xlab="Time",ylab="日匯率",main="美元兌新台幣匯率之時間走勢",lwd=2)
plot(chi,type="l",xlab="Time",ylab="日匯率",main="美元兌人民幣匯率之時間走勢",lwd=2)
plot(chi_tai,type="l",xlab="Time",ylab="日匯率",main="人民幣兌新台幣匯率之時間走勢",lwd=2)

# ex5
priceSS = price.ss
priceSZSA = price.SZSA
twoprice = cbind(priceSS,priceSZSA)
twoprice # 注意二股價序列時間並不相同,後者會出現NA值
write.table(twoprice,"c:\\meiyih\\Finstats\\ch1\\twoprice.txt")

# ex6
two = read.table("c:\\meiyih\\Finstats\\ch1\\twoprice.txt",header=T)# 文字檔內有名稱
names(two) # 尋問名稱為何
attach(two) # 接近two檔案
x = AdjClose.priceSS # 重新命名
y = AdjClose.priceSZSA
x # x內有NA值
x = x[!is.na(x)] # 將x內之NA移除
x
windows()
par(mfrow=c(2,1))
plot(x,type="l",lwd=2)
y
y = y[!is.na(y)] # 將y內之NA移除
plot(y,type="l",lwd=2)

# 2-1
# ex1
x = runif(2)
x

# ex2
y = rnorm(5)
y

# ex3
prob = punif(0.4)
prob

# ex4
prob1 = pnorm(0.4)
prob1

# ex5
x = qunif(0.3)
x

# ex6
y = qnorm(0.3)
y

# ex7
x = seq(-4,4,length=100) # 從-4遞增至4之間共有100個值 (含-4與4)
x
windows()
par(mfrow=c(2,1))
plot(x,dnorm(x),type="l",ylab="",lwd=2)
plot(x,pnorm(x),type="l",ylab="",lwd=2)

# ex8
T = price.ss
p1 = as.numeric(price.ss[(T-9):T]) # 去除時間
p1
sort(p1)
ecdfp1 = ecdf(p1) # ecdfp1是一個函數
p1[4] # 其為6/10
ecdfp1(p1[4]) # 計算出p1內第4個元素之累積機率

# ex9
x = as.numeric(price.ss)# 去除時間
T = length(x)
xr = 100*(x[2:T]-x[1:(T-1)])/x[1:(T-1)]
sxr = sort(xr)
F = ecdf(sxr) # 估計CDF
F(sxr) # 以函數型態表示如f(x)
densitysxr = density(sxr) # 估計PDF
densitysxr
windows()
par(mfrow=c(2,1))
plot(densitysxr,xlab="日報酬率",main="上海綜合指數日報酬率之估計PDF",lwd=2)
plot(sxr,F(sxr),type="l",xlab="日報酬率",ylab="估計之CDF",lwd=2,
             main="上海綜合指數日報酬率之估計CDF")


# ex10
# 1/4/2005-4/28/2015
rnorm(1)
rnorm(1)
p = largan[,1] # 大立光日收盤價
T = length(p)
rt = 100*(p[2:T]-p[1:(T-1)])/p[1:(T-1)]
T = length(rt)
srt = numeric(T)
for(i in 1:T)
{
 srt[i] = mean(rt) + rnorm(1)
}
windows()
par(mfrow=c(2,1))
plot(rt,type="l",xlab="Time",ylab="日報酬率",main="實際的大立光日報酬率序列之時間走勢")
plot(srt,type="l",xlab="Time",ylab="日報酬率",main="模擬的大立光日報酬率序列之時間走勢")
abline(h=mean(rt),lty=2,col="red")
mean(rt)/100


# 本章習題
# ex2
GDP = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\GDP.txt")
GDP = ts(GDP[,1],start=c(1961.1),frequency=4)
windows()
par(mfrow=c(2,2))
plot(GDP,main="名目GDP之時間走勢, 單位:百萬元",lwd=2)
lgdp = log(GDP)
plot(lgdp,main="名目GDP (對數值) 之時間走勢",ylab="對數GDP",lwd=2)
# 年成長率
n = length(lgdp)
gdpr = 400*((GDP[2:n]-GDP[1:(n-1)])/GDP[1:(n-1)])
gdpr = ts(gdpr,start=c(1961.2),frequency=4)
plot(gdpr,type="l",main="名目GDP年成長率之時間走勢 (季)",ylab="成長率",lwd=2)
#write.table(gdpr,"g:\\stat\\ex\\ch1\\gdpr.txt")
gdpr1 = 100*((GDP[5:n]-GDP[1:(n-4)])/GDP[1:(n-4)])
gdpr1 = ts(gdpr1,start=c(1962.1),frequency=4)
#write.table(gdpr1,"g:\\stat\\ex\\ch1\\gdpr1.txt") # 存資料
plot(gdpr1,type="l",main="名目GDP年成長率之時間走勢",ylab="成長率",lwd=2)

# ex3
index = gdpr1 >= 3
pbar = mean(as.numeric(index))
pbar

gdpr2 = gdpr1[154:length(gdpr1)] # 2000:1-2014:2
index = gdpr2 >= 3
pbar = mean(as.numeric(index))
pbar

# ex4
# 1981:1-2014:7
cpi = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\cpi.txt")
cpi = cpi[,1]
lcpi = log(cpi)
n = length(cpi)
inf = 1200*((cpi[2:n]-cpi[1:(n-1)])/cpi[1:(n-1)])
inf1 = 100*((cpi[13:n]-cpi[1:(n-12)])/cpi[1:(n-12)])
windows()
par(mfrow=c(2,2))
plot(cpi,type="l",lwd=2)
plot(lcpi,type="l",lwd=2)
plot(inf,type="l",lwd=2)
plot(inf1,type="l",lwd=2)

index = inf1 >= 3
pbar = mean(as.numeric(index))
pbar

# ex5
# 1/2/2002-8/29/2014 銀行間匯率
exch = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\exchangerate.txt", header=T)
names(exch)
attach(exch) # 接近exch
x = 新台幣 # 1美元等於?新台幣
y = 人民幣 # 1美元等於?人民幣
z = x/y
windows()
par(mfrow=c(2,1))
plot(x,type="l",xlab="time",ylab="exchange rate",main="新台幣對美元匯率時間走勢",lwd=2)
plot(z,type="l",xlab="time",ylab="exchange rate",main="新台幣對人民幣匯率時間走勢",lwd=2)
n = length(x)
xr = 100*((x[2:n]-x[1:(n-1)])/x[1:(n-1)])
zr = 100*((z[2:n]-z[1:(n-1)])/z[1:(n-1)])
head(xr)
head(zr)
index = xr >= 0.01
pbar = mean(as.numeric(index))
pbar

index = zr >= 0.01
pbar = mean(as.numeric(index))
pbar

# ex6
summary(xr)
length(xr)
xr = xr[6:length(xr)]
T = length(xr)
m = 15
maxr = numeric((T/m)) # 預備一個儲存空間有T/m個,其內元素皆為0
minr = numeric((T/m))
for(i in 1:(T/m)) # 進行一個小迴圈i從1至T/m (即362)
{
  h = (i-1)*m + 1
  k = i*m
  maxr[i] = max(r[h:k])
  minr[i] = min(r[h:k])
}
windows()
par(mfrow=c(2,1))
hist(maxr,main="匯率每隔15天最大日變動率之次數分配 (最大貶值幅度分配)",xlab="最大值",lwd=2)
freqmax = hist(maxr,plot=FALSE)
freqmax
segments(2.75,0,2.75,30,col="red")
points(2.75,30,lwd=2,pch=20)
segments(6.75,0,6.75,30,col="red")
points(6.75,30,lwd=2,pch=20)
hist(minr,main="匯率每隔15天最大日變動率之次數分配 (最大升值幅度分配)",xlab="最小值",lwd=2)
freqmin = hist(minr,plot=FALSE)
freqmin
segments(-2.5,0,-2.5,59,col="red")
points(-2.5,59,lwd=2,pch=20)

# ex7
library("tseries") #使用	tseries Package, 使用時網路需連線以便下載
price = get.hist.quote(instrument ="^IXIC",start="2000-01-01",end="2014-08-29",
    quote="AdjClose") # NASDAQ之調整後日股價
head(price) #檢視前面6個資料
tail(price) #檢視最後6個資料
length(price)
# 下載台灣股市資料
price_tw = get.hist.quote(instrument ="^TWII",start="2000-01-01",end="2014-08-29",
    quote="AdjClose") # Taiwan Weighted Index之調整後日股價
head(price_tw)
tail(price_tw)
length(price_tw)

windows()
par(mfrow=c(2,1))
plot(price,type="l",lwd=2)
plot(price_tw,type="l",lwd=2)
n = length(price)
#library(zoo)
price = as.numeric(price) # 不取日期只取資料
head(price)
nasr = 100*((price[2:n]-price[1:(n-1)])/price[1:(n-1)])
head(nasr)
m = length(nasr)
m
n1 = length(price_tw)
price_tw = as.numeric(price_tw)
tair = 100*((price_tw[2:n1]-price_tw[1:(n1-1)])/price_tw[1:(n1-1)])
m1 = length(tair)
m1
nasr = nasr[66:m]
length(nasr)
windows()
plot(nasr,tair,type="p",lwd=2)
abline(lm(tair~nasr),col="red")

# ex8
# monthly data 2000:1-
twinasm = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\twinasdaqm.txt", header=T)
names(twinasm)
attach(twinasm)
price_m = NASDAQ
price_twim = TWI
T = length(TWI)
twimr = 100*((price_twim[2:T]-price_twim[1:(T-1)])/price_twim[1:(T-1)])
nasmr = 100*((price_m[2:T]-price_m[1:(T-1)])/price_m[1:(T-1)])
windows()
par(mfrow=c(2,1))
plot(nasmr,twimr,type="p",lwd=2)
abline(lm(twimr~nasmr),col="red")

twinasw = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\twinasdaqw.txt", header=T)
names(twinasw)
attach(twinasw)
price_w = NASDAQW
price_twiw = TWIW
T = length(TWIW)
twiwr = 100*((price_twiw[2:T]-price_twiw[1:(T-1)])/price_twiw[1:(T-1)])
naswr = 100*((price_w[2:T]-price_w[1:(T-1)])/price_w[1:(T-1)])
windows()
plot(naswr,twiwr,type="p",lwd=2)
abline(lm(twiwr~naswr),col="red")

# ex9
# weekly data: 8/5/2002-8/25/2014
nasdaqgoldw = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\nasdaqgold.txt")
nasw = nasdaqgoldw[,1]
goldw = nasdaqgoldw[,2]
windows()
par(mfrow=c(2,2))
plot(nasw,type="l",lwd=2)
plot(goldw,type="l",lwd=2)
n = length(nasw)
naswr = 100*((nasw[2:n]-nasw[1:(n-1)])/nasw[1:(n-1)])
goldwr = 100*((goldw[2:n]-goldw[1:(n-1)])/goldw[1:(n-1)])
plot(goldwr,naswr,type="p",lwd=2)
abline(lm(naswr~goldwr),col="red")

# ex10
# 5/15/1987-8/22/2014
oilw = read.table("c:\\meiyih\\Finstats\\ex\\ch1\\data\\oilw.txt")
oilw = oilw[,1]
windows()
par(mfrow=c(2,1))
plot(oilw,type="l",lwd=2)
T = length(oilw)
oilwr = 100*((oilw[2:T]-oilw[1:(T-1)])/oilw[1:(T-1)])
hist(oilwr,breaks=50,prob=T,lwd=2)

# ex18
windows()
x = seq(-3,3,length=100); plot(x,dnorm(x),type="l",lwd=2,ylab="")


# ex22
PV = function(i,n) (1+i)^-n # 現值利率因子
PV(0.06,20)
(1.06)^(-20)
FV = function(i,n) (1+i)^n # 未來值利率因子
FV(0.06,20)
(1.06)^(20)



