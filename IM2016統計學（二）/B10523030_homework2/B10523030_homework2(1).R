#1.input database (use files)
#install.packages("devtools")
#library(devtools)
#install_github("easyGgplot2")
#library(easyGgplot2)



#EX1 #無法合併三個圖
mydata <- data.frame(example3_7)
boxplot(mydata)
stem(mydata$月生活費支出,scale = 1)
summary(mydata$性別)
summary(mydata$家庭所在地)
summary(mydata$月生活費支出)  

#EX2 #散點圖
install.packages("ggplot2")
library(ggplot2)#visualization
head(mydata)
ggplot(data=mydata, aes(x=月生活費支出, y=性別)) + geom_point()
ggplot(data=mydata, aes(x=月生活費支出, y=家庭所在地)) + geom_point()

#Ex3 

#Ex4  
mydata <- data.frame(example4_1)  
mydata
me <- colMeans(mydata)  #期望值
sd <- apply(mydata, 2, sd, na.rm = TRUE) #標準差
cv <- sd/me #變異係數
me
sd
cv

#EX5


#EX6
#h0:mu = 15
#h1:mu != 15
mydata <- data.frame(jjp)  
mydata
n <- 10
xbar <- mean(jjp$建材長度)
sd <- sd(jjp$建材長度)
u <- 15
z <- (xbar-u)/(sd/sqrt(n))
pnorm(z)
qnorm(1-0.05/2)
#non-reject h0 該供應商提供的材料符合要求


#EX7

#EX8

#EX9

#EX10

#EX11
#h0:p1 >= p2
#h1:p1 < p2
phat1 <- 0.27
phat2 <- 0.35
n1 <- 200
n2 <- 200
pooledp <- (phat1*n1+phat2*n2)/(n1+n2)
z <- (phat1-phat2)/sqrt((pooledp*(1-pooledp))*((1/n1)+(1/n2)))
z
qnorm(0.05)
#reject h0 男學生中表示贊成的比例顯著高於女學生

#EX12
