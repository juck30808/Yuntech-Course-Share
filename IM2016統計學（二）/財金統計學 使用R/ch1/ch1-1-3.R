# 1/4/2000-7/10/2014
# 台積電 (TSMC) 日收盤價 (除權息調整後) 與本益比 (TSE)
tsmcpper = read.table("x:\\fsr\\ch1\\tsmcpper.txt") # 讀取資料
tsmcp = tsmcpper[,1] # 令第一行為股價
tsmcper = tsmcpper[,2] #令第二行為本益比
# 一個較複雜的問題
# 得出每隔10天的最高日與最低報酬率的分配
T = length(tsmcp) # 令tsmcp的長度為T
T
# 改成簡單日報酬率
r = 100*(tsmcp[2:T]-tsmcp[1:(T-1)])/tsmcp[1:(T-1)] #2:T表示第2至第T個
T = length(r)
T
r = r[4:T] # 取4日後日報酬率的資料並令其為r
T = length(r)
T
m = 10
maxr = numeric((T/m)) # 預備一個儲存空間有T/m個,其內元素皆為0
minr = numeric((T/m))
for(i in 1:(T/m)) # 進行一個小迴圈i從1至T/m (即362)
{
  h = (i-1)*m + 1
  k = i*m
  maxr[i] = max(r[h:k])
  minr[i] = min(r[h:k])
}
windows()
par(mfrow=c(2,1))
hist(maxr,main="每隔10天最大日報酬率之次數分配",xlab="最大值",lwd=2)
freqmax = hist(maxr,plot=FALSE) # 觀察hist指令裡面的結果,不繪圖
freqmax
segments(2.75,0,2.75,51,col="black") # 畫一條線段前二個為起點坐標後二者則為尾之坐標
points(2.75,51,cex=2,pch=20) # 標出坐標 (2.75,51)以黑點表示, 有2倍大
hist(minr,main="每隔10天最小日報酬率之次數分配",xlab="最小值",lwd=2) # 畫直方圖有title
freqmin = hist(minr,plot=FALSE)
freqmin
segments(-2.25,0,-2.25,68,col="red")
points(-2.25,68,cex=2,pch=18) # # 以菱形點表示