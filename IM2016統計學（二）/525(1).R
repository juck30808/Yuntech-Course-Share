#R Code
# Ho: pmu1 = pmu2
# h1: pmu1 =!pmu2
xbar1 <- 3.2
xbar2 <- 3
sv1 <- (1.2)^2
sv2 <- (1.1)^2
n1 <- 100
n2 <- 64
spooled2 <- ((n1-1)*sv1+(n2-1)*sv2)/(n1+n2-2)
t <- (xbar1 -xbar2 -0) / sqrt(spooled2*2((1/n1)+(1/n2)))
t
qt(0.025,df=n1+n2-2)

#case3 -A test the equal variance between male and female
# Ho: pv1 = pv2
# h1: pv1 =!pv2
#在黑色區塊 = Reject Ho
sv1 <- (1.5)^2
sv2 <- (0.8)^2
n1 <- 100
n2 <- 64
F <- sv1/sv2
F
qf(0.025,df=n1-1,df2=n2-1,lower.tail = TRUE)
qf(0.025,df=n1-1,df2=n2-1,lower.tail = FALSE)

#case3 -B
# Ho: pv1 = pv2
# h1: pv1 =!pv2
#在黑色區塊 = Reject Ho
xbar1 <- 3.5
sv1 <- (1.5)^2
xbar2 <- 3
sv2 <- (0.8)^2
n1 <- 100
n2 <- 64
v <- ((sv1/n1)+(sv2/n2))^2/(((sv1/n1)^2/(n1-1))+((sv2/n2)^2/(n2-1)))
t <- (xbar1-xbar2-0)/sqrt((sv1/n1)+(sv2/n2))
t
qt(0.025,df=v)
F
qf(0.025,df=n1-1,df2=n2-1,lower.tail = TRUE)
qf(0.025,df=n1-1,df2=n2-1,lower.tail = FALSE)

#Yellow White ball
mydata <- data.frame(Xr13_12)
view(mydata)
str(mydata)
help("var.test")
help("t.test")
var.test(mydata$Yellow,mydata$White,ratio=1,alternative = "two.sided")
t.test(mydata$Yellow,mydata$White,mu=0,alternative = "less", var.equal = TRUE)

#Business problem - Ship Business
mydata <- data.frame(Xr13_20)
view(mydata)
str(mydata)
help("var.test")
help("t.test")
var.test(mydata$2.years.ago,mydata$This.year,ratio=1,alternative = "two.sided")
t.test(mydata$X2.years.ago,mydata$This.year,mu=0,alternative = "greater", var.equal = FALSE)

#two dependent sample
mydata <- data.frame(m=c(40,38,36,42),f=c(32,31,30,31))
view(mydata)
str(mydata)
help("var.test")
help("t.test")
var.test(mydata$2.years.ago,mydata$This.year,ratio=1,alternative = "two.sided")
t.test(mydata$X2.years.ago,mydata$This.year,mu=0,alternative = "greater", var.equal = FALSE)