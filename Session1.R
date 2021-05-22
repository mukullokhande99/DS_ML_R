#indicates comment line
#check curr working dir
getwd()
#to change working dir
setwd("C:/Users/Mukul/Downloads")
getwd()

#to load csv file
mydata=read.csv("Computer_data.csv")

#to get column names
names(mydata)

#to get no of rows
nrow(mydata)

#get 2nd & 9th column from mydata
data1= mydata[c(2,9)] #combine column 2 and 9 by column no
View(data1) # Uppercase V #View data

#extract price and premium column from mydata 
data2= select(mydata,price,premium) #by column name
View(data2)

#drop ram and cd column w/o changing original data
data3 = select(mydata,-ram,-cd)
View(data3)

#get 347th and 352nd row 
data4= mydata[c(347,352),] 
View(data4)

#use of $
#use1 to extract col value from data
data4$ram
#use2 to add new column in data
data4$mukul=data4$hd/data4$ram
#*/-+ operations
View(data4)

#get rows where price>4000
#subset inbuilt fun
#filter from dplyr
data5=subset(mydata, price>4000)
View(data5)
data6= filter(mydata,price>4000)
View(data6)

#and & or|
data7= filter(mydata,price>4000 & cd=="yes" | ads>200)
View(data7)

#to get no of columns
ncol(mydata)

#to install package in R
install.packages("dplyr")
#dplyr for data manipulation
library("dplyr")

