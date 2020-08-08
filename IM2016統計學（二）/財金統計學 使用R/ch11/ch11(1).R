# ch11 
a = c(3,1,5)
g = matrix(c(3,1,5),1,3)
g
dim(g)
dim(a)
b = t(a)
b
dim(b)
g%*%t(b)
g%*%a

# n階矩陣
B = matrix(c(5,2,2,3),2,2)
B

windows()
library(shape)
plot(c(10,-1),c(-1,10),type="n",frame.plot=F,axes=F,xlab="",ylab="")
points(5,2,pch=20,lwd=5)
arrows(0,0,5,2,lwd=2)
points(2,3,pch=20,lwd=5)
arrows(0,0,2,3,lwd=2)
text(5,2,labels=expression(x[1]),pos=1) 
text(2,3,labels=expression(x[2]),pos=3)
x1 = c(5,2)
x2 = c(2,3)
x3 = x1+x2
x3
points(x3[1],x3[2],pch=20,lwd=5)
arrows(0,0,x3[1],x3[2],lwd=2)
text(x3[1],x3[2],labels=expression(x[3]),pos=3)
segments(x1[1],x1[2],x3[1],x3[2],lty=2)
segments(x2[1],x2[2],x3[1],x3[2],lty=2)
text(0,0,labels="0",pos=1)
Arrows(0,0,10,0,arr.type="curved",code=2)
Arrows(0,0,0,10,arr.type="curved",code=2)
x4 = 3*x2
points(x4[1],x4[2],pch=20,lwd=5)
arrows(x2[1],x2[2],x4[1],x4[2],lty=2)
text(3.9,6,labels=expression(3*x[2]),pos=2)
text(0,10,labels="y",pos=2)
text(10,0,labels="x",pos=1)
#library(plotrix)
#draw.circle(0,0,2,lty=2)
Arrows(2.1,1.1,1.5,1.9,arr.type="curved",code=3,col = "red")
text(1.9,1.5,labels=expression(theta),pos=3,lwd=3)

# matrix algebra
D = matrix(c(3,0.5,0.5,1),2,2)
D

# 加法 (減法)
B+D
B-D

# 純積
3*B

# 點積 (內積)
sum(x1*x2)

# 角度
dot.prod = sum(x1*x2)
norm.x1a = norm(x1,type="2") # L2 norm = Euclidean norm
norm.x2a = norm(x2,type="2") 
norm.x1 = sqrt(x1[1]^2+x1[2]^2) # 與norm.x1a相同
norm.x2 = sqrt(x2[1]^2+x2[2]^2) # 與norm.x2a相同
cos.theta = dot.prod/(norm.x1 * norm.x1)
acos(cos.theta)*180/pi # 弧度轉成度,180度 = pi弧度
library(aspace)
acos_d(cos.theta) # 弧度轉成度

# 矩陣相乘
H = matrix(c(2,3,5,7,1,6),2,3)
H
B%*%H

# 試試看
H%*%B
t(H)%*%B
t(B)%*%B
B%*%t(B)
B%*%t(D)
t(B)%*%D
t(B%*%H)
t(H)%*%t(B)

# 對角矩陣
G = matrix(c(2,0,0,0,4,0,0,0,3.5),3,3)
G
G%*%t(G)
t(G)%*%G

# minors and cofactors
minor = function(A, i, j)
{
  A[-i, -j]  
}
cofactor = function(A, i, j)
{
  (-1)^(i + j) * minor(A, i, j)
}
Q = cbind(c(1,2,3,4),c(2,1,2,3),c(3,1,2,4),c(2,3,1,5))
Q
det(Q) # 行列式值
C11 = cofactor(Q,1,1);C21 = cofactor(Q,2,1);C31 = cofactor(Q,3,1);
C41 = cofactor(Q,4,1)
Q[1,1]*det(C11)+Q[2,1]*det(C21)+Q[3,1]*det(C31)+Q[4,1]*det(C41)
M11 = minor(Q,1,1)
M21 = minor(Q,2,1)
M31 = minor(Q,3,1)
M41 = minor(Q,4,1)

# 單位矩陣
I5 = diag(5)
I5
I2 = diag(2)
I2
I2%*%B
B%*%I2
t(I2)%*%I2
I2%*%I2

# 行列式
det(B)
det(D)

