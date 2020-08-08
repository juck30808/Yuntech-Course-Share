# 集合圖
library(plotrix)
windows()
par(mfrow=c(2,2))
plot(c(-1, 1), c(-1,1), type = "n", xlab="", ylab="", axes=F, main="(a)", 
    frame.plot = T)
draw.circle( -0.5, 0, 0.5, col="green",lwd=2)
text(-0.5,0,labels="A",pos=3,cex=2)
text(0.5,0.8, labels="S", pos=3,cex=2)
text(0.5,0, labels=expression(A^c),pos=3,cex=2)

plot(c(-1, 1), c(-1,1), type = "n", xlab="", ylab="", axes=F, main="(b)",
    frame.plot = T)
draw.circle( -0.5, 0, 0.4, col="tomato",lwd=2)
text(-0.5,0,labels="A",pos=3,cex=2)
draw.circle( 0.5, -0.1, 0.5,col="forestgreen",lwd=2)
text(0.2,0,labels="B",pos=3,cex=2)
text(0.5,0.8, labels="S", pos=3,cex=2)
 

plot(c(-1, 1), c(-1,1), type = "n", xlab="", ylab="", axes=F,main="(c)", 
    frame.plot = T)
draw.circle( -0.5, 0, 0.4, col="steelblue",lwd=2)
text(-0.5,0,labels="A",pos=3,cex=2)
draw.circle( 0.1, -0.1, 0.5,col="pink",lwd=2)
text(0.2,0,labels="B",pos=3,cex=2)
text(-0.18,-0.1, labels=expression(intersect(B)), pos=3,cex=2)
text(-0.3,-0.1, labels="A", pos=3,cex=2)
text(0.5,0.8, labels="S", pos=3,cex=2)
draw.circle( -0.5, 0, 0.4, lty=2,lwd=2)

# weekly data, 1/7/2000-7/4/2014
TSMCw = read.table("c:\\meiyih\\Finstats\\ch3\\TSMCw.txt", header=T)
names(TSMCw)
attach(TSMCw)
x = 收盤價
x
sort(x)
windows()
plot(x)
library(fBasics)
basicStats(x)

index = x >= mean(x)
index
pbar = mean(as.numeric(index))
pbar

index = x <= 32 & x >= 68.9 # "&"是指"且"
index
pbar = mean(as.numeric(index))
pbar

index = x <= 32 | x >= 68.9 # "|"是指"或"
pbar = mean(as.numeric(index))
pbar

index = x <= 32  
pbar = mean(as.numeric(index))
pbar

index = x >= 68.9  
pbar = mean(as.numeric(index))
pbar











