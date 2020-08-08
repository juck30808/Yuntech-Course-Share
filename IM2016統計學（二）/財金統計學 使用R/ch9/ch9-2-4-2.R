# MLE
# 9/5/1994-7/10/2014
tsmctwi = read.table("c:\\meiyih\\Finstats\\ch9\\tsmctwi.txt",header=T)
names(tsmctwi)
attach(tsmctwi)
p1 = TSMC # 收盤價
p2 = TWI
tsmcr = 100*diff(log(p1))
library(MASS)
y1 = tsmcr
# fitt
fitt = fitdistr(y1,"t")
summary(fitt)
fitt$estimate #其估計值分別為平均值、尺度以及自由度
fitt$sd # 估計的標準誤
fitt$vcov
fitt$loglik
fitt$n

# Using fGarch Package
library(fGarch)
model = stdFit(y1)
model
summary(model)
model$par # 可與fitt$estimate比較
-model$objective #應注意其是使用nlm
model$evaluations

# 標準差之估計: 變異數=(lambda^2)*nu/(nu-2) 
lambda = fitt$estimate[2]
lambda = as.numeric(lambda)
lambda
nu = as.numeric(fitt$estimate[3])
nu
sqrt((nu*lambda^2)/(nu-2)) # 標準差
model$par[2]

# Using nlm
# using dstd
mlogt = function(b, x) 
{
 sum(-dstd(x,mean=b[1],sd=b[2],nu = b[3],log = TRUE))
}
b = c(0,1,3) # 期初值
out2 = nlm(mlogt,b,x=y1,hessian=T)
out2
-out2$minimum # 與-model$objective或fitt$loglik相同
H2 = -out2$hessian/T # 應注意以平均數表示
H2
-round(out2$hessian/T,4)  
Inform2 = -H2
invI = 1/Inform2
se2 = diag(sqrt(invI/T))
se2 # 可與fitt$sd比較 # 估計的標準誤


# Using optim
?optim
#optim亦是求取最小值
b = c(mean(y1),sd(y1),3)
z = y1
start = b
model_t = optim(start, mlogt, x=z, method="BFGS", hessian=T)
model_t
-model_t$value # 與-model$objective或fitt$loglik相同









