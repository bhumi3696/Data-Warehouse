install.packages('tidytext', dependencies = TRUE)
install.packages('RMySQL', dependencies = TRUE)
install.packages('DBI',dependencies = TRUE)
install.packages('textcat')
install.packages('cld2')
install.packages('cld3')
install.packages('tidyverse')
library(tidytext) 
library(dplyr)
library(reshape2)
library(ggplot2)
library(tidyr)
library(RMySQL)
library(textcat)
library(cld2)
library(cld3)
library(tidyverse)


con <- dbConnect(MySQL(), user="twitter",password="Prabha3696", dbname="diseasetweets", host="ec2-34-255-181-172.eu-west-1.compute.amazonaws.com", port=3306)
#on.exit(dbDisconnect(con))
rs <- dbSendQuery(con, "select tweet_text, created_at from tweets;")
data <- fetch(rs,n =500000)
summary(data)
data <- data %>% mutate(textcat = textcat(x = tweet_text),
           cld2 = cld2::detect_language(text = tweet_text, plain_text = FALSE),
           cld3 = cld3::detect_language(text = tweet_text)) %>% select(tweet_text, textcat, cld2, cld3, created_at) %>% filter(cld2 == "en" & cld3 == "en")

summary(data)
data$textcat <- textcat(x = tweet_text)
data$cld2 <- cld2::detect_language(text = tweet_text, plain_text = FALSE) data$cld3 <- cld3::detect_language(text = tweet_text)
data <- data[data$cld2 == "en" & data$cld3 == "en", ]