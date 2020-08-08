#ch8
# 1961:1-2014:2
GDP = read.table("c:\\meiyih\\stat\\ex\\ch1\\GDP.txt")
GDP = GDP[,1]
m = length(GDP)
y = 100*((GDP[5:m]-GDP[1:(m-4)])/GDP[1:(m-4)])
yr = ts(y,start=c(1962,1),frequency=4)
windows()
plot(yr,type="l",ylab="名目經濟成長率",main="1962:1-2014:2期間台灣名目經濟成長率走勢",lwd=2)
points(1974.1,yr[49],pch=20)
points(1975.1,yr[53],pch=20)
text(1974.1,yr[49],labels="1974Q1",pos=4)
text(1975.1,yr[53],labels="1975Q1",pos=4)
points(1976.4,yr[60],pch=20)
text(1976.4,yr[60],labels="1976Q4",pos=3)
h = 1:147
k = 148:length(yr)
meana = mean(yr[h])
meana
segments(1962.1,meana,1998.4,meana,lty=2,col="red")
meanb = mean(yr[k])
meanb
segments(1998.4,meanb,2014.2,meanb,lty=2,col="blue")
text(1998.4,meanb,labels="1998Q4",pos=1)
points(1998.4,meanb,pch=20)
points(2008.3,yr[187],pch=20)
points(2008.4,yr[188],pch=20)
points(2009.1,yr[189],pch=20)
text(2008.4,yr[188],labels="2008Q4",pos=1)

# 自我相關與偏自我相關係數
windows()
par(mfrow=c(3,2))
acf(yr,main="(a) 名目經濟成長率之ACF (整個期間)",lwd=2)
pacf(yr,main="(b) 名目經濟成長率之PACF (整個期間)",lwd=2)
acf(yr[1:147],main="(c) 名目經濟成長率之ACF (結構1)",lwd=2)
pacf(yr[1:147],main="(d) 名目經濟成長率之PACF (結構1)",lwd=2)
acf(yr[148:length(yr)],main="(e) 名目經濟成長率之ACF (結構2)",lwd=2)
pacf(yr[148:length(yr)],main="(f) 名目經濟成長率之PACF (結構2)",lwd=2)

# 季節虛擬變數
yr
length(yr)
Q1 = rep(c(1,0,0,0),length(yr)/4)
Q1
length(Q1) # 與yr相比較差2個元素
Q1 = c(Q1,1,0) # 補上2個元素與yr相同
Q1
length(Q1)
Q2 = rep(c(0,1,0,0),length(yr)/4)
Q2 = c(Q2,0,1)
Q2
Q3 = rep(c(0,0,1,0),length(yr)/4)
Q3 = c(Q3,0,0)
Q3
Q4 = rep(c(0,0,0,1),length(yr)/4)
Q4 = c(Q4,0,0)
Q4
trend = 1:length(yr)
trend

# # 模擬
n = length(yr)
x = numeric(n)
set.seed(1234)
for(i in 2:n)
{
 x[i] = 0.2*x[(i-1)]+0.8*Q1[i]-1*Q2[i]-0.55*Q3[i]+0.7*Q4[i]+rnorm(1)
}
windows()
par(mfrow=c(3,1))
plot(x,type="l",main="(a) 季節性之模擬",lwd=2)
acf(x,main="(b) ACF",lwd=2)
pacf(x,main="(c) PACF",lwd=2)
xa = x[2:n]
xa1 = x[1:(n-1)]
summary(lm(xa~xa1+Q1[2:n]+Q2[2:n]+Q3[2:n]))

model = lm(yr~Q1+Q2+Q3+Q4+trend-1) #不含常數項
summary(model)
# AR(1) 模型
yrh = yr[2:n]
yrh1 = yr[1:(n-1)]
Q1h = Q1[2:n]
Q2h = Q2[2:n]
Q3h = Q3[2:n]
Q4h = Q4[2:n]
trendh = trend[2:n]
summary(lm(yrh~yrh1+Q1h+Q2h+Q3h+Q4h+trendh-1))

m = length(yr)
yra = yr[1:125]
Q1a = Q1[1:125]
Q2a = Q2[1:125]
Q3a = Q3[1:125]
Q4a = Q4[1:125]
trenda = trend[1:149]
summary(lm(yra~Q1a+Q2a+Q3a+Q4a+trenda-1))
g = 150:m
yrb = yr[g]
Q1b = Q1[g]
Q2b = Q2[g]
Q3b = Q3[g]
Q4b = Q4[g]
trendb = trend[g]
summary(lm(yrb~Q1b+Q2b+Q3b+Q4b+trendb-1))
