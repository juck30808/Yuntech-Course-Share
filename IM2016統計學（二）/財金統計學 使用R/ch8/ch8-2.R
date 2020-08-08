# 1961:1-2014:2
GDP = read.table("c:\\meiyih\\stat\\ex\\ch1\\GDP.txt")
GDP = GDP[,1]
m = length(GDP)
y = 100*((GDP[5:m]-GDP[1:(m-4)])/GDP[1:(m-4)])
yr = ts(y,start=c(1962,1),frequency=4)
head(y)
tail(y)
yall = embed(y,6) # 將y與其遞延落後1-5期合併
ya = yall[,1]
ya1 = yall[,2] # y之遞延落後1期
ya2 = yall[,3]
ya3 = yall[,4]
ya4 = yall[,5]
ya5 = yall[,6]
n = length(ya)
n

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

h = length(Q1)
Q1 = Q1[6:h]
length(Q1)
Q2 = Q2[6:h]
Q3 = Q3[6:h]
Q4 = Q4[6:h]
trend = 1:length(Q1)

dummy1 = numeric(length(ya))
dummy2 = numeric(length(ya))
dummy3 = numeric(length(ya))
dummy1[44]=1 # 1974Q1
dummy2[48]=1 # 1975Q1
dummy3[182]=1 # 2008Q3
dummya = c(rep(0,142),rep(1,(n-142))) # 1998Q4前後

# 1963Q2-2014Q2
model1 = lm(ya~ya1+ya2+ya4+ya5+Q1+Q2+Q3+trend) 
summary(model1)
res1 = residuals(model1)
 
model2 = lm(ya~ya1+ya2+dummy1+dummy2+dummy3+ya4+ya5+dummya)
summary(model2)
res2 = residuals(model2)
 
model3 = lm(ya~ya1+ya2+dummy1+dummy2+dummy3+ya4+ya5+trend)
summary(model3)
res3 = residuals(model3)

x = seq(-0.2,1.2,length=n)
ft =  1/(1+exp(-x))  
dft1 = ft 
model4 = lm(ya~ya1+dft1+ya2+dummy1+dummy2+dummy3+ya4+ya5)
summary(model4)
res4 = residuals(model4)

# logistic function
x = seq(-0.2,1.2,length=n)
ft =  1/(1+exp(-x))  
dft1 = ft 
windows()
par(mfrow=c(2,2))
plot(x,dft1,type="l",ylab="",main="(a)",lwd=2)
round(dft1,2)
x = seq(-5,6.9,length=n)
ft = 1/(1+exp(-x))
dft2 = ft 
plot(x,dft2,type="l",ylab="",main="(b)",lwd=2)
x = seq(-10,11,length=n)
ft = 1/(1+exp(-x))
dft3 = ft
plot(x,dft3,type="l",ylab="",main="(c)",lwd=2)
x = seq(-17.5,15,length=n)
ft = 1/(1+exp(-x))
dft4 = ft 
plot(x,dft4,type="l",ylab="",main="(d)",lwd=2)

model5 = lm(ya~ya1+dft2+ya2+dummy1+dummy2+dummy3+ya4+ya5)
summary(model5)
res5 = residuals(model5)

model6 = lm(ya~ya1+dft3+ya2+dummy1+dummy2+dummy3+ya4+ya5)
summary(model6)
res6 = residuals(model6)

model7 = lm(ya~ya1+dft4+ya2+dummy1+dummy2+dummy3+ya4+ya5)
summary(model7)
res7 = residuals(model7)

#診斷
Box.test(res1,lag=1, type="Ljung-Box")
Box.test(res1, lag=5, type="Ljung-Box")
Box.test(res1,lag=10, type="Ljung-Box")
Box.test(res1, lag=15, type="Ljung-Box")
Box.test(res1, lag=20, type="Ljung-Box")

Box.test(res2,lag=1, type="Ljung-Box")
Box.test(res2, lag=4, type="Ljung-Box")
Box.test(res2,lag=8, type="Ljung-Box")
Box.test(res2, lag=12, type="Ljung-Box")

Box.test(res3,lag=1, type="Ljung-Box")
Box.test(res3, lag=4, type="Ljung-Box")
Box.test(res3,lag=8, type="Ljung-Box")
Box.test(res3, lag=12, type="Ljung-Box")

Box.test(res4,lag=1, type="Ljung-Box")
Box.test(res4, lag=4, type="Ljung-Box")
Box.test(res4,lag=8, type="Ljung-Box")
Box.test(res4, lag=12, type="Ljung-Box")

# 概似比率檢定
library(lmtest)
lrtest(model2,model1)
lrtest(model3,model1)
lrtest(model4,model1)

dwtest(model1)
dwtest(model4)

