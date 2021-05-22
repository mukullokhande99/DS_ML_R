#pipe operator
#load data
customers= read.csv("Customer_Data.csv")

#Data where customer ID of bang customers with age >30
customers %>% filter(Location=="Bangalore" & Age>30) %>% select(CusID)
  #filter by criteria #select columns to show
#clearity about data view and execution process
