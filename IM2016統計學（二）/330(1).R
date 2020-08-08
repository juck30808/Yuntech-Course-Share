#Test population
sd<-17.386
n<-15
xbar<-24.501
a<-0.05
z <- qnorm(a/2)
z

Q<-abs(z*sd/sqrt(n))
ci<- c(xbar-Q,xbar+Q)
ci

#Test infer satisfaction
phat <- 0.8655
p <- 0.9
n <- 177
z <-(phat-p)/sqrt((p*(1-p)/n))
z

qnorm(0.05)




#The commuting time between the university and the airport
#is normally distributed. A random sample of 25 was drawn
#from a normal distribution with a standard deviation o of 0.5.
#The sample mean is 1.5hours.

#Determine the 90%,95% and 99% confidence interval
#estimate of the population mean.

#Determine the 95% confidence interval with a sample size of 100
xbar <- 1.5
psd <- 0.5
n <- 25
se <- abs(qnorm(0.1/2)*psd/sqrt(n))
lcl <- xbar-se   #(lcl)=lower confidence limit
ucl <- xbar+se
ci <- c(lcl,ucl)
ci

#A group of 16 foot surgery patients had a mean weight of
#240 pounds. The standard devaiation o was 25 pounds.

#Find a confidence interval for a smaple for the true mean
#weight of all foot surgery patients.Find a 90% confidence interval.

xbar <- 240
psd <- 25
n <- 16
se <- abs(qnorm(0.1/2)*psd/sqrt(n))
lcl <- xbar-se
ucl <- xbar+se
ci <- c(lcl,ucl)
ci

#We would like to estimate a popilation mean to within 10 units.
#The confidence level has been set at 95% and o=200. Determine the sample size.

#We would like to estimate a popilation mean to within 10 unites.
#The confidence level has been set at 95% and o=100. Determine the sample size.

#sample size = 1536.64 = 1537
lcl <- 240-abs(qnorm(0.05/2)*(25/sqrt(16)))
ucl <- 240+abs(qnorm(0.1/2)*(25/sqrt(16)))
ci <- c(lcl,ucl)
ci


#A random sample of 25 sample students enrolled in a biz statistics
#course was drawn. Each student was asked how many hours he or she
#spent doing homework in statistics

#The sample mean is 2 hours with o=0.6. Test to determine at the 5%
#significance level whether there is enough statistical evidence to 
#infer that the mean amount of doing hwork by student is less than 3.5 hours?

#1. h0=u=2    h0=u=2     [h0=u>=3.5]
#   h1=u!=2   h1=u<=3.5  [h1=u<3.5]
#2. a=0.05
#3. Z = (2-3.5)/0.6/sqt(25)



#A random sample of 36 sample students was collected.
#Each student was asked how many minutes of sports he watched daily.

#The mean is 620 mins with o=10 Test to determine at the 5% significance level
#whether there is enough statistical evidence to infer that the mean amount of
#sportTV watched daily ny student is greater than 50 mins?

#1. [h0=u<=50] [h1=u>50]
#2. a=0.05
#3. Z = (60-50)/10/sqt(36) =6
#4. 1-qnorm(0.05)=1.645
#5. 6 > 1.645
#6. Reject H0

