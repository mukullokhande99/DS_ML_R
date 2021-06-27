#load data
text=readLines("textdata.txt")
text
install.packages("tm")
install.packages("wordcloud2")
library("tm")
library("wordcloud2")

#cleaning data
text=Corpus(VectorSource(text))
#covert text to lowercase
text= tm_map(text,content_transformer(tolower))
#remove numbers
text=tm_map(text,removeNumbers)
#remove stopwords
text=tm_map(text,removeWords,stopwords("English"))
#remove unwanted words
text=tm_map(text, removeWords, c("aaa","bbb"))
#remover punctuations
text=tm_map(text, removePunctuation)
#remove extra white space
text= tm_map(text, stripWhitespace)
#stemming
text=tm_map(text,stemDocument)
#create term document matrix
text_matrix= TermDocumentMatrix(text)
df= as.matrix(text_matrix)
df= sort(rowSums(df),decreasing = TRUE)
#names(words)/names(df)
df
df=data.frame(word=names(df),freq=df)
wordcloud2(data=df,color='random-dark',shape='circle')
#wordcloud2(data=df,color='random-dark',shape='cardioid')
#heart shape 
#shape="star"#2
