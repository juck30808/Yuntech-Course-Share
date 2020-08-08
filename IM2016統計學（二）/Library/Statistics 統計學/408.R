#HTE

#Hypothesis test - I
#H0:u<=1.5
#H1:u>1.5    #Less than 1.5
pmean <-1.5
xbar <-1.1
n <-25
sd <- 0.5
sig <-0.05
z <-(xbar-pmean)/(sd/sqrt(n))
z
pvalue <-pnorm(z)
pvalue
pvalue<sig #TRUE Pvalue
cv <- qnorm(sig)
cv
z<cv  #TRUE Zvalue
#Reject H0


#Hypothesis test - I Problem 
#H0:u>=3.5
#H1:u<3.5       #Less than 3.5
pmean <-3.5
xbar <-2
n <-25
sd <- 0.6
sig <-0.05
z <-(xbar-pmean)/(sd/sqrt(n))
z
pvalue <-pnorm(z)
pvalue
cv <- qnorm(sig)
cv
pvalue<sig #TRUE Pvalue
z<cv  #TRUE Z-Value
#Reject H0



#Hypothesis test - II
#H0:u<=1.5
#H1:u>1.5       #Larger(greater) than 1.5
pmean <-1.5
xbar <- 1.9
n <-25
sd <- 0.5
sig <-0.05
z <-(xbar-pmean)/(sd/sqrt(n))
z
pvalue <-pnorm(z)
pvalue
cv <- qnorm(sig)
cv
pvalue<sig #TRUE Pvalue
z<cv  #TRUE Z-Value
#Non Reject H0


#Hypothesis test - II  Problem
#H0:u<=50
#H1:u>50       #Larger(greater) than 50
pmean <-50
xbar <- 60
n <-36
sd <- 10
sig <-0.05
z <-(xbar-pmean)/(sd/sqrt(n))
z
cv <- qnorm(1-sig)
cv
z>cv  #TRUE Z-Value
#Non Reject H0


#Two tail
#H0:u=250
#H1:u!=250
xbar <-246
pmean <- 250
sd <-5
n <-16
z <-(xbar-pmean)/(sd/sqrt(n))
z
CVL <-qnorm(0.05/2)
CVU <-qnorm(1-(0.05/2))
c(CVL,CVU) #Á{¬É­È
(z<CVL) | (z>CVU) # |=or
Pvalue <-2*pnorm(z)
Pvalue
Pvalue <alpha
