# 基本的數學
f = function(x) 3*x + 4
f(0) # 4
f(1) # 7

# 繪圖
x = seq(-3,3,length=100)
x
y = f(x)
y
windows() #開一個繪圖視窗
par(mfrow=c(2,1)) # 其內為二列一行圖形
plot(x,y,type="p") # 繪出"點"
plot(x,y,type="l",lwd=2) #繪出"直線" # 試比較lwd=4

# 二次式函數
f2 = function(x) 4*x^2 + 3*x + 2
f2(2) # 24
f2(1) # 9
y2 = f2(x)
windows()
plot(x,y2,type="l",lwd=2,ylab="y",ylim=c(-1,50))
abline(h=0,lty=2)
abline(v=0,lty=2)

f2 = function(x) -4*x^2 + 3*x + 2
f2(2) # -8
f2(1) # 1
y2 = f2(x)
windows()
plot(x,y2,type="l",lwd=2,ylab="y")
abline(h=0,lty=2)
abline(v=0,lty=2)

# 求解或根
f = function(x) x^2 - 3*x + 2
y = f(x)
windows()
plot(x,y,type="l",lwd=2)
abline(h=0,lty=2)
abline(v=c(1,2),lty=2)

# 逆函數與反函數
x = seq(-2,2,length=1000)
f = function(x)  x^3
windows()
plot(x,f(x),type="l",lwd=2,xlim=c(-1.5,1.5),ylim=c(-1.5,1.5))
abline(v=0,lty=2)
abline(h=0,lty=2)
lines(x,x)
invf = function(x) x^(1/3)
lines(x,invf(x),lty=2,col="red",lwd=3)
x = seq(0,2,length=500)
lines(-x,-invf(x),lty=2,col="red",lwd=3)
text(0.5,0.5,labels="y = x",pos=1)
text(-0.5,-0.8,labels=expression(f(x)^-1),pos=1)
text(0.8,0.45,labels=expression(f(x)),pos=1)


f = function(x) 2*x + 3
x = seq(-3,3,length=100) 
y = f(x)
y
invf = function(y) (y-3)/2
y1 = invf(y)
y1
windows()
plot(x,y,type="l",lwd=2,ylim=c(-3,8))
lines(x,y1,lty=2,col="red",lwd=3)
y2 = invf(x)
lines(x,y2,col="blue",lwd=3,lty=3)
abline(h=0,lty=30)
abline(v=0,lty=30)
text(2,8,labels="y = 2x+3",pos=1)
text(3,3,labels="y = x",pos=1)
text(3,0,labels="x = (y-3)/2",pos=1)


# 逆函數與反函數
f = function(x) x^2
x = seq(0,3,length=100)
invf = function(y) sqrt(y)
y = f(x)
windows()
plot(x,y,type="l",lwd=2,ylim=c(0,10),xlim=c(0,10))
x1 = seq(0,9,length=100)
lines(x1,x1,lty=2,col="red",lwd=2)
y2 = invf(x1)
lines(x1,y2,lty=3,col="blue",lwd=2)
text(9,9,labels="x = y",pos=1)
text(2.5,9,labels=expression(paste("f(x) = ", x^2)),pos=1)
text(9,3,labels=expression(f(x)^-1),pos=1)


# 指數函數與 (自然) 對數函數
exp(1) # 2.718282
exp(1.5) # 4.481689
exp(20) # 485165195
exp(-20) # 2.061154e-09 即2.061154*10^(-9)
2.061154*10^(-9)

x = seq(0,10,length=100)
windows()
plot(x,exp(x),type="l",lwd=2,ylim=c(-5,15))
lines(x,log(x),lty=2,lwd=3,col="red")
text(2.5,15,labels=expression(e^x),pos=1)
abline(v=0,lty=3)
abline(h=0,lty=3)
lines(x,x,lty=30)
text(10,2,labels=expression(log(x)),pos=1)
text(10,10,labels=expression(y==x),pos=1)

# 階層函數
factorial(5) # 5!
factorial(3) # 3!

exp(4) # 54.59815
1 + 4 +(4^2)/factorial(2) + (4^3)/factorial(3) + (4^4)/factorial(4) +
 (4^5)/factorial(5) + (4^6)/factorial(6) + (4^7)/factorial(7) + (4^8)/factorial(8) +
 (4^9)/factorial(9) + (4^10)/factorial(10) # 54.4431

