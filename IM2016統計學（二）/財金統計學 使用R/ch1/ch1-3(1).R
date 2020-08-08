# R的簡介

# inputting data
x = 10
x

y = c(2,4,6,8)
y

z = c(y,x)
z[3:4]

Y = matrix(0,2,3) #Y矩陣2列3行裡面的元素皆為0
Y #應注意大小寫之不同
y

dim(y) #y不是矩陣或向量
y = matrix(y,1,4)
dim(y) #1列4行
dim(Y) 

h = seq(1:15)
h
k = seq(from=1,to=15,length=100)
k
j = seq(1,15,by=1.5)
j

# 讀取資料
# 1/4/2000-7/10/2014
# 台積電 (TSMC) 日收盤價 (除權息調整後) 與本益比 (TSE)
tsmcpper = read.table("x:\\meiyih\\stat\\ch1\\tsmcpper.txt") # 讀取資料
tsmcp = tsmcpper[,1] # 令第一行為股價
tsmcper = tsmcpper[,2] #令第二行為本益比

TWIm = read.table("x:\\meiyih\\stat\\ch2\\TWIm.txt",header=T) # 有名稱的檔案
names(TWIm) # 裡面變數名稱
attach(TWIm) # 接近此檔案
開盤價 = ts(開盤價,start=c(2000,1),frequency=12) # 變數有對應的時間
開盤價

x = 1:10
y = 1:6
z = x^(1/3)
z
d = x != 2
d
i = y >= 3
i
as.numeric(d) #1為真0為假
as.numeric(i) #1為真0為假

x1 = !y
x1

z1 = x > 2 & y <=4
z1

z2 = x>=2 | y<=4
z2

sum(x)
max(x)
min(x)
var(x)
sd(x)
range(x)

library(moments)
skewness(x)# 計算偏態係數，可參考下一章
kurtosis(x)# 計算峰態係數，可參考下一章
x1 = rnorm(20) # 從標準常態分配內抽出20個觀察值
x1
kurtosis(x1)
sort(x1)
y1 = runif(20) # 從均等分配內抽出20個觀察值
cor(x1,y1)# 計算共變異數，可參考下一章
cov(x1,y1)# 計算相關係數，可參考下一章
log(x)
exp(x)
sqrt(x)

# 矩陣的操作
X = matrix(c(1,2,3,4),2,2) # 2列2行
X
X_1 = solve(X)
X_1
X_1%*%X
x = matrix(c(1,2),1,2) # 列向量
x
y = matrix(c(1,2,3),3,1) #行向量
y
t(y)
t(x)

r1 = matrix(runif(10),10,1)
r1
r2 = matrix(runif(10),10,1)
r2
r = cbind(r1,r2)
r
r[4,2]
r[,1]  # 取出r之第1行
r[2,]  # 取出r之第2列
diag(3) # 對角矩陣其值皆為1其餘為0
eigen(X) # X之特性根與向量

# 統計分配
x = rbinom(100,3,0.5) # 從二項分配內3個試驗成功的機率為0.5抽出100個觀察值
windows()
hist(x,prob=T)
pbinom(2,3,0.5) # 累加機率
y = rpois(100,lambda=2) # 從卜瓦松分配其平均數為2內抽出100個觀察值
windows()
hist(y,prob=T)


# 自訂函數
t_meandiff = function(x,y)
{
m = length(x)
n = length(y)
sp = sqrt(((m-1)*sd(x)^2+(n-1)*sd(y)^2)/(m+n-2))
t_stat = (mean(x)-mean(y))/(sp*sqrt(1/m+1/n))
return(t_stat)
}

x = rnorm(20,mean=0.5)
y = rnorm(10,mean=0.3, sd=0.2)
t_meandiff(x,y)


# Using loops
T = 100
y = numeric(T) # y變數內共有T個元素皆為0
set.seed(12)
for(i in 2:T)
{
 y[i] = 0.05 + y[(i-1)] + rnorm(1)
}
windows()
par(mfrow=c(2,1))
plot(y,type="l",lwd=2)

# Using while
T = 200
i = 2
x = numeric(T) # x變數內共有T個元素皆為0
while (i <= T)
{
  x[i] = x[(i-1)] + 0.5*rnorm(1)
  i = i+1
}
plot(x,type="l",lwd=2)

# 條件
# 上述TSMC之報酬率
T = length(tsmcp)
r = 100*(tsmcp[2:T]-tsmcp[1:(T-1)])/tsmcp[1:(T-1)] #2:T表示第2至第T個
T = length(r) 
T
r1 = numeric(T)
r2 = numeric(T)
for(i in 1:T)
{
   if(r[i] <= -2)
   { 
      r1[i] = r[i] 
   }
   else
   {
      r2[i] = r[i]
   }
}
del = r1 == 0
del
del1 = as.numeric(del) #true為1,false為0
del1
r1a = r1[-del1==0] #去除0之元素
r1a 
del2 = as.numeric(r2==0)
r2a = r2[-del2==0]
r2a
length(r1a)+length(r2a)  
T

index = r <= -2
index = as.numeric(index)
r1b = r[-index==0]
r1b

index = r > -2
index = as.numeric(index)
r2b = r[-index==0]
r2b
length(r1b)+length(r2b)  
T
