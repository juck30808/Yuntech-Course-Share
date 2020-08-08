#problem
#H0:p=0.8
#H1:p=/0.8
phat <-0.73
p <-0.8
n<-100
Alpha <-0.05
z <-(phat-p)/sqrt((p*(1-p)/n))
z
Pvalue <- 2*pnorm(z,lower.tail = TRUE)
Pvalue < Alpha


#Problem
#H0:p<=0.7
#H1:p>0.7   #most
phat <-0.75 #75% say
p <-0.8     #hypothesis
n<-150      #sampling
Alpha <-0.05
z <-(phat-p)/sqrt((p*(1-p)/n))
z
Pvalue <- pnorm(z,lower.tail = FALSE)
Pvalue < Alpha

#xr12_112
#H0:p<=0.5
#H1:p>0.5
mydata <-data.frame(Xr12_112)
#View(mydata)    #use 'V' not 'v'
str(mydata)
table(mydata)
help(prop.test)
prop.test(57,100,p=0.5,alternative = "greater",conf.level = 0.99,correct = FALSE)
#100 smaple choice 57

#xr12_108
#H0:p>=0.9
#H1:p<0.9
mydata <-data.frame(Xr12_108)
#View(mydata)    #use 'V' not 'v'
str(mydata)
table(mydata)
help(prop.test)
prop.test(153,177,p=0.9,alternative = "less",conf.level = 0.95,correct = FALSE)
#100 smaple choice 57

#an
#H0:a^2 = 100
#H1:a^2 =/100
svar<-(12.5)^2
pvar<-100
n<-20
Alpha<-0.05
chi<-(n-1)*svar/pvar
chi
Pvalue<-2*pchisq(chi,df=n-1,lower.tail = FALSE)
Pvalue
Pvalue < Alpha


#an
#H0:o2<=0.0004
#H1:o2>0.0004
svar<-0.0005
pvar<-(0.02)^2
n<-30
Alpha<-0.05
chi<-(n-1)*svar/pvar
chi
Pvalue<-pchisq(chi,df=n-1,lower.tail = FALSE)
Pvalue
Pvalue < Alpha


