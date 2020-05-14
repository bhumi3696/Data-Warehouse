Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_151') 
library("rJava")
library("jsonlite")
library("rvest")
library("syuzhet")
setwd("C:/Users/MOLAP/Documents/datasets/guardian.co.uk/")
content <- fromJSON("https://content.guardianapis.com/search?q=fitness&from-date=2010-03-01&to-date=2016-08-01&section=food&api-key=4927ed6d-b166-4889-8403-a34c2331b36b&page-size=200&show-fields=body", flatten=TRUE)
fitness = as.data.frame(content)

for (i in 2:10) {
  url = paste("https://content.guardianapis.com/search?q=fitness&from-date=2010-03-01&to-date=2016-08-01&section=food&api-key=4927ed6d-b166-4889-8403-a34c2331b36b&page-size=200&show-fields=body&pages=",i,sep="")
  content <- fromJSON(url, flatten=TRUE)
  tmp = as.data.frame(content)
  fitness = rbind(fitness,tmp)
}

cleanFun <- function(htmlString) {
  return(gsub("<.*?>", "", htmlString))
}

fitness$bodyCleaned = trimws(cleanFun(fitness$response.results.fields.body))

fitness_data = as.data.frame(fitness$response.results.webPublicationDate)
fitness_data$response.results.sectionName = fitness$response.results.sectionName

sentiment <- get_nrc_sentiment((fitness$bodyCleaned))
meta_data$anger = sentiment$anger
meta_data$anticipation = sentiment$anticipation
meta_data$disgust = sentiment$disgust
meta_data$fear = sentiment$fear
meta_data$joy = sentiment$joy
meta_data$sadness = sentiment$sadness
meta_data$surprise = sentiment$surprise
meta_data$trust = sentiment$trust
meta_data$negative = sentiment$negative
meta_data$positive = sentiment$positive

write.csv(meta_data,"sentiment-analysis.csv",row.names = FALSE)