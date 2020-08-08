# Uniform distribution
?runif
x = runif(10) # 從均等分配 (介於0與1之間) 抽出10個資料
x
y = seq(0,1,length=100) # 於0與1之間分成100等份
y
?ecdf #尋問ecdf為何意
windows()
par(mfrow=c(2,2))
set.seed(123) # 抽取或模擬的源頭
x = runif(100)
head(x)
T = 1:100 # T為1,2,3,...,100
plot(T,x, type="p", xlab=expression(x[i]), lwd=2,
        ylab="實現值", main=" (a) 均等分配的實現值")
Fx = ecdf(x)
Fx
Fx(x)      # 截取得實際的CDF
y1 = Fx(x)
plot(sort(x),sort(Fx(x)), type="l",main="(b) 均等分配之CDF", lwd=2, xlab="x的值 (分位數)",
      ylab="累加機率")
lines(y,punif(y), lty=2, col="red", lwd=2)
legend("topleft", c("實際","理論"), col=c("black","red"), lty=1:2, bty="n",lwd=2)
plot(density(x),main="(c) 均等分配之PDF", xlab="x", ylab="機率密度",lwd=2)
lines(y,dunif(y),lty=2, col="blue",lwd=2)
segments(0,0,0,1,lty=2,col="blue")
segments(1,0,1,1,lty=2,col="blue")
legend("center", c("實際","理論"), col=c("black","blue"), lty=1:2, bty="n",lwd=2)
ep = knots(Fx) # 從Fx內截取實際的分位數
y1 = sort(y1)
plot(y1,quantile(ep,prob=y1),main="(d) 均等分配之分位數", type="l", lwd=2,
              xlab="累加機率",ylab="分位數") # y1是機率
lines(y1,qunif(y1),lty=2,col="red",lwd=2)
legend("topleft", c("實際","理論"), col=c("black","red"), lty=1:2, bty="n",lwd=2)

 
