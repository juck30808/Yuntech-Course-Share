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
# DF unit root
T = 1000
n = 152
tstat = numeric(T)
set.seed(12435)
for(i in 1:T)
{
  x = numeric(n)
  for(j in 2:n)
    {
      x[j] = x[(j-1)] + rnorm(1)
    }
   dx = diff(x)
   x1 = x[1:(n-1)]
   model = lm(dx~x1-1) # 無常數項
   b = coef(model)[1]
   sb1 = sqrt(vcov(model)[1,1])
   tstat[i] = b/sb1
}
quantile(tstat,0.05)
sort(tstat)[(T*0.05)]
summary(ur.df(x,type="none",lags=0))
windows()
plot(density(tstat),type="l",xlab="",main="DF單跟檢定之檢定統計量分配與t分配的差異",lwd=2)
y = seq(-4,4,length=n)
lines(y,dt(y,(n-1)),col="red",lwd=2)
legend("topright",c("DF distribution","t distribution"),lty=c(1,1),lwd=2,
      col=c("black","red"),bty="n")

dy = diff(res)
y1 = res[1:(length(res)-1)]
b1 = coef(lm(dy~y1-1))
sb1 = sqrt(vcov(lm(dy~y1-1)))
b1/sb1
library(urca)
ur1 = ur.df(res,type="none",lags=0)
summary(ur1)

dy = diff(ly)
y1 = ly[1:(length(ly)-1)]
b1 = coef(lm(dy~y1-1))
sb1 = sqrt(vcov(lm(dy~y1-1)))
b1/sb1
ur2 = ur.df(ly,type="none",lags=0)
summary(ur2)

dy = diff(ldiv)
y1 = ldiv[1:(length(ldiv)-1)]
b1 = coef(lm(dy~y1-1))
sb1 = sqrt(vcov(lm(dy~y1-1)))
b1/sb1
ur3 = ur.df(ldiv,type="none",lags=0)
summary(ur3)








