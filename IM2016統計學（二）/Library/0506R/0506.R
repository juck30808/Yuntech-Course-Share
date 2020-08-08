#select 10 student
score <- c(80,75,60,72,55,89,95,78,82,90)
xbar<-mean(score)
n<-length(score)
ssd<-sd(score)
tcv<-qt(0.05/2,df=n-1)
se<-abs(tcv*ssd/sqrt(n))
c(xbar-se,xbar+se)


#
score <- c(4.5,22,7,14.5,9,9,3.5,8,11,7.5,18,20,7.5,9,10.5,15,19,2.5,5,9,8.5,14,20,8)
xbar<-mean(score)
n<-length(score)
ssd<-sd(score)
tcv<-qt(0.05/2,df=n-1)
se<-abs(tcv*ssd/sqrt(n))
c(xbar-se,xbar+se)

#ramdom25 aerage0.265 sd0.03 differ0.26 5%
xbar<-0.265
pmean<-0.26
n<-25
sd<-0.03
alpha<-0.05
t <-(xbar-pmean)/(sd/sqrt(n))
t
pvalue <-2*pt(t,df=n-1,lower.tail = FALSE)
pvalue <alpha

#now you try to recruit
xbar<-0.29
pmean<-0.26
n<-25
sd<-0.04
alpha<-0.05
t <-(xbar-pmean)/(sd/sqrt(n))
t
pvalue <-pt(t,df=n-1,lower.tail = FALSE)
pvalue <alpha

#howerer
xbar<-0.25
pmean<-0.26
n<-25
sd<-0.02
alpha<-0.05
t <-(xbar-pmean)/(sd/sqrt(n))
t
pvalue <-pt(t,df=n-1,lower.tail = TRUE)
pvalue <alpha


#READ
#file > import data > excel
mydata<-data.frame(Xr12_23)
view(Xr12_23)
str(mydata)
t.test(mydata$Times,alternative = "less",mu=6)



#
mydata<-data.frame(Xr12_25)
#View(Xr12_25)
str(mydata)
t.test(mydata$Overweight,alternative = "greater",mu=20)
