# weekly data, 1/7/2000-7/4/2014
TSMCw = read.table("x:\\Finstats\\ch3\\TSMCw.txt", header=T)
names(TSMCw)
attach(TSMCw)
x = Μ絃基
library(fBasics)
basicStats(x) # 膀セ参璸秖
#
div = セ痲ゑ/x
div = 1/div
n = length(div)
# 癸计厨筍瞯
xr = 100*(log(x[2:n]+div[2:n])-log(x[1:(n-1)]))
basicStats(xr)
windows()
par(mfrow=c(2,1))
hist(x,n=5, xlab="基",ylab="Ω计",main="基Ω计だ皌", border="pink",lwd=2,
            col="steelblue")
hist(xr,n=7, xlab="癸计厨筍瞯",ylab="Ω计", border="green",
           main="癸计厨筍瞯Ω计だ皌", col="red",lwd=2)
hp = hist(x,n=5,plot=F)
hp
pfi = round(hp$counts/n,2)
pfi
pmidi = hp$mids
pmidi
mean(x)
sum(pfi*pmidi)

m = length(xr)
hr = hist(xr,breaks=7,plot=F)
hr
rfi = round(hr$counts/m,2)
rfi
rmidi = hr$mids
rmidi
mean(xr)
sum(rmidi*rfi)