#逆矩陣
B
solve(B)
library(MASS)
ginv(B)
3/det(B) # (1,1)
5/det(B) # (2,2)
-2/det(B) # (1,2) 或 (2,1)
inB = solve(B)
inB%*%B
B%*%inB
B%*%(1/B)
B*(1/B)
1/B

# B之非對稱矩陣
B1 = cbind(c(5,1),c(3,3))
B1
(1/2)*(B1 + t(B1))
det(B1)

# 正負定矩陣之判斷
A1 = cbind(c(1,1,-2),c(1,5,-4),c(2,-4,6))
A1
A2 = (1/2)*(A1 + t(A1))
A2
minor = function(A, i, j)
{
  A[-i, -j]  
}
A2[1,1]
M33 = minor(A2,3,3)
det(M33)
det(A2)

# 線性轉換
J1 = cbind(c(1,2),c(2,4))
J1

library(shape)
library(plotrix)
windows()
#par(mfrow=c(1,2))
plot(c(-5,10),c(10,-5),xlab="",ylab="",type="n",frame.plot=F,axes=F)
Arrows(-5,0,10,0,arr.type="curved",code=2,lwd=2)
text(10,0,labels="x",pos=1,lwd=2)
Arrows(0,-5,0,10,arr.type="curved",code=2,lwd=2)
text(0,10,labels="y",pos=2,lwd=2)
points(2,1,lwd=4,pch=20)
text(2,1,labels="(2,1)",pos=4,lwd=4)
points(4,8,lwd=4,pch=20)
text(4,8,labels="(4,8)",pos=4,lwd=4)
segments(0,0,2,1,lty=2,lwd=2)
segments(0,0,5,10,lty=2,lwd=2)
points(1,2,lwd=4,pch=20)
text(1,2,labels="(1,2)",pos=4,lwd=4)
points(5,10,lwd=4,pch=20)
text(5,10,labels="(5,10)",pos=4,lwd=4)
points(1,-1/2,lwd=4,pch=20)
text(1,-1/2,labels="(1,-1/2)",pos=4,lwd=4)
segments(0,0,4,-2,lty=4,lwd=2,col="red")
draw.circle(0,0,1,lty=3)

windows()
x = seq(-1,1,length=100)
y1 = sqrt(1-x^2)
y2 = -sqrt(1-x^2)
plot(c(x,x),c(y1,y2),xlim=c(-2,2),ylim=c(-2,2),type="l",frame.plot=F,axes=F,xlab="",ylab="")
Arrows(-2,0,2,0,arr.type="curved",code=2,lwd=2)
text(2,0,labels="x",pos=1,lwd=2)
Arrows(0,-2,0,2,arr.type="curved",code=2,lwd=2)
text(0,2,labels="y",pos=2,lwd=2)
points(1/sqrt(5),2/sqrt(5),lwd=4,pch=20)
points(1/sqrt(5),-2/sqrt(5),lwd=4,pch=20)
Arrows(0,0,2/sqrt(5),4/sqrt(5),arr.type="curved",code=2,lty=2)
Arrows(0,0,2/sqrt(5),-4/sqrt(5),arr.type="curved",code=2,lty=2)
text(1/sqrt(5),2/sqrt(5),labels=expression(paste("(",1/sqrt(5),",",2/sqrt(5),")")),pos=3)
text(1/sqrt(5),-2/sqrt(5),labels=expression(paste("(",1/sqrt(5),",",-2/sqrt(5),")")),pos=1)


# J1與J2
J1 = cbind(c(1,2),c(2,4))
J1
det(J1)
eigen(J1)$values
w1 = eigen(J1,symmetric=F)$vectors[,1]
w2 = eigen(J1,symmetric=F)$vectors[,2]
sum(w1*w2)

J2 = matrix(c(2,-2,-1,3),2,2)
J2
det(J2)
eigen(J2)$values
w1 = eigen(J2,symmetric=F)$vectors[,1]
w2 = eigen(J2,symmetric=F)$vectors[,2]
sum(w1*w2)

# Daily TSMC and TWI
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch6\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))
twi = read.table("c:\\meiyih\\Finstats\\ch6\\TWI.txt", header=T)
attach(twi)
names(twi)
twi.r = 100*diff(log(收盤價_TW))
y = tsmc.r
x = twi.r
data = cbind(x,y)
# 共變異數矩陣sigma
sigma = cov(data)
round(sigma,4)
det(sigma)
# 特性向量所構成的矩陣omega
omega = eigen(sigma,symmetric=F)$vectors
#omega = cbind(-omega[,1],omega[,2])
v1 = omega[,1]
v2 = omega[,2]

