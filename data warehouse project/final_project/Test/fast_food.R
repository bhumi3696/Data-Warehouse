Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_151') 
library("rJava")
library("jsonlite")
library("xml2")
library("rvest")
library("syuzhet")
library(dplyr)
content <- fromJSON("https://content.guardianapis.com/search?q=junk%20food%20AND%20inactive&from-date=2010-03-01&to-date=2016-08-01&section=food&api-key=4927ed6d-b166-4889-8403-a34c2331b36b&page-size=200&show-fields=body", flatten=TRUE)
UnhealthyFood = as.data.frame(content)

for (i in 2:10) {
  url = paste("https://content.guardianapis.com/search?q=junk%20food%20AND%20inactive&from-date=2010-03-01&to-date=2016-08-01&section=food&api-key=4927ed6d-b166-4889-8403-a34c2331b36b&page-size=200&show-fields=body&pages=",i,sep="")
  content <- fromJSON(url, flatten=TRUE)
  tmp = as.data.frame(content)
  UnhealthyFood = rbind(UnhealthyFood,tmp)
}

cleanFun <- function(htmlString) {
  return(gsub("<.*?>", "", htmlString))
}

UnhealthyFood$bodyCleaned = trimws(cleanFun(UnhealthyFood$response.results.fields.body))

meta_data = as.data.frame(UnhealthyFood$response.results.webPublicationDate)
meta_data$response.results.sectionName = UnhealthyFood$response.results.sectionName
sentiment <- get_nrc_sentiment((UnhealthyFood$bodyCleaned))
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
meta_data$`UnhealthyFood$response.results.webPublicationDate`<- gsub("2010.*","2010",meta_data$`UnhealthyFood$response.results.webPublicationDate`)
meta_data$`UnhealthyFood$response.results.webPublicationDate` <- gsub("2011.*","2011",meta_data$`UnhealthyFood$response.results.webPublicationDate`)
meta_data$`UnhealthyFood$response.results.webPublicationDate`<- gsub("2012.*","2012",meta_data$`UnhealthyFood$response.results.webPublicationDate`)
meta_data$`UnhealthyFood$response.results.webPublicationDate`<- gsub("2013.*","2013",meta_data$`UnhealthyFood$response.results.webPublicationDate`)
meta_data$`UnhealthyFood$response.results.webPublicationDate`<- gsub("2014.*","2014",meta_data$`UnhealthyFood$response.results.webPublicationDate`)
meta_data$`UnhealthyFood$response.results.webPublicationDate`<- gsub("2015.*","2015",meta_data$`UnhealthyFood$response.results.webPublicationDate`)
meta_data$`UnhealthyFood$response.results.webPublicationDate`<- gsub("2016.*","2016",meta_data$`UnhealthyFood$response.results.webPublicationDate`)
meta_data$Fast_Food_id = ""
for(i in 1:620){
  meta_data$Fast_Food_id[i] <- i 
}

meta_data$Factor <- "Unhealthy diet and eating habits"
colnames(meta_data) <- c("Year","Section","anger","anticipation","disgust","fear","joy","sadness","surprise","trust","negative","positive","Fast_Food_id","Factor")

result2016 <- meta_data[meta_data$Year == 2016, ]
a2016 <- result2016 %>% group_by("2016") %>% summarise(anger = mean(anger,na.rm = T),anticipation = mean(anticipation,na.rm = T),disgust = mean(disgust,na.rm = T),fear = mean(fear,na.rm = T),joy = mean(joy,na.rm = T),sadness = mean(sadness,na.rm = T),surprise = mean(surprise,na.rm = T),trust = mean(trust,na.rm = T),negative = mean(negative,na.rm = T),positive = mean(positive,na.rm = T))
b2016 <- round(a2016[2:11],digits=0)
b2016$Year <- "2016"
b2016$Section <- "Food"
b2016$Factor <- "Unhealthy diet and eating habits"
#------------------------------------------------------------------------------
result2015 <- meta_data[meta_data$Year == 2015, ]
a2015 <- result2015 %>% group_by("2015") %>% summarise(anger = mean(anger,na.rm = T),anticipation = mean(anticipation,na.rm = T),disgust = mean(disgust,na.rm = T),fear = mean(fear,na.rm = T),joy = mean(joy,na.rm = T),sadness = mean(sadness,na.rm = T),surprise = mean(surprise,na.rm = T),trust = mean(trust,na.rm = T),negative = mean(negative,na.rm = T),positive = mean(positive,na.rm = T))
b2015 <- round(a2015[2:11],digits=0)
b2015$Year <- "2015"
b2015$Section <- "Food"
b2015$Factor <- "Unhealthy diet and eating habits"
#------------------------------------------------------------------------------
result2014 <- meta_data[meta_data$Year == 2014, ]
a2014 <- result2014 %>% group_by("2014") %>% summarise(anger = mean(anger,na.rm = T),anticipation = mean(anticipation,na.rm = T),disgust = mean(disgust,na.rm = T),fear = mean(fear,na.rm = T),joy = mean(joy,na.rm = T),sadness = mean(sadness,na.rm = T),surprise = mean(surprise,na.rm = T),trust = mean(trust,na.rm = T),negative = mean(negative,na.rm = T),positive = mean(positive,na.rm = T))
b2014 <- round(a2014[2:11],digits=0)
b2014$Year <- "2014"
b2014$Section <- "Food"
b2014$Factor <- "Unhealthy diet and eating habits"
#---------------------------------------------------------------------------------