# 對數函數
log(1)
log(0.5) # -0.6931472
log(1+0.05) # 0.04879016 約等於0.05
log(20) # 2.995732

# Power laws
x = seq(0,1,length=100)
windows()
par(mfrow=c(2,2))
y = x^0.5
plot(x,y,type="l",main="(a) 0 < b < 1",lwd=2)
y = x
plot(x,y,type="l",main="(b) b = 1",lwd=2)
y = x^2
plot(x,y,type="l",main="(c) b > 1",lwd=2)
y = 1/x
plot(x,y,type="l",main="(d) b < 0",lwd=2)

# 多項式函數
x = seq(0,10,length=100)
y1 = 2+5*x-0.2*x^2
y2 = 2+5*x-0.4*x^2
y3 = 2+4*x-0.6*x^2+0.04*x^3
y4 = 2+4*x+2*x^2-0.6*x^3+0.04*x^4
windows()
par(mfrow=c(2,2))
plot(x,y1,type="l",ylab="y",main=" (a) 遞減",lwd=3)
points(1,7,pch=18)
y = 2.5 + 4.6*x
lines(x,y,lty=2)
points(6,24.8,pch=18)
y = 9.5 + 2.6*x
lines(x,y,lty=2)
plot(x,y2,type="l",ylab="y",main="(b) 最大值",lwd=3)
abline(h=17.7,lty=2)
plot(x,y3,type="l",ylab="y",main="(c) 轉折",lwd=3)
abline(v=5,lty=2)
plot(x,y4,type="l",ylab="y",main="(d) 局部最大與最小值",lwd=3)
abline(h=22.5,lty=2)
abline(h=18,lty=2)

# 漸近函數
x = seq(0,1,length=100)
a = 1
b = 2
y = a*x/(1+b*x)
windows()
par(mfrow=c(2,1))
plot(x,y,type="l",lwd=3,ylim=c(0,2.5))
b = 4
y1 = a*x/(1+b*x)
lines(x,y1,lty=20,lwd=3,col="red")
b = -0.5
y2 = a*x/(1+b*x)
lines(x,y2,lty=30,lwd=3,col="blue")
legend("topleft",c("a = 1;b = 2","a = 1,b = 4","a = 1;b = -0.5"),
      lty = c(1,20,30),col=c("black","red","blue"),bty="n",lwd=3)

x = seq(0,1,length=100)
a = 1
b = 1
y = a*x/(1+b*x)
#windows()
plot(x,y,type="l",lwd=3,ylim=c(-1,2))
a = 4
y1 = a*x/(1+b*x)
lines(x,y1,lty=20,lwd=3,col="red")
a = -0.5
y2 = a*x/(1+b*x)
lines(x,y2,lty=30,lwd=3,col="blue")
legend("topleft",c("b = 1;a = 1","b = 1,a = 4","b = 1;a = -0.5"),
      lty = c(1,20,30),col=c("black","red","blue"),bty="n",lwd=3)


x = seq(0,5,length=100)
a = 1
b = 1
y = a*(1 - exp(-b*x))
windows()
par(mfrow=c(2,1))
plot(x,y,type="l",lwd=3,ylim=c(-1,2))
a = 2
y1 = a*(1 - exp(-b*x))
lines(x,y1,lwd=3,lty=20,col="red")
a = -0.5
y2 = a*(1 - exp(-b*x))
lines(x,y2,lwd=3,lty=30,col="blue")

x = seq(0,5,length=100)
a = 1
b = 1
y = a*(1 - exp(-b*x))
#windows()
plot(x,y,type="l",lwd=3,ylim=c(-8,2))
b = 0.02
y1 = a*(1 - exp(-b*x))
lines(x,y1,lwd=3,lty=20,col="red")
b = -0.2
y2 = a*(1 - exp(-b*x))
lines(x,y2,lwd=3,lty=30,col="blue")

# S
a = 1
b = 90
c = 1
x = seq(1,10,length=100)
f = function(a,b,c,x) a/(1 + b*exp(-c*x))
windows()
par(mfrow=c(2,1))
y = f(a,b,c,x)
plot(x,y,type="l",lwd=3)
text(6,0.75,labels="b=90,c=1",pos=1)
b = 50
y1 = f(a,b,c,x)
lines(x,y1,lty=20,lwd=3,col="red")
text(4,0.8,labels="b=50,c=1",pos=1)
b = 180
c = 0.7
y2 = f(a,b,c,x)
lines(x,y2,lty=30,lwd=3,col="blue")
text(9,0.7,labels="b=180,c=0.7",pos=1)

