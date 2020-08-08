# Monthly TSMC and TWI
# 1/2000-6/2014
tsmcm = read.table("c:\\meiyih\\Finstats\\ch7\\tsmcm.txt", header=T)
attach(tsmcm)
names(tsmcm)
tsmc.r = 100*diff(log(收盤價))
twim = read.table("c:\\meiyih\\Finstats\\ch7\\twim.txt", header=T)
attach(twim)
names(twim)
# interest rates 1/2000-6/2014
# 央行一個月期存款牌告利率01/00-05/14
int = read.table("c:\\meiyih\\Finstats\\ch7\\interestrate.txt")
int = int[,1]
twi.r = 100*diff(log(收盤價_TW))
length(twi.r)

# 超額報酬率
n = length(int)
int = int[2:n]/12 # 年率轉為月率
y = tsmc.r-int
x = twi.r-int
n = length(y)
n
x1 = x[1:5]
y1 = y[1:5]
data = round(cbind(x1,y1),0)
data
x = data[,1]
y = data[,2]
xbar = mean(x)
ybar = mean(y)
xbar
ybar
x
y
(x[1]-xbar)*(y[1]-ybar)
(x[2]-xbar)*(y[2]-ybar)
(x[3]-xbar)*(y[3]-ybar)
(x[4]-xbar)*(y[4]-ybar)
(x[5]-xbar)*(y[5]-ybar)
sxy = sum((x-xbar)*(y-ybar))
sxy
(x[1]-xbar)^2
(x[2]-xbar)^2
(x[3]-xbar)^2
(x[4]-xbar)^2
(x[5]-xbar)^2
sx = sum((x-xbar)^2)
sx
b1 = sxy/sx
b1 
b0 = ybar-b1*xbar
b0
b0+b1*x[1]
b0+b1*x[2]
b0+b1*x[3]
b0+b1*x[4]
b0+b1*x[5]
e1 = y[1]-(b0+b1*x[1])
e1
e2 = y[2]-(b0+b1*x[2])
e2
e3 = y[3]-(b0+b1*x[3])
e3
e4 = y[4]-(b0+b1*x[4])
e4
e5 = y[5]-(b0+b1*x[5])
e5
sume = sum(y-(b0+b1*x))
sume

model = lm(y~x)
summary(model)
coef(model)
fitted.values(model)
residuals(model)
e1^2
e2^2
e3^2
e4^2
e5^2
SSE = sum((y-(b0+b1*x))^2)
SSE
s = sqrt(SSE/(5-2))
s

SST = var(y)*(5-1)
SST

SSR = SST-SSE
R2 = SSR/SST
SSR
R2

cor(x,y)
sqrt(R2)

qf(0.95,1,3)
1-pf((SSR/(SSE/3)),1,3)

res = residuals(model) # 殘差值
s2 = sum(res*res)/(5-2)
s = sqrt(s2)
s

sb1 = s/sqrt(sx)
sb1

sb0 = sqrt((s^2)*((1/5)+((xbar^2)/sx)))
sb0

cor(res,x)

b0 = as.numeric(coef(model)[1])
b1 = as.numeric(coef(model)[2])
t_b0 = b0/sb0
t_b0
t_b1 = b1/sb1
t_b1
qt(0.975,3)
2*(1-pt(t_b0,3))
2*(1-pt(t_b1,3))
summary(model)

s2/var(y)

xstar = 3
sxx = ((xstar-xbar)^2)/sx
syhatstar = sqrt(s2*((1/5)+sxx))
syhatstar

# 條件平均數之95%預測區間,x=3
(b0+b1*xstar)+qt(0.025,3)*syhatstar
(b0+b1*xstar)+qt(0.975,3)*syhatstar
newdata = data.frame(x=3)
predict(model, newdata, interval="confidence",se.fit=T)
pred = predict(model, newdata, interval="confidence",se.fit=T)
pred$fit[2]

x2 = seq(min(x),max(x), length=100)
newdata1 = data.frame(x=x2)
pred = predict(model, newdata1, interval="confidence",se.fit=T)
fit = pred$fit[,1]
lower = pred$fit[,2]
upper = pred$fit[,3]
windows()
plot(x2,fit,type="l",xlim=c(-15,5),ylim=c(-20,20),lwd=3,xlab="x")
lines(x2,lower,lty=2,col="red",lwd=3)     
lines(x2,upper,lty=2,col="red",lwd=3)  

# 個別y值之95%預測區間,x=3
spred = sqrt((syhatstar^2) + s2)
spred
(b0+b1*xstar)+qt(0.025,3)*spred
(b0+b1*xstar)+qt(0.975,3)*spred
predict(model, newdata, interval="predict",se.fit=T)
pred1 = predict(model, newdata1, interval="predict",se.fit=T)
fit1 = pred1$fit[,1]
lower1 = pred1$fit[,2]
upper1 = pred1$fit[,3]
lines(x2,lower1,lty=4,col="steelblue",lwd=3)     
lines(x2,upper1,lty=4,col="steelblue",lwd=3)  
text(-14,-2,labels=expression(paste(hat(y)," = ",b[0]+b[1]*x)),pos=1)
arrows(-14,-4,-12,-7)
legend("topleft",c("E[y|x]之95%預測區間","個別y值之95%預測區間"),lty=c(2,4),
       col=c("red","steelblue"),bty="n",lwd=3)

# 使用所有的樣本資料
tsmc.r = 100*diff(log(收盤價))
int = read.table("c:\\meiyih\\Finstats\\ch7\\interestrate.txt")
int = int[,1]
twi.r = 100*diff(log(收盤價_TW))
length(twi.r)
# 超額報酬率
n = length(int)
int = int[2:n]/12 # 年率轉為月率
y = tsmc.r-int
x = twi.r-int
n = length(x)
model = lm(y~x)
summary(model)
b1 = as.numeric(coef(model)[2])
sb1 = sqrt(vcov(model)[2,2]) # standard error of b1
# H0:beta1=1
tb1 = (b1-1)/sb1
tb1
# p_value
2*(pt(tb1,(n-2)))
# beta的95%信賴區間
b1+qt(0.025,(n-2))*sb1
b1+qt(0.975,(n-2))*sb1

res = residuals(model)
s2 = sum((res*res))/(n-2)
s2
sqrt(s2) # standard error of regression
s2/var(y)












