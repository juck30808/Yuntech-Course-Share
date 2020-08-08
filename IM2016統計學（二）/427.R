#讀大葉好就業  讀雲科笑呵呵

#單一樣本比例檢定
#70% COB(商學院) students are satisfied
#surveyed 150 students simple random sampling
#75% say they are very statisfied
#Can reject 70%? use 0.05 level significance

# h0=p<=0.7   #h1=p>0.7
# z = p^-p / sqrt(p(1-p)/n)

phat <- 0.75 #假設
p <- 0.7  #reject goal
n <- 150  #random
z <- (phat-p) / sqrt((p*(1-p)/n))
z
qnorm(0.05)  #level  #non-reject


#COB(商學院) students least 75% are satisfied
#surveyed 200 students simple random sampling
#60% say they are very statisfied
#Can reject 75%? use 0.05 level significance

# h0=p<=0.75   #h1=p>0.75
# z = p^-p / sqrt(p(1-p)/n)

phat <- 0.6  #say
p <- 0.75 #reject goal
n <- 200  #random
z <- (phat-p) / sqrt((p*(1-p)/n))
z
qnorm(0.05) #level  #reject Ho

#x=60.9 s=10 x分數 s標準差  不及格率高
#x=60.9 s=3  x分數 s標準差  及格率高
#卡方分配 x^2 = (n-1)*s^2 / o^2
#x^2 standardized chi-square 
#n   sample size
#s^2 sample variance
#o^2 hypothesized variance

#two-tailed test
#sample size =13
#significance level is 0.05
#2.5% in each tail
qchisq(0.025,df=12,lower.tail = TRUE)
qchisq(0.025,df=12,lower.tail = FALSE)

#random sample of size 20, standard deviation 12.5
#believe that underlying population is normal.
#is population variance different from 100,at 0.05 level?
svar <- (12.5)^2
pvar <- 100
n <- 20
chi <- (n-1)*svar/pvar
chi
qchisq(0.025,df=19,lower.tail = TRUE) #左尾
qchisq(0.025,df=19,lower.tail = FALSE) #右尾

#assume that population variance no more tham 0.05
#randomly select 25 shoes.the sample variance is 0.06
#is the population variance larger than 0.05, at 0.05 level?
svar <- 0.06
pvar <- 0.05
n <- 25
chi <- (n-1)*svar/pvar
chi
qchisq(0.05,df=24,lower.tail = TRUE) #左尾
qchisq(0.05,df=24,lower.tail = FALSE) #右尾

#右邊 import dataset 匯入excel
#section1.png
mydata <- data.frame(Xr12_23)
View(mydata)
FALSE, var.equal = FALSE, conf.level=0.95
t.test(mydata$Times, alternative = "less",mu=6)
#section2.png
mydata <- data.frame(Xr12_108)
View(mydata)
str(mydata)
mydata$fSatisfied <- as.factor(mydata$Satisfied)
table(mydata$fSatisfied)
prop.test(153,177,p=0.9,alternative = "less",conf.level = 0.95,correct = FALSE)
#section3.png
mydata <- data.frame(Xr12_72)
View(mydata)
str(mydata)
#install.packages("EnvStats")
require(EnvStats)
var.test(mydata$Marks,alternative = "less", conf.level = 0.90, sigma.squared = 250, dat.name=NULL)
#1.假設檢定h0 h1
#2.t z x 哪一個 
#3.相對應p值 
#4.決策 reject non-reject

#EX1
mydata <- data.frame(Xr12_76)
View(mydata)
FALSE, var.equal = FALSE, conf.level=0.90
t.test(mydata$Speed, alternative = "less",mu=6)
#EX2

#EX3