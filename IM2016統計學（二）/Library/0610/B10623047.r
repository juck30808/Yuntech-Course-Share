#1
#H0:uy<=uw H1:uy>uw
mydata<-data.frame(Xr13_12)
str(mydata)
#H0:pv1/pv2=1,H1:pv1/pv2 /=1
var.test(mydata$Yellow,mydata$White,ratio=1,alternative="two.sided",conf.level=0.95)
#reject H0
t.test(mydata$Yellow,mydata$White,alternative="less",var.equal=FALSE,conf.level=0.95)
#non reject H0
#The baseball's errors are fewer on average when the yellow ball is used.

#2
#H0:utwo<=uthis H1:utwo>uthis

mydata<-data.frame(Xr13_20)
str(mydata)
#H0:pv1/pv2=1,H1:pv1/pv2 /=1
var.test(mydata$X2.years.ago,mydata$This.year,ratio=1,alternative="two.sided",conf.level=0.95)
#reject H0
t.test(mydata$X2.years.ago,mydata$This.year,alternative="greater",var.equal=FALSE,conf.level=0.95)
#non reject H0
#The cruise ships are not attracting younger customers.

#3
#H0:Ud>=0 H1:Ud<0 Ud=Ub-Ua
mydata<-data.frame(b=c(9,8,7,10,6),a=c(10,9,11,12,9))
View(mydata)
t.test(mydata$b,mydata$a,mu=0,alternative="less",paired=TRUE)
#reject H0
#After more than before so we have enough evidence can reject H0.

