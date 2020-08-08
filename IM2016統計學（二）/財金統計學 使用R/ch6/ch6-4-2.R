# Daily TSMC and TWI
# 1/4/2000-7/10/2014
tsmc = read.table("c:\\meiyih\\Finstats\\ch6\\tsmc.txt", header=T)
attach(tsmc)
names(tsmc)
tsmc.r = 100*diff(log(收盤價))

# Backtesting
library(fGarch)
y = tsmc.r
T = length(y)			
WE = 500 # estimation window length					
prob = 0.01 # probability					
l1 = WE*prob 	# expected number of violations			
value = 1   # portfolio value		 	
VaR = matrix(nrow=T,ncol=4) # matrix VaR forecast for 4 models	
lambda = 0.94;
s11 = var(y[1:30]);		
for(t in 2:WE) {
  s11 = lambda * s11 + (1-lambda) * y[t-1]^2
}
 
for (t in (WE+1):T){
	t1 = t-WE;								
	t2 = t-1;									
	window = y[t1:t2] 				
	s11	 = lambda * s11  + (1-lambda) * y[t-1]^2
	VaR[t,1] = qnorm(prob) * sqrt(s11) * value 
	VaR[t,2] = sd(window) * qnorm(prob)*value
	ys = sort(window)					
	VaR[t,3] = ys[l1]*value	
	g=garchFit(formula = ~ garch (1,1), window ,trace=FALSE, 
           include.mean=FALSE)
	par=g@fit$matcoef				
	s4=par[1]+par[2]*window[WE]^2+par[3]*g@h.t[WE]
	VaR[t,4] = sqrt(s4) * qnorm(prob) *  value
}
VaR = VaR[(WE+1):T,]
y = y[(WE+1):T]
length(y)
length(VaR[,1])
head(VaR)
T1 = length(y)
# etaMatrix
etaM = matrix(0,T1,4)
for(j in 1:4)
{
  for(i in 1:T1)
    {
      etaM[i,j] = as.numeric(y[i] <= VaR[i,j])
    }
}
v1 = apply(etaM,2,sum) # 行加總,實際違反的次數
v1
prob*T1 # 理論違反的次數
VRio = v1/(prob*T1)
VRio
windows()
T2 = 1:T1
plot(T2,y[T2],type="p",xlab="Time",col=1,ylab="1% VaR", ylim=c(-10,0), 
    main="Various VaR Models for TSMC's Returns")
lines(T2,VaR[T2,1],lty=2, col=2,lwd=2)
lines(T2,VaR[T2,2],lty=3, col=3,lwd=2)
lines(T2,VaR[T2,3],lty=4, col=4,lwd=2)
lines(T2,VaR[T2,4],lty=5, col=5,lwd=2)
legend("bottomright", c("EWMA","MA","HS","GARCH"),
       col=2:5,lty=c(2,3,4,5),bty="n",lwd=2)

