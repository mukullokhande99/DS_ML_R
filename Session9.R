#logistic regression
#load data
titanic=read.csv("titanic-2.csv", na.strings = "")
View(titanic)

#remove unrequired columns
titanic=titanic[-c(1,4,9,10)]

#to check %missing values in each column
apply(titanic, 2, function(x) sum(is.na(x))/length(x)*100)

#remove cabin column  77.1043771 as more than 50% data is missing
titanic=titanic[-7]

#replace mean age in age column
titanic$Age[is.na(titanic$Age)]=mean(titanic$Age,na.rm=TRUE)
table(titanic$Embarked)
#  C   Q   S 
#168  77 644 
#s is repeated more so replacing with mode S
titanic$Embarked[is.na(titanic$Embarked)]="S"

#divide data into training and testset
library("caTools")
sample=sample.split(titanic$Survived,SplitRatio = 0.80)
trainset=subset(titanic,sample==TRUE)
testset=subset(titanic,sample==FALSE)

#develope logistic reg model
model=glm(Survived~.,data=trainset,family=binomial())
#apply model into testset
testset$predicted_prob=predict(model,testset,type="response")
#type=response to avoid prob>1and <0
testset$predicted_survival=ifelse(testset$predicted_prob>0.5,1,0)
library("MLmetrics")
ConfusionMatrix(testset$predicted_survival,testset$Survived)
Recall(testset$Survived,testset$predicted_survival)
#0.7777778
Precision(testset$Survived,testset$predicted_survival)
#0.9545455
F1_Score(testset$Survived,testset$predicted_survival)
#0.8571429
#Good model
