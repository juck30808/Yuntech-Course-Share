#Confidence
n <- 16
sd <- 25
xbar <- 240
sig <- 0.9
se <- abs(qnorm((1-sig)/2)*sd/sqrt(n))
se
lcl <- xbar-se
ucl <- xbar+se
ci <- c(lcl,ucl)
ci


#Left tail
#H0:u<=50 H1:u>50
n <-36
xbar <-60
pmean <-50
sd <-10 
sig <-0.05
z<-(xbar-pmean)/(sd/sqrt(n))
z
CV <-qnorm(1-sig) 
CV
Pvalue <- pnorm(z,lower.tail = FALSE)
Pvalue
Pvalue > sig
z > CV

############mean##################
#„Huse Xr12 25)
#average American is more than 20 pounds overweight. 
#random sample of Was weighed, and the difference 
#between their actual and idea weights was calculated.
#The data is listed at Xr12 25. 
#Do these data allow us to infer at the5 % significance level that the doctor¡¦s claim is true?

#H0:p<=20 , H1:p>20
mydata <-data.frame(Xr12_25)
View(mydata)
t.test(mydata$Overweight,alternative = "greater",mu=20)

##########proportion##########
#Xr12_108
#H0:p>=0.9 H1:p<0.9
mydata <-data.frame(Xr12_108)
View(mydata)
str(mydata)
mydata$Textbook <- as.faactor(mydata$Textbook)
table(mydata$Textbook)
prop.test(57,100,p=0.5,alternative = "greater",conf.level = 0.99,correct = FALSE)

##########variance############
#H0:a^2=250 H1:a^2<250
mydata <-data.frame(Xr12_72)
View(mydata)
str(mydata)
install.packages("EnvStats")
require(EnvStats)
varTest(mydata$Marks,alternative="less",conf.level=0.90,sigma.sqared=250,data.name=NULL)
