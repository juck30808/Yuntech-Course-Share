# MLE
# 9/5/1994-7/10/2014
tsmctwi = read.table("c:\\meiyih\\Finstats\\ch9\\tsmctwi.txt",header=T)
names(tsmctwi)
attach(tsmctwi)
p1 = TSMC # 收盤價
p2 = TWI # 收盤價

tsmcr = 100*diff(log(p1))
twir = 100*diff(log(p2))

T = length(tsmcr)
#T
#n = 3000
#y = tsmcr[(T-n+1):T]
#length(y)
y1 = tsmcr
# Compute the MLEs
mu_mle   = mean(y1)
sig2_mle = mean((y1-mu_mle)^2)
mu_mle
sig2_mle
upper = mu_mle+4
lower = mu_mle-4
mu   =  seq(lower,upper,length=101)
upper = sig2_mle+2
lower = sig2_mle-2
sig2 =  seq(lower,upper,length=101)
nrows = length(mu)
ncols = length(sig2)

lnlmu = numeric(nrows)
for(i in 1:nrows)
{
s2 = sig2_mle
lnlmu[i] = -0.5*log(2*pi)-0.5*log(s2)-(mean((y1-mu[i])^2)/s2)
}
windows()
par(mfrow=c(2,1))
plot(mu,lnlmu,type="l",ylab="概似值",xlab=expression(mu), lwd=2,
    main=expression(paste("固定",sigma^2,"下",mu,"之ML估計")))
points(mu_mle,lnlmu[51],pch=20,lwd=6)
lnlsig = numeric(ncols)
for(j in 1:ncols)
{
mu1 = mu_mle
lnlsig[j] = -0.5*log(2*pi)-0.5*log(sig2[j])-(mean((y1-mu1)^2)/sig2[j])
}
plot(sig2,lnlsig,type="l",ylab="概似值",xlab=expression(sigma^2), lwd=2,
    main=expression(paste("固定",mu,"下",sigma^2,"之ML估計")))
points(sig2_mle,lnlsig[51],pch=20,lwd=6)

lnl = array(0,c(nrows,ncols)) # 101列,101行
dim(lnl)
for(i in 1:101)
{
  for(j in 1:101)
  {
  lnl[i,j] = -0.5*T*log(2*pi)-0.5*T*log(sig2[j])-sum(((y1-mu[i])^2)/sig2[j])
  }
}
windows()
persp(mu,sig2,lnl,xlab=expression(mu),ylab=expression(sigma^2),
      zlab="概似值",theta=20,phi=10,expand=0.95,ticktype="detailed",
      col="tomato",ltheta = -120,shade=0.05,box=T,
      main=expression(paste(mu,"與",sigma^2,"之ML估計")))

 
