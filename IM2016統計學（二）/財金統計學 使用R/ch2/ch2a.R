#ch2
TWIm = read.table("c:\\meiyih\\Finstats\\ch2\\TWIm.txt",header=T)
names(TWIm) # TWImずΤ嘿
attach(TWIm) # 钡郎
秨絃基 = ts(秨絃基,start=c(2000,1),frequency=12)
程蔼基 = ts(程蔼基,start=c(2000,1),frequency=12)
程基 = ts(程基,start=c(2000,1),frequency=12)
Μ絃基 = ts(Μ絃基,start=c(2000,1),frequency=12)
Θユ秖 = ts(Θユ秖,start=c(2000,1),frequency=12)
秅锣瞯 = ts(秅锣瞯,start=c(2000,1),frequency=12)
セ痲ゑ = ts(セ痲ゑ,start=c(2000,1),frequency=12)
基瞓ゑ = ts(基瞓ゑ,start=c(2000,1),frequency=12)
#锣Θ
 = セ痲ゑ/Μ絃基
 = 1/
 = ts(,start=c(2000,1),frequency=12)
head()
windows()
par(mfrow=c(2,1))
plot(秨絃基,ylab="基",main="舦计る基ǐ墩",lwd=2)
lines(程蔼基,lty=2,col="2",lwd=2)
lines(程基,lty=3,col="3",lwd=2)
lines(Μ絃基,lty=4,col="4",lwd=2)
legend("bottomright",c("秨絃基","程蔼基","程基","Μ絃基"), lty=1:4, lwd=2,
       col=c("1","2","3","4"),bty="n")

TSMCm = read.table("c:\\meiyih\\Finstats\\ch2\\TSMCm.txt",header=T)
names(TSMCm)
attach(TSMCm)
縩秨絃基 = ts(縩秨絃基,start=c(2000,1),frequency=12)
縩程蔼基 = ts(縩程蔼基,start=c(2000,1),frequency=12)
縩程基 = ts(縩程基,start=c(2000,1),frequency=12)
縩Μ絃基 = ts(縩Μ絃基,start=c(2000,1),frequency=12)
縩Θユ秖 = ts(縩Θユ秖,start=c(2000,1),frequency=12)
縩秅锣瞯 = ts(縩秅锣瞯,start=c(2000,1),frequency=12)
縩セ痲ゑ = ts(縩セ痲ゑ,start=c(2000,1),frequency=12)
縩基瞓ゑ = ts(縩基瞓ゑ,start=c(2000,1),frequency=12)
#锣Θ
縩 = 縩セ痲ゑ/縩Μ絃基
縩 = 1/縩
縩 = ts(縩,start=c(2000,1),frequency=12)
plot(縩秨絃基,ylab="基",main="縩筿る基ǐ墩",lwd=2)
lines(縩程蔼基,lty=2,col="2",lwd=2)
lines(縩程基,lty=3,col="3",lwd=2)
lines(縩Μ絃基,lty=4,col="4",lwd=2)
legend("bottomright",c("秨絃基","程蔼基","程基","Μ絃基"), lty=1:4,lwd=2,
       col=c("1","2","3","4"),bty="n")
