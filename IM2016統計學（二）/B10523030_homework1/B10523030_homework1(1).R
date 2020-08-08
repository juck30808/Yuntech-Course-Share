#EX1
mydata <- data.frame(example1_4)
mydata               
mydata$分數          #mydata[c(3,2)]
mean(mydata[,2])     #平均數 
median(mydata[,2])   #中位數 
range<-max(mydata[,2])-min(mydata[,2]) 
range                #全距 
sd(mydata[,2])       #標準差 


#EX2 #次數分配表 #百分比表  #table() summary() 
mydata <- data.frame(example2_1)
mydata                  
summary(mydata)         
summary(mydata$社區)    
summary(mydata$性別)    
prop.table(summary(mydata$性別)) 
summary(mydata$態度)    
prop.table(summary(mydata$態度))


#Ex3 #長條圖(barplot)
barplot(summary(mydata$社區))
barplot(summary(mydata$性別))
barplot(summary(mydata$態度))


#Ex4  #圓餅圖(pie)
pie(summary(mydata$社區),main="社區") 
pie(summary(mydata$性別),main="性別")
pie(summary(mydata$態度),main="態度")
#package ‘plotrix’ was built under R version 3.4.3
library("plotrix")    #install.packages("plotrix")
fan.plot(summary(mydata$社區),labels=1,main="社區")
fan.plot(summary(mydata$性別),labels=2,main="性別")
fan.plot(summary(mydata$態度),labels=3,main="態度")


#EX5
mydata <- data.frame(example2_2)
mydata
data <- seq(161,272,10)  #等差數列(from,to,by)
data
cut.data <- cut(mydata$銷售額,breaks=data)  #切割後
table(cut.data)  #次數
prop.table(table(cut.data))         #百分比
cumsum(prop.table(table(cut.data))) #累積百分比


#Ex6
mydata <- data.frame(example2_2)
mydata
hist(mydata$銷售額,main="(a)普通",xlab="銷售額",ylab="次數")
hist(mydata$銷售額,main="(b)分成20組",xlab="銷售額",ylab="次數",breaks=20,col="gray")
hist(mydata$銷售額,main="(c)增加軸鬚線和核密度線",xlab="銷售額",ylab="次數",breaks=20,col="gray",freq=FALSE)
rug(jitter(mydata$銷售額)) #底
lines(density(mydata$銷售額),col="blue",lwd=4)  #畫圖
hist(mydata$銷售額,main="(d)增加常態密度線",xlab="銷售額",ylab="次數",breaks=20,col="gray",freq=FALSE)
rug(jitter(mydata$銷售額)) #底
lines(density(mydata$銷售額),col="red",lwd=4)#畫圖


#Ex7
mydata<- example2_2$銷售額
stem(mydata$銷售額,scale = 1)


#Ex8 #重疊散布圖
plot(x=example2_4$銷售收入,y=example2_4$銷售網站數,main="重疊散佈圖")
par(new=TRUE)
plot(x=example2_4$銷售人員,y=example2_4$廣告費用,main="重疊散佈圖",axes=FALSE,xlab="",ylab="")


#Ex9  #矩陣散分布
plot(example2_4)


#EX10
mydata <- data.frame(example3_5)  #讀取該檔案成為資料框 取名為mydata
mydata
summary(mydata)
mean<-colMeans(mydata) #平均
sd <-apply(mydata, 2, sd, na.rm = TRUE)#標準差
cv<- data.sd/colMeans(mydata) #變異係數
mean 
sd
cv
boxplot(mydata)