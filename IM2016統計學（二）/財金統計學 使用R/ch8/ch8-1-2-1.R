# 虛擬變數的使用
# 自發性的結構改變
x = 1:10
beta0 = 1
beta1 = 1
y = beta0 + beta1*x 
windows()
par(mfrow=c(1,2))
plot(x,y,type="l",lwd=2,main=expression(paste(beta[0],"的改變 (自發性結構改變)")))
text(2,10,labels=expression(paste("E[y] = ",beta[0]+beta[1]*x)),pos=3)
arrows(2,10,4,y[4])
arrows(3,10,4,y[4])
beta0 = 4
y1 = beta0 + beta1*x 
lines(x,y1,lty=2,col="red",lwd=2)
beta0 = -2
y2 = beta0 + beta1*x 
lines(x,y2,lty=3,col="blue",lwd=2)
plot(x,y,type="l",lwd=2,main=expression(paste(beta[1],"的改變 (誘發性結構改變)")))
text(2,10,labels=expression(paste("E[y] = ",beta[0]+beta[1]*x)),pos=3)
arrows(2,10,4,y[4])
arrows(3,10,4,y[4])
beta1 = 0.5; beta0=1
ya = beta0 + beta1*x
lines(x,ya,lty=2,col="blue",lwd=2)
beta1 = 2; beta0=1
ya = beta0 + beta1*x
lines(x,ya,lty=3,lwd=2,col="red")

# 名目經濟成長率
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
# 1963Q2-2014Q2
# 結構改變 
#
# 1999Q4, 123
dummy = c(rep(0,146),rep(1,n-146))
summary(lm(ya~ya1+dummy))
summary(lm(ya~ya1+dummy+ya1*dummy))
summary(lm(ya~ya1))

# 任何時點
h = 1
k = 7
m = n-h
tstat = numeric(m)
tp = numeric(m)
for(i in 1:m)
{
n1 = h+i-1
dummy = c(rep(0,n1),rep(1,n-n1))
dummy = matrix(dummy,n,1)
y1 = matrix(ya,n,1)
x = cbind(rep(1,n),ya1,ya2,ya3,ya4,ya5)
#x = cbind(rep(1,n),ya1)
X = cbind(matrix(x,n,k-1),dummy)
b = solve(t(X)%*%X)%*%t(X)%*%y1
res = y1-X%*%b
s2 = sum(t(res)%*%res)/(n-k)
se = sqrt(s2*solve(t(X)%*%X)[k,k])
bhat = b[k]/se
tstat[i] = bhat
if(bhat >= 0)
{
 tp[i] = 2*(1-pt(bhat,(n-k)))
}
else
{
tp[i] = 2*pt(bhat,(n-k))
}
}
tstat
tp
windows()
par(mfrow=c(2,1))
plot(tstat,type="l",lwd=2,main="t檢定統計量",xlab="Time",ylab="")
plot(tp,type="l",lwd=2,main="t檢定統計量對應之p值",xlab="Time",ylab="")
abline(h=0.05,lty=2,col="red")
points(57,tp[57],lwd=5)
arrows(75,0.5,57,tp[57])
text(75,0.5,labels="1977Q2",pos=3)
points(151,tp[151],lwd=5)
arrows(95,0.5,151,tp[151])
text(95,0.5,labels="2000Q4",pos=3)

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
length(trend)
length(ya)

# 1963Q2-2014Q2,模型 1
model1 = lm(ya~ya1+ya2+ya4+ya5+Q1+Q2+Q3+trend)
summary(model1)
res1 = residuals(model1)

# 模型 2
dummy1 = numeric(length(ya))
dummy2 = numeric(length(ya))
dummy3 = numeric(length(ya))
dummy1[44]=1 # 1974Q1
dummy2[48]=1 # 1975Q1
dummy3[182]=1 # 2008Q3
dummya = c(rep(0,142),rep(1,(n-142))) # 1998Q4前後

model2 = lm(ya~ya1+ya2+dummy1+dummy2+dummy3+ya4+ya5+dummya)
summary(model2)
res2 = residuals(model2)

# 模型 3
model3 = lm(ya~ya1+ya2+dummy1+dummy2+dummy3+ya4+ya5+trend)
summary(model3)
res3 = residuals(model3)

# 模型 4
x = seq(-0.2,1.2,length=n)
ft =  1/(1+exp(-x))  
dft1 = ft 
model4 = lm(ya~ya1+dft1+ya2+dummy1+dummy2+dummy3+ya4+ya5)
summary(model4)
res4 = residuals(model4)

windows()
par(mfcol=c(3,4))
plot(res1,type="l",ylab="",main="模型1之殘差值",lwd=2)
acf(res1,main="估計之ACF",lwd=2)
pacf(res1,main="估計之PACF",lwd=2)
plot(res2,type="l",ylab="",main="模型2之殘差值",lwd=2)
acf(res2,main="估計之ACF",lwd=2)
pacf(res2,main="估計之PACF",lwd=2)
plot(res3,type="l",ylab="",main="模型3之殘差值",lwd=2)
acf(res3,main="估計之ACF",lwd=2)
pacf(res3,main="估計之PACF",lwd=2)
plot(res4,type="l",ylab="",main="模型4之殘差值",lwd=2)
acf(res4,main="估計之ACF",lwd=2)
pacf(res4,main="估計之PACF",lwd=2)

 