# 序列相關檢定
bgtest(model1,order=1,type="F")
bgtest(model1,order=5,type="F")
bgtest(model1,order=10,type="F")
bgtest(model1,order=15,type="F")
bgtest(model1,order=20,type="F")

bgtest(model1,order=1,type="Chisq")
bgtest(model1,order=5,type="Chisq")
bgtest(model1,order=10,type="Chisq")
bgtest(model1,order=15,type="Chisq")
bgtest(model1,order=20,type="Chisq")

bgtest(model2,order=1,type="F")
bgtest(model2,order=5,type="F")
bgtest(model2,order=10,type="F")
bgtest(model2,order=15,type="F")
bgtest(model2,order=20,type="F")

bgtest(model3,order=1,type="F")
bgtest(model3,order=5,type="F")
bgtest(model3,order=10,type="F")
bgtest(model3,order=15,type="F")
bgtest(model3,order=20,type="F")

bgtest(model4,order=1,type="F")
bgtest(model4,order=5,type="F")
bgtest(model4,order=10,type="F")
bgtest(model4,order=15,type="F")
bgtest(model4,order=20,type="F")

bgtest(model4,order=1,type="Chisq")
bgtest(model4,order=5,type="Chisq")
bgtest(model4,order=10,type="Chisq")
bgtest(model4,order=15,type="Chisq")
bgtest(model4,order=20,type="Chisq")

bgtest(model5,order=1,type="F")
bgtest(model5,order=5,type="F")
bgtest(model5,order=10,type="F")
bgtest(model5,order=15,type="F")
bgtest(model5,order=20,type="F")

# 變異數異質檢定
bptest(model1)
res12 = res1^2
model1a = lm(res12~ya1+ya2+ya4+ya5+Q1+Q2+Q3+trend)
summary(model1a)
res1a = residuals(model1a)
SSE = sum(res1a^2)
T = length(res12) 
SST = var(res12)*(T-1)
SSR = SST-SSE
R2 = SSR/SST
R2
F = (R2/8)/((1-R2)/(T-8-1))
F
T*R2
(T-4)*R2

bptest(model1)
bptest(model4)

# White test
summary(model4)
res42 = res4^2
W1 = ya1+dft1+ya2+dummy1+dummy2+dummy3+ya4+ya5
W2 = ya1*W1
W3 = ya2*W1
W4 = dft1*W1
W5 = dummy1*W1
W6 = dummy2*W1
W7 = ya4*W1
W8 = ya5*W1
W9 = dummy3*W1     
model4a = lm(res42~W1+W2+W3+W4+W5+W6+W7+W8+W9)
summary(model4a)
res4a = residuals(model4a)
T = length(res42)
SSE4a = sum(res4a^2)
SST4a = var(res42)*(T-1)
SSR4a = SST4a-SSE4a
R2 = SSR4a/SST4a
R2
F = (R2/9)/((1-R2)/(T-9-1))
F
1-pf(F,9,(T-9-1))
chi = (T-9)*R2
chi    
1-pchisq(chi,9)

# White's robust se
library(sandwich)
coeftest(model4,df = Inf, vcov = vcovHC(model4, type = "HC0"))

# Reset test
resettest(model1,power=2,type="fitted")
resettest(model1,power=2:3,type="fitted")

resettest(model4,power=2,type="fitted")
resettest(model4,power=2:3,type="fitted")


# Normal distribution test
library(fBasics)
windows()
par(mfrow=c(2,1))
res1n = res1/sd(res1)
ksnormTest(res1n) # 於fBasics內
ks.test(res1n,"pnorm")
Fx = ecdf(res1n)
sFx = sort(Fx(res1n))
x = sort(res1n)
plot(x,sFx,type="l",ylab="",xlab="",main="模型1估計殘差值之實際與理論CDF",lwd=2)
lines(x,pnorm(x),lty=1,col="red",lwd=2) 
legend("topleft",c("實際","理論"),lty=c(1,1),col=c("black","red"),bty="n",lwd=2)
D = sFx-pnorm(x)
max(abs(D))

res4n = res4/sd(res4)
ksnormTest(res4n)
ks.test(res4n,"pnorm")
Fx = ecdf(res4n)
sFx = sort(Fx(res4n))
x = sort(res4n)
plot(x,sFx,type="l",ylab="",xlab="",main="模型4估計殘差值之實際與理論CDF",lwd=2)
legend("topleft",c("實際","理論"),lty=c(1,1),col=c("black","red"),bty="n",lwd=2)
lines(x,pnorm(x),lty=1,col="red",lwd=2) 
D = sFx-pnorm(x)
max(abs(D))

basicStats(res1n)
basicStats(res4n)
jarqueberaTest(res1n)
jarqueberaTest(res4n)








