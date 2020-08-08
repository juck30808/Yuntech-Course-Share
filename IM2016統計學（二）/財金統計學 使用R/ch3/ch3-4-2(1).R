# weekly data, 1/7/2000-7/4/2014
TSMCw = read.table("c:\\meiyih\\Finstats\\ch3\\TSMCw.txt", header=T)
names(TSMCw)
attach(TSMCw)
x = ¦¬½L»ù
TSMC.r = 100*diff(log(x))
basicStats(TSMC.r)
basicStats(xr)

TSMC.2r = 100*diff(log(x),2)
#basicStats(TSMC.2r)
var(TSMC.2r)/(2*var(TSMC.r))

TSMC.5r = 100*diff(log(x),5)
#basicStats(TSMC.5r)
var(TSMC.5r)/(5*var(TSMC.r))

TSMC.10r = 100*diff(log(x),10)
#basicStats(TSMC.10r)
var(TSMC.10r)/(10*var(TSMC.r))

TSMC.20r = 100*diff(log(x),20)
#basicStats(TSMC.20r)
var(TSMC.20r)/(20*var(TSMC.r))

# log(pt/pt1) = c+u
# pt = pt1 + exp(c+u)
pt = numeric(1000)
set.seed(1234)
for(i in 2:1000)
{
  pt[i] = pt[i-1] + exp(0.01+rnorm(1))
}

r1 = diff(pt)
r2 = diff(pt,2)
r5 = diff(pt,5)
r10 = diff(pt,10)
r20 = diff(pt,20)

var(r2)/(2*var(r1))
var(r5)/(5*var(r1))
var(r10)/(10*var(r1))
var(r20)/(20*var(r1))

# Monte Carlo¼ÒÀÀ
windows()
par(mfrow=c(2,2))
T = 10000
c = 0.005
m = 1000
VR1 = rep(0,T)
pt = rep(0,m)
for (j in 1:T)
{
    for(i in 2:m)
    {
       pt[i] = pt[i-1] + exp(c+rnorm(1))
    }
r1 = diff(pt)
r2 = diff(pt,2)
VR1[j] = var(r2)/(2*var(r1))
}
hist(VR1, n=100, xlab="", main="VR test: k = 2",lwd=2)
quantile(VR1,c(0.025,0.975))

VR2 = rep(0,T)
pt = rep(0,m)
for (j in 1:T)
{
    for(i in 2:m)
    {
       pt[i] = pt[i-1] + exp(c+rnorm(1))
    }
r1 = diff(pt)
r5 = diff(pt,5)
VR2[j] = var(r5)/(5*var(r1))
}
hist(VR2, n=100, xlab="", main="VR test: k = 5",lwd=2)
quantile(VR2,c(0.025,0.975))

VR3 = rep(0,T)
pt = rep(0,m)
for (j in 1:T)
{
    for(i in 2:m)
    {
       pt[i] = pt[i-1] + exp(c+rnorm(1))
    }
r1 = diff(pt)
r10 = diff(pt,10)
VR3[j] = var(r10)/(10*var(r1))
}
hist(VR3, n=100, xlab="", main="VR test: k = 10")
quantile(VR3,c(0.025,0.975))

VR4 = rep(0,T)
pt = rep(0,m)
for (j in 1:T)
{
    for(i in 2:m)
    {
       pt[i] = pt[i-1] + exp(c+rnorm(1))
    }
r1 = diff(pt)
r20 = diff(pt,20)
VR4[j] = var(r20)/(20*var(r1))
}
hist(VR4,n=100, xlab="", main="VR test: k = 20")
q4 = quantile(VR4,c(0.025,0.975))
q4
abline(v=q4[1],lty=2,col="red")
abline(v=q4[2],lty=2,col="red")