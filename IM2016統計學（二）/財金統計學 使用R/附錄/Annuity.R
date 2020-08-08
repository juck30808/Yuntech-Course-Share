# Annuity
# geometric sequence
a = 0.6
r = -0.5
c(a,a*r,a*r^2,a*r^3,a*r^4)


# example 1
a = 0.9
r = 0.8
c(a,a*r,a*r^2,a*r^3,a*r^4)
n = 10
a*r^(n-1) # 0.120796

# example
n = 10
a = 0.9
r = 0.8
Sn = a*(r^n - 1)/(r - 1)
Sn # 4.016816

# 普通年金
library(shape)
windows()
plot(c(0,11),c(0,11),type="n",frame.plot=F,axes=F,xlab="",ylab="") 
segments(2,8,9,8,lwd=2)
points(2,8,pch=20,lwd=4)
text(2,8,labels="0",pos=3)

points(3,8,pch=20,lwd=4)
text(3,8,labels="1",pos=3)
points(4,8,pch=20,lwd=4)
text(4,8,labels="2",pos=3)

points(5,8,pch=20,lwd=4)
text(5,8,labels="3",pos=3)
points(6,8,pch=20,lwd=4)
text(6,8,labels="4",pos=3)

points(7,8,pch=20,lwd=4)
text(7,8,labels="5",pos=3)
points(8,8,pch=20,lwd=4)
text(8,8,labels="6",pos=3)

Arrows(3,8,3,2,arr.type="curved",code=2,lwd=1)
Arrows(3,2,9,2,arr.type="curved",code=2,lwd=1)
text(3,1.8,labels="15000",pos=1)

Arrows(4,8,4,3,arr.type="curved",code=2,lwd=1)
Arrows(4,3,9,3,arr.type="curved",code=2,lwd=1)
text(4,2.8,labels="15000",pos=1)
 
Arrows(5,8,5,4,arr.type="curved",code=2,lwd=1)
Arrows(5,4,9,4,arr.type="curved",code=2,lwd=1)
text(5,3.8,labels="15000",pos=1)

Arrows(6,8,6,5,arr.type="curved",code=2,lwd=1)
Arrows(6,5,9,5,arr.type="curved",code=2,lwd=1)
text(6,4.8,labels="15000",pos=1)

Arrows(7,8,7,6,arr.type="curved",code=2,lwd=1)
Arrows(7,6,9,6,arr.type="curved",code=2,lwd=1)
text(7,5.8,labels="15000",pos=1)

Arrows(8,8,8,7,arr.type="curved",code=2,lwd=1)
Arrows(8,7,9,7,arr.type="curved",code=2,lwd=1)
text(8,6.8,labels="15000",pos=1)

text(9.5,7,labels="15000",pos=1)
text(9.5,6,labels=expression(15000*(1+0.06)),pos=1)
text(9.5,5,labels=expression(15000*(1+0.06)^2),pos=1)
text(9.5,4,labels=expression(15000*(1+0.06)^3),pos=1)
text(9.5,3,labels=expression(15000*(1+0.06)^4),pos=1)
text(9.5,2,labels=expression(15000*(1+0.06)^5),pos=1)


n = 6
a = 15000
r = 1.06
Sn = a*(r^n - 1)/(r - 1)
Sn # 104629.8



windows()
plot(c(0,11),c(0,11),type="n",frame.plot=F,axes=F,xlab="",ylab="") 
segments(2,8,9,8,lwd=2)
points(2,8,pch=20,lwd=4)
text(2,8,labels="0",pos=3)

points(3,8,pch=20,lwd=4)
text(3,8,labels="1",pos=3)
points(4,8,pch=20,lwd=4)
text(4,8,labels="2",pos=3)

points(5,8,pch=20,lwd=4)
text(5,8,labels="3",pos=3)
points(6,8,pch=20,lwd=4)
text(6,8,labels="...",pos=3)

points(7,8,pch=20,lwd=4)
text(7,8,labels="n-1",pos=3)
points(8,8,pch=20,lwd=4)
text(8,8,labels="n",pos=3)

Arrows(3,8,3,2,arr.type="curved",code=2,lwd=1)
Arrows(3,2,9,2,arr.type="curved",code=2,lwd=1)
text(3,1.8,labels="R元",pos=1)

Arrows(4,8,4,3,arr.type="curved",code=2,lwd=1)
Arrows(4,3,9,3,arr.type="curved",code=2,lwd=1)
text(4,2.8,labels="R元",pos=1)
 
Arrows(5,8,5,4,arr.type="curved",code=2,lwd=1)
Arrows(5,4,9,4,arr.type="curved",code=2,lwd=1)
text(5,3.8,labels="R元",pos=1)

