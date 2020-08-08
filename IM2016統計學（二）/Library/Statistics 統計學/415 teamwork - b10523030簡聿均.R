#1.Teamwork
#H0:u<=98.6
#H1:u>98.6
xbar <-98.3
pmean <-98.6
n <-25
sd <-0.6
alpha <-0.01
z <-(xbar-pmean)/(sd/sqrt(n))
z
CV <- (1-alpha)
CV
Pvalue <- pnorm(z)
Pvalue <alpha #TRUE
#Non Reject H0


#2.Teamwork
#H0:u>=1200
#H1:u<1200
xbar <-1194
pmean <-1200
n <-64
sd <- 6
alpha <-0.05
z <-(xbar-pmean)/(sd/sqrt(n))
z
CV <- (1-alpha)
CV
Pvalue <- pnorm(z)
Pvalue <alpha #TRUE
#Non Reject H0

#3.Teamwork left
#H0:u>=100
#H1:u<100
xbar <-106
pmean <-100
n<-49
sd <-10.5
alpha <-0.01
z <-(xbar-pmean)/(sd/sqrt(n))
z
Pvalue <-pnorm(z)
Pvalue <= alpha
#Reject H0