result2013 <- meta_data[meta_data$Year == 2013, ]
a2013 <- result2013 %>% group_by("2013") %>% summarise(anger = mean(anger,na.rm = T),anticipation = mean(anticipation,na.rm = T),disgust = mean(disgust,na.rm = T),fear = mean(fear,na.rm = T),joy = mean(joy,na.rm = T),sadness = mean(sadness,na.rm = T),surprise = mean(surprise,na.rm = T),trust = mean(trust,na.rm = T),negative = mean(negative,na.rm = T),positive = mean(positive,na.rm = T))
b2013 <- round(a2013[2:11],digits=0)
b2013$Year <- "2013"
b2013$Section <- "Food"
b2013$Factor <- "Unhealthy diet and eating habits"
#------------------------------------------------------------------------------
result2012 <- meta_data[meta_data$Year == 2012, ]
a2012 <- result2012 %>% group_by("2015") %>% summarise(anger = mean(anger,na.rm = T),anticipation = mean(anticipation,na.rm = T),disgust = mean(disgust,na.rm = T),fear = mean(fear,na.rm = T),joy = mean(joy,na.rm = T),sadness = mean(sadness,na.rm = T),surprise = mean(surprise,na.rm = T),trust = mean(trust,na.rm = T),negative = mean(negative,na.rm = T),positive = mean(positive,na.rm = T))
b2012 <- round(a2012[2:11],digits=0)
b2012$Year <- "2012"
b2012$Section <- "Food"
b2012$Factor <- "Unhealthy diet and eating habits"
#------------------------------------------------------------------------------
result2011 <- meta_data[meta_data$Year == 2011, ]
a2011 <- result2011 %>% group_by("2011") %>% summarise(anger = mean(anger,na.rm = T),anticipation = mean(anticipation,na.rm = T),disgust = mean(disgust,na.rm = T),fear = mean(fear,na.rm = T),joy = mean(joy,na.rm = T),sadness = mean(sadness,na.rm = T),surprise = mean(surprise,na.rm = T),trust = mean(trust,na.rm = T),negative = mean(negative,na.rm = T),positive = mean(positive,na.rm = T))
b2011 <- round(a2011[2:11],digits=0)
b2011$Year <- "2011"
b2011$Section <- "Food"
b2011$Factor <- "Unhealthy diet and eating habits"
#------------------------------------------------------------------------------
result2010 <- meta_data[meta_data$Year == 2010, ]
a2010 <- result2015 %>% group_by("2010") %>% summarise(anger = mean(anger,na.rm = T),anticipation = mean(anticipation,na.rm = T),disgust = mean(disgust,na.rm = T),fear = mean(fear,na.rm = T),joy = mean(joy,na.rm = T),sadness = mean(sadness,na.rm = T),surprise = mean(surprise,na.rm = T),trust = mean(trust,na.rm = T),negative = mean(negative,na.rm = T),positive = mean(positive,na.rm = T))
b2010 <- round(a2015[2:11],digits=0)
b2010$Year <- "2010"
b2010$Section <- "Food"
b2010$Factor <- "Unhealthy diet and eating habits"
ab <- rbind(b2010,b2011,b2012,b2013,b2014,b2015,b2016)
ab$Fast_Food_id = ""
for(i in 1:7){
  ab$Fast_Food_id[i] <- i 
}
data <- ab[,c(14,11,1,2,3,4,5,6,7,8,9,10,12,13)]
setwd("D:/data warehouse project/final_project/Test/CSV")
write.csv(data,"sentiment-analysis.csv",row.names = FALSE)
