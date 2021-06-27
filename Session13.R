#load data
kmeans_data= read.csv("Kmeans data-2.csv")
View(kmeans_data)

data1= kmeans_data[c(3,4)]
View(data1)
data2= kmeans_data[c(4,5)]
View(data2)

#to find optimum no of clusters
help(kmeans)
wcss= vector()
for(i in 1:10)
  wcss[i]=sum(kmeans(data2,i)$withinss)
str(data1)
#plot elbow curve
plot(1:10,wcss,type="b",xlab='no of clusters',ylab="wcss")
km=kmeans(data2,4)
km$cluster
#visualization
library("cluster")
clusplot(data, km$cluster, lines=0, shade=TRUE,color=TRUE, labels=2,xlab="income",ylab = "spending score")


