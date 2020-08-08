TWIm = read.table("c:\\meiyih\\Finstats\\ch2\\TWIm.txt",header=T)#此檔內有名稱
names(TWIm) # TWIm內有各序列名稱
attach(TWIm) # 接近此檔案
TSMCm = read.table("c:\\meiyih\\Finstats\\ch2\\TSMCm.txt",header=T)
names(TSMCm)
attach(TSMCm)
積股利 = 積本益比/積收盤價
積股利 = 1/積股利
price = 積收盤價
T = length(price)
div = 積股利
lr = 100*(log(price[2:T]+div[2:T])-log(price[1:(T-1)]))
股利 = 本益比/收盤價
股利 = 1/股利
price = 收盤價
div = 股利 
T = length(price)
lr.TWI = 100*(log(price[2:T]+div[2:T])-log(price[1:(T-1)]))

# Fiancial applications
y = lr
x = lr.TWI
mx = mean(x)
my = mean(y)
sdx = sd(x)
sdy = sd(y)
windows()
plot(x,y,main="TSMC與TWI月報酬率之散佈圖",lwd=2)
abline(lm(y~x))
abline(v=mean(x),h=mean(y), lty=2, col="red")
text(x=mean(x), y=-30, labels=expression(bar(x)))
text(x=-18, y=mean(y), labels=expression(bar(y)))

# covariance and correlation between x and y
cov(x,y)
cor(x,y)

# 2/3 TSMC and 1/3 TWI
w = 2/3
y = lr
x = lr.TWI
mx = mean(x)
my = mean(y)
sdx = sd(x)
sdy = sd(y)
mean(w*y+(1-w)*x)
sd(w*y+(1-w)*x)
mx
my
sdx
sdy

# rho = 1 and rho = -1
w = seq(-0.5,1.5,length=100)
mp = w*mx+(1-w)*my
rho = 1
sdxy = rho*sdx*sdy
varp1 = w^2*sdx^2+(1-w)^2*sdy^2+2*w*(1-w)*sdxy
sdp1 = sqrt(varp1)
rho = -1
sdxy = rho*sdx*sdy
varpn1 = w^2*sdx^2+(1-w)^2*sdy^2+2*w*(1-w)*sdxy
sdpn1 = sqrt(varpn1)
windows()
plot(sdp1,mp,type="l",xlab=expression(sigma[p]),ylab=expression(mu[p]),
     xlim=c(0,12), ylim=c(3,7),main="為何可以有資產組合?",lwd=4)
points(sdx,mx,col="blue", lwd=3)
text(sdx,mx, labels="TWI", pos=1, col="blue")
points(sdy,my,col="blue",lwd=3)
text(sdy,my, labels="TSMC", pos=4, col="blue")
lines(sdpn1,mp,lty=2,col="green",lwd=3)
rho = cor(x,y)
sdxy = rho*sdx*sdy
varpxy = w^2*sdx^2+(1-w)^2*sdy^2+2*w*(1-w)*sdxy
sdpxy = sqrt(varpxy)
lines(sdpxy,mp, lty=3, col="red",lwd=3)
rho = -0.5
sdxy = rho*sdx*sdy
varpxy = w^2*sdx^2+(1-w)^2*sdy^2+2*w*(1-w)*sdxy
sdpxy = sqrt(varpxy)
lines(sdpxy,mp, lty=4, col="gray",lwd=3)
rho = 0
sdxy = rho*sdx*sdy
varpxy = w^2*sdx^2+(1-w)^2*sdy^2+2*w*(1-w)*sdxy
sdpxy = sqrt(varpxy)
lines(sdpxy,mp, lty=5, col="orange",lwd=3)
legend("bottomleft", legend=c(expression(rho[xy]==1), expression(rho[xy]==-1),
      expression(rho[xy]==0.7525), expression(rho[xy]==-0.5), expression(rho[xy]==0)),
      col=c("black","green","red","gray","orange"), lty=1:5,lwd=3)
      
# efficient portfolio
# 沒有放空
w = seq(0,1,length=1000)
mp = w*mx+(1-w)*my
varp = w^2*sdx^2+(1-w)^2*sdy^2+2*w*(1-w)*cov(x,y)
sdp = sqrt(varp)
windows()
par(mfrow=c(2,1))
plot(sdp,mp,type="l",lwd=4, ylim=c(4,7),xlim=c(6,10),
     xlab=expression(sigma[p]), ylab=expression(mu[p]),main="效率前緣線 (沒有放空)")
points(sdx,mx,col="red", lwd=3)
text(sdx,mx, labels="TWI", pos=4, col="red")
points(sdy,my,col="blue",lwd=3)
text(sdy,my, labels="TSMC", pos=1, col="blue")

# 有放空 
w = seq(-1,2,length=1000)
mp = w*mx+(1-w)*my
varp = w^2*sdx^2+(1-w)^2*sdy^2+2*w*(1-w)*cov(x,y)
sdp = sqrt(varp)
plot(sdp,mp,type="l",lwd=4, ylim=c(3,8),xlim=c(6,13), 
     xlab=expression(sigma[p]), ylab=expression(mu[p]),main="效率前緣線 (有放空)")
points(sdx,mx,col="red", lwd=3)
text(sdx,mx, labels="TWI", pos=4, col="red")
points(sdy,my,col="blue",lwd=3)
text(sdy,my, labels="TSMC", pos=3, col="blue")

# Compute VaR
windows()
plot(density(y),xlab="TSMC的月報酬率",ylab="機率", main="VaR的估計",lwd=3)
abline(v=quantile(y,prob=0.05), lty=2, col="red")
abline(v=quantile(y,prob=0.1), lty=3, col="blue")
abline(v=quantile(y,prob=0.95), lty=4, col="gray")
abline(v=quantile(y,prob=0.90), lty=5, col="green")
legend("topleft", c("Long 5%","Long 10%","Short 5%","Short 10%"), lty=2:4,
      col=c("red","blue","gray","green"), bty="n")

V = 100000
y1 = (quantile(y,prob=0.05)/100)
y1
y1*V
 
V = 100000
y2 = (quantile(y,prob=0.10)/100)
y2
y2*V

V = -100000
y3 = (quantile(y,prob=0.95)/100)
y3
y3*V

V = -100000
y4 = (quantile(y,prob=0.90)/100)
y4
y4*V

exp(y1)-1
exp(y2)-1
exp(y3)-1
exp(y4)-1
