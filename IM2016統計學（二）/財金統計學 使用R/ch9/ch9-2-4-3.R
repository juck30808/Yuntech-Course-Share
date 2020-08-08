# MLE
# 9/5/1994-7/10/2014
tsmctwi = read.table("c:\\meiyih\\Finstats\\ch9\\tsmctwi.txt",header=T)
names(tsmctwi)
attach(tsmctwi)
p1 = TSMC # 收盤價
p2 = TWI # 收盤價
# Probit regression
tsmcr = 100*diff(log(p1))
twir = 100*diff(log(p2))

x = tsmcr
xa = abs(x)
xall = embed(xa,2)
x1 = xall[,1]
x2 = xall[,2] # Lag 1
summary(lm(x1~x2))

ind = x1 >= sd(x1)
y = as.numeric(ind)
windows()
par(mfrow=c(3,1))
plot(x2,y,type="p",main="模型 a",ylab="",xlab=expression(y[t-1]),lwd=2)
#abline(lm(y~x2),col="red")
modela = glm(y~x2, family = binomial(link = "probit"))
summary(modela)
fit = fitted(modela)
lines(sort(x2),sort(fit),col="blue",lwd=2)

T = length(x)
xb = x[2:T]
I = xb <= 0
I = as.numeric(I) # I為指標函數
neg = I*x2
pos = (1-I)*x2
summary(lm(x1~neg+pos))
modelb = glm(y~neg+pos,family=binomial(link="probit"))
summary(modelb)
fita = fitted(modelb)
plot(neg,fita,type="p",xlab=expression(paste(I[t-1],".",y[t-1])),ylab="累積機率",
        main="模型 b",lwd=2)
abline(h=0.54,lty=2,lwd=2)
plot(pos,fita,type="p",xlab=expression(paste("(1-",I[t-1],").",y[t-1])),ylab="累積機率",
        main="模型 b",lwd=2)
abline(h=0.54,lty=2,lwd=2)

# try modela
# 對數概似函數 (不受限制之Probit)
T = length(x2)
unprobit = function (b,y,x)
 {
  p = pnorm(x %*% b) # 注意是用矩陣表示
  LL = -mean(y*log(p)+(1-y)*log(1-p))
  return (LL)
}
x2m = matrix(x2,T,1) # 轉成以矩陣表示
ones = matrix(rep(1,T),T,1) # 常數項皆為1,以矩陣表示
depx = cbind(ones,x2m) # 二矩陣之行合併,只有一個解釋變數
head(depx)

# 使用MLE估計受限制之Probit
b0 = matrix(c(0.1,0.1),2,1)  # 設期初值
modela1 = optim(b0, unprobit, x=depx, y=y, method="BFGS", hessian=T) 
theta1 = modela1$par # 參數估計值,可與modela比較
l1 = modela1$val
h = modela1$hessian  
cov = (1/T)*solve(h)
sqrt(cov) # 標準誤,可與modela比較
l1 = l1*T*2 # 可與modela比較
l1

# pseudo-Rsquare
1-modela$deviance/modela$null.deviance

#  受限制probit之LL
reprobit = function(b,y) 
{  
  p  = pnorm(b) 
  LL = -mean(y*log(p)+(1-y)*log(1-p))
  return(LL)
}
# 使用 MLE估計受限制之probit      
b0 = qnorm(mean(y),0,1)
modela2 = optim(b0, reprobit, y=y, method="BFGS", hessian=T) 
theta = modela2$par
reL = modela2$val
H = modela2$hessian 
reL = reL*T*2
reL

# try modelb
negm = matrix(neg,T,1)
posm = matrix(pos,T,1)
depxb = cbind(ones,negm,posm)
b0 = matrix(c(0.1,0.1,0.1),3,1)  
modelb1 = optim(b0, unprobit, x=depxb, y=y, method="BFGS", hessian=T) 
modelb1
summary(modelb)
modelb1$par
h = modelb1$hessian 
cov = (1/T)*solve(h)
sqrt(cov)
l1 = modelb1$val
l1 = l1*T*2
l1
