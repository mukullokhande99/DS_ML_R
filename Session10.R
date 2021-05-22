#load data
kmeans_data=read.csv("Kmeans data-2.csv", header=TRUE)
View(kmeans_data)
#get spending score and income
data=kmeans_data[c(4,5)]
#to decide optimum no of clusters:elbow plot
help("kmeans")
wcss=vector()
wcss
for(i in 1:10)
wcss[i]=sum(kmeans(data,i)$withinss)
help(plot)
#yaxis, type p-point,b-
plot(1:10,wcss,type="b", xlab = "No of Clusters", ylab="WCSS")
#clustering
km=kmeans(data,4)

#visualize cluster
install.packages("cluster")
library("cluster")
clusplot(data, km$cluster,lines = 0, shade = TRUE, color = TRUE,labels= 2)

km$cluster
data_with_cluster=cbind(kmeans_data,cluster_no=km$cluster)

#customer ids in 4th cluster
library("dplyr")
targeted_customers= data_with_cluster %>% filter(cluster_no==4) %>% select(CustomerID)

