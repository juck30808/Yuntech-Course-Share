#using R as a Calculator
1+2
6-3
8*9
8/4
2^3
9%%4
2**3

#iii.select the data type: class() and str()
my_numeric <- 60 
my_character <- "Taiwan"
my_lgical <-FALSE

class(my_numeric)
class(my_character)
class(my_lgical)

str(my_numeric)
str(my_character)
str(my_lgical)

#iv.Input & Output
getwd()
setwd("C:/Users/juck3/Dropbox/a2 Course/1.Statistics/data")
getwd()
dir()

#use femaleMiceWeights.csv
read.csv("femaleMiceWeights.csv")
read.table("femaleMiceWeights.csv")
tempmydata <- read.csv("femaleMiceWeights.csv")

iris
data<-iris
write.table(data,file = "test.CSV", sep = ",")
write.csv(data,file = "test2.CSV")

##v. Install package() Meet Common Package
install.packages("ggplot2")
install.packages("dslabs")
install.packages("dplyr")
library(ggplot2)
require(ggplot2)

##vi. other basic operation
sleep
View(sleep)
q()

a<-1
b <- "Two"
ls()

#vii. About help
help(pnorm)
?"pnorm"
args(pnorm)
pnorm(1.96,lower.tail = TRUE) 
pnorm(1.96)
pnorm(1.96,lower.tail = FALSE)


#### charapter 2 ###

#i.Logical
5>3
4<9
2>=4
7<=8
8==5
9!=4

#ii.Math function
1:10    　　　#排列
abs(-1) 　　　#1
sqrt(9) 　　　#3
round(1.4)    #四捨五入 
help("round")　
sum(1:10)     #加總
summary(1:10) #return max,min,mean
sample(1:20)  #隨機變數
sample(c("a","b","c","d"))
cumsum(1:20)  #累加 summery the summery
cumprod(1:5)  #累乘 mutiply the mutiply 

#對數
#log2(8)
log(8,2)
log(8,base = 2)
args(log)
#What is the answer of log base=10 value=1200
log(1200,10)

#iii. statistics function
x <- sample(1:10)
x
mean(x)
sd(x)
var(x)
medium(x)

#question(2) what is the mean/med if you randomly select 10 sample from 1 to 100
x <- sample(1:100,10)
mean(x)
median(x)

#iv.string function
length("Taiwan")
length(c("US","Taiwan"))
nchar("Taiwan")
nchar(c("US","Taiwan"))

tolower(c("US","Taiwan"))
toupper(c("us","taiwan"))
casefold(c("US","Taiwan"),upper=FALSE)
casefold(c("apple","orange"),upper=TRUE)

#v.seq()
1:10
seq(1,10)
?"seq"
help("seq")
seq(1,10,by=2)             #間距為2
seq(length=10,from=1,by=2) 
seq(1,10,length.out = 5)   #切成5等分
