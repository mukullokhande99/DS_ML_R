#univariate analysis
#load data
com_data= read.csv("Computer_Data.csv")
View(com_data)

#extract numeric columns
cont_data=com_data[c(2,3,4,5,6,10,11)]
summary(cont_data)

#for categoricl columns
cat_data=com_data[c(7,8,9)]

#to get freq of categories within a category
table(cat_data$premium)
apply(cat_data,2, function(x) table(x))

#to get ratio
prop.table(table(cat_data$premium))
apply(cat_data,2, function(x) prop.table(table(x)) )

#get percentage
prop.table(table(cat_data$premium))*100
apply(cat_data,2, function(x) prop.table(table(x))*100 )          


#apply function
#apply(dataset_name, row/col-1/2, mean/median)
apply(cont_data,2,mean)
apply(cont_data,2,median)
apply(cont_data,2,sum)

data= data.frame(A=c(5,10,20),B=c(45,90,60),C=c(120,150,200))
#input
data1= data.frame(A=c(1,2,4),B=c(9,18,12),C=c(24,30,40))
#output expected
data2=apply(data,2,function(x) x/5)
#data.frame(A=c(x,x,x),B=c(x,x,x),C=c(x,x,x)) x->x/5
#lambda x:x/5 (python)







