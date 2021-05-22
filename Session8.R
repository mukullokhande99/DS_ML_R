#load data
com_data=read.csv("Computer_Data.csv")
View(com_data)

#Linear regression model to predict price(dep var)

#No missing value and hidden data
#remove 1st column serial num
com_data=com_data[-1]
View(com_data)

#Assumption check
#check linearity using scatterplot
#multicolinearity
cor(com_data[c(2,3,4,5,9,10)])
#hd-ram corr 0.7777263 cant be used at a time

#get two datasets
data1=com_data[-3] #without hd
data2=com_data[-4] #without ram

#Supervised concept as price is already known
#data- train, test 

#to divide data in train-test dataset
install.packages("caTools")
library("caTools")
sample1=sample.split(data1$price,SplitRatio = 0.70)
trainset1=subset(data1,sample1==TRUE)
testset1=subset(data1,sample1==FALSE)
sample2=sample.split(data2$price,SplitRatio = 0.70)
trainset2=subset(data2,sample2==TRUE)
testset2=subset(data2,sample2==FALSE)

#model1 
model1=lm(price~.,data=trainset1)
#apply model into testset
testset1$predicted_price1= predict(model1,testset1)

#to validate model accuracy 
#using MAPE
install.packages("MLmetrics")
library("MLmetrics")
MAPE(testset1$predicted_price1,testset1$price)
#0.09980543== 10%error


#model2
model2=lm(price~.,data = trainset2)
testset2$predicted_price2=predict(model2,testset2)
MAPE(testset2$predicted_price2,testset2$price)
#0.1160135==11%error

#Check adjusted R sq value
summary(model1) #0.7456 
summary(model2) #0.7043 
#higher value better model
#ram value model gives better prediction