# 下列二者是相同的
t(v1)%*%v2
sum(v1*v2)

# 下列二者是相同的
t(omega)
solve(omega)

# 單位矩陣
omega%*%t(omega)
t(omega)%*%omega

# 對角矩陣,對腳為特性根Lambda
Lambda = t(omega)%*%sigma%*%omega
round(Lambda,4)
lambda = eigen(sigma)$values
round(lambda,4)

# 下列二者是相同的
sigma%*%omega
omega%*%Lambda
# 下列二者是相同的 
omega%*%Lambda%*%t(omega)
sigma

# TSMC與TWI資料轉換
adata = data%*%omega
adata
omega%*%sigma%*%omega
cov(adata)

# 還原
t(omega)%*%cov(adata)%*%solve(omega)
sigma
head(adata%*%solve(omega))
tail(adata%*%solve(omega))
head(data)
tail(data)

library(shape)
library(plotrix)
windows()
plot(x,y,type="p",xlim=c(-12,12),ylim=c(-12,12),frame.plot=F,axes=F,
     xlab="",ylab="",main="TSMC與TWI日對數報酬率之 (旋轉) 散佈圖")
Arrows(-12,0,12,0,arr.type="curved",code=2,lwd=2)
points(lambda[1]*omega[1,1],lambda[1]*omega[2,1],lwd=8,pch=20,col="tomato")
text(12,0,labels="x",pos=1,lwd=2)
Arrows(0,-12,0,12,arr.type="curved",code=2,lwd=2)
text(0,12,labels="y",pos=2,lwd=2)
Arrows(-14*omega[1,1],-14*omega[2,1],14*omega[1,1],14*omega[2,1],arr.type="curved",
       code=3,lwd=2,col="red")
draw.ellipse(c(0,0),c(0,0),a=12,b=4, angle = c(64,64),border="red",lty=1)
Arrows(-12*omega[1,2],-12*omega[2,2],12*omega[1,2],12*omega[2,2],arr.type="curved",
       code=3,lwd=2,col="blue")
text(7.5,12,labels="U",pos=1,lwd=3,col="red")
text(-10,6,labels="V",pos=1,lwd=3,col="blue")
Arrows(10,-10,lambda[1]*omega[1,1],lambda[1]*omega[2,1],arr.type="curved",
      code=1,lty=2,col="tomato")
text(10,-10,labels=expression(lambda[1]*v[1]),pos=4)
points(lambda[2]*omega[1,2],lambda[2]*omega[2,2],lwd=8,pch=20,col="tomato")
text(-8,2,labels=expression(lambda[2]*v[2]),pos=2)
Arrows(-8,2,lambda[2]*omega[1,2],lambda[2]*omega[2,2],arr.type="curved",
      code=1,lty=2,col="tomato")

windows()
plot(adata[,1],adata[,2],xlab="經過轉換之TWI日對數報酬率",ylab="經過轉換之TSMC日對數報酬率",type="p",
     main="經過轉換之TSMC與TWI日對數報酬率之散佈圖")
abline(v=0,h=0)

# 可列斯基拆解
library(quantmod)
gold1 = getMetals(c("gold","XAU"),base.currency = "CHF",
            from="2011-01-01",to="2015-06-30") # 以瑞士法郎計價
gold1
gprice1 = XAUCHF
ex = getFX("USD/CHF",from="2011-01-01",to="2015-06-30")
ex
usd = USDCHF
head(gprice1)
head(usd)
tail(gprice1)
tail(usd)
windows()
par(mfrow=c(2,1))
plot(usd,ylab="",main="美元價位 (以瑞士法郎表示) 之時間走勢")
plot(gprice1,ylab="",main="黃金價位 (以瑞士法郎表示) 之時間走勢")

y = 100*diff(log(as.numeric(gprice1))) # 
x = 100*diff(log(as.numeric(usd)))

A = cov(cbind(x,y))
round(A,4)
?chol
U = chol(A)
L = t(U)
round(L,4)
round(U,4)
L%*%U

