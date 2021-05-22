
#load data
com_data=read.csv("Computer_Data.csv")
View(com_data)

#cat-cat
chisq.test(com_data$cd,com_data$premium)
#p-value<2.2e-16
#2.2/1,000,000,0000,000,000
#0.00000000000000022

#cont_d-cat_iv
#t.test(price~multi,data=com_data)
anova_test=aov(price~multi,data=com_data)
summary(anova_test)


#cat_d - cont_i- no method
sales_data=data.frame(channel=c("SMS","Newspaper","Youtube"),Sales=c(1000,1200,1500))
#SMS-0.15
#YT-0.003
#Newsp-0.00002