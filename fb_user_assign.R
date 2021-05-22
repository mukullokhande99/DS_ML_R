getwd()
#load data
fb= read.table("facebook_user.tsv",header=TRUE)
library("dplyr")
#1.Which day has the highest number of birthdays ?
fb$birthdate=as.Date(with(fb,paste(dob_day,dob_month,dob_year,sep="-")),"%d-%m-%Y")
data=fb%>% group_by(birthdate) %>% summarise(count_dob=n()) %>% filter(count_dob1==max(count_dob))

#birthdate-1988-01-01
#count_dob-656

#2. Who tends to have more friends by average / by median ? Males or Females ?
fb %>% group_by(gender) %>% summarise(mean_friend_count= mean(friend_count), med_frnd_count= median(friend_count))
#female              242.             96
#male                165.             74
#NA                  184.             81
#answer-female

#3. Which set of users have been on facebook for a long time ?
fb %>% arrange(desc(tenure)) %>% head(10) %>% select(userid,tenure)
#userid tenure
#1  1419799   3139
#2  1601778   3139
#3  2135122   3139
#4  2137369   3129
#5  2111567   3128
#6  1934957   3101
#7  2032933   3019
#8  2171167   2958
#9  1701874   2926
#10 1574331   2888

#4. Who is most active on facebook ? Who is most active on mobile facebook ? on web facebook ?

#mean of friendships_innitiated , mobile liked by user, www liked by user


#5. Who is using facebook more on mobile than desktop ?
df=fb %>% filter(mobile_likes>www_likes) %>% select(userid,mobile_likes,www_likes)
View(df)
