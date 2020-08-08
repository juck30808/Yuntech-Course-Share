# 讀取資料
# 1/4/2000-7/10/2014
# 台積電 (TSMC) 日收盤價 (除權息調整後) 與本益比 (TSE)
tsmcpper = read.table("x:\\fsr\\ch1\\tsmcpper.txt") # 讀取資料
tsmcp = tsmcpper[,1] # 令第一行為股價
tsmcper = tsmcpper[,2] #令第二行為本益比

windows() #開一個繪圖的視窗
par(mfrow=c(2,1)) # 2列1行圖
ts.plot(tsmcp, ylab="TSMC日收盤價", main="TSMC日收盤價之時間走勢",lwd=2) # 時間圖
ts.plot(tsmcper, ylab="TSMC日本益比", main="TSMC日本益比之時間走勢",lwd=2)

# 轉成 (預估) 股利
tsmcdiv = tsmcper/tsmcp
tsmcdiv = 1/tsmcdiv

windows()
par(mfrow=c(1,2)) # 1列2行圖
# 散佈圖
plot(tsmcper,tsmcp,type="l", ylab="日收盤價", xlab="日本益比", main="台積電",lwd=2)
# 注意type之不同
abline(lm(tsmcp~tsmcper),col="blue") # 二者之間的直線關係,顏色為藍色
plot(tsmcdiv,tsmcp,type="p", ylab="日收盤價", xlab="日股利", main="台積電",lwd=2)
abline(lm(tsmcp~tsmcdiv), col="blue") #繪出迴歸線
