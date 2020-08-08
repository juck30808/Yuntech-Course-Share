# 傳統pdf
# 二變數常態
mux = -1
muy = 1
fxy = function(x,y) ((2*pi)^(-1))*exp(-(0.5)*((x-mux)^2+(y-muy)^2)) 
x = seq(-4,2,length=100)
y = seq(-2,4,length=100)
z = outer(x,y,fxy) # 高度
windows()
#par(mfrow=c(2,2))
persp(x,y,z, theta=-30, phi=30,ticktype="detailed",lwd=2)
windows() 
image(x,y,z) # 
contour(x,y,z,add=T,lwd=2)
#fx = function(x,y,h=0.001) (fxy(x+h,y)-fxy(x,y))/h
#fy = function(x,y,h=0.001) (fxy(x,y+h)-fxy(x,y))/h
#zfx = outer(x,y,fx)
#zfy = outer(x,y,fy)
#windows()
#par(mfrow=c(2,2))
#persp(x,y,zfx, theta=-30,phi=15,ticktype="detailed")
#persp(x,y,zfy, theta=-30,phi=15,ticktype="detailed")
#image(x,y,zfx)
#contour(x,y,zfx,add=T)
#image(x,y,zfy)
#contour(x,y,zfy,add=T)
?optim
gx = function(x) fxy(x[1],x[2])
model1 = optim(c(0.5,0.5),gx,method="BFGS",control=list(fnscale=-1))
model1

fmuxy = function(mux,muy) -(0.5)*((-1-mux)^2+(1-muy)^2)

# 對數概似函數
ll = function(par)
{
 mux = par[1]
 muy = par[2]
 -(0.5)*((-1-mux)^2+(1-muy)^2)+log(1/(2*pi))
}
mux = seq(-4,2,length=20)
muy = seq(-2,4,length=20)
z = outer(mux,muy,fmuxy)
windows()
persp(mux,muy,z, theta=30, phi=30,ticktype="detailed",lwd=2)
gmu = function(x) fmuxy(x[1],x[2])
model2 = optim(c(0,0),ll,method="BFGS",hessian = TRUE,control=list(fnscale=-1))
model2
exp(model2$value)
model1$value
