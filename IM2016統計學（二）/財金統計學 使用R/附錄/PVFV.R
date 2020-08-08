# MathFin1
# 1.1
# example 1
P = 50000
r = 0.08
t = 11/12
I = P*r*t
I # 3666.667

# example 2
# (1)
P = 25000
r = 0.043
t = 8/12
A = P*(1 + r*t)
A # 25716.67
I = A - P
I

# (2)
P = 30000
r = 0.07
t = 85/360
A = P*(1 + r*t)
A # 30495.83
I = A - P
I

# example 3
A = 82000
P = 80000
t = 6/12
r = (A - P)/(P*t)
r # 0.05

# 複利
1000*(1+0.05)^2 # 1102.5
1000*(1+0.05*2) # 1100 簡單利息

# example 4
P = 20000
r = 0.0425
t = 6
m = 1
i = r/m
n = m*t
A = P*(1 + i)^n
A # 25673.58
I = A - P
I 

# example 5
P = 24500
r = 0.0525
m = 4
t = 6.5
i = r/m
n = m*t
A = P*(1 + i)^n
A # 34387.84
I = A - P
I

# 比較
P = 10000
t = seq(1,20,length=20)
r = 0.1
m = 1
i = r/m
n = m*t
A1 = P*(1 + r*t)
A2 = P*(1 + i)^n
windows()
plot(n,A1,type="l",lwd=2,main="簡單利息與複利之比較",xlab="時間", ylim=c(1000,50000),
      ylab="金額")
lines(n,A2,lty=2,lwd=2,col="red")
legend("bottomright",c("簡單利息","複利"),lty=1:2,col=c("black","red"),
        lwd=2,bty="n")
points(15,A1[15],lwd=4,pch=20)
text(15,A1[15],labels="A = 25000元",pos=1)
points(15,A2[15],lwd=4,pch=20,col="red")
text(15,A2[15],labels="A = 41772.48元",pos=4, col="red")
matrix(cbind(t[1:10],A1[1:10],A2[1:10]),10,3) 
 
# example 6
P = 50000
A = 65400
m = 4
t = 6
n = m*t
(A/P)^(1/n)
r = m*((A/P)^(1/n) - 1)
r # 約為4.5%
i = r/4
i
P*(1 + i)^n

# EAR
(1 + 0.04/4)^4

# example 7
m = 2
r = 0.06
n = 2
EAR = (1 + r/m)^n - 1
EAR # 6.09%

# example 8
rA = 0.08
mA = 2
nA = 2
EARA = (1 + rA/mA)^nA - 1
EARA # 8.16%
rB = 0.079
mB = 12
nB = 12
EARB = (1 + rB/mB)^nB - 1
EARB # 8.1924%

# example 9
A = 60000
i = 0.062
n = 5
P = A*(1 + i)^-n
P # 44414.9

# example 10
r = 0.06
A = 160000
m = 2
t = 9
n = m*t
i = r/m
P = A*(1 + i)^(-n)
P # 93983.14

# example 11
A = 100000
P = 24500
r = 0.0525
m = 4
i = r/m
x = seq(1,150,length=150)
y = P*(1 + i)^x
y
windows()
plot(x,y,type="l",lwd=2,xlab="期間",ylab="金額")
abline(h=A,lty=2,lwd=1)
abline(v=x[108],lty=2,lwd=1)
n = x[108]
t = n/m
t # 約27年
P*(1 + i)^n # 100178.3
# 或使用下列方法
n = log(A/P)/log(1+i) # 107.8634


# 72法則
(1.072)^10 # 2.004231

# example 12
r = 0.02
n = 70/(100*r)
n # 35
(1 + r)^n # 1.99989

r = 0.0002
n = 70/(100*r)
n # 3500
(1 + r)^n # 2.013612
 
r = 0.08
n = 72/(100*r)
n # 9
(1 + r)^n # 1.999005

r = 0.12
n = 72/(100*r)
n # 6
(1 + r)^n # 1.973823

# 連續複利
# 投資100元,利率10%
PV = 100
r = 0.1
# 年利率
FV = PV * (1 + r)
FV
# 半年
FV1 = PV * (1 + r/2)^2
FV1
# 季
FV2 = PV * (1 + r/4)^4
FV2
# 月
FV3 = PV * (1 + r/12)^12
FV3
# 週
FV4 = PV * (1 + r/52)^52 # 52*7
FV4
# 日
FV5 = PV * (1 + r/365)^365  
FV5
# 時
n = 365*24
FV6 = PV * (1 + r/n)^n  
FV6
# 分
n = 365*24*60
FV7 = PV * (1 + r/n)^n  
FV7
# 秒
n = 365*24*60*60
FV8 = PV * (1 + r/n)^n  
FV8
# 連續
FV9 = PV*exp(r)
FV9

windows()
PV = 100
r = c(0.02,0.05,0.1,0.15)
n = 50
m = 50
t = seq(1,n,length=m)
FV = matrix(0,m,4)
for(j in 1:4)
{
   for(i in 1:m)
   {
      FV[i,j] = PV*(1 + r[j]/t[i])^t[i]
   }
}
plot(t,FV[,1],type="l",lwd=2,ylim=c(100,120))
lines(t,FV[,2],lty=2,col=2,lwd=2)
lines(t,FV[,3],lty=2,col=3,lwd=2)
lines(t,FV[,4],lty=2,col=4,lwd=2)

# example 13
P = 24500
r = 0.065
t = 6.5
A = P*exp(r*t)
A # 37381.39
EAR = exp(r) - 1
EAR # 0.06715902
# A* = 100000
# A* = P*exp(0.065*t)
# log(A*/P) = r*t
Astar = 100000
t = log(Astar/P)/r
t # 21.63842

# example 14
# 圖解未來值
# 1元或其他,不同的利率
n = seq(0,10,length=100)
i = 0.2
PV = 1
FV = PV*(1 + i)^n
windows()
plot(n,FV,type="l",lwd=2,main="圖解未來值 (1元的投資)")
i1 = 0.15
FV1 = PV*(1 + i1)^n
lines(n,FV1,lty=2,lwd=2,col=2)
i2 = 0.1
FV2 = PV*(1 + i2)^n
lines(n,FV2,lty=3,lwd=2,col=3)
i3 = 0.05
FV3 = PV*(1 + i3)^n
lines(n,FV3,lty=4,lwd=2,col=4)
FV4 = PV*exp(i*n)
lines(n,FV4,lty=5,lwd=2,col=5)
leg = expression(i == 0.2,i == 0.15, i == 0.1,  i == 0.05, e^(0.2*n))
legend("topleft",leg,lty=1:5,col=1:5,bty="n",lwd=2)

# 圖解現值
FV = 1
PV = FV*(1 + i)^(-n)
windows()
plot(n,PV,type="l",lwd=2,main="圖解現值 (未來值為1)")
PV1 = FV*(1 + i1)^(-n)
lines(n,PV1,lty=2,lwd=2,col=2)
PV2 = FV*(1 + i2)^(-n)
lines(n,PV2,lty=3,lwd=2,col=3)
PV3 = FV*(1 + i3)^(-n)
lines(n,PV3,lty=4,lwd=2,col=4)
FV4 = PV*exp(-i*n)
lines(n,FV4,lty=5,lwd=2,col=5)
leg = expression(i == 0.2,i == 0.15, i == 0.1,  i == 0.05, e^(-0.2*n))
legend("topright",leg,lty=1:5,col=1:5,bty="n",lwd=2)











