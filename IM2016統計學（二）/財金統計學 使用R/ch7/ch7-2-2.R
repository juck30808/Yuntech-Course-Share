#TWI:三大法人持股市值
# 1/2/2001-9/10/2014
three = read.table("c:\\meiyih\\Finstats\\ch7\\三大法人TWI.txt")
z = three[,1] # 外資
x = three[,2] # 投信
y = three[,3] # 自營商

summary(lm(y~x+z))

#外資 = fis[,1] # 外資
#投信 = fis[,2] # 投信
#自營商 = fis[,3] # 自營商

z = (z-mean(z))/sd(z)
x = (x-mean(x))/sd(x)
y = (y-mean(y))/sd(y)
summary(lm(y~x+z))

windows()
par(mfrow=c(2,2))
plot(z,type="l",xlab="time",ylab="",main="TSMC:三大法人持股市值時間走勢 (標準化)",lwd=2)
lines(x,lty=2,col="red",lwd=2)
lines(y,lty=4,col="blue",lwd=2)
legend("topleft",c("外資","投信","自營商"),lty=1:3,col=c("black","red","blue"),
      bty="n",lwd=2)
plot(z,x,type="p",xlab="外資",ylab="投信",main="外資與投信",lwd=2)
abline(lm(x~z))
plot(z,y,type="p",xlab="外資",ylab="自營商",main="外資與自營商",lwd=2)
abline(lm(y~z))
plot(x,y,type="p",xlab="投信",ylab="自營商",main="投信與自營商",lwd=2)
abline(lm(y~x))

all = cbind(x,y,z)
cor(all)

T = length(z)
T
k = 2

#用最後5個資料
m = 3391:3395
z1 = round(z[m],4)
y1 = round(y[m],4)
x1 = round(x[m],4)
z1
y1
x1
# using matrix
y1 = matrix(y1,5,1) # 5 by 1 向量
ones = rep(1,5) # ones 全為1
X = cbind(ones,x1,z1) # 行合併
X = matrix(X,5,3) # 5 by 3 矩陣,注意大寫
y1
X
t(X)%*%X
t(X)%*%y1
solve(t(X)%*%X)

b = solve(t(X)%*%X)%*%t(X)%*%y1
b
model = lm(y1~x1+z1)
summary(model)
coef(model)

# 用全部的資料
y = matrix(y,T,1)
ones = rep(1,T)
X = cbind(ones,x,z)
X = matrix(X,T,3)
model1 = lm(y~x+z)
summary(model1)
b = solve(t(X)%*%X)%*%t(X)%*%y
b

# residuals
res = y-X%*%b
SSE = t(res)%*%res
SST = var(y)*(T-1)
SSR = SST-SSE
R2 = SSR/SST
R2
s = sqrt(SSE/(T-1-2)) # 注意s仍為矩陣型態
s
s = s[1,1] # 取出元素 
s
X2 = solve(t(X)%*%X)
X2 # 內有負數
sb0 = round(sqrt(X2*(s^2))[1,1],2)
sb0
sb1 = round(sqrt(X2*(s^2))[2,2],2)
sb1
sb2 = round(sqrt(X2*(s^2))[3,3],2)
sb2

# test statistic
t0 = round(b[1]/sb0,2)
t0
t1 = round(b[2]/sb1,2)
t1
t2 = round(b[3]/sb2,2)
t2

# p value
2*(1-pt(t1,(T-k-1)))
2*(1-pt(t2,(T-k-1)))

# adjusted R2
k = 2
Rbar2 = 1-((SSE/(T-k-1))/(SST/(T-1)))
Rbar2
# 變異數分析
SSE
SSR
T-k-1
MSR = SSR/k
MSR
MSE = SSE/(T-k-1)
MSE
F = MSR/MSE
F
summary(model1)
anova(model1)

# critical value alpha=0.05
qf(0.95,k,(T-k-1))
1-pf(F,k,(T-k-1)) # p value

# 外資對自營商
model2 = lm(y~z)
summary(model2)
b = round(coef(model2),2)
b
sb0 = sqrt(vcov(model2)[1,1])
sb0
t0 = b[1]/sb0
t0
sb1 = sqrt(vcov(model2)[2,2])
sb1
t1 = b[2]/sb1
t1
# 外資對投信
model3 = lm(x~z)
summary(model3)
b = round(coef(model3),2)
b
sb0 = sqrt(vcov(model3)[1,1])
sb0
t0 = b[1]/sb0
t0
sb1 = sqrt(vcov(model3)[2,2])
sb1
t1 = b[2]/sb1
t1
# 投信對自營商
model4 = lm(y~x)
summary(model4)
b = round(coef(model4),2)
b
sb0 = sqrt(vcov(model4)[1,1])
sb0
t0 = b[1]/sb0
t0
sb1 = sqrt(vcov(model4)[2,2])
sb1
t1 = b[2]/sb1
t1

