library(lmtest)
library(sandwich)
# load cpi
# 1981M1-2014M7
cpi = read.table("c:\\meiyih\\Finstats\\ch8\\cpi.txt") 
cpi = cpi[,1] 
# load TSMC 月收盤價與益比
# 1994M9-2014M6
tsmc = read.table("c:\\meiyih\\Finstats\\ch8\\tsmcp.txt",header=T)
names(tsmc)
attach(tsmc)
tsmcp = TSMC
tsmcper = TSMC本益比
cpi1 = cpi[165:(length(cpi)-1)]
length(cpi1)
length(tsmcp)
# TSMC股利
tsmcdiv = tsmcper/tsmcp
tsmcdiv = 1/tsmcdiv
head(tsmcdiv)

# TWI
# 1981M1-2014M6
twi = read.table("c:\\meiyih\\Finstats\\ch8\\twip.txt",header=T)
names(twi)
attach(twi)
twip = TWI
twiper = TWI本益比
cpi2 = cpi[1:(length(cpi)-1)]
length(cpi2)
length(twip)
# TWI股利
# TSMC股利
twidiv = twiper/twip
twidiv = 1/twidiv
head(twidiv)

windows()
par(mfrow=c(3,1))
cpits = ts(cpi,start=c(1981,1),frequency=12)
plot(cpits,type="l",ylab="",main="CPI時間走勢",lwd=2)
tsmcpts = ts(tsmcp,start=c(1994,9),frequency=12)
plot(tsmcpts,type="l",ylab="",main="TSMC月收盤價時間走勢",lwd=2)
twipts = ts(twip,start=c(1981,1),frequency=12)
plot(twipts,type="l",ylab="",main="TWI月收盤價時間走勢",lwd=2)

T = length(tsmcp)
k = 20
T1 = T-k
y1 = (tsmcp[(k+1):T]+tsmcdiv[(k+1):T]-tsmcp[1:T1])/tsmcp[1:T1]
x1 = (cpi1[(k+1):T]-cpi1[1:T1])/cpi1[1:T1]
model = lm(y1~x1)
summary(model)
 

T = length(twip)
k = 120 
T1 = T-k
y1 = (twip[(k+1):T]+twidiv[(k+1):T]-twip[1:T1])/twip[1:T1]
x1 = (cpi2[(k+1):T]-cpi2[1:T1])/cpi2[1:T1]
model = lm(y1~x1)
summary(model)
 

T = length(tsmcp)
k = 2
T1 = T-k
y1 = (tsmcp[(k+1):T]+tsmcdiv[(k+1):T]-tsmcp[1:T1])/tsmcp[1:T1]
x1 = (cpi1[(k+1):T]-cpi1[1:T1])/cpi1[1:T1]
model = lm(y1~x1)
res = residuals(model)
windows()
par(mfcol=c(2,4))
acf(res,lag.max=100,main="(a) k = 2",lwd=2)
pacf(res,lag.max=100,main="",lwd=2)
k = 10
T1 = T-k
y1 = (tsmcp[(k+1):T]+tsmcdiv[(k+1):T]-tsmcp[1:T1])/tsmcp[1:T1]
x1 = (cpi1[(k+1):T]-cpi1[1:T1])/cpi1[1:T1]
model = lm(y1~x1)
res = residuals(model)
acf(res,lag.max=100,main="(b) k = 10",lwd=2)
pacf(res,lag.max=100,main="",lwd=2)
k = 50
T1 = T-k
y1 = (tsmcp[(k+1):T]+tsmcdiv[(k+1):T]-tsmcp[1:T1])/tsmcp[1:T1]
x1 = (cpi1[(k+1):T]-cpi1[1:T1])/cpi1[1:T1]
model = lm(y1~x1)
res = residuals(model)
acf(res,lag.max=100,main="(c) k = 50",lwd=2)
pacf(res,lag.max=100,main="",lwd=2)
k = 100
T1 = T-k
y1 = (tsmcp[(k+1):T]+tsmcdiv[(k+1):T]-tsmcp[1:T1])/tsmcp[1:T1]
x1 = (cpi1[(k+1):T]-cpi1[1:T1])/cpi1[1:T1]
model = lm(y1~x1)
res = residuals(model)
acf(res,lag.max=100,main="(d) k = 100",lwd=2)
pacf(res,lag.max=100,main="",lwd=2)



