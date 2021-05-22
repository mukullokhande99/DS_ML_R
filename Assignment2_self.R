#EDA steps to get better insights from the data
tel_data=read.csv("Tel_data.csv")
View(tel_data)

#Redundant Data-
#voice mail plan column is redundant. number vmail messages- is enough
#total eve calls(Not required)- total eve charge is redundant-total eve minutes is enough 
#total night calls(Not required)- total night charge is redundant-total night  minutes is enough 
#total intl calls(Not required)-total intl charge is redundant-total intl  minutes is enough 

#Univariate Analysis

#dependent var (cont)-total day minutes,total eve minutes
#independent target var(cat)-churn

#Categorical var-Churn
#frequencies of categories
table(tel_data$churn)
#FALSE  TRUE 
#2850   483

#Ratio
prop.table(table(tel_data$churn))
#FALSE      TRUE 
#0.8550855 0.1449145 

#Percentage= ratio*100
prop.table(table(tel_data$churn))*100
#FALSE     TRUE 
#85.50855 14.49145 


#continous var-total day minutes,total eve minutes

summary(tel_data$total.day.minutes)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#0.0   143.6   179.4   179.8   216.4   350.8       4
#NA- represent missing data
    
summary(tel_data$total.eve.minutes)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#0.0   166.6   201.4   201.0   235.3   363.7 

#for bivariate analysis, hypothesis testing
#Churn is dependent on total eve minutes
#total eve minutes [Continous var (dependent)]--churn [Categorical var(independent)]
#sample size>30 --> Anova

anova_test=aov(total.eve.minutes~churn,data=tel_data)
summary(anova_test)
#Df  Sum Sq Mean Sq F value   Pr(>F)    
#churn          1   73793   73793   28.93 8.01e-08 ***
#  Residuals   3331 8495758    2551                     ---
#  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

#p=8.01e-08 <0.05
#alternative hypothesis will be true i.e Churn is not dependent on total eve minutes