res3 = residuals(model3)
res2 = residuals(model2)
res1 = residuals(model1)
res4 = residuals(model4)
windows()
plot(res1,type="l",xlab="殘差值",main="模型1-4之殘差值序列",ylab="",lwd=3)
lines(res2,lty=2,col="red",lwd=3)
lines(res3,lty=3,col="blue",lwd=3)
lines(res4,lty=4,col="green",lwd=3)
legend("topleft",c("模型 1","模型 2","模型 3","模型 4"),lty=1:4,lwd=3,
        col=c("black","red","blue","green"),bty="n")

# 轉成變動率
lz = three[,1] # 外資
lx = three[,2] # 投信
ly = three[,3] #  自營商

lzr = diff(log(lz))
lyr = diff(log(ly))
lxr = diff(log(lx))

#
lz2r = diff(log(lz),2) 
lz3r = diff(log(lz),3) 
lz4r = diff(log(lz),4) 

ly2r = diff(log(ly),2) 
ly3r = diff(log(ly),3) 
ly4r = diff(log(ly),4) 

var(ly2r)/(2*var(lyr))
var(ly3r)/(3*var(lyr))
var(ly4r)/(4*var(lyr))

# try, VR ratio test
p = y #  
#lp = log(p)
n = length(p)
n
q1 = 2:20
VRy = numeric(19)
for(j in 1:19)
{
q = q1[j]  
p = p
chat = (p[n]-p[1])/(n-1)
sigma1 = 0
for(i in 2:n)
{
sigma = (p[i]-p[i-1]-chat)^2
sigma1 = sigma1+sigma
}
sigma12 = sigma1/((n-1)-1)
sigma3 = 0
for(i in q:(n-1))
{
sigma = (p[(i+1)]-p[((i+1)-q)]-q*chat)^2
sigma3 = sigma3+sigma
}
m = q*((n-1)-q+1)*(1-(q/(n-1)))
sigma32 = sigma3/m
h = 2*((2*q)-1)*(q-1)/(3*q)
VRy[j] = sqrt((n-1))*((sigma12/sigma32)-1)/sqrt(h)
}
VRy

# all VR ratio test
allp = cbind(y,x,z,res1,res2,res3,res4) #  
#lp = log(p)
n = length(allp[,1]) # 第一行之長度
n
w = 30
q1 = 2:w
VR = matrix(0,(w-1),7)
for(k in 1:7)
{
 p = allp[,k]
  for(j in 1:(w-1))
  {
   q = q1[j]  
   p = p
   chat = (p[n]-p[1])/(n-1)
   sigma1 = 0
     for(i in 2:n)
      {
         sigma = (p[i]-p[i-1]-chat)^2
         sigma1 = sigma1+sigma
      }
      sigma12 = sigma1/((n-1)-1)
      sigma3 = 0
      for(i in q:(n-1))
        {
           sigma = (p[(i+1)]-p[((i+1)-q)]-q*chat)^2
           sigma3 = sigma3+sigma
        }
      m = q*((n-1)-q+1)*(1-(q/(n-1)))
      sigma32 = sigma3/m
      h = 2*((2*q)-1)*(q-1)/(3*q)
      VR[j,k] = sqrt((n-1))*((sigma12/sigma32)-1)/sqrt(h)
   }
}
VRy = VR[,1];VRx = VR[,2]; VRz = VR[,3]; 
VR1 = VR[,4]; VR2 = VR[,5]; VR3 = VR[,6]; VR4 = VR[,7];
windows()
par(mfrow=c(2,1))
plot(VRy,type="l",xlab="k",ylab="VR檢定統計量",main="三大法人持有市值",lwd=3)
lines(2:w,VRx,col="red",lty=2,lwd=3)
lines(2:w,VRz,col="blue",lty=3,lwd=3)
abline(h=-1.96,lty=2)
legend("topleft",c("自營商","投信","外資"),lty=c(1,2,3),col=c("black","red","blue"),lwd=3,
       bty="n")
plot(VR1,type="l",xlab="k",ylab="VR檢定統計量",main="模型 1-4之殘差植",lwd=3)
lines(2:w,VR2,col="red",lty=2,lwd=3)
lines(2:w,VR3,col="blue",lty=3,lwd=3)
lines(2:w,VR4,col="green",lty=4,lwd=3)
abline(h=-1.96,lty=2)
legend("topleft",c("模型 1","模型 2","模型 3","模型 4"),lty=c(1,2,3,4),lwd=3,
   col=c("black","red","blue","green"),bty="n")








