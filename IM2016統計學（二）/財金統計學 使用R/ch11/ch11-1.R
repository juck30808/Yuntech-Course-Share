# ch11-1
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
