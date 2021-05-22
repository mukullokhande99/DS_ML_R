tel_data=read.csv("Telecom_Data.csv")
tel_data=tel_data[-4]
str(tel_data)
tel_data$churn=as.factor(tel_data$churn)
library("caTools")
sample=sample.split(tel_data$churn, SplitRatio=-0.8)
trainset=subset(tel_data,sample==TRUE)
testset=subset(tel_data,sample == FALSE)
install.packages("randomForest")
library("randomForest")
model=randomForest(churn~.,data=trainset)
testset$predicted_churn=predict(model,testset)
library("Mlmetrics")

#validation part
