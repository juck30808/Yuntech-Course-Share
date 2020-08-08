#### 6/3 problemm ####
#a marketing manager want to conduct

#H0: pv1 = pv2
#H1: pv1 =/= pv2

#創造倆的變數把原生資料排入
m <-c(8,8,7,8,8.5,9.5,8.4,8.2)
f <-c(5,5,5.2,5.3,5.5,5.2,5.2,5)
#存儲m的var平均
sv1 <- var(m)
sv2 <- var(f)
#n裡面有幾個完整的case
n1 <-sum(complete.cases(m))
n1 #8
n2 <-sum(complete.cases(f))
n2
#顯著水準
Alpha <- 0.1
F <- sv1/sv2
F
Pvalue <- 2*pf(F,df1=n1-1,df2=n2-1,lower.tail = FALSE)
Pvalue
Pvalue < Alpha

#
var.test(m,f,ratio=1,alternative="two.sided")


#########################
#var.test(x,y,rat)

mydata <- data.frame(Xr13_122)
#View(mydata)
#排序內部結構
str(mydata)
#進行兩組變異數相同與否的F檢定
var.test(mydata$Machine.1,mydata$Machine.2,ratio=1,alternative="two.sided")
#p-value > Alpha 
#non_reject

############################

mydata <- data.frame(Xr13_30)
#5% sig 
#View(mydata)
#排序內部結構
str(mydata)
#進行兩組變異數相同與否的F檢定
var.test(mydata$Machine.1,mydata$Machine.2,ratio=1,alternative="two.sided")
#p-value > Alpha #non_reject

#########################

#h0: pv1 = pv2
#h1: pv1 =/pv2
sv1 <- (1.2)^2
sv2 <- (1.1)^2
n1 <- 100
n2 <- 64
Alpha <-0.05
F <-sv1 / sv2
F
Pvalue <- 2*pf(F,df1=n1-1,df2=n2-1,lower.tail = FALSE)
Pvalue
Pvalue < Alpha #FALSE
#Non Reject H0
#

########################

#h0: pum1 = pum2
#h1: pum1 =/pum2
xbar1 <-3.2
xbar2 <-3
sv1 <- (1.2)^2
sv2 <- (1.1)^2
n1 <- 100
n2 <- 64
Alpha <-0.05
spooled2 <- ((n1-1)*sv1+(n2-1)*sv2)/(n1+n2-2)
t <- (xbar1-xbar2-0)/sqrt(spooled2*((1/n1)+(1/n2)))
t
Pvalue <- 2*pt(t,df=n1+n2-2)
Pvalue < Alpha #FALSE
#Non Reject H0

########期末考必考#########
#兩群的平均數比較  Girls & Boys sample size