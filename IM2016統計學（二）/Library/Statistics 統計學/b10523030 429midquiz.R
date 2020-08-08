#429 Midterm exam b10523030

#1
#1-1what is the probability 130-135
x<-135
min<-130
max<-150
punif(x,min,max)
#ans1-1.0.25

#1-2.what is the probability for 132
x<-132
min<-130
max<-150
a <-punif(x,min,max,lower.tail = TRUE)
x2<-131
min<-130
max<-150
b <-punif(x2,min,max,lower.tail = TRUE)
a-b
#ans1-2. 0.05



#2
#probability is 3times of  font side
#thrown 10 times,random is greater than one(X>1)
X<-3
lambda <-10
dpois(x,lambda)
#ans2. 5.359086e-96


#3 
#150 applicant mu=120 ,sd=15
#select 24 then lowest score
x<-135
mu <-120
sd <-15
z = (x-mu)/sd
z
pnorm(z,lower.tail = FALSE)
probility<-(24/150)
probility

#4
#Normal dis.
#mean=460 ,sd=18,probability 
#take 25 apples and more than 470 grams
xbar <-470
mean <-460
sd <-18
n <-25
z <- (xbar-mean)/(sd/sqrt(n))
z
pnorm(z,lower.tail = FALSE)
#0.0027

#5
#5-1.normal dis. less than 26000.
mu <-30071
sd <-4431
x <-26000
z<-(x-mu)/sd
z
pnorm(z)
#ans5-1. 0.1791121
#5-2. solve 75% of unemployee , what is salary new job
z<-qnorm(0.075) #z=-1.439531
x<-(z*sd)+mu
x
#ans5-2. 23692+1


#6.
# sample size is 49, sd=6, the 95% confident
mean <-36
z<-qnorm(0.05) 
z #-1.644854
mu<-36
n<-49
sd<-6
#z<-(xbar-mu)/(sd/sqrt(n))
xbar <- z*(sd/sqrt(n))-mu
xbar #37.40987


#7. Normal dis. At least 70000 kilo
#H0:u>=70000  H1:u<70000
sd <-25000
n <-16
xbar<-65000
alpha <-0.1
pmean <-70000
z <-(xbar-pmean)/(sd/sqrt(n))
z #-0.8
pvalue <- pnorm(z)
pvalue #0.2118554
pvalue<alpha #false
#Non-Reject H0,The manufacturers claim to produce at least 70,000 kilometers of tires is correct

#8. Normal dis.
#H0:u=70  H1:u/=70
xbar <-75
pmean <-70
sd <-6
n <-20
alpha <-0.05
z <-(xbar-pmean)/(sd/sqrt(n))
z #3.72678
pvalue <-2*pnorm(z)
pvalue #1.999806
pvalue>alpha
cvl <-qnorm(alpha/2)
cvu <-qnorm(1-(alpha/2))
c(cvl,cvu)
(z<cvl) |(z>cvu)
#Reject H0,The mobile phone average weight was not 70 grams.

#9.
#H0:u=12 H1:u/=12
xbar <-12.02
pmean<-12
sd<-0.2
n <-36
alpha <-0.05
z <-(xbar-pmean)/(sd/sqrt(n))
z #0.6
pvalue <-2*pnorm(z)
pvalue #1.451494
pvalue<alpha
cvl <-qnorm(alpha/2)
cvu <-qnorm(1-(alpha/2))
c(cvl,cvu)
(z<cvl) |(z>cvu)
#Non-reject H0,the automatic filling machine's average was 12 ounces.


#10.
#H0:u<=8 H1:u>8
xbar <-8.2
pmean <-8
sd <-0.4
n <-18
alpha<-0.05
z <-(xbar-pmean)/(sd/sqrt(n))
z #2.12132
pvalue <-pnorm(z,lower.tail=FALSE)
pvalue #0.01694743
pvalue <alpha
cv <- qnorm(1-alpha)
z>cv
#Reject H0,the phone manufacturer claims is not correct,the phone's talk time will not more than 8 hours.


#11
#random select 20 people , sample mean = 19.20
#sd =4
xbar = (20.15+21.54+14.54+16.57+19.52+18.56+12.56+17.44+17.86+18.43+19.76+15.48+20.04+21.84+20.22+23.85+20.58+23.55+20.05+21.54)/20
xbar #19.204
n <-20
sd<-4
z<-qnorm(0.05) 
z #-1.644854
#z<-(xbar-mu)/(sd/sqrt(n))
mu <- z*(sd/sqrt(n))-xbar
mu
#ans.20.6752