# 8.3
# Binary dependent variable
twi = read.table("c:\\meiyih\\Finstats\\ch8\\twi.txt",header=T)
tsmc = read.table("c:\\meiyih\\Finstats\\ch8\\tsmc.txt",header=T)
names(twi)
attach(twi)
ptwi = Μ絃基_TW 
names(tsmc)
attach(tsmc)
pd = Μ絃基
divd = セ痲ゑ/Μ絃基
divd = 1/divd
tsmcr = 100*diff(log(pd))
names(twi)
attach(twi)
twir = 100*diff(log(Μ絃基_TW))
T = length(pd)
T
pd1 = pd[(T-250+1):T] # 7/8/2013-7/10/2014
divd1 = divd[(T-250+1):T]
summary(pd1)
summary(divd1)
windows()
par(mfrow = c(2,2))
plot(pd1,type="l",main="TSMCらΜ絃基",lwd=2)
plot(divd1,type="l",main="TSMCら",lwd=2)
plot(tsmcr,type="l",main="TSMCら癸计厨筍瞯",lwd=2)
plot(twir,type="l",main="TWIら癸计厨筍瞯",lwd=2)
 
windows()
par(mfcol=c(2,3))
plot(divd1,pd1,xlab="",ylab="",main="TSMCらΜ絃基籔ぇ床瓜",lwd=2)
model = lm(pd1~divd1)
summary(model)

lpd1 = log(pd1)
ldivd1 = log(divd1)
summary(lm(lpd1~ldivd1))
abline(model)
res = residuals(model)
plot(res,type="l",ylab="",main="瓜︳璸ぇ摧畉",lwd=2)
abline(h=0)

index = pd1 <= quantile(pd1,0.8)
pd1a = as.numeric(index)
plot(divd1,pd1a,type="p",main="TSMCらΜ絃基单材80κだ计",xlab="",
      lwd=2,ylab="")
modelpd1 = lm(pd1a~divd1)
summary(modelpd1)
abline(modelpd1)
resd1 = residuals(modelpd1)
plot(resd1,type="l",main="瓜︳璸ぇ摧畉",ylab="",lwd=2)
fitd1 = fitted(modelpd1)
divd1[100]
fitd1[100] # 诀瞯
divd1[200]
fitd1[200]
fitd1

index = pd1 >= quantile(pd1,0.90)
pd2 = as.numeric(index)
plot(divd1,pd2,type="p",main="TSMCらΜ絃基单材90κだ计)",lwd=2)
modelpd2 = lm(pd2~divd1)
summary(modelpd2)
abline(modelpd2)
resd2 = residuals(modelpd2)
plot(resd2,type="l",main="瓜︳璸ぇ摧畉",ylab="",lwd=2)
fitd2 = fitted(modelpd2)
divd1[100]
fitd2[100]
divd1[200]
fitd2[200]
fitd2

# ぃ瞶场だ
divd1[24]
fitd1[24]
fitd2[24]


# probit model
windows()
par(mfrow=c(2,2))

y = pd1a
x = divd1
modela = glm(y~x, family = binomial(link = "probit"))
summary(modela)
plot(divd1,pd1a,type="p",main="TSMCらΜ絃基单材80κだ计 (Probit)",xlab="",ylab="",lwd=2)
fitted1 = fitted(modela)
lines(sort(divd1),sort(fitted1),col="red",lwd=2)
# pseudo-Rsquare
1-modela$deviance/modela$null.deviance

y = pd2
x = divd1
modelb = glm(y~x, family = binomial(link = "probit"))
summary(modelb)
plot(divd1,pd2,type="p",main="TSMCらΜ絃基单材90κだ计 (Probit)",xlab="",ylab="",lwd=2)
fitted2 = fitted(modelb)
lines(sort(divd1),sort(fitted2),col="red",lwd=2)
# pseudo-Rsquare
1-modelb$deviance/modelb$null.deviance

# 箇戳
fitted2[200]
divd1[200]
fitted2[240]
divd1[240]
fitted2[100]
divd1[100]
fitted2[224]
divd1[224]
pnorm(-63.36+8.44*7.58)
pnorm(-63.36+8.44*7.59)
round(fitted2,4)
round(fitted2,4)[159]
divd1[159]
divd1
max(divd1)

# logit model
y = pd1a
x = divd1
modela = glm(y~x, family = binomial(link = "logit"))
summary(modela)
plot(divd1,pd1a,type="p",main="TSMCらΜ絃基单材80κだ计 (Logit)",xlab="",ylab="",lwd=2)
fitted1 = fitted(modela)
lines(sort(divd1),sort(fitted1),col="red",lwd=2)
# pseudo-Rsquare
1-modela$deviance/modela$null.deviance

