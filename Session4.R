#one hot encoding for nominal variables
View(HairEyeColor)
install.packages("fastDummies")
library("fastDummies")
HairEyeColor=as.data.frame(HairEyeColor) 
#convert data to dataframe
dummydata= dummy_cols(HairEyeColor,select_columns=c("Hair","Eye","Sex") ) 
#Datasetname, select column no
View(dummydata)
names(HairEyeColor)
str(HairEyeColor)

#Univariate analysis
#Continous var
summary(HairEyeColor$Freq) #Describe function in Python
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#2.00    7.00   10.00   18.50   29.25   66.00 
 
#Categorical var
table(HairEyeColor$Sex) #Frequency of categories
#Male Female 
#16     16 
prop.table(table(HairEyeColor$Sex)) #Ratio
#Male Female 
#0.5    0.5 
prop.table(table(HairEyeColor$Sex))*100 #Percentage= ratio*100
#Male Female 
#50     50 
