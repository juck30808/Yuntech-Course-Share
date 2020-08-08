#IS
#Problem 14
n<-225
sd <- 30
xbar <-180
alpha<-0.05
ci <- abs(qnorm(alpha/2)*sd/sqrt(n))
lcl <- xbar-ci
ucl <- xbar+ci
c(lcl,ucl)
#Problem 14
n<-25
sd <- 30
xbar <-180
alpha<-0.05
ci <- abs(qnorm(alpha/2)*sd/sqrt(n))
lcl <- xbar-ci
ucl <- xbar+ci
c(lcl,ucl)
#exercise 16
n<-10
xbar <- mean(c(80,75,60,72,55,89,95,78,82,90))
alpha <- 0.05
sd <- sd(c(80,75,60,72,55,89,95,78,82,90))
ci <- abs(qnorm(alpha/2)*sd/sqrt(n))
lcl <- xbar-ci
ucl <- xbar+ci
c(lcl,ucl)
#exericse2 17
n<-24
xbar<-mean(c(4.5,22,7,14.5,9,9,3.5,8,11,7.5,18,20,7.5,9,10.5,15,19,2.5,5,9,8.5,14,20,8))
sd <- sd(c(4.5,22,7,14.5,9,9,3.5,8,11,7.5,18,20,7.5,9,10.5,15,19,2.5,5,9,8.5,14,20,8))
alpha <- 0.05
se <- abs(qt(alpha/2,df=n-1))
lcl <- xbar -se
ucl <- xbar +se
c(lcl,ucl)
#now you are
#h0:u = 0.26
#h1:u /= 0.26
n<-25
xbar <- 0.265
mean<-0.26
sd<-0.03
alpha<-0.05
z<-(xbar-mean)/(sd/sqrt(n))
z
cv<-qnorm(alpha/2)
cv
z<cv
pvalue<-2*pnorm(z)
pvalue
pvalue<alpha
#noew you try23
#h0:u<=0.26
#h1:u>0.26
n<-25
sd<-0.04
xbar<-0.29
mean<-0.26
alpha<-0.05
z<-(xbar-mean)/(sd/sqrt(n))
z
cv<--1*qnorm(alpha)
cv
z>cv
pvalue<-pt(z,df=n-1,lower.tail = FALSE)
pvalue
pvalue<-pnorm(alpha,lower.tail = FALSE)
pvalue
pvalue<alpha
#exercise 27
#h0:u=250
#h1:u/=250
mean<-250
n<-16
xbar<-240
alpha<-0.05
sd<-5
t <- (xbar-mean)/(sd/sqrt(n))
t
pvalue <- 2*pt(t,df=n-1)
pvalue<alpha

#Xr12-23
#h0:u>=6
#h1:u<6
mydata<-data.frame(Xr12_23)
t.test(mydata$Times,alternative = "less",mu=6)

xbar<-mean(c(3.03,6.33,6.5,5.22,3.56,6.76,7.98,4.82,7.96,4.54,5.09,6.46))
mean<-6
alpha<-0.05
n<-12
sd<-sd(c(3.03,6.33,6.5,5.22,3.56,6.76,7.98,4.82,7.96,4.54,5.09,6.46))
t <- (xbar-mean)/(sd/sqrt(n))
t
pvalue<-pt(t,df=n-1)
pvalue
pvalue<alpha


#Xr12-25
#h0:u<=6
#h1:u>20
alpha<-0.05
mydata<-data.frame(Xr12_25)
t.test(mydata$Overweight,alternative = "greater",mu=20)
pvalue = 0.2903
pvalue <alpha

#35
#h0:u=8
#h1:u/=8
alpha<-0.01
mydata<-data.frame(Xr12_26)
t.test(mydata$Weights,alternative = "two.sided",mu=8)
pvalue<-0.0004725
pvalue <alpha

#45
#h0:p=0.8
#h1:p/=0.8
p<-0.8
xbar<-0.73
n <- 100
z<-(xbar-p)/(sqrt(p*(1-p)/n))
z

#52
#h0:p<=0.5
#h1:p>0.5 #execellent
n<-100
alpha<-0.01
mydata<-data.frame(Xr12_112)
str(mydata)
#mydata$Textbook<-as.factor(mydata$Textbook)
table(mydata$Textbook) #1=57 2=35 3=4 4=4
prop.test(57,100,p=0.5,alternative = "greater",conf.level = 0.99,correct = FALSE)

#54
#h0:p>=0.9
#h1:p<0.9
mydata<-data.frame(Xr12_108)
str(mydata)
table(mydata$Satisfied)
prop.test(153,177,p=0.9,alternative = "less",conf.level = 0.95,correct = FALSE)

#76
#h0:o^2>= 250
#h1:o^2 < 250
mydata<-data.frame(Xr12_72)
sd(c(mydata$Marks))
str(mydata) #10
#install.packages("EnvStats")
require(EnvStats)
varTest(mydata$Marks,alternative = "less",conf.level = 0.9,sigma.squared=250,data.name=NULL)

