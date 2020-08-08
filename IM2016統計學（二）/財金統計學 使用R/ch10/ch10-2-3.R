set.seed(12345)
x = rexp(100,0.5)
mean(x)
var(x)
T = length(x)
n = 10
G1 = numeric(n)
H1 = G1
LL1 = G1
theta1 = G1
U1 = G1


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
