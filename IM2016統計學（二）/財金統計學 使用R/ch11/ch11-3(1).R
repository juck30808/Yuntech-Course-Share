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
rf = 0.02
rf = rf/365

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
