#610teamwork

#q1 Business Problem - Softball
#h0:pmun1 >= pmu2
#h1:pmun1 < pum2
mydata <- data.frame(Xr13_12)
#View(mydata)
str(mydata)
var.test(mydata$Yellow, mydata$White, ratio = 1, alternative = "two.sided")
t.test(mydata$Yellow, mydata$White, mu = 0, alternative = "less", var.equal = TRUE) 
#pvalue >alpha
#non reject H0
#The baseball's errors are fewer on average when the yellow ball is used.
#=====================================


#q2 Business problem - ship business
#h0:mu(2yearsago) - mu(thisyear)==0
#h1:mu(2yearsago) - mu(thisyear)!=0
mydata <- data.frame(Xr13_20)
#View(mydata)
str(mydata)
var.test(mydata$X2.years.ago, mydata$This.year, ratio = 1, alternative = "two.sided")
t.test(mydata$X2.years.ago, mydata$This.year, mu = 0, alternative = "greater", var.equal = FALSE) 
#pvalue < alpha
#reject H0
#We have enough to infer that cruise ships are younger than customers

#=====================================
#q3 Problem
#H0:md <=0
#H1:md >0
md<-0
n<-5
xbar <- (1+1+4+2+3)/5
sd = sqrt(((1-2.2)^2+(1-2.2)^2+(4-2.2)^2+(2-2.2)^2+(3-2.2)^2)/4)
t <- (xbar -md)/(sd/sqrt(n))
t
pt(t,df=4,lower.tail = FALSE)
pvalue <alpha
#Reject H0.
#we can stay that the eye exercises is successful.
