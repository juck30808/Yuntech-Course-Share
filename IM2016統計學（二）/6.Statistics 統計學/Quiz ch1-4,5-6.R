####Quiz ch1-4####
####Quiz ch5-6####

#Hypergeometric Distribution (T9)
m<-5
n<-8
x<-3
k<-3
dhyper(x,m,n,k)

#Normally Distribution
mu<-15.2
xbar<-17
#0.22 inquiry z table can find the z value =0.77
z1<-0.77
sd1<-(xbar-mu)/z
sd1
#or to use qnorm(0.22,lower.tail=FALSE)
z2<-(xbar-mu)/z
sd2

#Binomial Distribution (9)
n<-10
k<-2
p<-0.05
dbinom(k,n,p)


#Hypergeometric Distribution (14)
m<-5
x<-2
n<-5
k<-3
dhyper(x,m,n,k)

#Binomial Distribution (16)
n<-15
p<-0.85
k<-9
1-pbinom(k,n,p,lower.tail = TRUE)


#Poisson Distribution (18)
#inquire the poisson probabilities table
x<-0 #no cutermos
lambda<-2.5
dpois(x,lambda) #accumulation use dpois 


#Uniform Distribution (19)
x<-400
min<-0
max<-480
punif(x,min,max,lower.tail = FALSE)
  
#Poisson Distribution (20)
x<-1
lambda<-7
ppois(x,lambda,lower.tail = TRUE)  #Value use ppois

#
z2
