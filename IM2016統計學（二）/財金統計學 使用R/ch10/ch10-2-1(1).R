# Newton-Raphson
windows()
x = seq(-2,1,length=100)
y = -x^(2) - 2*x - 1
plot(x,y,type="l",lwd=2)
points(-1,0,lwd=2,pch=18)
iters = 10
theta = rep(0,iters) # 0重複10次置於theta內
theta0 = 50 # 期初值
theta[1] = theta0
for(i in 2:iters)
{
  y1 = -2*theta[i-1]-2 # gradient
  y2 = -2     # Hessian
  theta[i] = theta[i-1] - y1*y2^(-1)
}
theta


# Simple regression model
x = c(1,3,5,7,9)
T = length(x)
beta1 = 0.5
sigma2 = 2
set.seed(1234)
y = beta1*x+sqrt(sigma2)*rnorm(T)

# 計算於theta下之Gradient與Hessian
theta = cbind(beta1,sigma2)
G = matrix(c(0,0),2,1)
G[1,1] = sum((y-beta1*x)*x)/sigma2
G[2,1] = -0.5*T/sigma2 + 0.5*sum((y-beta1*x)^2)/sigma2^2

H = matrix(c(0,0,0,0),2,2)
H[1,1] = -sum(x^2)/sigma2
H[1,2] = -sum((y-beta1*x)*x)/sigma2^2
H[2,1] = -sum((y-beta1*x)*x)/sigma2^2
H[2,2] = 0.5*T/sigma2^2 - sum((y-beta1*x)^2)/sigma2^3

# Average log-likelihood at theta
LL = -0.5*log(2*pi)-0.5*log(sigma2)-0.5*mean((y-beta1*x)*2)/sigma2
LL

# Newton-Raphson
LLa = numeric(10)
theta0 = matrix(rep(0,40),20,2)
model = lm(y~x-1) # 不包含常數項之簡單迴歸估計
res = residuals(model)
s2 = sum(res*res)/(T-1)
theta0[1,1] = 0.1  # beta1之期初值 # 或使用as.numeric(coef(model)[1])
theta0[1,2] = 1 # sigma2之期初值 # 或使用s2
for(i in 2:20)
{
  beta  = theta0[(i-1),1]
  sig2  = abs(theta0[(i-1),2]) 
  G = matrix(c(0,0),2,1)
  G[1,1] = sum((y-beta*x)*x)/sig2
  G[2,1] = -0.5*T/sig2 + 0.5*sum((y-beta*x)^2)/sig2^2
  H = matrix(c(0,0,0,0),2,2)
  H[1,1] = -sum(x^2)/sig2
  H[1,2] = -sum((y-beta*x)*x)/sig2^2
  H[2,1] = -sum((y-beta*x)*x)/sig2^2
  H[2,2] = 0.5*T/sig2^2 - sum((y-beta*x)^2)/sig2^3
  theta0[i,] = theta0[(i-1),] - solve(H)%*%G
  LLa[i] = -0.5*log(2*pi)-0.5*log(theta0[i,2])-
           0.5*mean((y-theta0[i,1]*x)*2)/theta0[i,2]
}
LLa
theta0
 
# Convergence Criteria
t(G)%*%G
t(G)%*%solve(H)%*%G


rm(G) # 移去G
rm(H) # 移去H
G
# 使用梯度函數收斂指標
theta = theta0[1,]
betac1  = theta[1]
sigmac2  = theta[2]  
G = cbind(rep(0,2))
G[1,1] = sum((y-betac1*x)*x)/sigmac2
G[2,1] =  -0.5*T/sigmac2+0.5*sum((y-betac1*x)^2 )/sigmac2^2  
H = matrix(c(0,0,0,0),2,2)
H[1,1] = -sum(x^2)/sigmac2
H[1,2] = -sum((y-betac1*x)*x )/sigmac2^2
H[2,1] = -sum((y-betac1*x)*x )/sigmac2^2
H[2,2] = 0.5*T/sigmac2^2 - sum((y-betac1*x)^2 )/sigmac2^3 
tol = 0.00001
k = 1
while (t(G) %*% G > tol) # 執行下列程式直至收斂指標不超過tol 
{
  theta = theta - solve(H) %*% G
  betac1  = theta[1]
  sigmac2  = theta[2]  
  G = cbind(rep(0,2))
  G[1,1] = sum((y-betac1*x)*x)/sigmac2
  G[2,1] =  -0.5*T/sigmac2+0.5*sum((y-betac1*x)^2 )/sigmac2^2  
  H = matrix(c(0,0,0,0),2,2)
  H[1,1] = -sum(x^2)/sigmac2
  H[1,2] = -sum((y-betac1*x)*x )/sigmac2^2
  H[2,1] = -sum((y-betac1*x)*x )/sigmac2^2
  H[2,2] = 0.5*T/sigmac2^2 - sum((y-betac1*x)^2 )/sigmac2^3 
  k = k+1
}
betac1
sigmac2
k