y = pd2
x = divd1
modelb = glm(y~x, family = binomial(link = "logit"))
summary(modelb)
plot(divd1,pd2,type="p",main="TSMCらΜ絃基单材90κだ计 (Logit)",xlab="",ylab="",lwd=2)
fitted2 = fitted(modelb)
lines(sort(divd1),sort(fitted2),col="red",lwd=2)
# pseudo-Rsquare
1-modelb$deviance/modelb$null.deviance
anova(modelb)


# TSMC籔TWI癸计厨筍瞯
summary(lm(tsmcr~twir))

T = length(twir)
T
x = twir
length(tsmcr)
windows()
par(mfrow=c(2,2))
i1 = tsmcr <= -1
i1
y1 = as.numeric(i1)
y1
plot(x,y1,type="p",main="(a) TSMCら癸计厨筍瞯单-1%",lwd=2)
model1 = lm(y1~x)
summary(model1)
abline(model1)
model1p = glm(y1~x, family = binomial(link = "probit"))
summary(model1p)
1-model1p$deviance/model1p$null.deviance

fit1p = fitted(model1p)
lines(sort(x),sort(fit1p),lty=2,col="red",lwd=2)
model1l = glm(y1~x, family = binomial(link = "logit"))
summary(model1l)
1-model1l$deviance/model1l$null.deviance

fit1l = fitted(model1l)
lines(sort(x),sort(fit1l),lty=4,col="blue",lwd=2)
legend("left",c("Linear","Probit","Logit"),lty=c(1,2,4),col=c("black","red",
      "blue"),bty="n",lwd=2)


i2 = tsmcr >= 0
i2
y2 = as.numeric(i2)
y2
plot(x,y2,type="p",main="(b) TSMCら癸计厨筍瞯单0",lwd=2)
model2 = lm(y2~x)
summary(model2)
abline(model2)
model2p = glm(y2~x, family = binomial(link = "probit"))
summary(model2p)
1-model2p$deviance/model2p$null.deviance

fit2p = fitted(model2p)
lines(sort(x),sort(fit2p),lty=2,col="red",lwd=2)
model2l = glm(y2~x, family = binomial(link = "logit"))
summary(model2l)
1-model2l$deviance/model2l$null.deviance
fit2l = fitted(model2l)
lines(sort(x),sort(fit2l),lty=4,col="blue",lwd=2)
legend("left",c("Linear","Probit","Logit"),lty=c(1,2,4),col=c("black","red",
      "blue"),bty="n",lwd=2)

i3 = tsmcr <= 1
i3
y3 = as.numeric(i3)
y3
plot(x,y3,type="p",main="(c) TSMCら癸计厨筍瞯单1%",lwd=2)
model3 = lm(y3~x)
abline(model3)
model3p = glm(y3~x, family = binomial(link = "probit"))
summary(model3p)
1-model3p$deviance/model3p$null.deviance
fit3p = fitted(model3p)
lines(sort(x),sort(fit3p),lty=2,col="red",lwd=2)
model3l = glm(y3~x, family = binomial(link = "logit"))
summary(model3l)
1-model3l$deviance/model3l$null.deviance
fit3l = fitted(model3l)
lines(sort(x),sort(fit3l),lty=4,col="blue",lwd=2)
legend("left",c("Linear","Probit","Logit"),lty=c(1,2,4),col=c("black","red",
      "blue"),bty="n",lwd=2)

i4 = tsmcr >= 1.5
i4
y4 = as.numeric(i4)
y4
plot(x,y4,type="p",main="(d) TSMCら癸计厨筍瞯单1.5%",lwd=2)
model4 = lm(y4~x)
summary(model4)
abline(model4)
model4p = glm(y4~x, family = binomial(link = "probit"))
summary(model4p)
1-model4p$deviance/model4p$null.deviance
fit4p = fitted(model4p)
lines(sort(x),sort(fit4p),lty=2,col="red",lwd=2)
model4l = glm(y4~x, family = binomial(link = "logit"))
summary(model4l)
1-model4l$deviance/model4l$null.deviance
fit4l = fitted(model4l)
lines(sort(x),sort(fit4l),lty=4,col="blue",lwd=2)
legend("left",c("Linear","Probit","Logit"),lty=c(1,2,4),col=c("black","red",
      "blue"),bty="n",lwd=2)

fita = fitted(model1)
fitb = fitted(model2)
fitc = fitted(model3)
fitd = fitted(model4)
twir[2000]
fitd[2000]
twir[3000]
fitd[3000]