a=-2;b=90;c=1
y = f(a,b,c,x)
plot(-x,y,type="l",lwd=3)
text(-6,0.7,labels="b=90,c=1",pos=1)
b = 50
y1 = f(a,b,c,x)
lines(-x,y1,lty=20,lwd=3,col="red")
text(-4,0.8,labels="b=50,c=1",pos=1)
b = 180
c = 0.7
y2 = f(a,b,c,x)
lines(-x,y2,lty=30,lwd=3,col="blue")
text(-6,0.2,labels="b=180,c=0.7",pos=1)



# 微分
library(shape)
x = seq(0.1,3,length=100)
y = x^3
windows()
plot(x,y,type="l",lwd=3,frame.plot=F,axes=F,ylim=c(-1,30),xlim=c(-1,3),
     xlab="",ylab="")
Arrows(-0.8,0,3,0,arr.type="curved",code=2,lty=1,lwd=2)
text(3,0,labels="x",pos=1)
Arrows(-0.8,0,-0.8,30,arr.type="curved",code=2,lty=1,lwd=2)
text(-0.8,30,labels="y",pos=2)
points(2,8,pch=20)
y1 = -16 + 12*x
lines(x,y1)
Arrows(1.55,2,2.45,2,arr.type="curved",code=3)
Arrows(2.5,2.2,2.5,13.5,arr.type="curved",code=3)
text(2,1.8,labels=expression(paste(Delta," ",x)),pos=1,cex=1)
text(2.7,8.8,labels=expression(f(x+paste(Delta,x))-f(x)),pos=1)
segments(1.5,0,1.5,2)
text(1.5,0,labels="x",pos=1)
segments(2.5,0,2.5,2)
text(2.5,0,labels=expression(paste(x,"+",Delta," ",x)),pos=1)
points(1.5,1.5^3,pch=18)
text(1.5,1.5^3,labels="B",pos=3)
points(2.5,2.5^3,pch=18)
text(2.5,2.5^3,labels="A",pos=3)
segments(1.5,1.5^3,2.5,2.5^3)
segments(-0.8,2.5^3,2.5,2.5^3,lty=2)
text(-0.8,2.5^3,labels=expression(f(x+paste(Delta,x))),pos=2)
text(-0.8,1.5^3,labels=expression(f(x)),pos=2)
segments(-0.8,1.5^3,1.5,1.5^3,lty=2)
text(2,8,labels="C",pos=4)
text(3,27,labels="f(x)",pos=2)


# 凹凸函數
library(shape)
x = seq(-3,3,length=100)
y =  x^3  
windows()
plot(x,y,type="l",lwd=3,frame.plot=F,axes=F,xlab="",ylab="")
Arrows(-3,0,3,0,arr.type="curved",code=2,lty=1,lwd=1)
Arrows(0,-28,0,28,arr.type="curved",code=2,lty=1,lwd=1)
text(-1.5,-8,labels="凹",pos=1,cex=2)
text(1.5,12,labels="凸",pos=1,cex=2)
text(3,0,labels="x",pos=1)
text(0,28,labels="y",pos=2)
Arrows(1.5,-15,0.05,-0.6,arr.type="curved",code=2,lty=1,lwd=1)
text(1.5,-15,labels="轉折",pos=1,cex=2)


# 二元變數函數
fxy = function(x,y) x^2*y - 2*x - 4*y
fxy(1,2) 
x = seq(-2,2,length=20)
y = x
z = outer(x,y,fxy)
windows()
persp(x,y,z, theta=30, phi=45,ticktype="detailed",lwd=2,col="tomato")


# 泰勒
x = seq(0.1,3,length=100)
f = function(x) x^4 - 3*log(x)
windows()
plot(x,f(x),type="l",lwd=3)
f(1) # 1
# 微分
f1 = function(x) 4*x^3 - 3/x
f1(1) # 1
f2 = function(x) 12*x^2 + 3/x^2
f2(1) # 15
f3 = function(x) 24*x - 6/x^3
f3(1) # 18
f4 = function(x) 24 + 18/x^4
f4(1) # 42
appf = function(x) f(1) + f1(1)*(x-1) + (f2(1)/2)*(x-1)^2 + (f3(1)/factorial(3))*
     (x-1)^3 + (f4(1)/factorial(4))*(x-1)^4
