#to get list of inbuilt datasets
data()
#to view any existing data
View(iris)   #iris example

library("dplyr")
#extract columns starts with S from iris
data1= select(iris,starts_with("S"))
View(data1)

#extract columns ends with h from iris
data2= select(iris,ends_with("h"))
View(data2)

#extract columns contains h from iris
data3= select(iris,contains("h"))
View(data3)

#extract rows 
data4= filter(iris, Sepal.Length>4)
View(data4)

#pipe operator
data5= iris %>% filter(Sepal.Length>7)
View(data5)
data6= iris %>% filter(Sepal.Length>7) %>% select(Petal.Length, Species)
View(data6)

#aggregate functions
sum(iris$Sepal.Length)
mean(iris$Petal.Width)
iris%>% summarise(m1= sum(Sepal.Length, m2= mean(Petal.Width)))
iris %>% group_by(Species) %>% summarise(n1= sum(Sepal.Length)
                                         