# the case 1
# the case of TSMC
T = length(tsmcp)
K = 100
tsmcb = numeric(K)
tsmct1 = numeric(K)
tsmct2 = numeric(K)
for(i in 1:K)
{
k = i
T1 = T-k
y1 = (tsmcp[(k+1):T]+tsmcdiv[(k+1):T]-tsmcp[1:T1])/tsmcp[1:T1]
x1 = (cpi1[(k+1):T]-cpi1[1:T1])/cpi1[1:T1]
model = lm(y1~x1)
model1 = coeftest(model,type="HC0")
tsmcb[i] = model1[2,1]
tsmct1[i] = model1[2,3]
se = model1[2,2]
tsmct2[i] = (tsmcb[i]-1)/se
}
windows()
par(mfcol=c(3,2))
plot(tsmcb,type="l",ylab="",main="TSMC 情況1",xlab="k",lwd=2)
abline(h=0,lty=2)
plot(tsmct1,type="l",ylab="",xlab="k",lwd=2)
abline(h=2,lty=2)
abline(h=-2,lty=2)
plot(tsmct2,type="l",ylab="",xlab="k",lwd=2)
abline(h=2,lty=2)
abline(h=-2,lty=2)
tsmcb
tsmct1
tsmct2
# the case of TWI
T = length(twip)
K = 120
b = numeric(K)
tstat1 = numeric(K)
tstat2 = numeric(K)
for(i in 1:K)
{
k = i
T1 = T-k
y1 = (twip[(k+1):T]+twidiv[(k+1):T]-twip[1:T1])/twip[1:T1]
x1 = (cpi2[(k+1):T]-cpi2[1:T1])/cpi2[1:T1]
model = lm(y1~x1)
model1 = coeftest(model,type="HC0")
b[i] = model1[2,1]
tstat1[i] = model1[2,3]
se = model1[2,2]
tstat2[i] = (b[i]-1)/se
}
plot(b,type="l",main="TWI 情況1",ylab="",xlab="k",lwd=2)
abline(h=0,lty=2)
plot(tstat1,type="l",ylab="",xlab="k",lwd=2)
abline(h=2,lty=2)
abline(h=-2,lty=2)
plot(tstat2,type="l",ylab="",xlab="k",lwd=2)
abline(h=2,lty=2)
abline(h=-2,lty=2)

N = 201
y = numeric(N)
set.seed(1)
for(i in 2:N)
{
y[i] = 0.3+0.6*y[(i-1)]+rnorm(1)
}
windows()
par(mfcol=c(2,4))
acf(y,lag.max=100,main="(a)",lwd=2)
pacf(y,lag.max=100,main="",lwd=2)
set.seed(12)
for(i in 2:N)
{
y[i] = 0.3+0.8*y[(i-1)]+rnorm(1)
}
acf(y,lag.max=100,main="(b)",lwd=2)
pacf(y,lag.max=100,main="",lwd=2)
set.seed(1234)
for(i in 2:N)
{
y[i] = 0.3+0.95*y[(i-1)]+rnorm(1)
}
acf(y,lag.max=100,main="(c)",lwd=2)
pacf(y,lag.max=100,main="",lwd=2)
set.seed(123)
for(i in 2:N)
{
y[i] = 0.3+0.98*y[(i-1)]+rnorm(1)
}
acf(y,lag.max=100,main="(d)",lwd=2)
pacf(y,lag.max=100,main="",lwd=2)

# the case 2
# the other cases
# the case of TSMC
T = length(tsmcp)
K = 101
K1 = K-1
tsmcb = numeric(K1)
tsmct1 = numeric(K1)
tsmct2 = numeric(K1)
for(i in 2:K)
{
k = i
T1 = T-k
y = (tsmcp[(k+1):T]+tsmcdiv[(k+1):T]-tsmcp[1:T1])/tsmcp[1:T1]
x = (cpi1[(k+1):T]-cpi1[1:T1])/cpi1[1:T1]
h = length(y)
ya = y[i:h]
ya1 = y[(i-1):(h-1)]
xa = x[i:h]
model = lm(ya~xa+ya1)
model1 = coeftest(model,vcov=vcovHAC) 
tsmcb[(i-1)] = model1[2,1]
tsmct1[(i-1)] = model1[2,3]
se = model1[2,2]
tsmct2[(i-1)] = (tsmcb[(i-1)]-1)/se
}
windows()
par(mfcol=c(3,2))
plot(tsmcb,type="l",main="TSMC 情況2",ylab="",xlab="k",lwd=2)
abline(h=0,lty=2)
plot(tsmct1,type="l",ylab="",xlab="k",lwd=2)
abline(h=2,lty=2)
abline(h=-2,lty=2)
plot(tsmct2,type="l",ylab="",xlab="k",lwd=2)
abline(h=2,lty=2)
abline(h=-2,lty=2)

