set.seed(12345)
x = rexp(100,0.5)
mean(x)
var(x)
# Newton-Raphson
T = length(x)
n = 10
G1 = numeric(n)
H1 = G1
LL1 = G1
theta1 = G1
theta = 1
for(i in 1:n)
{
G = -1/theta + mean(x)/theta^2  
H = 1/theta^2 - 2*mean(x)/theta^3
LL = -log(theta)- mean(x)/theta
theta = theta - solve(H)%*%G
G1[i] = G
H1[i] = H
LL1[i] = LL
theta1[i] = theta
}
round(G1,4)
round(H1,4)
round(LL1,4)
round(theta1,4)

# Scoring method
theta = 1
I1 = G1
J1 = G1
for(i in 1:n)
{
G = -1/theta + mean(x)/theta^2  
I = 1/theta^2
LL = -log(theta) - mean(x)/theta
theta = theta + solve(I) %*% G
G1[i] = G
J1[i] = t(G)%*%G
I1[i] = I
LL1[i] = LL
theta1[i] = theta
}
round(G1,4)
round(J1,4)
round(I1,4)
round(LL1,4)
round(theta1,4)

# BHHH algorithm 
theta = 1
Gm1 = numeric(n)
for (i in 1:n) 
{
Gt =  -1/theta + x/theta^2
Gm =  mean(Gt)
Jt =  t(Gt) %*% Gt/T
LL = -log(theta) - mean(x)/theta
theta = theta + solve(Jt) %*% Gm
J1[i] = Jt
Gm1[i] = Gm
LL1[i] = LL
theta1[i] = theta  
}
round(Gm1,4)
round(J1,4)
round(LL1,4)
round(theta1,4)

# 期初的演算過程
Gt = (-1/1) + (x/1^2)
G0 = mean(Gt)
G0
J0 = mean(Gt^2)
J0
1+((J0)^(-1))*G0


# BFGS
U1 = numeric(n)
theta = 1.1
H = -1
for(i in 1:n)
{
G = -1/theta +  mean(x)/theta^2
LL = -log(theta) - mean(x)/theta
theta = theta - solve(H) %*% G
Dtheta = -solve(H) %*% G
Gold = G
G = -1/theta + mean(x)/theta^2
DG = G - Gold
#U = -2*H+(1+(Dtheta*H/DG))*(DG/Dtheta)
U0 = -(H%*%Dtheta%*%t(DG)+DG%*%t(Dtheta)%*%H)/(t(DG)%*%Dtheta)
a = (t(Dtheta)%*%H%*%Dtheta)/(t(DG)%*%Dtheta)
b = (1+a)%*%((DG%*%t(DG))/(t(DG)%*%Dtheta))
U = U0+b
H = H+U
U1[i] = U
H1[i] = H
G1[i] = G
LL1[i] = LL
theta1[i] = theta
}

round(G1,4)
round(U1,4)
round(H1,4)
round(LL1,4)
round(theta1,4)

# Nelder-Mead algorithm
fxy = function(x,y) x^2-4*x+y^2-x*y
x = seq(-2,5,length=100)
y = seq(-2,6,length=100)
z = outer(x,y,fxy) # 高度
windows()
persp(x,y,z, theta=-35, phi=15,ticktype="detailed",lwd=2)
windows() 
image(x,y,z) # 
contour(x,y,z,add=T,lwd=2)
abline(v=3,lty=2)
abline(h=2,lty=2)

windows()
plot(c(-0.2,2),c(-0.2,1.5),type="n",xlab="",ylab="",axes=F,frame.plot=F,lwd=2)
points(0,0,lwd=2,pch=18)
text(0,0,"W",pos=1)
points(1.2,0,lwd=2,pch=18)
text(1.2,0,"B",pos=4)
segments(0,0,1.2,0,lwd=2)
points(0,0.8,lwd=2,pch=18)
text(0,0.8,"G",pos=4)
points(1.2,0.8,lwd=2,pch=18)
text(1.2,0.8,"R",pos=4)
segments(0,0,0,0.8,lwd=2)
points(1.8,1.2,lwd=2,pch=18)
text(1.8,1.2,"E",pos=4)
segments(0,0,1.8,1.2,lwd=2)
segments(1.2,0,0,0.8,lty=2,lwd=2)
points(0.6,0.4,lwd=2,pch=18)
text(0.6,0.4,"M",pos=2)
points(0.9,0.6,lwd=2,pch=18)
text(0.9,0.6,"C1",pos=1)
segments(0.6,0.4,0.6,0,lty=2,lwd=2)
text(0.6,0,"C1",pos=1)

