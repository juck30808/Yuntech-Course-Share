#Continuous Probability Distributions
#1.Uniform dis
#2.Normal dis(z)
#3.Sampling dis


#2.Normal dis(z)-------------------
#ex1 more than 0.35
u<-0.26
sd<-0.05
x<-0.35
z<-(x-u)/sd
1-pnorm(z)

#ex2 less than 0.21
u<-0.26
sd<-0.05
x<-0.21
z<-(x-u)/sd
pnorm(z)

#ex3 taller than 70.4
u<-64
sd<-2.5
x<-70.4
z<-(x-u)/sd
1-pnorm(z)

#ex4 between 60.3 and 65
u<-64
sd<-2.5
x1<-60.3
x2<-65
z1<-(x1-u)/sd
z2<-(x2-u)/sd
pnorm(z2)-pnorm(z1)


#3.Sampling dis---------------
#ex1 morn than 32
u<-32.2
sd<-0.3
x<-32
z<-(x-u)/sd
1-pnorm(z)

#ex2 have four bottles,and greater than 32
u<-32.2
sd<-0.3
x<-32
z<-(x-u)/(sd/sqrt(4))
1-pnorm(z)

#ex3 take sample 25, and 105 greater
u<-100
sd<-15
x<-105
z<-(x-u)/(sd/sqrt(25))
1-pnorm(z)

#ex4 random sample 100 , assumed = 0.6 , less than 0.56
u<-0.6
x<-0.56
z<-(x-u)/(sqrt( (0.6*(1-0.6)) /100) )
pnorm(z)

#ex5 p=0.4 ,n=100, less than 0.32
u<-0.4
x<-0.32
z<-(x-u)/(sqrt( (0.4*(1-0.4))/100))
pnorm(z)

