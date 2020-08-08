
# Exponential distribution
?rexp
1-pexp(3,rate=2)

windows()
x = seq(0,20,length=100)
plot(x,dexp(x,0.5),type="l",ylab="",main="不同參數下的指數分配之PDF",lwd=2)
lines(x,dexp(x,0.1),lty=2,col="red",lwd=2)
lines(x,dexp(x,2),lty=3,col="green",lwd=2)
leg = expression(beta == 0.5, beta == 0.1, beta == 2)
legend("topright",leg,col=c("black","red","green"),lty=1:3,bty="n",lwd=2)

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

