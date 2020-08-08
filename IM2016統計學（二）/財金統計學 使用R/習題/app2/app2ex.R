# appex
# 1-1
# ex3
x = c(1,2,3)
y = c(4,5,6)
t(x)%*%y
3*x -4*y

# ex4
x = matrix(c(1,2,3),3,1)
y = matrix(c(4,5,6),3,1)
t(x)%*%y
3*x-4*y

# 1-2
library(shape)
windows()
plot(c(-3,3),c(-3,3),type="n",frame.plot=F,axes=F,xlab="",ylab="")
Arrows(0,-3,0,3,arr.type="curved",code=2,lty=2)
Arrows(-3,0,3,0,arr.type="curved",code=2,lty=2)
text(0,3,labels="y",pos=2)
text(3,0,labels="x",pos=1)
points(1,-1,lwd=4,pch=20)
text(1,-1,labels="(1,-1)",pos=1)
points(2,1,lwd=4,pch=20)
text(2,1,labels="(2,1)",pos=1)
points(0,0,lwd=4,pch=20)
text(0,0,labels="(0,0)",cex=0.8,adj=c(0,0))
Arrows(0,0,1,-1,arr.type="curved",code=2)
Arrows(0,0,2,1,arr.type="curved",code=2)
points(-1,-2,lwd=4,pch=20)
text(-1,-2,labels="(-1,-2)",pos=1)
Arrows(0,0,-1,-2,arr.type="curved",code=2)
Arrows(0,0,-2,-1,arr.type="curved",code=2,lty=20)
points(-2,-1,lwd=4,pch=20)
text(-2,-1,labels="(-2,-1)",pos=1)

# 1-2-1
# ex1,2
H = matrix(c(2,3,5,7,1,6),2,3)
G = matrix(c(2,0,0,0,4,0,0,0,3.5),3,3)
t(H)%*%G
H%*%G

# ex4
a = c(2,3)
b = c(1,2)
dot.prod = sum(a*b)
norm.a = norm(a,type="2") # L2 norm = Euclidean norm
norm.b = norm(b,type="2") 
#norm.a = sqrt(a[1]^2+a[2]^2) # 與norm.a相同
#norm.b = sqrt(b[1]^2+b[2]^2) # 與norm.b相同
cos.theta = dot.prod/(norm.a * norm.b)
acos(cos.theta)*180/pi # 弧度轉成度,180度 = pi弧度
library(aspace)
acos_d(cos.theta) # 弧度轉成度

# ex5
B = matrix(c(5,2,2,3),2,2)
H = matrix(c(2,3,5,7,1,6),2,3)
t(B%*%H)
t(H)%*%t(B)


# 1-2-2
# ex1
windows()
plot(c(-1,5),c(5,-1),xlab="",ylab="",frame.plot=F,axes=T,type="n")
Arrows(-1,0,5,0,arr.type="curved",code=2)
Arrows(0,-1,0,5,arr.type="curved",code=2)
text(0,5,labels="y",pos=2)
text(5,0,labels="x",pos=1)
points(1,1,lwd=4,pch=20)
text(1,1,labels="(1,1)",pos=1)
points(3,3,lwd=4,pch=20)
text(3,3,labels="(3,3)",pos=1)
points(2,1,lwd=4,pch=20)
text(2,1,labels="(2,1)",pos=1)
points(4,3,lwd=4,pch=20)
text(4,3,labels="(4,3)",pos=1)
Arrows(1,1,3,3,arr.type="curved",code=2,col="red",lwd=2)
Arrows(2,1,4,3,arr.type="curved",code=2,col="blue",lwd=2)
# 二向量
a = c(2,2)
b = c(2,2)
cbind(a,b)
text(2,2.1,labels=expression(a),pos=3,col="red")
text(3,2.1,labels=expression(b),pos=3,col="blue")
Arrows(0,0,2,1,arr.type="curved",code=2,lwd=2,lty=2)
text(0.5,0.3,labels=expression(c),pos=3)

# ex3
matrix(c(1,0,0,0,1,0,0,0,1),3,3)
diag(3)
cbind(c(1,0,0),c(0,1,0),c(0,0,1))

# 1-2-3
# ex1
B
1/B
inB = solve(B)
inB%*%B
B%*%inB
B%*%(1/B)
B*(1/B)

# ex2
J = cbind(c(1,2,3),c(4,5,6),c(7,8,9))
J
solve(J)
det(J)
ginv(cbind(c(1,2,3),c(4,5,6),c(7,8,9)))

# ex3
J1 = cbind(c(1,2,3),c(4,5,6),c(7,8,10))
J1
solve(J1)
det(J1)
ginv(J1)

# ex5
G = matrix(c(2,0,0,0,4,0,0,0,3.5),3,3)
G
1/G
solve(G)

# ex6
W = cbind(c(1,1),c(1,-1))
W
solve(W)%*%c(2,1)

# 1-2-4
# ex1
G
det(G)

