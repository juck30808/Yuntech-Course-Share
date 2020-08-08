#Q1
#h0:u = 1580
#h1:u =/= 1580
n <- 100
sd <- 90
mean <- 1600
alpha <- 0.05
xbar <- 1580
#sampling mean
z <- (xbar-mean)/(sd/sqrt(n))
z
cv <- qnorm(0.05)
cv
z < cv 
#reject ho. the company claim is correct
p <- 2*pnorm(z)
p
p < alpha


##############################################
#Q2
#h0:u>=6
#h1:u<6
xbar <- 5.8
n <- 36
mean <- 6
sd <- 1.7
alpha <- 0.05
#z
z <- (xbar-mean)/(sd/sqrt(n))
z
z <qnorm(0.05)
#p
pvalue <- pnorm(z)
pvalue
pvalue < alpha
##############################################
#Q3
#h0:u<=170
#h1:u>170
sd <- 65
n <- 400
xbar <- 178
mean <- 170
alpha <- 0.1
z <- (xbar-mean)/(sd/sqrt(n))
z
z>qnorm(alpha)
#p
pvalue <- pnorm(z,lower.tail = FALSE)
pvalue
pvalue < alpha
#non-reject ho
################################################
#Q4
#h0:u= 79.15
#h1:u=/79.15
mean <- 79.15
n <- 100
xbar <- 80
sd <- 4
alpha <- 0.01
z <- (xbar-mean)/(sd/sqrt(n))
z
cv <- qnorm(alpha/2)
cv
z < cv
pvalue <- 2*pnorm(z,lower.tail = FALSE) 
pvalue
pvalue< alpha
################################################
#Q5
#h0:u>=1700 
#h1:u<1700
mean <- 1700
sd <-450
n <- 12
xbar <-1298
alpha<- 0.05
z <- (xbar-mean)/(sd/sqrt(n))
z
cv <- qnorm(alpha)
cv
z<cv
pvalue <- pnorm(z)
pvalue
pvalue < alpha
###############################################
#Q6
#h0:u >= 85
#h1:u <85
xbar<-80.94
n <- 25
sd <-11.6
alpha <-0.1
mean <- 85
z <- (xbar-mean)/(sd/sqrt(n))
z
cv <- qnorm(alpha)
cv
z<cv
pvalue <-pnorm(z)
pvalue
pvalue < alpha
##############################################
#Q7
#h0:u<=613
#h1:u>613
xbar <- mean(c(828,610,474,562,518,588))
mean <- 613
sd <- 76
n <- 6
alpha <- 0.05
z <- (xbar-mean)/(sd/sqrt(n))
z
cv<-qnorm(alpha)
cv
z<cv 
pvalue <- 2*pnorm(z)
pvalue
pvalue < alpha
#############################################
#Q8
#h0:u>=30
#h1:u<30
xbar <- 20
mean <-30
n <-5
alpha <-0.01
sd <-6
z <- (xbar-mean)/(sd/sqrt(n))
z
cv<-qnorm(alpha)
cv
z<cv
pvalue <- pnorm(z)
pvalue
pvalue < alpha
############################################
#Q9
#h0:u<=180
#h1:u>180
xbar <- 195
mean <- 180
sd <-50
n <- 40
alpha <- 0.1
z <- (xbar-mean)/(sd/sqrt(n))
z
cv <- qnorm(alpha)
cv
z > cv
pvalue <- pnorm(z,lower.tail = FALSE)
pvalue
pvalue <alpha
#############################################
#Q10
#h0:u<=30
#h1:u>30
n <- 15
xbar <- 33.4
sd <-8.2
mean <-30
alpha<- 0.05
z <- (xbar-mean)/(sd/sqrt(n))
z
cv <- -1*qnorm(alpha)
cv
z>cv
pvalue <- pnorm(z,lower.tail=FALSE)
pvalue
pvalue < alpha

