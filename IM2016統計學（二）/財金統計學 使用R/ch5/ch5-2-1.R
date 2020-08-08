# exchange rates 1/2/2002-7/10/2014
exch = read.table("c:\\meiyih\\Finstats\\ch5\\exch.txt", header=T)
attach(exch)
names(exch)
tai.r = 100*diff(log(新台幣))
# rolling estimations (point estimates)
windows()
par(mfcol=c(2,2))
r = 新台幣
library(fBasics)
basicStats(r)
t = 100
m = length(r)-t+1
rollr = numeric(m)
for(i in 0:(m-1))
{
  r1 = (i+1):(t+i)
  rollr[(i+1)] = mean(r[r1])
}
plot(rollr,type="l",main="匯率之移動平均",lwd=3)
abline(h=mean(r),lty=2,col="red",lwd=3)
error = abs(rollr[1:(m-1)]-r[(t+1):length(r)])
plot(error,lty=3,main="匯率之絕對誤差與一般絕對誤差",ylim=c(0,5),lwd=2)
error1 = abs(mean(r)-r[(t+1):length(r)])
lines(1:(m-1),error1,lty=18, col="red",lwd=2)
legend("topleft",c("匯率之絕對誤差","匯率之一般絕對誤差"),lty=c(2,18),
       col=c("black","red"),lwd=2,bty="n")
mean(error1)
mean(error)
sd(error1)
sd(error)
error2 = sum((rollr[1:(m-1)]-r[(t+1):length(r)])^2)/(m-1)
error2
error3 = sum((mean(r)-r[(t+1):length(r)])^2)/(m-1)
error3

r = tai.r
basicStats(r)
t = 100
m = length(r)-t+1
rollr = numeric(m)
for(i in 0:(m-1))
{
  r1 = (i+1):(t+i)
  rollr[(i+1)] = mean(r[r1])
}
plot(rollr,type="l",main="匯率報酬率之移動平均",lwd=3)
abline(h=mean(r),lty=2,col="red",lwd=3)
error = abs(rollr[1:(m-1)]-r[(t+1):length(r)])
plot(error,lty=3,main="匯率報酬率之絕對誤差誤差與一般絕對誤差",lwd=2)
error1 = abs(mean(r)-r[(t+1):length(r)])
lines(1:(m-1),error1, lty=18, col="red",lwd=2)
legend("topleft",c("匯率報酬率之絕對誤差","匯率報酬率之一般絕對誤差"),lty=c(2,18),
       col=c("black","red"),lwd=2,bty="n")

mean(error1)
mean(error)
sd(error1)
sd(error)
error2 = sum((rollr[1:(m-1)]-r[(t+1):length(r)])^2)/(m-1)
error2
error3 = sum((mean(r)-r[(t+1):length(r)])^2)/(m-1)
error3
