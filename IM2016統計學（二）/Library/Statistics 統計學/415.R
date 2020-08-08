#Right tail
#H0:u<=50 H1:u>50
n <-36 #random samle
xbar <-60 #mean
pmean <-50
sd <-10 
sig <-0.05
z<-(xbar-pmean)/(sd/sqrt(n))
z
CV <-qnorm(1-0.05) #right tail
CV
Pvalue <- pnorm(z,lower.tail = FALSE)
Pvalue
Pvalue < sig
z > CV


#Two tail
#H0:
xbar <-0.495
pmean <- 0.5
sd <-0.05
n <-16
z <-(xbar-pmean)/(sd/sqrt(n))
z
CVL <-qnorm(0.05/2)
CVU <-qnorm(1-(0.05/2))
c(CVL,CVU) #臨界值
(z<CVL) | (z>CVU) # |=or
Pvalue <-2*pnorm(z,lower.tail = TRUE)
Pvalue
Pvalue <alpha

#test1
#h0:u =250
#h1:u !=250
xbar <-255
u<-250
pmean <-3
n <-81
alpha<-0.05
z<-(xbar-u)/(pmean/sqrt(n))
z
CVL <- qnorm(alpha/2)
CVU <- qnorm(1-(alpha/2))
c(CVL,CVU)
(z<CVL) |(z>CVU)
#reject HO

#test2
#h0:u<=140
#h1:u>140
xbar <-146
u <-140
pmean<-48.2
n <-900
sig<-0.05
z<-(xbar-u)/(pmean/sqrt(n))
z
CV <-qnorm(1-(0.05))
CV
z>CV
#Reject H0 處方藥確實小於140