# ex3
minor = function(A, i, j)
{
  A[-i, -j]  
}
H1 = cbind(c(0.2486,-0.0043,-0.0025),c(-0.0043,0.1969,0.0314),
          c(-0.0025,0.0314,0.0077))
H1
det(H1)
M11 = minor(H1,1,1)
det(M11)
M22 = minor(H1,2,2)
det(M22)
M33 = minor(H1,3,3)
det(M33)

# ex4
H1 = cbind(c(0.2486,-0.0043,-0.0025),c(-0.0043,0.1969,0.0314),
          c(-0.0025,0.0314,0.0077))
H2 = -H1
H2
H2[1,1]
M33 = minor(H2,3,3)
det(M33)
det(H2)

# ex5
H3 = round(model8$hessian/T,4) #可參考ch10-1-3.R
H3
H3[1,1]
det(H3[1:2,1:2])
det(H3[1:3,1:3])
det(H3[1:4,1:4])
det(H3[1:5,1:5])
det(H3)

# 2-1
# ex3
J2 = matrix(c(2,-2,-1,3),2,2)
J2
?eigen
# 特性根
eigen(J2,symmetric=F)$values
# 特性根向量
eigen(J2,symmetric=F)$vectors
1/sqrt(2)
1/sqrt(5)

# ex4
w1 = eigen(J2,symmetric=F)$vectors[,1]
w2 = eigen(J2,symmetric=F)$vectors[,2]
sum(w1*w2)
dot.prod = sum(w1*w2)
norm.w1 = sqrt(w1[1]^2+w1[2]^2)  
norm.w2 = sqrt(w2[1]^2+w2[2]^2)  
cos.theta = dot.prod/(norm.w1 * norm.w1)
acos(cos.theta)*180/pi # 弧度轉成度,180度 = pi弧度
library(aspace)
acos_d(cos.theta) # 弧度轉成度

# ex5
library(quantmod)
gold = getMetals(c("gold","XAU"),base.currency = "USD",
            from="2011-01-01",to="2015-08-25") # 黃金以美元計價
gold
gprice = XAUUSD
head(gprice)
tail(gprice)
ex1 = getFX("CHF/USD",from="2011-01-01",to="2015-08-25")
ex1
chf = CHFUSD #瑞士法郎以美元計價
head(chf)
tail(chf)
ex2 = getFX("TWD/USD",from="2011-01-01",to="2015-08-25")
ex2
twd = TWDUSD #新台幣以美元計價
head(twd)
tail(twd)
#ex3 = getFX("YEN/USD",from="2011-01-01",to="2015-08-25")
#ex3
#yen = YENUSD #日圓以美元計價
#head(yen)
#tail(yen)
ex4 = getFX("CNY/USD",from="2011-01-01",to="2015-08-25")
ex4
cny = CNYUSD #人民幣以美元計價
head(cny)
tail(cny)
黃金 = 100*diff(log(as.numeric(gprice)))
瑞士法郎 = 100*diff(log(as.numeric(chf)))
新台幣 = 100*diff(log(as.numeric(twd)))
#日圓 = 100*diff(log(as.numeric(yen)))
人民幣 = 100*diff(log(as.numeric(cny)))
all = cbind(黃金,瑞士法郎,新台幣,人民幣)
omega = cov(all)
R = cor(all)
R
windows()
pairs(all,main="日對數報酬率之間的關係")
eigen(omega)
eigen(R)
w1 = eigen(omega)$vectors[,1]
w2 = eigen(omega)$vectors[,2]
w3 = eigen(omega)$vectors[,3]
w4 = eigen(omega)$vectors[,4]
sum(w1*w2)
sum(w1*w3)
sum(w1*w4)
sum(w2*w3)
sum(w2*w4)

# 2-2
# ex1
x = c(2.5,0.5,2.2,1.9,3.1,2.3,2,1,1.5,1.1)
y = c(2.4,0.7,2.9,2.2,3.0,2.7,1.6,1.1,1.6,0.9)
x = x - mean(x)
y = y - mean(y)
x
y
windows()
par(mfrow=c(2,1))
plot(x,y,type="p",lwd=2,main="轉換前",ylim=c(-2,2),xlim=c(-2,2))
abline(v=0,h=0)
data = cbind(x,y)
sigma = cov(data)
lambda = eigen(sigma)$values
omega = eigen(sigma,symmetric=F)$vectors
#omega = cbind(-omega[,1],omega[,2])
lambda
omega
Arrows(-2*omega[1,1],-2*omega[2,1],2*omega[1,1],2*omega[2,1],arr.type="curved",
       code=3,lwd=2,col="blue")
Arrows(-2*omega[1,2],-2*omega[2,2],2*omega[1,2],2*omega[2,2],arr.type="curved",
       code=3,lwd=2,col="blue")
adata = data%*%omega
plot(adata[,1],adata[,2],type="p",xlim=c(-2,2),ylim=c(-2,2),lwd=2,
     xlab="",ylab="",main="轉換後")
abline(v=0,h=0)
round(omega%*%sigma%*%omega,4)
round(cov(adata),4)
round(sigma,4)
adata
solve(omega)%*%cov(adata)%*%solve(omega)
sigma
adata%*%solve(omega)
data

