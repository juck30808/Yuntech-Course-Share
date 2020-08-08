# Nelder-Mead algorithm
# 圖解
windows()
plot(c(0,8.5),c(0,8.5),type="n",frame.plot=F,axes=F,xlab="",ylab="")
segments(1,1,3,5,lwd=3)
segments(1,1,5,2,lwd=3)
segments(3,5,5,2,lwd=3)
segments(1,1,4,3.5,lwd=3)
segments(1,1,8,6.8,lwd=3)
text(1,1,labels="W",pos=2,cex=1.5)
text(3,5,labels="B",pos=3,cex=1.5)
text(5,2,labels="G",pos=1,cex=1.5)
text(4,3.5,labels="M",pos=3,cex=1.5)
points(6,5.15,pch=20,cex=1.5)
text(6,5.15,labels="R",pos=3,cex=1.5)
points(8,6.8,pch=20,cex=1.5)
text(8,6.8,labels="E",pos=3,cex=1.5)
segments(3,5,8,6.8,lty=2,lwd=3)
segments(5,2,8,6.8,lty=2,lwd=3)
text(5.2,4.1,labels="d",pos=3)
text(7,5.9,labels="d",pos=3)
segments(4,3.5,2.3,3.5,lty=2,lwd=3)
points(2.25,3.5,pch=20,cex=1.5)
text(2.25,3.5,labels="S",pos=3,cex=1.5)
points(5,4.3,pch=20,cex=1.5)
text(5,4.3,labels=expression(C[2]),pos=3,cex=1.5)
segments(5,4.3,5,2,lty=2)
segments(5,4.3,3,5,lty=2)
points(3,2.65,pch=20,cex=1.5)
segments(3,2.65,5,2,lty=2)
segments(3,2.65,3,5,lty=2)
text(3,2.65,labels=expression(C[1]),pos=1,cex=1.5)

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

