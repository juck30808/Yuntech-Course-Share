#Pop Quiz 

#1 (uniform)between 30 and 60
u<-50
ans<-(60-30)/50
ans

#2 (normal) finished after 60min
u<-40
sd<-9
x<-60
z<-(x-u)/sd
ans<-1-pnorm(z)
ans

#3 (normal) less than2.0
u<-3.6
sd<-1.2
x<-2.0
z<-(x-u)/sd
ans<-pnorm(z)
ans

#4 (normal) sample=145,82% of deaths
u<-18
x<-12
z<-(x-u)/sqrt(145)
ans<-pnorm(z)
ans

#5 having 3 cars in 30min and 1 car in 12
u<-5
x1<-3
x2<-1
z1<-(x1-u)/sqrt(30)
ans1<-pnorm(z1)
ans1
z2<-(x2-u)/sqrt(12)
ans2<-pnorm(z2)
ans2


#6 sample=50,
u<-0.43
x<-0.46
z<-(x-u)/sqrt(50)
ans<-pnorm(z)
ans #worth it

#7 select 16 bottle
u<-500
p<-0.048 #1-pnorm(1.66)
x<-510
sd<-(x-u)/1.66
sd

#8 more than 19 pass the inspection
u<-60
x<-19
z<-(x-u)/sqrt(1000)
ans<-1-pnorm(z)
ans

#9 
u<-100
x<-96
z<-(x-u)/sqrt(5)
ans<-pnorm(z)
ans

#10 between 106 and 108
u<-105
sd<-4
x1<-106
x2<-108
z1<-(x1-u)/sd
z2<-(x2-u)/sd
pnorm(z2)-pnorm(z1)



