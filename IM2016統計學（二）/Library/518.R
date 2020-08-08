//case1 proportion

phat1 <- 0.44
phat2 <- 0.38
n1 <- 200
n2 <- 100
pooledp <- (phat1*n1+phat2*n2)/(n1+n2)
z <- (phat1-phat2)/sqrt((pooledp*(1-pooledp))*((1/n1)+(1/n2)))
z
qnorm(0.1/2)


//case2
phat1 <- 0.51
phat2 <- 0.38
D <- 0.05
n1 <- 200
n2 <- 100
z <- ((phat1-phat2)-D)/sqrt((phat1*(1-phat1)/n1)+(phat2*(1-phat2)/n2))
z
qnorm(0.05)

//example safe
//check 250 found 30
//400 that 80   0.05sig
#H0 p1-p2 <= 0
#H1 p1-p2  > 0
phat1 <- 0.12
phat2 <- 0.2
n1 <- 250
n2 <- 400
pooledp <- (phat1*n1+phat2*n2)/(n1+n2)
z <- (phat1-phat2)/sqrt((pooledp*(1-pooledp))*((1/n1)+(1/n2)))
z
qnorm(0.1/2)

//example voter
//652 out of 1158 
//412 out of 982
//0.05 sig 0.1point
#H0 p1-p2 <= 0.1
#H1 p1-p2  > 0.1
phat1 <- 652/1158
phat2 <- 412/982
D <- 0.1
n1 <- 1158
n2 <- 982
z <- ((phat1-phat2)-D)/sqrt((phat1*(1-phat1)/n1)+(phat2*(1-phat2)/n2))
z
qnorm(0.05)

//ex variance
#H0 pv1 = pv2
#H1 pv1 != pv2
m <- c(8,9,8,9,8.5,9.5,8.4,8.2)
f <- c(5,5,5.2,5.3,5.5,5.2,5.2,5)
sv1 <- var(m)
sv2 <- var(f)
n1 <- sum(complete.cases(m))
n2 <- sum(complete.cases(f))
F <- sv1/sv2
F
qf(0.05,df1=n1-1,df2=n2-1,lower.tail = TRUE)
qf(0.05,df1=n1-1,df2=n2-1,lower.tail = FALSE)