# the other cases
# the case of TWI
T = length(twip)
K = 121
K1 = K-1
twib = numeric(K1)
twit1 = numeric(K1)
twit2 = numeric(K1)
for(i in 2:K)
{
k = i
T1 = T-k
y = (twip[(k+1):T]+twidiv[(k+1):T]-twip[1:T1])/twip[1:T1]
x = (cpi2[(k+1):T]-cpi2[1:T1])/cpi2[1:T1]
h = length(y)
ya = y[i:h]
ya1 = y[(i-1):(h-1)]
xa = x[i:h]
model = lm(ya~xa+ya1)
model1 = coeftest(model,vcov=vcovHAC)
twib[(i-1)] = model1[2,1]
twit1[(i-1)] = model1[2,3]
se = model1[2,2]
twit2[(i-1)] = (twib[(i-1)]-1)/se
}
plot(twib,type="l",main="TWI 情況2",xlab="k",ylab="",lwd=2)
abline(h=0,lty=2)
plot(twit1,type="l",ylab="",xlab="k",lwd=2)
abline(h=2,lty=2)
abline(h=-2,lty=2)
plot(twit2,type="l",ylab="",xlab="k",lwd=2)
abline(h=2,lty=2)
abline(h=-2,lty=2)

windows()
par(mfcol=c(2,4))
T = length(tsmcp)
i = 2
k = i
T1 = T-k
y = (tsmcp[(k+1):T]+tsmcdiv[(k+1):T]-tsmcp[1:T1])/tsmcp[1:T1]
x = (cpi1[(k+1):T]-cpi1[1:T1])/cpi1[1:T1]
h = length(y)
ya = y[i:h]
ya1 = y[(i-1):(h-1)]
xa = x[i:h]
model = lm(ya~xa+ya1)
res = residuals(model)
acf(res,main="k = 2",lag.max=100,lwd=2)
pacf(res,main="",lag.max=100,lwd=2)

i = 10
k = i
T1 = T-k
y = (tsmcp[(k+1):T]+tsmcdiv[(k+1):T]-tsmcp[1:T1])/tsmcp[1:T1]
x = (cpi1[(k+1):T]-cpi1[1:T1])/cpi1[1:T1]
h = length(y)
ya = y[i:h]
ya1 = y[(i-1):(h-1)]
xa = x[i:h]
model = lm(ya~xa+ya1)
res = residuals(model)
acf(res,main="k = 10",lag.max=100,lwd=2)
pacf(res,main="",lag.max=100,lwd=2)

i = 50
k = i
T1 = T-k
y = (tsmcp[(k+1):T]+tsmcdiv[(k+1):T]-tsmcp[1:T1])/tsmcp[1:T1]
x = (cpi1[(k+1):T]-cpi1[1:T1])/cpi1[1:T1]
h = length(y)
ya = y[i:h]
ya1 = y[(i-1):(h-1)]
xa = x[i:h]
model = lm(ya~xa+ya1)
res = residuals(model)
acf(res,main="k = 50",lag.max=100,lwd=2)
pacf(res,main="",lag.max=100,lwd=2)

i = 100
k = i
T1 = T-k
y = (tsmcp[(k+1):T]+tsmcdiv[(k+1):T]-tsmcp[1:T1])/tsmcp[1:T1]
x = (cpi1[(k+1):T]-cpi1[1:T1])/cpi1[1:T1]
h = length(y)
ya = y[i:h]
ya1 = y[(i-1):(h-1)]
xa = x[i:h]
model = lm(ya~xa+ya1)
res = residuals(model)
acf(res,main="k = 100",lag.max=100,lwd=2)
pacf(res,main="",lag.max=100,lwd=2)



windows()
par(mfcol=c(2,4))
T = length(twip)
i = 2
k = i
T1 = T-k
y = (twip[(k+1):T]+twidiv[(k+1):T]-twip[1:T1])/twip[1:T1]
x = (cpi2[(k+1):T]-cpi2[1:T1])/cpi2[1:T1]
h = length(y)
ya = y[i:h]
ya1 = y[(i-1):(h-1)]
xa = x[i:h]
model = lm(ya~xa+ya1)
res = residuals(model)
acf(res,main="k = 2",lag.max=100,lwd=2)
pacf(res,main="",lag.max=100,lwd=2)