# 最小變異數之資產組合
library(quantmod)
gold1 = getMetals(c("gold","XAU"),base.currency = "TWD",
            from="2011-01-01",to="2015-06-30") # 黃金以新台幣計價
gold1
gprice1 = XAUTWD
ex1 = getFX("USD/TWD",from="2011-01-01",to="2015-06-30")# 美元以新台幣計價
ex1
ex2 = getFX("CNY/TWD",from="2011-01-01",to="2015-06-30")# 人民幣以新台幣計價
ex2
ex3 = getFX("CHF/TWD",from="2011-01-01",to="2015-06-30")# 瑞士法郎以新台幣計價
ex3
usd = USDTWD
cny = CNYTWD
chf = CHFTWD
head(gprice1)
head(usd)
head(cny)
head(chf)
tail(gprice1)
tail(usd)
tail(cny)
tail(chf)
all = cbind(gprice1,usd,cny,chf)
head(all)
tail(all)
write.table(all,"c:\\meiyih\\Finstats\\ch11\\all.txt")
gr = 100*diff(log(as.numeric(gprice1)))
usdr = 100*diff(log(as.numeric(usd)))
cnyr = 100*diff(log(as.numeric(cny)))
chfr = 100*diff(log(as.numeric(chf)))
allr = cbind(gr,usdr,cnyr)

muhat = apply(allr,2,mean)
muhat
mean(gr)
sigma = cov(allr)
sigma
ones = matrix(rep(1,3),3,1)
Aw = cbind(2*sigma,ones)
Aw = rbind(Aw,cbind(t(ones),0))
Aw
b = c(0,0,0,1)
x = solve(Aw)%*%b
x
# 最小變異數之資產組合
w = matrix(x[1:3],3,1)
w 
MVPmu = t(w)%*%muhat
MVPmu
MVPsigma = t(w)%*%sigma%*%w
sqrt(MVPsigma)

windows()
plot(c(0,0.8),c(-0.01,0.01),type="n",xlab="風險",ylab="報酬")
points(sqrt(sigma[1,1]),muhat[1],lwd=4,pch=20) 
text(sqrt(sigma[1,1]),muhat[1],labels="GOLD",pos=1)
points(sqrt(sigma[2,2]),muhat[2],lwd=4,pch=20)
text(sqrt(sigma[2,2]),muhat[2],labels="USD",pos=1)
points(sqrt(sigma[3,3]),muhat[3],lwd=4,pch=20) 
text(sqrt(sigma[3,3]),muhat[3],labels="CNY",pos=3)
points(sqrt(MVPsigma),MVPmu,lwd=4,pch=20,col="red") 
text(sqrt(MVPsigma),MVPmu,labels="MVP",pos=3)
 

# 有效的資產組合 (三種資產)
muhat = matrix(apply(cbind(usdr,cnyr,chfr),2,mean),3,1)
muhat
sigma = cov(cbind(usdr,cnyr,chfr))
sigma
ones = matrix(rep(1,3),3,1)
A = cbind(2*sigma,muhat,ones)
A = rbind(A,c(muhat,0,0))
A = rbind(A,c(t(ones),0,0))
A
mu0 = seq(-0.02,0.03,length=100)
MU = numeric(100)
SIGMA = MU
for(i in 1:100)
{
b = matrix(c(0,0,0,mu0[i],1),5,1)
x1 = solve(A)%*%b
w1 = matrix(x1[1:3,1],3,1)
MU[i] = t(w1)%*%muhat
SIGMA[i] = sqrt(t(w1)%*%sigma%*%w1)
}
windows()
plot(SIGMA,MU,type="l",xlim=c(0.2,0.55),xlab="風險",ylab="報酬",main="有效的資產組合",lwd=2)
points(sd(usdr),mean(usdr),lwd=4,pch=20)
text(sd(usdr),mean(usdr),labels="USD",pos=1)
points(sd(cnyr),mean(cnyr),lwd=4,pch=20)
text(sd(cnyr),mean(cnyr),labels="CNY",pos=1)
points(sd(chfr),mean(chfr),lwd=4,pch=20)
text(sd(chfr),mean(chfr),labels="CHF",pos=1)
abline(v=0.35,h=0.01,lty=2)



