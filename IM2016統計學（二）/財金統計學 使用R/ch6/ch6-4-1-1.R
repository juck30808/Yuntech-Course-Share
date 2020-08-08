# Daily TSMC and TWI
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch6\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))
twi = read.table("c:\\meiyih\\Finstats\\ch6\\TWI.txt", header=T)
attach(twi)
names(twi)

# 金融資產報酬率的特徵
ptw = 收盤價_TW
p = 收盤價
twi.r = 100*diff(log(ptw))
tsmc.r = 100*diff(log(p))
length(twi.r)
twi.r = twi.r[124:length(twi.r)] # 6/23/2000-7/10/2014
tsmc.r = tsmc.r[124:length(tsmc.r)]
T = 250
n = 14
annual_twi = numeric(n)
annual_tsmc = numeric(n)
i = (0:14)*T
i1 = i+1
for(k in 1:n)
{
j = c(i1[k],i[k+1])
annual_twi[k] = sd(twi.r[j])*sqrt(T)
annual_tsmc[k] = sd(tsmc.r[j])*sqrt(T)
} 
windows()
par(mfrow=c(2,2))
plot(annual_twi,type="h",lwd=10,ylab="波動率",xlab="",main="TWI",ylim=c(0,50),xlim=c(0,15))
lines(annual_twi,lty=2,col="blue",lwd=2)
segments(9,42,9,50)
segments(11,25,11,50)
arrows(9,50,11,50,code=3)
text(8,45,labels="高波動",pos=1,lwd=2)
segments(11.5,9,11.5,50)
segments(13.5,9,13.5,50)
arrows(11.5,40,13.5,40,code=2)
text(12.5,35,labels="低波動",pos=1,lwd=2)

plot(annual_tsmc,type="h",lwd=10,ylab="波動率",xlab="",main="TSMC",ylim=c(0,55))
lines(annual_tsmc,lty=2,col="blue",lwd=2)
text(14,55,labels="高波動",pos=1,lwd=2)
text(7,10,labels="低波動",pos=1,lwd=2)
plot(twi.r,type="l",ylim=c(-6,8),xlab="time",ylab="log returns",lwd=2)
text(2100,8,labels="高波動",pos=1,lwd=2)
text(1400,6,labels="低波動",pos=1,lwd=2)
plot(tsmc.r,type="l",xlab="time",ylab="log returns",ylim=c(-6,8),lwd=2)
text(400,8,labels="高波動",pos=1,lwd=2)
text(2500,6,labels="低波動",pos=1,lwd=2)

windows()
par(mfrow=c(3,2))
#自我相關
acf(twi.r,xlab="遞延落後期數",ylab="自我相關",main="(a) TWI",lwd=2) 
acf(tsmc.r,xlab="遞延落後期數",ylab="自我相關",main="(b) TSMC",lwd=2)
acf(twi.r^2,xlab="遞延落後期數",ylab="自我相關",main="(c) TWI (對數報酬率平方)",lwd=2) 
acf(tsmc.r^2,xlab="遞延落後期數",ylab="自我相關",main="(d) TSMC (對數報酬率平方)",lwd=2)
acf(abs(twi.r),xlab="遞延落後期數",ylab="自我相關",main="(e) TWI (對數報酬率之絕對值)",lwd=2)
acf(abs(tsmc.r),xlab="遞延落後期數",ylab="自我相關",main="(f) TSMC (對數報酬率之絕對值)",lwd=2)
