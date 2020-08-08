#右下packages -> Install -> packages輸入klaR安裝  

url <- 'http://www.biz.uiowa.edu/faculty/jledolter/DataMining/admission.csv'
admit <- read.csv(url)
library(MASS) 
plot(admit$GMAT,admit$GPA,col=admit$De) #
summary(admit)
numSummary(admit[,c("GMAT", "GPA")], groups=admit$De, 
           statistics=c("mean","sd", "IQR", "quantiles"), quantiles=c(0,.25,.5,.75,1))

adm.lda <- lda(De~.,admit)
adm.predict <- predict(adm.lda)
adm.class <- adm.predict$class 
ldahist(data=adm.predict$x[,1], g=admit$De)
ldahist(data=adm.predict$x[,2], g=admit$De) 

# Confusion Matrix:
table(admit$De,adm.class)
# Accuracy rate
correct <- diag(table(adm.class, admit$De))
sum(correct)/NROW(admit$De) # or use length(admit$De)

plot(adm.predict$x[,1],adm.predict$x[,2],col=admit$De) # make a scatterplot

newadmit=rbind(c(3.0, 2.5, 3.6, 3.5, 2), c(300, 600, 550, 480, 670)) # New admission data
predict(adm.lda, data.frame(GPA=newadmit[1,],GMAT=newadmit[2,]))$class 

library(klaR)
partimat(De~.,data=admit,method="lda",prec=500)  #畫圖精細度

# QDA
adm.qda <- qda(De~.,admit)
table(admit$De, predict(adm.qda)$class)
partimat(De~.,data=admit,method="qda",prec=500) 