i = 10
k = i
T1 = T-k
y = (twip[(k+1):T]+twidiv[(k+1):T]-twip[1:T1])/twip[1:T1]
x = (cpi2[(k+1):T]-cpi2[1:T1])/cpi2[1:T1]
h = length(y)
ya = y[i:h]
ya1 = y[(i-1):(h-1)]
xa = x[i:h]
model = lm(ya~xa+ya1)
res = residuals(model)
acf(res,main="k = 10",lag.max=100,lwd=2)
pacf(res,main="",lag.max=100,lwd=2)

i = 50
k = i
T1 = T-k
y = (twip[(k+1):T]+twidiv[(k+1):T]-twip[1:T1])/twip[1:T1]
x = (cpi2[(k+1):T]-cpi2[1:T1])/cpi2[1:T1]
h = length(y)
ya = y[i:h]
ya1 = y[(i-1):(h-1)]
xa = x[i:h]
model = lm(ya~xa+ya1)
res = residuals(model)
acf(res,main="k = 50",lag.max=100,lwd=2)
pacf(res,main="",lag.max=100,lwd=2)

i = 100
k = i
T1 = T-k
y = (twip[(k+1):T]+twidiv[(k+1):T]-twip[1:T1])/twip[1:T1]
x = (cpi2[(k+1):T]-cpi2[1:T1])/cpi2[1:T1]
h = length(y)
ya = y[i:h]
ya1 = y[(i-1):(h-1)]
xa = x[i:h]
model = lm(ya~xa+ya1)
res = residuals(model)
acf(res,main="k = 100",lag.max=100,lwd=2)
pacf(res,main="",lag.max=100,lwd=2)

# the case 3
# the other cases
# the case of TSMC
T = length(tsmcp)
K = 101
K1 = K-1
tsmcb = numeric(K1)
tsmct1 = numeric(K1)
tsmct2 = numeric(K1)
for(i in 2:K)
{
k = i
T1 = T-k
y = (tsmcp[(k+1):T]+tsmcdiv[(k+1):T]-tsmcp[1:T1])/tsmcp[1:T1]
x = (cpi1[(k+1):T]-cpi1[1:T1])/cpi1[1:T1]
h = length(y)
ya = y[i:h]
ya1 = y[(i-1):(h-1)]
xa = x[1:(h-i+1)]
x1a = x1[i:h]
model = lm(ya~xa+ya1+x1a)
model1 = coeftest(model,vcov=vcovHAC)
tsmcb[(i-1)] = model1[2,1]
tsmct1[(i-1)] = model1[2,3]
se = model1[2,2]
tsmct2[(i-1)] = (tsmcb[(i-1)]-1)/se
}
windows()
par(mfcol=c(3,2))
plot(tsmcb,type="l",main="TSMC 情況3",ylab="",xlab="k",lwd=2)
abline(h=0,lty=2)
plot(tsmct1,type="l",ylab="",xlab="k",lwd=2)
abline(h=2,lty=2)
abline(h=-2,lty=2)
plot(tsmct2,type="l",ylab="",xlab="k",lwd=2)
abline(h=2,lty=2)
abline(h=-2,lty=2)

# the other cases
# the case of TWI
T = length(twip)
K = 121
K1 = K-1
twib = numeric(K1)
twit1 = numeric(K1)
twit2 = numeric(K1)
for(i in 2:K)
{
k = i
T1 = T-k
y = (twip[(k+1):T]+twidiv[(k+1):T]-twip[1:T1])/twip[1:T1]
x = (cpi2[(k+1):T]-cpi2[1:T1])/cpi2[1:T1]
h = length(y)
ya = y[i:h]
ya1 = y[(i-1):(h-1)]
xa = x[1:(h-i+1)]
model = lm(ya~xa+ya1)
model1 = coeftest(model,vcov=vcovHAC)
twib[(i-1)] = model1[2,1]
twit1[(i-1)] = model1[2,3]
se = model1[2,2]
twit2[(i-1)] = (twib[(i-1)]-1)/se
}
plot(twib,type="l",main="TWI 情況3",ylab="",xlab="k",lwd=2)
abline(h=0,lty=2)
plot(twit1,type="l",ylab="",xlab="k",lwd=2)
abline(h=2,lty=2)
abline(h=-2,lty=2)
plot(twit2,type="l",ylab="",xlab="k",lwd=2)
abline(h=2,lty=2)
abline(h=-2,lty=2)
