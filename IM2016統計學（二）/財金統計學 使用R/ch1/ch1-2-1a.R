# 讀取資料
# 1/4/2000-7/10/2014
# 台積電 (TSMC) 日收盤價 (除權息調整後) 與本益比 (TSE)
tsmcpper = read.table("x:\\FSR\\ch1\\tsmcpper.txt") # 讀取資料
tsmcp = tsmcpper[,1] # 令第一行為股價
tsmcper = tsmcpper[,2] #令第二行為本益比
T = length(tsmcp)
r = 100*(tsmcp[2:T]-tsmcp[1:(T-1)])/tsmcp[1:(T-1)]

# 台積電的日報酬率的例子
windows()
par(mfrow=c(2,2))
plot(1:length(r),r,xlab="時間",ylab="日報酬率", type="p",lwd=2,
      main="(a) 台積電的日報酬率之散佈圖")
Ftsmc = ecdf(r)
plot(Ftsmc,main="(b) 台積電日報酬率之實際CDF",xlab="日報酬率",ylab="累加機率",lwd=2)
r[1500]
Ftsmc(r)[1500]
Fx = Ftsmc(r)
points(r[1500],Ftsmc(r)[1500],lwd=3)
hist(r,breaks=100,prob=T,main="(c) 台積電日報酬率之實際機率分配",ylab="機率密度",lwd=2)
lines(density(r),lty=2,col="red",lwd=2)
plot(Fx,quantile(r,prob=Fx),xlab="機率",ylab="分位數", lwd=2,
        main="(d) 台積電日報酬率之分位數" )

# 去除日報酬率為0的部分
r0 = r == 0
r0
z.index = as.numeric(r == 0) # TRUE為1,FALSE為0
r1 = r[-z.index==0] # 去掉去除日報酬率為0的部分
r1

r = r1
windows()
par(mfrow=c(2,2))
plot(1:length(r),r,xlab="時間",ylab="日報酬率", type="p",lwd=2,
      main="(a) 台積電的日報酬率之散佈圖")
Ftsmc = ecdf(r)
plot(Ftsmc,main="(b) 台積電日報酬率之實際CDF",xlab="日報酬率",ylab="累加機率",lwd=2)
r[1500]
Ftsmc(r)[1500]
Fx = Ftsmc(r)
points(r[1500],Ftsmc(r)[1500],lwd=3)
hist(r,breaks=100,prob=T,main="(c) 台積電日報酬率之實際機率分配",ylab="機率密度",lwd=2)
lines(density(r),lty=2,col="red",lwd=2)
plot(Fx,quantile(r,prob=Fx),xlab="機率",ylab="分位數",lwd=2,
        main="(d) 台積電日報酬率之分位數" )

# 日報酬率與標準常態分配比較
T = length(r)
zr = (r-mean(r))/sd(r) # 標準化
Fzr = ecdf(zr)
windows()
par(mfrow=c(2,2))
plot(1:T,zr,xlab="",ylab="",main="(a) 日報酬率與標準常態模擬值",lwd=2)
z = seq(min(zr),max(zr),length=T)
lines(1:T,rnorm(T), type="p", col="red",lwd=2)
plot(zr,Fzr(zr),xlab="quantile",ylab="CDF", main="(b) E_CDF and N_CDF",lwd=2)
lines(z,pnorm(z), lty=2, lwd=3, col="red")
legend("topleft", c("實際","標準常態"), col=c("black","red"),
      lty=1:2, lwd=c(2,3))
hist(zr,breaks=100,prob=T,xlab="z", main="(c) E_PDF and N_PDF",lwd=2)
lines(density(zr),lty=2,col="blue",lwd=2)
lines(z,dnorm(z), lty=3, col="red",lwd=2)
legend("topleft",c("直方","實際","標準常態"), lty=1:3,lwd=2,
       col=c("black","blue","red"), bty="n")
plot(Fzr,quantile(zr,prob=Fzr(zr)), xlab="probability", ylab="quantile", lwd=2,
     main="(d) E_quantile and N_quantile")
lines(Fzr,qnorm(Fzr(zr)),lty=2,col="red",lwd=2)
legend("topleft", c("實際","標準常態"), col=c("black","red"),
      lty=1:2, lwd=c(2,2),bty="n")
