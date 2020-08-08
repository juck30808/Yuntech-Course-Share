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
ya5 = yall[,6] # y之遞延落後5期
n = length(ya)
n

dummy1 = numeric(length(ya))
dummy2 = numeric(length(ya))
dummy3 = numeric(length(ya))
dummy1[44]=1 # 1974Q1
dummy2[48]=1
dummy3[182]=1 # 2008Q3
dummya = c(rep(0,142),rep(1,(n-142))) # 1998Q4前後

# logistic function
x = seq(-0.2,1.2,length=n)
ft =  1/(1+exp(-x))  
dft1 = ft 
windows()
par(mfrow=c(2,2))
plot(x,dft1,type="l",ylab="",main="(a)",lwd=2)
abline(v=x[138],lty=2)
dft1[143]
x = seq(-5,6.9,length=n)
ft = 1/(1+exp(-x))
dft2 = ft 
plot(x,dft2,type="l",ylab="",main="(b)",lwd=2)
abline(v=x[143],lty=2)

x = seq(-10,11,length=n)
ft = 1/(1+exp(-x))
dft3 = ft
plot(x,dft3,type="l",ylab="",main="(c)",lwd=2)
abline(v=x[143],lty=2)

x = seq(-17.5,15,length=n)
ft = 1/(1+exp(-x))
dft4 = ft 
plot(x,dft4,type="l",ylab="",main="(d)",lwd=2)
abline(v=x[143],lty=2)

model4 = lm(ya~ya1+dft1+ya2+dummy1+dummy2+dummy3+ya4+ya5)
summary(model4)
res4 = residuals(model4)

dft1[143]*(-11.15)
dft1[n]*(-11.15)


model5 = lm(ya~ya1+dft2+ya2+dummy1+dummy2+dummy3+ya4+ya5)
summary(model5)
res5 = residuals(model5)

model6 = lm(ya~ya1+dft3+ya2+dummy1+dummy2+dummy3+ya4+ya5)
summary(model6)
res6 = residuals(model6)

model7 = lm(ya~ya1+dft4+ya2+dummy1+dummy2+dummy3+ya4+ya5)
summary(model7)
res7 = residuals(model7)


 






