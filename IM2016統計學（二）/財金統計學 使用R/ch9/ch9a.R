# ch9
# MLE
# 9/5/1994-7/10/2014
tsmctwi = read.table("c:\\meiyih\\Finstats\\ch9\\tsmctwi.txt",header=T)
names(tsmctwi)
attach(tsmctwi)
p1 = TSMC # 收盤價
p2 = TWI # 收盤價
# MLE
# 不重疊 k=2
n = length(p1)
m = n/2
tsmcr_non = numeric(m)
for(i in 1:m)
{
h = 2*i 
j = 2*(i-1)+1
tsmcr_non[i] = 100*(log(p1[h])-log(p1[j]))
}
n = c(10,100,200,500)
windows()
par(mfrow=c(2,2))
xmean = numeric(4)
maxi = numeric(4)
for(i in 1:4)
{
n1 = n[i]
T = length(tsmcr_non)
y = tsmcr_non[(T-n1+1):T]
index = y >= -0.5
y1 = as.numeric(index)
p = mean(y1)
likelihood = function(y1,p)
{
likelihood = 1
for(i in 1:length(y1))
 {
   if (y1[i] == 1)
   {
     likelihood = likelihood*p
   }
   else
   {
     likelihood = likelihood*(1-p)
   }
  }
  return(likelihood)
}
p1 = seq(0,1,by=0.001) # possible p
plot(p1,likelihood(y1,p1), lwd=2,
     type="l",main=paste("概似值為p之函數, n = ",n1),
     xlab="p", ylab="概似值")
grid()
mle.results = optimize(function(p) {likelihood(y1,p)},
interval = c(0,1),maximum=TRUE)
maxi[i] = mle.results$maximum
xmean[i] = mean(y1)
abline(v=xmean[i],lty=2,col="red")
}
maxi
xmean
