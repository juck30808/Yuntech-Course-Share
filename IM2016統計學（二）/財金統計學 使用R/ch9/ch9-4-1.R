tsmctwi = read.table("c:\\meiyih\\Finstats\\ch9\\tsmctwi.txt",header=T)
names(tsmctwi)
attach(tsmctwi)

# ARCH(1) Model
p1 = TSMC # Μ絃基
p2 = TWI # Μ絃基
tsmcr = 100*diff(log(p1))
# ㄏノfGarch
library(fGarch)
?garchFit
model = garchFit(~garch(1,0),data=tsmcr,include.mean=F)# ぃ珹キА计よ祘Αぇ盽计兜
summary(model) # 莱猔種omega碞琌alpha0

# ㄏノoptim
y = tsmcr
#-----------------------------------------------
# ARCH(1)ぇ癸计阀ㄧ计
#-----------------------------------------------
Llike1 <- function( b,y ) {
  b = abs(b)
  T = length( y )
  u = y  
  h = sd(y)^2*rep(1,T)  
  for (i in 2:T) {
    h[i] = b[1] + b[2]*u[i-1]^2
  }
  loglt = - 0.5*log( 2*pi ) - 0.5*log( h ) - 0.5*(u^2/h)
  return(loglt)
}
neglog1 = function( b,y ) {
  logl = -mean( Llike1( b,y ) )
  return(logl)
}

# ︳璸ARCH(1)
b0 = c(0.01, 0.1)
model1 = optim(b0,neglog1, y=y, method="Nelder-Mead")
model1
theta = model1$par
lf = model1$val  
lf = -lf*length(y)
lf

#獶兵ン跑钵计ぇ︳璸
formula(model)
model@fit
model@fit$params$params
alpha0 = model@fit$params$params[2]
alpha0
alpha1 = model@fit$params$params[3]
alpha1
as.numeric(alpha0)/(1-as.numeric(alpha1))
var(y)

# ARCH浪﹚
# ARCH(4)
y = tsmcr
y = y-mean(y)
model2 = garchFit(~garch(4,0),data=y,include.mean=F)
summary(model2)
# ㄏノ癹耴家
# try
y1 = matrix(head(y),6,1)
y1
all = embed(y1,5)
all
all4 = embed(y,5)
y2 = all4[,1]
y2 = y2^2
y12 = all4[,2] # lag 1
y12 = y12^2
y22 = all4[,3] # lag 2
y22 = y22^2
y32 = all4[,4] # lag 3
y32 = y32
y42 = all4[,5] # lag 4
y42 = y42
modela = lm(y2~y12+y22+y32+y42)
summary(modela)
T = length(y2)
R2 = 0.07228
chi = (T-4)*R2
chi
1-pchisq(chi,4)
F = (R2/4)/((1-R2)/(T-4-1))
F
1-pf(F,4,(T-4-1))