# 有效的資產組合 (四種資產)
muhat = matrix(apply(cbind(gr,usdr,cnyr,chfr),2,mean),4,1)
muhat
sigma = cov(cbind(gr,usdr,cnyr,chfr))
sigma
ones = matrix(rep(1,4),4,1)
A = cbind(2*sigma,muhat,ones)
A = rbind(A,c(muhat,0,0))
A = rbind(A,c(t(ones),0,0))
A

mu0 = 0.004
b = matrix(c(0,0,0,0,mu0,1),6,1)
x1 = solve(A)%*%b
w1 = matrix(x1[1:4,1],4,1)
MU = t(w1)%*%muhat
SIGMA = sqrt(t(w1)%*%sigma%*%w1)
w1
MU
SIGMA

mu0 = seq(-0.02,0.045,length=100)
MU = numeric(100)
SIGMA = MU
for(i in 1:100)
{
b = matrix(c(0,0,0,0,mu0[i],1),6,1)
x1 = solve(A)%*%b
w1 = matrix(x1[1:4,1],4,1)
MU[i] = t(w1)%*%muhat
SIGMA[i] = sqrt(t(w1)%*%sigma%*%w1)
}
windows()
plot(SIGMA,MU,type="l",xlim=c(0.2,0.75),xlab="風險",ylab="報酬", ylim=c(-0.02,0.045),
        main="有效的資產組合",lwd=2)
points(sd(usdr),mean(usdr),lwd=4,pch=20)
text(sd(usdr),mean(usdr),labels="USD",pos=1)
points(sd(cnyr),mean(cnyr),lwd=4,pch=20)
text(sd(cnyr),mean(cnyr),labels="CNY",pos=1)
points(sd(chfr),mean(chfr),lwd=4,pch=20)
text(sd(chfr),mean(chfr),labels="CHF",pos=1)
abline(v=0.35,h=0.01,lty=2)
points(sd(gr),mean(gr),lwd=4,pch=20)
text(sd(gr),mean(gr),labels="GOLD",pos=1)

# Huang與Litzenberger
muhat = matrix(apply(cbind(gr,usdr,cnyr,chfr),2,mean),4,1)
muhat
sigma = cov(cbind(gr,usdr,cnyr,chfr))
sigma
ones = matrix(rep(1,4),4,1)
A = (t(ones)%*%solve(sigma)%*%muhat)[1,1]
A
B = (t(muhat)%*%solve(sigma)%*%muhat)[1,1]
B
C = (t(ones)%*%solve(sigma)%*%ones)[1,1]
C
D = B*C-A^2
D
g = (1/D)*(B*(solve(sigma)%*%ones)-A*(solve(sigma)%*%muhat))
g
h = (1/D)*(C*(solve(sigma)%*%muhat)-A*(solve(sigma)%*%ones))
h

Aw = cbind(2*sigma,ones)
Aw = rbind(Aw,cbind(t(ones),0))
Aw
b = c(0,0,0,0,1)
x = solve(Aw)%*%b
x
# 最小變異數之資產組合
w = matrix(x[1:4],4,1)
w 
MVPmu = t(w)%*%muhat
MVPmu
MVPsigma = t(w)%*%sigma%*%w
sqrt(MVPsigma)

mu0 = seq(MVPmu,0.04,length=100)
MU = numeric(100)
SIGMA = numeric(100)
for(i in 1:100)
{
 wp = g + h*mu0[i]
 MU[i] = t(wp)%*%muhat
 SIGMA[i] = sqrt(t(wp)%*%sigma%*%wp)
}
windows()
plot(SIGMA,MU,type="l",lwd=2,xlab="風險",ylab="報酬",main="導出效率前緣線",
    ylim=c(-0.01,0.05))
points(sqrt(MVPsigma),MVPmu,lwd=4,pch=20)
text(sqrt(MVPsigma),MVPmu,labels="MVP",pos=1)
points(sd(gr),mean(gr),lwd=4,pch=20)
text(sd(gr),mean(gr),labels="GOLD",pos=1)
points(sd(usdr),mean(usdr),lwd=4,pch=20)
text(sd(usdr),mean(usdr),labels="USD",pos=4)
points(sd(cnyr),mean(cnyr),lwd=4,pch=20)
text(sd(cnyr),mean(cnyr),labels="CNY",pos=1)
points(sd(chfr),mean(chfr),lwd=4,pch=20)
text(sd(chfr),mean(chfr),labels="CHF",pos=1)

