#Q1
#average delivery time is less than 7(420) hours for local
#random sample of times for 20 deliveries 
#sample mean was 620 min, sd = 1.48

#h0:u>=420
#h1:u<420
n<-20
mean<-420
xbar<-620
sd<-1.48
alpha<-0.9
z <-(xbar-mean)/(sd/sqrt(n))
z
cv <- -1*qnorm(alpha)
cv
z<cv #FALSE

pvalue<-pnorm(z,lower.tail = TRUE)
pvalue
pvalue<alpha #FALSE

#non-reject h0,the courier's advertisement is correct that its average delivery time is less than 7 hours for local deliveries.


#Q2
#target diameter of 3 inch ,sample 20 sd=0.025
#evidence that the population sd is less than 0.035
#h0=£m^2 >=0.035
#h1=£m^2 < 0.035
svar<-(0.025)^2
pvar<-(0.035)^2
n <- 20
alpha <- 0.1
chi <- ((n-1)*svar)/pvar
chi

pvalue<-pchisq(chi,df=n-1)
pvalue
pvalue <alpha
#reject h0,the population sd is not less than 0.035

#install.packages("EnvStats")
#require(EnvStats)
#varTest(x,alternative = "less",conf.level = 0.9,sigma.squared = 1,data.name = NULL)


#Q3
#receive a job offer from 70%, student decides to apply to only 4 firms. probality
prob = 0.7
size = 4
x =0
dbinom(x,size,prob,log = FALSE)


#Q4
#whether anxiety is higher for real spiders than pictures.
#h0:MuD<0
#h1:MuD>0
alpha <- 0.01
mydata <- data.frame(Big_Hairy_Spider)
str(mydata)
t.test(mydata$picture,mydata$real,mu=0,alternative = "greater",var.equal = FALSE)
pvalue <- 0.9464
pvalue < alpha
#non-reject h0,the anxiety is higher for relspiders than pictures.


#Q5
#mean of 16.4 an sd=2.75, find the family of four spends more than 10
pnorm(10,mean=16.4,sd=2.75,lower.tail = FALSE,log.p = TRUE)
#the probability is 0.01002546

#Q6
#99% confidence interval
#sd=5min sample=10,
data<-c(11,10,16,15,18,12,25,20,18,24)
sd<- sd(data)
mean<-mean(data)
n <- 10
alpha<-0.01
se<- abs(qnorm(alpha/2)*sd/sqrt(n))
lcl <- mean-se
ucl <- mean+se
c(lcl,ucl)


#Q7
#h0:u = 0.1
#h1:u/= 0.1
#81 of 900 subject , competitor want is not 10%
alpha <-0.05
prop.test(81,900,p=0.1,alternative="two.sided",conf.level=0.95,correct=FALSE)
pvalue<-0.3173
pvalue<alpha
#non-reject h0, the company claim is actual.so the competitor is not correct.


#Q8
#change: more than 5 mins
#mean =4.8, sd<-1.3, 60 students ,probability need more than 5 mins
pnorm(5,mean=4.8,sd=1.3,lower.tail = TRUE)


#Q9
#deliver whinin 15 min is free. sample 25, mean=13,sd=4
#a. determin if 0.05 that pop mean less than 15 min
#h0:u>=15
#h1:u<15
mean <-15
xbar <-13
sd <- 4
n <- 25
alpha<-0.05
t<-(xbar-mean)/(sd/sqrt(n))
t
pvalue <- pt(t,df=n-1)
pvalue
pvalue<alpha
#reject h0, Mystic can not make this claim that they deliver pizza within 15 mins.

#b. Estimate the population mean with 90% confidence.
mean <-15



#Q10
#random select 5 cards without placement
x<-2  #the number of white balls drawn without replacement from an urn
m<-26 #the number of white balls in the urn.
n<-26 #the number of black balls in the urn.
k<-5 #the number of balls drawn from the urn.
dhyper(x,m,n,k,log=FALSE)
help("dhyper")
#the probability is 0.3251301


#Q11
#fianl exam £m^2 = 250. is variance ha "decreased"?
#h0:£m^2 >=250
#h1:£m^2 < 250
alpha <- 0.1
mydata <- data.frame(Score)
str(mydata)
varTest(mydata$Score,alternative = "less",conf.level = 0.9,sigma.squared = 250,data.name = NULL)
pvalue <- 0.4218
pvalue < alpha
#non-reject h0,statistics professor computed the variance has decreased


#Q12
#measure of their happiness with their relationship after reading the book.
#h0:pv1 =pv2
#h1:pv1/=pv2
alpha <- 0.05
mydata <- data.frame(book)
str(mydata)
#var.test(mydata$book1,mydata$book2,ratio =1,alternative =  "two.sided",conf.level = 0.95)
t.test(mydata$book1,mydata$book2,mu=0,alternative ="two.sided",pired=FALSE,var.equal = FALSE,conf.level = 0.95)
pvalue <- 0.04796
pvalue < alpha
#reject h0,Social Animal book and Marie Claire book have the different happiness with their relationship.

#measure of their happiness with their relationship after reading the book.
#h0:pv1<=pv2
#h1:pv1>pv2
alpha <- 0.05
mydata <- data.frame(book)
str(mydata)
#var.test(mydata$book1,mydata$book2,ratio =1,alternative =  "two.sided",conf.level = 0.95)
t.test(mydata$book1,mydata$book2,mu=0,alternative ="greater",pired=FALSE,var.equal = FALSE,conf.level = 0.95)
pvalue <- 0.976
pvalue < alpha
#non-reject h0,Social Animal book has greater happiness than Marie Claire book.




#Q13
#Is the male different than the fastest female?
#male    n=34  mean=105.5  sd=20.1
#female  n=29  mean=90.9   sd=12.2
#h0:pv1 = pv2
#h1:pv1 =/pv2
sv1<-(20.1)^2
sv2<-(12.2)^2
n1<-34
n2<-29
alpha<-0.05

Fv = sv1/sv2
Fv

pvalue <- 2*pf(F,df1 = n1-1,df2 = n2-1,lower.tail = FALSE)
pvalue
pvalue < alpha
#non-reject ho. the fastest speed driven by male student are different than the female.


#Q14
x <- 0 #vector of (non-negative integer) quantiles.
lambda <- 2  #vector of (non-negative) means.
dpois(x,lambda,log=FALSE)
help(dpois)
#the probability is 0.1353353