lines(x,appf(x),lty=2,lwd=3,col="red")

# 多變數泰勒
f = function(x,y) exp(-x^2 -y^2)
x = seq(-3,3,length=20)
y = x
z = outer(x,y,f)
windows()
persp(x,y,z, theta=60, phi=60,ticktype="detailed",lwd=2)

fx = function(x,y) -2*x*exp(-x^2 -y^2)
fy = function(x,y) -2*y*exp(-x^2 -y^2)
fxy = function(x,y) 4*x*y*exp(-x^2 -y^2)
fxx = function(x,y) (-2+4*x^2)*exp(-x^2 -y^2)
fyy = function(x,y) (-2+4*y^2)*exp(-x^2 -y^2)
f(0,0) # 1
fx(0,0) # 0
fy(0,0) # 0
fxy(0,0) # 0
fxx(0,0) # -2
fyy(0,0) # -2
appf = function(x,y) 1 - x^2 -y^2
zf = outer(x,y,appf)
windows()
persp(x,y,zf, theta=60, phi=60,ticktype="detailed",lwd=2)


# 積分
f = function(x) 2*x + x^2
x = seq(0,10,length=100)
windows()
plot(x,f(x),type="l",lwd=3)
j = x >= 4 & x <= 8
polygon(c(4,x[j],8),c(0,f(x[j]),0),col="red")
abline(h=0)
text(9,f(9),labels="f(x)",pos=2)

#
(8^2 + (8^3)/3) - (4^2 + (4^3)/3)

# local max and min
f = function(x) x^3 - 3*x
x = seq(-2,2,length=100)
windows()
plot(x,f(x),type="l",lwd=3)
segments(-1.5,2,-0.5,2,lty=2)
segments(1.5,-2,0.5,-2,lty=2)
text(-0.5,2,labels="f '(x)=0",pos=4)
text(1.5,-2,labels="f '(x)=0",pos=4)
text(1.5,f(1.5),labels="f (x)",pos=4)

x = seq(-4,4,length=100)
windows()
plot(x,f(x),type="l",lwd=3)
points(0,0,pch=20,cex=2)
text(0,0,labels="鞍點",pos=1)

#於限制下之極值
f = function(x,y) x^2 + y^2 
x = seq(-5,5,length=100)
y = x
z = outer(x,y,f)
windows()
persp(x,y,z, theta=30, phi=30,ticktype="detailed",lwd=1)
windows() 
image(x,y,z) # 
contour(x,y,z,add=T,lwd=2)

library(plotrix)
library(shape)
windows()
x = seq(-1,1,length=100)
y1 = sqrt(1-x^2)
y2 = -sqrt(1-x^2)
plot(c(x,x),c(y1,y2),xlim=c(-2,2),ylim=c(-2,2),type="l",frame.plot=T,axes=T,xlab="",
    ylab="",lwd=2)
Arrows(-2,0,2,0,arr.type="curved",code=2,lwd=1)
text(2,0,labels="x",pos=1)
Arrows(0,-2,0,2,arr.type="curved",code=2,lwd=1)
text(0,2,labels="y",pos=2)
y1 = sqrt(0.5-x^2)
y2 = -sqrt(0.5-x^2)
lines(c(x,x),c(y1,y2),lwd=2)
y1 = sqrt(0.75-x^2)
y2 = -sqrt(0.75-x^2)
lines(c(x,x),c(y1,y2),lwd=2)
segments(-2,3,3,-2)
points(0.5,0.5,pch=20,cex=2)
Arrows(1,1.5,0.525,0.55,arr.type="curved",code=2,lwd=1)
text(1,1.5,labels="(x , y) = (0.5 , 0.5)",pos=4)
text(1.06,0.06,labels="1",pos=2)
y1 = sqrt(0.25-x^2)
y2 = -sqrt(0.25-x^2)
lines(c(x,x),c(y1,y2),lwd=2)
text(1.8,-0.5,labels="x + y - 1 = 0",pos=1)