# 無風險資產
rf = 1.5
rf = rf/365
rf

# 點T之資產組合
t1 = solve(sigma)%*%(muhat-rf*ones)
t2 = (t(ones)%*%t1)[1,1]
t = t1/t2
t
mut = t(t)%*%muhat
mut
sigmat = sqrt(t(t)%*%sigma%*%t)
sigmat

mu0 = seq(MVPmu,0.05,length=100)
MU = numeric(100)
SIGMA = numeric(100)
for(i in 1:100)
{
 wp = g + h*mu0[i]
 MU[i] = t(wp)%*%muhat
 SIGMA[i] = sqrt(t(wp)%*%sigma%*%wp)
}

windows()
plot(SIGMA,MU,type="l",lwd=3,xlab="風險",ylab="報酬",ylim=c(-0.01,0.05),
      xlim=c(-0.1,0.8),main="無風險與風險性資產")
points(sqrt(MVPsigma),MVPmu,lwd=4,pch=20)
text(sqrt(MVPsigma),MVPmu,labels="MVP",pos=2)
points(sd(gr),mean(gr),lwd=4,pch=20)
text(sd(gr),mean(gr),labels="GOLD",pos=1)
points(sd(usdr),mean(usdr),lwd=4,pch=20)
text(sd(usdr),mean(usdr),labels="USD",pos=4)
points(sd(cnyr),mean(cnyr),lwd=4,pch=20)
text(sd(cnyr),mean(cnyr),labels="CNY",pos=4)
points(sd(chfr),mean(chfr),lwd=4,pch=20)
text(sd(chfr),mean(chfr),labels="CHF",pos=1)
abline(v=0)
points(sigmat,mut,lwd=4,pch=20)
text(sigmat,mut,labels="T",pos=1)
points(0,rf,lwd=4,pch=20)
text(0,rf,labels=expression(r[f]),pos=2,lwd=4)
segments(0,rf,sigmat+0.15,mut+0.0083,lwd=2,lty=2,col=2)
segments(0,rf,sigmat+0.15,mut+0.02,lwd=1,lty=2)
segments(0,rf,sigmat+0.15,mut+0.001,lwd=1,lty=2)

# 
H = t(muhat-ones*rf)%*%solve(sigma)%*%(muhat-ones*rf)
H = H[1,1]
H
B-2*A*rf+C*rf^2
sqrt(H)

n = 200
mu0 = c(seq(-0.2,0,length=n/2),seq(0,0.2,length=n/2))
MU = numeric(n)
SIGMA = numeric(n)
for(i in 1:n)
{
 wp = g + h*mu0[i]
 MU[i] = t(wp)%*%muhat
 SIGMA[i] = sqrt(t(wp)%*%sigma%*%wp)
}

MU1 = numeric(n)
SIGMA1 = MU
for(i in 1:n)
{
wp = solve(sigma)%*%(muhat-rf*ones)*(mu0[i]-rf)/H
MU1[i] = t(wp)%*%muhat + (1-t(wp)%*%ones)*rf
SIGMA1[i] = sqrt(t(wp)%*%sigma%*%wp)
}
windows()
plot(SIGMA,MU,type="l",lwd=2,ylim=c(-0.05,0.05),xlim=c(-0.1,1),xlab="風險",
     ylab="報酬",main="無風險與風險性資產之效率前緣線")
lines(SIGMA1,MU1,lty=2,lwd=2)
abline(v=0)
points(0,rf,lwd=4,pch=20)
text(0,rf,labels=expression(r[f]),pos=2,lwd=4)
points(sigmat,mut,lwd=4,pch=20)
text(sigmat,mut,labels="T",pos=1)

windows()
plot(SIGMA,MU,type="l",lwd=2,ylim=c(-0.00,0.05),xlim=c(0,1))
lines(SIGMA1,MU1,lty=2)
abline(v=0)
points(sigmat,mut,lwd=4,pch=20)
text(sigmat,mut,labels="T",pos=1)
points(0,rf,lwd=4,pch=20)
text(0,rf,labels=expression(r[f]),pos=2,lwd=4)

muT = A/C - (D/C^2)*(rf-A/C)^(-1)
muT
mut
sigmaT = (muT-rf)/sqrt(H)
sigmaT
sigmat
wp = g + h*muT
wp
t