Arrows(6,8,6,5,arr.type="curved",code=2,lwd=1)
Arrows(6,5,9,5,arr.type="curved",code=2,lwd=1)
text(6,4.8,labels="R元",pos=1)

Arrows(7,8,7,6,arr.type="curved",code=2,lwd=1)
Arrows(7,6,9,6,arr.type="curved",code=2,lwd=1)
text(7,5.8,labels="R元",pos=1)

Arrows(8,8,8,7,arr.type="curved",code=2,lwd=1)
Arrows(8,7,9,7,arr.type="curved",code=2,lwd=1)
text(8,6.8,labels="R元",pos=1)

text(9.5,7,labels="R",pos=1)
text(9.5,6,labels=expression(R*(1+i)),pos=1)
text(9.5,5,labels="...",pos=1)
text(9.5,4,labels=expression(R*(1+i)^(n-3)),pos=1)
text(9.5,3,labels=expression(R*(1+i)^(n-2)),pos=1)
text(9.5,2,labels=expression(R*(1+i)^(n-1)),pos=1)

# FVIFA
FVA = function(i,n) ((1+i)^n - 1)/i # 注意此為函數型態
FVA(0.06,6)
R = 15000
R*FVA(0.06,6) # 104629.8

# FVIF
FV = function(i,n) 1/(1+i)^n
FV(0.06,6) # 0.7049605
1/(1.06)^6 # 與FV(0.06,6)相同

# 繪圖
i = seq(0.01,0.1,length=100)
n = seq(0.01,50,length=100)
z = outer(i,n,FVA)
windows()
persp(i,n,z, theta=-30, phi=30,ticktype="detailed",lwd=1,zlab="FVIFA")
FVA(0.1,50)

# 固定n
FVA1 = numeric(100)
FVA2 = FVA1
FVA3 = FVA1
for(j in 1:100)
{
 FVA1[j] = FVA(i[j],4)
 FVA2[j] = FVA(i[j],5)
 FVA3[j] = FVA(i[j],6)
}
windows()
plot(i,FVA1,type="l",lwd=2,ylim=c(4,8),xlab="",ylab="")
lines(i,FVA2,lty=2,lwd=2,col=2)
lines(i,FVA3,lty=3,lwd=2,col=3)


# example 4
FVA = function(i,n) ((1+i)^n - 1)/i # 注意此為函數型態
# (a)
R = 5000
i = 0.02/12
n = 12*20
R*FVA(i,n) # 1473984

# (b)
i = seq(0.01,0.1,length=n)
i = i/12
Retire = numeric(n)
for(j in 1:n)
{
 Retire[j] = R*FVA(i[j],n)
}
windows()
plot(i,Retire,type="l",lwd=2)
abline(h=3000000,lty=2)
abline(v=i[191],lty=2)
i[191]
R*FVA(i[191],n) # 3002411
i[191]*12 # 0.08154812

# (c)
R = seq(5000,15000,length=n)
Retire = numeric(n)
i = 0.02/12
for(j in 1:n)
{
 Retire[j] = R[j]*FVA(i,n)
}
windows()
plot(R,Retire,type="l",lwd=2)
abline(h = 3000000,lty=2)
abline(v = R[125],lty=2)
R[125] # 10188.28
R[125]*FVA(i,n) # 3003474


# Annuity due
# example 5
R = 12000
n = 28
i = 0.035/4
R*(FVA(i,n+1)-1) # 382186.7

# example 6
PVA = function(i,n) (1 - (1+i)^-n)/i # 年金現值利率因子函數
R = 5000
i = 0.03
n = 10
R*PVA(i,n) # 42651.01
 
# example 7
i = 0.06/12
P = 600000
n = 36
R = P/PVA(i,n)
R # 18253.16

# example 8
# (a)
P = 2000000
i = 0.04/12
n = 12*20
R = P/PVA(i,n)
R # 12119.61
# (b)
R*n - P # 908705.6
# (c)
x = 1:n
y = R*PVA(i,n-x)
windows()
plot(x,y,type="l",lwd=2)
abline(h= 1000000,lty=2)
abline(v=x[144],lty=2)
text(57,1671435,labels=expression(y==R%.%PVIFA[list(i,n-x)]),pos=4,cex=2)
x[144]

# example 9
P = 50000
i = 0.12/12
n = 12
x = 3
R = P/PVA(i,n)
R*PVA(i,n-x) # 38054.01

# sensitivity analysis
P = 200 
n = 12*20
m = c(10,15,20,25,30)
i = c(0.02,0.03,0.04,0.05)
it = i/12
Rz = function(it,m) P/PVA(it,m)
z = outer(it,m,Rz)
windows()
persp(it,m,z, theta=-65, phi=40,ticktype="detailed",xlab="i",
      ylab="n",zlab="R (萬元)")










