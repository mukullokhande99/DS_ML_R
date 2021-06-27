#load the data
text=readLines("textdata.txt")
text
install.packages("tm")
install.packages("wordcloud2")
library("tm")
library("wordcloud2")
#cleaning steps
text=Corpus(VectorSource(text))
#conver text to lower case
text=tm_map(text,content_transformer(tolower))
#remove numbers
text=tm_map(text,removeNumbers)
#remove stop words
text=tm_map(text,removeWords,stopwords("english"))
#remove words
text=tm_map(text,removeWords,c("aaaa","bbbb"))
#remove punctuations
text=tm_map(text,removePunctuation)
#remove extra whitespace
text=tm_map(text,stripWhitespace)
#stemming
text=tm_map(text,stemDocument)
#create term document matrix
text_matrix=TermDocumentMatrix(text)
df=as.matrix(text_matrix)
df=sort(rowSums(df),decreasing = TRUE)
names(df)
df=data.frame(word=names(df),freq=df)
wordcloud2(data=df,color='random-light',shape = 'star')