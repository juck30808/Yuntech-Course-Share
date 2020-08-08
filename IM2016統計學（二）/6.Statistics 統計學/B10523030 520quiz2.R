#### Quiz2 #####
#ex1 
#h0:u=25 , h1:u/=25
mydata <- data.frame(Xr12_73)
#View(mydata)
str <- c(mydata$Mileage)
ssd <-sd(mydata$Mileage)
xbar <- mean(mydata$Mileage)
pmean <-25
n <- 8
alpha <- 0.1
t <- (xbar-pmean)/(ssd/sqrt(n))
t
Pvalue = 2*pt(t,df=n-1,lower.tail = FALSE)
Pvalue
Pvalue < alpha #0>0.05 #true
#Reject h0.the variability has changed.


#ex2 proportion
#occur with 21.55%
#h0:u=0.2155 , h1:u/=0.2155
mydata <- data.frame(Xr12_115)
#View(mydata)
str <- c(mydata$Hands)
mydata$Hands <- as.factor(mydata$Hands)
table(mydata$Hands) #1=786 #2=254
phat <- 254/1040
p <- 0.2155
n <- 1040
alpha <-0.01
z <- (phat-p)/sqrt(p*(1-p)/n)
z
Pvalue = 2*pnorm(z,lower.tail = FALSE)
Pvalue
Pvalue < alpha #1.93>0.1 #false
#Non-reject h0,the proportion of code1 differ from the theoretical probability.
#4432機率是21.55
#求code2在顯著水準下是否有不同
#=
#比例要使用p
#prop.test(254,1040,p=0.2155,alternative="two.sided",conf.level=0.99,correct=FALSE)
#前面是感興趣的總樣本,回傳P值0.02423
#===============================
#ex3
#h0:u=7.91 , h1:u/=7.91
mydata <- data.frame(Xr12_26)
View(mydata)
str <- c(mydata$Weights)
ssd <-sd(mydata$Weights)
xbar <- mean(mydata$Weights)
pmean <-7.91
n <- 18
alpha <- 0.1
t <- (xbar-pmean)/(ssd/sqrt(n))
t
Pvalue = 2*pt(t,df=n-1,lower.tail = FALSE)
Pvalue
Pvalue < alpha #0.84 < 0.1 #false
#non-Reject h0.on average the containers are not mislabeled.
#=
#t.test(mydata$weights,alternative = " wo.sided",mu=7.91,conf.level=0.9)
#===============================
#ex4 t-test
#claims are above ave intelligence
#ramdom sample =30 , avg=112.5
#avg population =100, sd=15
#h0:u<=100 / h1:>100
pmean <- 100
xbar <- 112.5
n <- 30
alpha <- 0.05
ssd <- 15
t <- (xbar-pmean)/(ssd/sqrt(n))
t
Pvalue = 2*pt(t,df=n-1,lower.tail = FALSE)
Pvalue
Pvalue >alpha #0>0.05 #False
#Reject H0.the students in his school are not above average intelligence.
#=
#z<-(xbar-mu)/(sd/sqrt(n))
#Pvalue<-pnorm(z,lower.tail=FALSE)
#Pvalue<-Alpha
#=====================

#ex5 varience
#h0:a^2=20 / h1:a^2>20
#scores on 25-point quiz,random sample=5
#population = 18,16,10,13,23 , 10% sig
str <- c(18,16,10,13,23)
ssd <-sd(str)
ssd #4.94
svar <- ssd*ssd
pvar <- 20
n <- 5
alpha <- 0.1
chi <- (n-1)*svar/pvar
chi
Pvalue = 2*pchisq(chi,df=n-1,lower.tail = FALSE)
Pvalue
Pvalue > alpha #0.59 > 0.1 #true
#Reject h0,the hypotheses h1:a^2>20 are correct 
#=
#右尾檢定
#Pvalue = pchisq(chi,df=n-1,lower.tail = FALSE) #0.2977
#Pvalue > alpha #FALSE
#==========================
#ex6 proportion
#random sample=500,planned to vote yes=320
#more than 60% yes. 5%sig
#h0:u<=60% /  h1:u>60%
phat <- 0.6  #P
p <- 0.64  #PHAT
n <- 500
alpha <- 0.1
z <- (phat-p)/sqrt(p*(1-p)/n)
z
Pvalue = pnorm(z,lower.tail = FALSE)
Pvalue
Pvalue > alpha #1.93>0.1 #true
#Reject h0,the new contract will receive more than 60% yes votes.
#=
#phat = 0.64
#p = 0.6
#Pvalue <- pnorm(z,lower.tail=FALSE)
#==========================
#ex7 confidence interval
#average unemployment rate = 3.89% , 
#sample=64, sd=1.6% , what is the 95% confidence
xbar <-0.0389
n <- 64
ssd <- 0.016
sig <- 0.95
tcv <- qt((1-sig)/2,df=n-1)
se <- abs(tcv*ssd/sqrt(n))
se
lcl <- xbar-se
ucl <- xbar+se
ci <- c(lcl,ucl)
ci
# 0.03490332 0.04289668
#=yes
#=========================
#ex8 t-test
#average score higher than national average 1300
#sd=125, random sample=25,average=1375
#h0:u<=1300  h1:u>1300
pmean <- 1300
xbar <- 1375
ssd <- 125
n <- 25
alpha <- 0.025
t <- (xbar-pmean)/(ssd/sqrt(n))
t
Pvalue = 2*pt(t,df=n-1,lower.tail = FALSE)
Pvalue
Pvalue>alpha #0.0062 > 0.025 #false
#Non-reject h0,University of Pennsylvania's average score on last exam are not higher than national average
#=
#z值=3
#pvalue <- pnorm(z,lower.tail==FALSE) #pvalue=0.001
#Pvalue < Alpha
#========================

#ex9
#random sample=10,age=22,17...24
#1.estimate the population mean with 90% confident
str <- c(22,17,27,20,23,19,24,18,19,24)
xbar <- mean(str) 
xbar #21.3
#=
#xbar<-mean()
#=======================
#2.test to determin if we can infer at the 5% sig is not equal to20
#h0:u=20  h1:u/=20
pmean <-20
n <- 10
xbar <- mean(str) 
ssd <- sd(str) 
alpha <- 0.05
t <- (xbar-pmean)/(ssd/sqrt(n))
t
Pvalue <- 2*pt(t,df=n-1,lower.tail = FALSE)
Pvalue
Pvalue < alpha #0.2308 < 0.05 #false
#Non-Reject h0,the population mean is equal to 20
#=yes
#============================

#ex10
rain <- c(7.5,1.5,5.5,111.7,286.0,233.5,148.9,806.5,60.2,0.0,6.1,21.1)
xbar <- mean(rain)
n <- 12
ssd <- sd(rain)
sig <- 0.95
tcv <- qt((1-sig)/2,df=n-1)   
se <- abs(tcv*ssd/sqrt(n))
lul <- xbar-se
ucl <- xbar+se
ci <- c(lcl,ucl)
ci
#0.03490332 287.60954611
#=
#算法對 但-6.192 , 287.609546
#============================