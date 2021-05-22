#to check data Structure
str(iris)
View(iris)

#create vector
a= c(5,9,20)
b= c("rahul","Sachin", "Virat")

#create a list
mylist= list(23, "Bang" )

#create matrix
mymatrix= matrix(c(2,5,6,7,3,9,12,34,56,78,33,8),3,4)
mymatrix[2,3] #value at 2nd row 3rd column
mymatrix[2,3]=100 #update the value
mymatrix[2,] #all values from 2nd row
mymatrix[,3] #all values from 3rd col

#create dataframe
df1= data.frame(ID=c(1,2,3),
                Name=c("Virat", "Rahul", "Sachin"),
                Age= c(33,48,47))

df2= data.frame(CID=c(1,2,4,5),
                Location=c("Bang","Mumbai","Chennai","Hyd"))

#Joins
library("dplyr")

#left join
leftdata= left_join(df1,df2, by=c("ID"="CID"))

#right join
rightdata= right_join(df1,df2, by=c("ID"="CID"))

#inner join 
innerdata= inner_join(df1,df2, by=c("ID"="CID"))

#full join 
fulljoindata= full_join(df1,df2, by=c("ID"="CID"))

#detect NA count
sum(is.na(leftdata))
sum(is.na(rightdata))





