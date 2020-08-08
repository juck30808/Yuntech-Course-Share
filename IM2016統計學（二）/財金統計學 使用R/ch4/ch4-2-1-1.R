# Normal Distribution
windows()
x = seq(-3,4,length=1000)
plot(x,dnorm(x,0,0.5),type="l",main="不同的常態分配",ylab="",lwd=3)
lines(x,dnorm(x,0,1),lty=1, col="tomato",lwd=3)
lines(x,dnorm(x,0,1.5), lty= 1, col="green",lwd=3)
lines(x,dnorm(x,2,0.5), lty=1, col="blue",lwd=3)
legend("topleft", lty=c(1,1,1,1), col=c("black","tomato","green","blue"), lwd=3,
  legend= c(expression(paste(mu," = 0, ", sigma, " = 0.5")),
          expression(paste(mu," = 0, ", sigma, " = 1.0")),
          expression(paste(mu," = 0, ", sigma, " = 1.5")),
          expression(paste(mu," = 2, ", sigma, " = 0.5"))))

# Standard normal distribution
z = seq(-4,4,length=1000)
windows()
par(mfrow=c(2,1))
plot(z,dnorm(z), type="l",axes=F, frame.plot=T, ylab="機率密度",main="標準常態分配",lwd=4)   
z1 = qnorm(0.025); z2 = qnorm(0.975)
i = z < z1
polygon(c(-4,z[i],z1),c(0,dnorm(z[i]),0), col="tomato")
j = z > z2
polygon(c(z2,z[j],4),c(0,dnorm(z[j]),0), col="tomato")
x = seq(-4,6,length=1000)
axis(1,z1,labels=expression(-2==-z[1]),lwd=3)
axis(1,z2,labels=expression(2==z[2]),lwd=3)
X = seq(-3,3,by=2)
axis(1,X, X)
axis(1,0)
abline(v=0,lty=2)
plot(x,dnorm(x,1,2), type="l", ylab="機率密度", lwd=4,
    main=expression(paste("常態分配 ",mu," = 1 與 ",sigma," = 2")))
x1 = qnorm(0.025,1,2); x2 = qnorm(0.975,1,2); # 兩指令於同一列可用;分開
i = x < x1
polygon(c(-4,x[i],x1),c(0,dnorm(x[i],1,2),0), col="tomato")
j = x > x2
polygon(c(x2,x[j],6),c(0,dnorm(x[j],1,2),0), col="tomato")
axis(1,x1,labels=expression(paste(x[1]," = ",mu-z[1]*sigma)),lwd=3)
axis(1,x2,labels=expression(paste(x[2]," = ",mu+z[1]*sigma)),lwd=3)
axis(1,1)
abline(v=1,lty=2)

pnorm(2,1,2)-pnorm(-1,1,2)
#[1] 0.5328072
pnorm(0.5)-pnorm(-1)
#[1] 0.5328072
