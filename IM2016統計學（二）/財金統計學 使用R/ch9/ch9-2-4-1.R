# MLE
# 9/5/1994-7/10/2014
tsmctwi = read.table("c:\\meiyih\\Finstats\\ch9\\tsmctwi.txt",header=T)
names(tsmctwi)
attach(tsmctwi)
p1 = TSMC # Μ絃基
p2 = TWI # Μ絃基
tsmcr = 100*diff(log(p1))
library(MASS)
y1 = tsmcr
T = length(tsmcr)
T
?fitdistr
fitnorm = fitdistr(y1,"normal")    
summary(fitnorm)
fitnorm$estimate
fitnorm$estimate[2] #材把计︳璸
fitnorm$loglik
sqrt(diag(fitnorm$vcov)) # ︳璸夹非粇
fitnorm$sd # ︳璸夹非粇
# 籔fitnormゑ耕    
# ㄏノ nlm  ―程
# log likelihood function
# эタ计
?nlm
# 虫縒ML
fn = function(theta,x)  
{
 m = theta[1]
 s = abs(theta[2]) # 惠タ计
 s2 = s^2
 0.5*log(2*pi)+0.5*log(s2)+ (0.5/s2)*mean((x-m)^2)
}
theta0 = c(0,1) # 砞戳
fitnorm1 = nlm(fn, p = theta0, hessian=TRUE, x=y1)
fitnorm1

# ML T戈癟
-T*fitnorm1$minimum # 籔fitnorm$loglikゑ耕

# Hessian matrix
H = -round(fitnorm1$hessian,4)*T
H
det(H) # ︽Α
Inform = -H/T #癟痻皚キА计ボ
invI = 1/Inform
se = sqrt(diag(invI)/T) # ︳璸夹非粇 
se
sd(y1)/sqrt(T) # 妓セキА计ぇ夹非粇

# using dnorm
# 猔種T戈癟
mlogl <- function(b, x) # ョㄏノ "<-"  "="
{
 sum(-dnorm(x,mean=b[1],sd=b[2],log = TRUE))
}
b = c(0,1)
out1 = nlm(mlogl,b,x=y1,hessian=T)
out1
-out1$minimum
H1 = -out1$hessian/T # 莱猔種キА计ボ
H1
-round(out1$hessian/T,4) # 籔H
Inform1 = -H1
invI = 1/Inform1
se1 =  sqrt(diag(invI)/T) 
se1

# 猔種キА计ボ
mlog2 <- function(b, x) # ョㄏノ "<-"  "="
{
 mean(-dnorm(x,mean=b[1],sd=b[2],log = TRUE))
}
b = c(0,1)
out2 = nlm(mlog2,b,x=y1,hessian=T)
out2
-out2$minimum*T
H2 = -out2$hessian # 莱猔種キА计ボ
H2
-round(out2$hessian,4) # 籔H/T
Inform2 = -H2
invI = 1/Inform2
se2 = sqrt(diag(invI/T))
se2










