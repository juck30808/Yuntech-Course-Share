#4/22 Quiz1 B10523030

#1
#H0:u=1600
#H1:u!=1600
xbar<-1580
pmean<-1600
n<-100
sd<-90
alpha<-0.05
z <-(xbar-pmean)/(sd/sqrt(n))
z
pvalue <-2*pnorm(z)
pvalue
pvalue <alpha
cvl <-qnorm(alpha/2)
cvu <-qnorm(1-(alpha/2))
c(cvl,cvu)
(z<cvl)|(z>cvu)
#Reject H0 , the comopany claim is wrong , the product mean is not 1600
##right

#2 
#H0:u<=6
#H1:u>6
xbar<-5.8
pmean<-6
n<-36
sd<-1.7
alpha<-0.05
z <-(xbar-pmean)/(sd/sqrt(n))
z
pvalue <- pnorm(z,lower.tail=FALSE)
pvalue
pvalue <alpha
cv <-qnorm(1-alpha)
cv
z>cv
#non Reject H0, the students in Taiwan is less tahn 6 hours.
##error
##H0:u>=6
##H1:u<6
##pavalue <- pnorm(z)
##I DON'T THINK IT IS LEFT

#3
#H0:u>=170
#H1:u<170
xbar<-178
pmean<-170
n<-400
sd<-65
alpha<-0.1
z <-(xbar-pmean)/(sd/sqrt(n))
z
pvalue <- pnorm(z)
pvalue
pvalue <alpha
cv <-qnorm(alpha)
cv
z<cv
#non-reject H0 , the average customer spends more than $170 each time
##error
##H0:u<=6
##H1:u>6
##pvalue <- pnorm(z,lower.tail=FALSE)
##I DON'T THINK IT IS LEFT

#4
#H0:u=79.15
#H1:u!=79.15
xbar<-80
pmean<-79.15
n<-100
sd<-4
alpha<-0.01
z <-(xbar-pmean)/(sd/sqrt(n))
z
pvalue <-2*pnorm(z)
pvalue
pvalue <alpha
cvl <-qnorm(alpha/2)
cvu <-qnorm(1-(alpha/2))
c(cvl,cvu)
(z<cv)|(z>cvu)
#non-reject H0 , the government statistics is reliable
#error 
#pvalue <- 2*pnorm(z,lower.tail=FALSE)

#5 OK
#H0:u<=1700
#H1:u>1700
xbar<-1298
pmean<-1700
n<-12
sd<-450
alpha<-0.05
z <-(xbar-pmean)/(sd/sqrt(n))
z
pvalue <- pnorm(z,lower.tail = FALSE)
pvalue
pvalue<alpha
cv <-qnorm(1-alpha)
cv
z>cv
#non-reject H0 , It is cheaper for employees to travel on their own


#6
#H0:u=85
#H1:u!=85
xbar<-80.94
pmean<-85
n<-25
sd<-11.6
alpha<-0.1
z <-(xbar-pmean)/(sd/sqrt(n))
z
pvalue <-2*pnorm(z)
pvalue
pvalue <alpha
cvl <-qnorm(alpha/2)
cvu <-qnorm(1-(alpha/2))
c(cvl,cvu)
(z<cv)|(z>cvu)
#reject H0, boys of a certain age have a mean weight aren't 85


#7
#H0:u>=613
#H1:u<613
xbar<-((13*60+48)+(10*60+10)+(7*60+54)+(9*60+22)+(8*60+38)+(9*60+48))/6
pmean<-10*60+13
n<-6
sd<-76
alpha<-0.05
z <-(xbar-pmean)/(sd/sqrt(n))
z
pvalue <- pnorm(z)
pvalue
pvalue <alpha
cv <-qnorm(alpha)
cv
z<cv
#non-reject H0 , his family running speed higher from the national average


#8
#H0:u<=30
#H1:u>30
xbar<-20
pmean<-30
n<-5
sd<-6
alpha<-0.01
z <-(xbar-pmean)/(sd/sqrt(n))
z
pvalue <- pnorm(z,lower.tail=FALSE)
pvalue
pvalue <alpha
cv <-qnorm(1-alpha)
cv
z>cv
#non-reject H0 , his claim is correct.to find a spot in the campus <=30


#9
#H0:u<=180
#H1:u>180
xbar<-195
pmean<-190
n<-40
sd<-50
alpha<-0.1
z <-(xbar-pmean)/(sd/sqrt(n))
z
pvalue <- pnorm(z,lower.tail=FALSE)
pvalue
pvalue <alpha
cv <-qnorm(1-alpha)
cv
z>cv
#non-reject H0 , the insurance company should be concerned


#10
#H0:u<=30
#H1:u>30
xbar<-33.4
pmean<-30
n<-15
sd<-8.2
alpha<-0.05
z <-(xbar-pmean)/(sd/sqrt(n))
z
pvalue <- pnorm(z,lower.tail=FALSE)
pvalue
pvalue <alpha
cv <-qnorm(1-alpha)
cv
z>cv
#non-reject H0 , The store manager's purchase volume can meet the needs of consumers

