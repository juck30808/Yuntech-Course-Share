# exchange rates 1/2/2002-7/10/2014
exch = read.table("c:\\meiyih\\Finstats\\ch6\\exch.txt", header=T)
attach(exch)
names(exch)
# 人民幣與港幣的例子
china = 人民幣
tai = 新台幣
tai_chi = tai/china
hk = 港幣
tai_hk = tai/hk
tcr = 100*(diff(log(tai_chi)))
thr = 100*(diff(log(tai_hk)))


# 95% p1-p2 區間估計(人民幣與港幣)
n = length(tcr) 
pbar = (n*pbar_tc+n*pbar_th)/(2*n)
pbar_tc-pbar_th+qnorm(0.025)*sqrt(pbar*(1-pbar)*(2/n))
pbar_tc-pbar_th+qnorm(0.975)*sqrt(pbar*(1-pbar)*(2/n))

pbar_tc-pbar_th+qnorm(0.025)*sqrt((pbar_tc*(1-pbar_tc)/n)+(pbar_th*(1-pbar_th)/n))
pbar_tc-pbar_th+qnorm(0.975)*sqrt((pbar_tc*(1-pbar_tc)/n)+(pbar_th*(1-pbar_th)/n))

z = (pbar_tc-pbar_th)/sqrt(pbar*(1-pbar)*(2/n))
z
2*(1-pnorm(z))

# 二樣本比率的抽樣分配
i = thr >= 0.1 
pbar_th = mean(as.numeric(thr[i]))
pbar_th
pbar_tc

windows()
par(mfrow=c(3,1))
three = c(1,2,3)
T = 10000
n = 1000
tz = numeric(T)
for(i in 1:T)
{
x1 = sample(three,n,replace=T)
index = x1 == 3
pbar1 = mean(as.numeric(index))
x2 = sample(three,n,replace=T)
index = x2 == 3
pbar2 = mean(as.numeric(index))
pbar = (n*pbar1+n*pbar2)/(n+n)
tz[i] = (pbar1-pbar2)/sqrt(pbar*(1-pbar)*(2/n))
}
plot(density(tz),type="l",xlab=expression(bar(p)[1]-bar(p)[2]),main=expression(paste
  (bar(p)[1]-bar(p)[2]," 的抽樣分配")),lwd=2)
x = sort(tz)
lines(x,dnorm(x),lty=2,col="red",lwd=2)

T = 10000
ten = 1:10 
n = length(tcr)
tz1 = numeric(T)
tz2 = numeric(T)
p1 = numeric(T)
p2 = numeric(T)
for(i in 1:T)
{
x1 = sample(three,n,replace=T)
index = x1 == 3
pbar1 = mean(as.numeric(index))
x2 = sample(ten,n,replace=T)
index = x2 == 3
pbar2 = mean(as.numeric(index))
pbar = (n*pbar1+n*pbar2)/(n+n)
z1 = (pbar1-pbar2-((1/3)-(1/10)))/sqrt(pbar*(1-pbar)*(2/n))
z2 = (pbar1-pbar2-((1/3)-(1/10)))/sqrt((pbar1*(1-pbar1)/n)+((pbar2*(1-pbar2)/n)))
tz1[i] = z1
tz2[i] = z2
p1[i] = pnorm(z1)
p2[i] = pnorm(z2)
}
plot(density(tz1),type="l",xlab=expression(bar(p)[1]-bar(p)[2]),main="使用 (16) 與 (17) 式之抽樣分配",lwd=2)
den = density(tz2)
lines(den$x,den$y,lty=2,col="red",lwd=2)
plot(density(p1),type="l",xlab=expression(bar(p)[1]-bar(p)[2]),main="使用 (16) 與 (17) 式之p值 (左尾檢定)",lwd=2)
lines(density(p2),lty=2,col="red",lwd=2)
