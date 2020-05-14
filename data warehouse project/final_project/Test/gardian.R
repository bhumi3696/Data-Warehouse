# Configure JAVA
Sys.setenv(JAVA_HOME='C:\\Program Files (x86)\\Java\\jre1.8.0_191\\') 
install.packages("rJava")
install.packages("jsonlite")
install.packages("rvest")
install.packages("syuzhet")
library("rJava")
library("jsonlite")
library("rvest")
library("syuzhet")
content <- fromJSON("https://content.guardianapis.com/search?q=heart%20failure&from-date=2016-09-17&api-key=4927ed6d-b166-4889-8403-a34c2331b36b&page-size=50&order-by=newest&show-fields=body", flatten=TRUE)
s = as.data.frame(content)
cleanFun <- function(htmlString) {
  return(gsub("<.*?>", "", htmlString))
}
s$bodyCleaned = trimws(cleanFun(s$response.results.fields.body))
mysentiment_review <- get_nrc_sentiment((s$bodyCleaned))
mysentiment_review

