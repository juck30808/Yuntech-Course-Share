# TSMC monthly prices and dividends      
tsmcm = read.table("c:\\meiyih\\Finstats\\ch7\\tsmcm.txt", header=T)
attach(tsmcm)
names(tsmcm)
#1/2000-6/2014
y = 收盤價
x = 本益比
div = x/y
div = 1/div # 轉成股利
y1 = ts(y,start=c(2000,1),frequency=12)
div1 = ts(div,start=c(2000,1),frequency=12)
windows()
par(mfrow=c(2,2))
plot(y1,type="l",ylab="收盤價",main="(a) TSMC月收盤價走勢",lwd=2)
plot(div1,type="l",ylab="股利",main="(b) TSMC月股利走勢",lwd=2)
plot(log(y1),type="l",ylab="對數值",ylim=c(-2,5),main="(c) 收盤價與股利以對數值表示",lwd=2)
lines(log(div1),lty=1,col="red",lwd=2)
plot(log(div1),log(y1),type="p",xlab="股利",ylab="收盤價",
           main="(d) 收盤價與股利之間的散佈圖",lwd=2)
abline(lm(log(y1)~log(div1)),col="red",lwd=2)
 
cor(y,div)
ly = log(y)
ldiv = log(div)
cor(ly,ldiv)
model = lm(ly~ldiv)
summary(model)
coef(model)
res = residuals(model)
lyr = diff(ly)
ldivr = diff(ldiv)
res1 = res[2:length(res)]
m = length(lyr)
dy1 = lyr[2:m]
ecm = res1[1:(m-1)]
summary(lm(dy1~ecm))

dy2 = lyr[3:m]
ecm1 = res1[1:(m-2)]
dy21 = lyr[2:(m-1)]
divr1 = ldivr[2:(m-1)]
summary(lm(dy2~ecm1+dy21+divr1))

windows()
par(mfrow=c(2,1))
plot(ecm,type="l",xlab="時間",ylab="",main="TSMC月對數股價與股利之長期失衡走勢",lwd=2)

# all VR ratio test
all = cbind(ly,ldiv,res) #  
n = length(all[,1]) # 第一行之長度
n
w = 30
q1 = 2:w
VR = matrix(0,(w-1),3)
for(k in 1:3)
{
 p = all[,k]
  for(j in 1:(w-1))
  {
   q = q1[j]  
   p = p
   chat = (p[n]-p[1])/(n-1)
   sigma1 = 0
     for(i in 2:n)
      {
         sigma = (p[i]-p[i-1]-chat)^2
         sigma1 = sigma1+sigma
      }
      sigma12 = sigma1/((n-1)-1)
      sigma3 = 0
      for(i in q:(n-1))
        {
           sigma = (p[(i+1)]-p[((i+1)-q)]-q*chat)^2
           sigma3 = sigma3+sigma
        }
      m = q*((n-1)-q+1)*(1-(q/(n-1)))
      sigma32 = sigma3/m
      h = 2*((2*q)-1)*(q-1)/(3*q)
      VR[j,k] = sqrt((n-1))*((sigma12/sigma32)-1)/sqrt(h)
   }
}
VRy = VR[,1];VRx = VR[,2]; VRres = VR[,3]; 
plot(VRy,type="l",xlab="k",ylab="VR檢定統計量",main="不同k下之VR檢定",lwd=2,
       ylim=c(-2,3.5))
lines(2:w,VRx,col="red",lty=17,lwd=2)
lines(2:w,VRres,col="blue",lty=18,lwd=2)
abline(h=1.96,lty=2)
abline(h=-1.96,lty=2)
legend("topleft",c("收盤價","股利","長期失衡"),lty=c(1,17,18),col=c("black","red","blue"),
       bty="n",lwd=2)