fv = function(v) v[1]^2-4*v[1]+v[2]^2-v[2]-v[1]*v[2]
B = c(1.2,0)
W = c(0,0)
G = c(0,0.8)
S = c(3,2)
fv(B)
fv(W)
fv(G)
fv(S)
result = optim(W,fv,NULL,method="Nelder-Mead",control=c(maxit=2000,trace=T,
         reltol=1e-10,alpha=1,beta=0.5,gamma=0.5))
result

# B優於G優於W
# 設M點
M = (B+G)/2
M
fv(M)
R = c(1.2,0.8)
fv(R)
E = c(1.8,1.2)
fv(E)
C1 = (M+R)/2
C1

# 指數分配
set.seed(12345)
x = rexp(100,0.5)
mean(x)
start = 1
LL = function(theta)
{
 -mean(dexp(x,theta,log=T))
}
modele = optim(start,LL,method="Nelder-Mead",control=c(maxit=2000,trace=T,
         reltol=1e-10,alpha=1,beta=0.5,gamma=0.5))
modele

LLa = function(theta,x)
{
 -mean(dexp(x,theta,log=T))
}
y = x
modela = optim(start,LLa,method="BFGS",x=y,hessian=T)
modela

# 估計標準誤
T = length(x)

H1
J1
I1
seH = sqrt(-(H1[8]^(-1))/T)
seH
seI = sqrt((I1[10]^(-1))/T)
seI
seJ = sqrt((J1[10]^(-1))/T)
seJ

# xbar^2的抽樣分配
x = rnorm(100,2,4)
xbar = mean(x)
xbar2 = xbar^2
xbar2
varxbar2 = 4*4*4/100
varxbar2

T = 50000
R = 10000
theta0 = 2
sigma02 = 4
standW = numeric(R)
for(i in 1:R)
{
 x = rnorm(T,theta0,sqrt(sigma02))
 xbar2 = mean(x)^2
 varxbar2 = 4*(theta0^2)*(sigma02)/T
 standW[i] = (xbar2-theta0^2)/sqrt(varxbar2)
}
windows()
mean(standW) # 標準化後
var(standW)  # 標準化後
plot(density(standW),ylim=c(0,0.5),lwd=2)
lines(sort(standW),dnorm(sort(standW)),lty=2,lwd=2)

# CLT之推廣
T = 100
R = 10000
theta0 = 2
sigma02 = 4
xbar2W = numeric(R)
set.seed(1234)
for(i in 1:R)
{
 x = rnorm(T,theta0,sqrt(sigma02))
 xbar2W[i] = mean(x)^2
}
windows()
par(mfrow=c(2,1))
mean(xbar2W)
var(xbar2W)
varxbar2 = 4*(theta0^2)*(sigma02)/T
varxbar2
plot(density(xbar2W),xlab=expression(bar(x)^2),main=expression(paste(bar(x)^2,
     "的抽樣分配 (常態分配)")),lwd=2)
x1 = sort(xbar2W)
lines(x1,dnorm(x1,theta0^2,sqrt(varxbar2)),lty=2,lwd=2)
abline(v=mean(x1))

# uniform distribution (0,1)
sigma02 = 1/12
theta0 = 0.5
varxbar2 = 4*(theta0^2)*(sigma02)/T
varxbar2
set.seed(1234)
for(i in 1:R)
{
 x = runif(T)
 xbar2W[i] = mean(x)^2
}
mean(xbar2W)
var(xbar2W)
plot(density(xbar2W),xlab=expression(bar(x)^2),main=expression(paste(bar(x)^2,
     "的抽樣分配 (均等分配)")),lwd=2)
x1 = sort(xbar2W)
lines(x1,dnorm(x1,theta0^2,sqrt(varxbar2)),lty=2,lwd=2)
abline(v=mean(x1))


# CLT, again
T = 1000000
R = 10000
xbar = numeric(R)
for(i in 1:R)
{
 x = rnorm(T,1,2)
 xbar[i] = mean(x)
}
xbar1 = xbar-1
xbar2 = sqrt(T)*xbar1
windows()
par(mfrow=c(2,1))
plot(density(xbar1),xlab=expression(bar(x)-mu),main=expression(paste(bar(x)-mu,
         "之抽樣分配")),lwd=2)
y1 = sort(xbar1)
lines(y1,dnorm(y1,0,2/sqrt(T)),lty=2,lwd=2)
plot(density(xbar2),xlab=expression(sqrt(T)*(bar(x)-mu)),main=
    expression(paste(sqrt(T)*(bar(x)-mu),"之抽樣分配")),lwd=2)
y2 = sort(xbar2)
lines(y2,dnorm(y2,0,2),lty=2,lwd=2)