# ex2
sigma = cov(all)
sigma
eigen(sigma)
omega = eigen(sigma,symmetric=F)$vectors
t(omega)
solve(omega)
aall = all%*%omega
round(cov(aall),2)
t(omega)%*%cov(aall)%*%solve(omega)
sigma

# ex5
y = tsmc.r
x = twi.r
data = cbind(x,y)
R = cor(data)
R
eigen(R,symmetric=F)

# 3-1
# ex2
f = function(x,y) 10*x + 10*y + x*y - x^2 - y^2
x = seq(0,10,length=100)
y = x
z = outer(x,y,f)
windows()
par(bg = "white")
persp(x,y,z, theta=-30, phi=30,ticktype="detailed",box=T)
windows()
image(x,y,z) # 
contour(x,y,z,add=T,lwd=2)
# 梯度
gx = function(x,y) 10 + y - 2*x
gy = function(x,y) 10 + x - 2*y
zx = outer(x,y,gx)
zy = outer(x,y,gy)
windows()
par(mfrow=c(1,2))
persp(x,y,zx, theta=-30, phi=30,ticktype="detailed",box=T)
persp(x,y,zy, theta=-30, phi=30,ticktype="detailed",box=T)
# 黑森矩陣
H11 = -2
H12 = 1
H21 = 1
H22 = -2
H = matrix(c(H11,H21,H12,H22),2,2)
H
det(H)

# ex4-6
A = 1;a = 1/3;b = 1/3;P = 3;w = 1;r = 2
pi = function(L,K) P*A*(L^a)*(K^b)-w*L-r*K 
L = seq(0.1,2,length=20);K = L
z = outer(L,K,pi)
windows()
persp(L,K,z,theta=-30,phi=30,expand=0.5,col = "pink",ltheta = 120, 
    shade = 0.3, ticktype = "detailed",zlab = "利潤",main="利潤函數") -> res
points(trans3d(1/2,1/4,pi(1/2,1/4),pmat=res),pch=16,lwd=10)
# 等產量曲線
windows()
image(L,K,z) # 
contour(L,K,z,add=T,lwd=2)
# 梯度
gL = function(L,K) P*A*a*(L^(a-1))*K^b-w
gK = function(L,K) P*A*b*(L^a)*K^(b-1)-r
zL = outer(L,K,gL)
zK = outer(L,K,gK)
zK = zK/5 # 以5表示
windows()
persp(L,K,zL,theta=-30,phi=30,expand=0.5,col = "white",ltheta = 120, 
    shade = 0.3, ticktype = "detailed",zlab = "L之邊際利潤",main="L之梯度函數") -> res
points(trans3d(1/2,1/4,pi(1/2,1/4),pmat=res),pch=16,lwd=10)
windows()
persp(L, K, zK, theta = -65, phi = 30, col = "green",ltheta = -12, shade = 0.05,
       ticktype = "detailed",zlab = "K之邊際利潤",main="K之梯度函數") -> res
points(trans3d(1/2,1/4,pi(1/2,1/4)/5,pmat=res),pch=16,lwd=10)

# 第一階條件
gL(1/2,1/4)
gK(1/2,1/4)
# 第二階條件
# 黑森矩陣
HLL = function(L,K) P*A*a*(a-1)*(L^(a-2))*K^b
HLK = function(L,K) P*A*a*b*(L^(a-1))*K^(b-1)
HKL = function(L,K) P*A*b*a*(L^(a-1))*K^(b-1)
HKK = function(L,K) P*A*b*(L^a)*(b-1)*K^(b-2)
H = matrix(c(HLL(1/2,1/4),HLK(1/2,1/4),HKL(1/2,1/4),HKK(1/2,1/4)),2,2)
H
det(H)

# 2-3-3
# ex6
n = 100
beta0 = 2; beta1 = 0.5; beta2 = 0.9;beta = c(beta0,beta1,beta2);b # 3 by 1
set.seed(1234)
x1 = rnorm(n,2,3);x2 = rnorm(n,4,8)
X = cbind(rep(1,n),x1,x2) # n by 3
y = X%*%beta + matrix(rnorm(n,0,4))
y
b = solve(t(X)%*%X)%*%t(X)%*%y
b

# 2-4
# ex1
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

y = 100*diff(log(as.numeric(gprice1))) # 黃金日對數報酬率
x = 100*diff(log(as.numeric(usd))) # 美元日對數報酬率
data = cbind(x,y)
sigma = cov(data)
library(mvtnorm)
# 使用可列斯基拆解
r = rmvnorm(1000,mean=c(mean(x),mean(y)),sigma=sigma,method="chol")
cov(r)

# ex2,3
A = cbind(c(49,14,7,-14),c(14,85,-16,5),c(7,-16,105,-34),c(-14,5,-34,158))
A
t(A)
solve(A)
A[1,1]
det(A[1:2,1:2])
det(A[1:3,1:3])
det(A)
U = chol(A)
L = t(U)
L%*%U