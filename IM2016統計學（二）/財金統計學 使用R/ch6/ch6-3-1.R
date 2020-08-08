# Goodness-of-Fit Test
n = 200
A = 100
S = 70
H = 30
# testing H0: pa = 0.5, ps = 0.4, ph = 0.1
exA = 200*0.5
exS = 200*0.4
exH = 200*0.1

chi2 = (1/exA)*(A-exA)^2 + (1/exS)*(S-exS)^2 + (1/exH)*(H-exH)^2
chi2  
1-pchisq(chi2,2) # p-value

# Using the following function
chisq.test(c(100,70,30), p = c(0.5,0.4,0.1))

# chisq distribution
windows()
#par(mfrow=c(2,1))
T = 10000
n = 200
chi = numeric(T)
three = c(1,2,2,2,3,3) # 2:3/6, 3:2/6, 1:1/6
for(i in 1:T)
{
x = sample(three,n,replace=T)
index = x == 1
x1 = sum(as.numeric(index))
index = x == 2
x2 = sum(as.numeric(index))
index = x == 3
x3 = sum(as.numeric(index))
e1=n*(1/6); e2=n*(1/2); e3=n*(1/3);
chi[i] = (((x1-e1)^2)/e1) + (((x2-e2)^2)/e2) + ((x3-e3)^2)/e3
}
plot(density(chi),type="l",xlab="",axes=T,ylim=c(-0.1,0.4), ylab="", lwd=2,
     main="自由度為2之卡方分配",frame.plot=T)
x = sort(chi)
lines(x,dchisq(x,2),lty=2,col="red",lwd=2)
i = x >= qchisq(0.95,2)
polygon(c(qchisq(0.95,2),x[i],20),c(0,dchisq(x[i],2),0),col="green")
segments(qchisq(0.95,2),0,qchisq(0.95,2),0.35)
arrows(qchisq(0.95,2),0.3,(qchisq(0.95,2)+2),0.3)
text((qchisq(0.95,2)+2),0.3,labels="拒絕區",pos=4,cex=1.5)
text(qchisq(0.95,2),0,labels=expression(chi[list(0.05,2)]^2),pos=1,cex=1.5)
text(20,0,labels="卡方值",pos=1,cex=1.5)
points(chi2,0,pch=20)
arrows(10,0.08,chi2,0)
text(10,0.08,labels="6.25",pos=3)
abline(h=0)

# testing of independence
M = as.table(rbind(c(762, 327, 468), c(484, 239, 477)))
dimnames(M) = list(gender = c("男","女"),
                    party = c("股票","債券", "基金"))
Xsq = chisq.test(M)  # Prints test summary
Xsq
Xsq$observed   # observed counts (same as M)
Xsq$expected   # expected counts under the null

# party
o11 = M[1,1]
o12 = M[1,2]
o13 = M[1,3]
Ma = o11+o12+o13
Fi = M[2,1]+M[2,2]+M[2,3]
sum = Ma+Fi
Ma
D = M[1,1] + M[2,1]
D
e11 = D*(Ma/sum)
e11
