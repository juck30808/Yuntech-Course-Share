tsmctwi = read.table("c:\\meiyih\\Finstats\\ch9\\tsmctwi.txt",header=T)
names(tsmctwi)
attach(tsmctwi)
p1 = TSMC # 收盤價
p2 = TWI # 收盤價
tsmcr = 100*diff(log(p1))
twir = 100*diff(log(p2))

# 不對稱
# Using rugarch 程式套件
library(rugarch)
?ugarchspec
# GARCH(1,1)
spec1 = ugarchspec(variance.model=list(model="sGARCH",garchOrder=c(1,1))
         ,mean.model=list(armaOrder=c(0,0),include.mean=F),
        distribution.model = "norm")
model.1 = ugarchfit(spec1,data=tsmcr)
model.1

# GJRGARCH模型
spec2 = ugarchspec(variance.model=list(model="gjrGARCH",garchOrder=c(1,1))
         ,mean.model=list(armaOrder=c(0,0),include.mean=F),
        distribution.model = "norm")
model.2 = ugarchfit(spec2,data=tsmcr)
model.2
coef(model.2)
persistence(model.2) # 持續性

# 訊息衝擊曲線
ni1 = newsimpact(z=NULL,model.1)
ni2 = newsimpact(z=NULL,model.2)
ni2
windows()
plot(ni1$zx, ni1$zy, ylab=ni1$yexpr, xlab=ni1$xexpr, type="l", lwd=2,
      main = "訊息衝擊曲線")
lines(ni2$zx, ni2$zy,lty=2,col="red",lwd=2)
legend("top",c("GARCH(1,1)","GJRGARCH(1,1)"),lty=1:2,col=c("black","red"),bty="n",lwd=2)

spec3 = ugarchspec(variance.model=list(model="sGARCH",garchOrder=c(1,1))
         ,mean.model=list(armaOrder=c(0,0),include.mean=F),
        distribution.model = "std")
model.3 = ugarchfit(spec3,data=tsmcr)
model.3

# GJRGARCH模型
spec4 = ugarchspec(variance.model=list(model="gjrGARCH",garchOrder=c(1,1))
         ,mean.model=list(armaOrder=c(0,0),include.mean=F),
        distribution.model = "std")
model.4 = ugarchfit(spec4,data=tsmcr)
model.4

# 殘差值標準化
res1 = residuals(model.1,standardize=T)
res1a = residuals(model.1)
sigma1a = sigma(model.1)
res1a = res1a/sigma1a
head(res1)
head(res1a)
res1 = as.numeric(res1)
head(res1)

# ARCH檢定
res1all = embed(res1,5)
r1 = res1all[,1]
r2 = res1all[,2]
r3 = res1all[,3]
r4 = res1all[,4]
r5 = res1all[,5]
summary(lm(r1~r2+r3+r4+r5))
R2 = 0.003262
T = length(res1)
chi = (T-4)*R2
1-pchisq(chi,4)

res4 = as.numeric(residuals(model.4,standardize=T))
res4all = embed(res4,5)
r1 = res4all[,1]
r2 = res4all[,2]
r3 = res4all[,3]
r4 = res4all[,4]
r5 = res4all[,5]
summary(lm(r1~r2+r3+r4+r5))
R2 = 0.003444
T = length(res4)
chi = (T-4)*R2
1-pchisq(chi,4)

# 蒙地卡羅模擬
# 模擬GARCH(1,1)-t-distribution
library(fGarch)
library(rugarch)
N = 2000
alpha = numeric(N)
beta = numeric(N)
alphaN = numeric(N)
betaN = numeric(N)

for(j in 1:N)
{
 T = 2000
 Init = 1000 # 期初值可捨棄 
 garch1 = numeric(T) 
 u1 = rstd(Init+T,mean=0,sd=1,nu=5)
 z1 = u1
 y1 = u1
 h1 = rep(0,Init+T)
 alpha0 = 0.05
 alpha1 = 0.3
 beta1 = 0.65
 h1[1] = alpha0/(1-alpha1-beta1) # 條件變異數之期初值
 u1[1] = rstd(1,mean=0,sd=sqrt(h1[1]),nu=5) # 誤差項之期初值
 for(i in 2:(Init+T))
 {
    h1[i] = alpha0 + alpha1[1]*u1[i-1]^2 + beta1[1]*h1[i-1]
    u1[i] = z1[i]*sqrt(h1[i])
    y1[i] = u1[i]  
 }
 y1 = y1[(Init+1):(Init+T)]
 spec = ugarchspec(variance.model=list(model="sGARCH",garchOrder=c(1,1))
         ,mean.model=list(armaOrder=c(0,0),include.mean=F),
        distribution.model = "std")
 model = ugarchfit(spec,data=y1)
 alpha[j] = as.numeric(coef(model))[2]
 beta[j] = as.numeric(coef(model))[3]

 spec1 = ugarchspec(variance.model=list(model="sGARCH",garchOrder=c(1,1))
         ,mean.model=list(armaOrder=c(0,0),include.mean=F),
        distribution.model = "norm")
 model1 = ugarchfit(spec1,data=y1)
 alphaN[j] = as.numeric(coef(model1))[2]
 betaN[j] = as.numeric(coef(model1))[3]
}
windows()
par(mfrow=c(2,2))
plot(density(alpha),xlab=expression(alpha[1]),main="t-GARCH(1,1)用t分配估計",lwd=2)
abline(v=alpha1,lty=2,col="red",lwd=2)
points(mean(alpha),0,pch=19)
plot(density(beta),xlab=expression(beta[1]),main="t-GARCH(1,1)用t分配估計",lwd=2)
abline(v=beta1,lty=2,col="red",lwd=2)
points(mean(beta),0,pch=19)
alphaN
alphaN = alphaN[!is.na(alphaN)] # 去除有Na的部分
plot(density(alphaN),xlab=expression(alpha[1]),main="使用準QLE估計",lwd=2)
abline(v=alpha1,lty=2,col="red",lwd=2)
points(mean(alphaN),0,pch=19)
betaN = betaN[!is.na(betaN)]
plot(density(betaN),xlab=expression(beta[1]),main="使用準QLE估計",lwd=2)
abline(v=beta1,lty=2,col="red",lwd=2)
points(mean(betaN),0,pch=19)
sd(alpha)
sd(beta)
sd(alphaN)
sd(betaN)
