# Daily TSMC and TWI
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch6\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))
twi = read.table("c:\\meiyih\\Finstats\\ch6\\TWI.txt", header=T)
attach(twi)
names(twi)
ptw = 收盤價_TW
p = 收盤價
twi.r = 100*diff(log(ptw))
tsmc.r = 100*diff(log(p))
T = 250
n = length(tsmc.r)
m = n-T+1
corr = numeric(m)
beta1 = numeric(m)
for(i in 1:m)
{
k = i:(T+i-1)
corr[i] = cor(twi.r[k],tsmc.r[k])
beta1[i] = coef(lm(tsmc.r[k]~twi.r[k]))[2]
}
windows()
par(mfrow=c(2,1))
plot(corr,type="l",xlab="time",ylab="樣本相關係數",main="TWI與TSMC日對數報酬率之間
     樣本相關係數年移動平均",lwd=2)
abline(h=cor(twi.r,tsmc.r),lty=2,col="red",lwd=2)
segments(2004,0,2004,0.9,lty=3,col="blue")
segments(2754,0,2754,0.9,lty=3,col="blue")
crisis = 2004:2754
polygon(c(crisis,rev(crisis)),c(corr[crisis],(crisis*0)),col="green")
plot(beta1,type="l",ylab=expression(beta),xlab="time",main=expression(paste(
     "TSMC之",beta,"年移動平均估計值")),lwd=2)    
segments(2004,0,2004,1.6,lty=3,col="blue")
segments(2754,0,2754,1.6,lty=3,col="blue")
crisis = 2004:2754
polygon(c(crisis,rev(crisis)),c(beta1[crisis],(crisis*0)),col="green")
abline(h=(coef(lm(tsmc.r~twi.r))[2]),lty=2,col="red",lwd=2)
coef(lm(tsmc.r~twi.r))[2]
cor(tsmc.r,twi.r)
min(beta1)
