w <- read.csv("D:/data warehouse project/Hospitals/new.csv")
s <- w
s <- s[-c(1:3),]
person <- s[c(2:26),]
person <- person[,-c(8)]
library(tidyr)
england <- person[,c(2:7)]
england <-  england[,c(1,2,6)]
england <- england[-c(1),]
#male
male <- s[c(27:50),7]
england <- cbind(england,male)
#female
female <- s[c(51:74),7]
england <- cbind(england,female)
#save
colnames(england) <- c("Cause","Year","total_death","male_death","female_death")
setwd("D:\\data warehouse project\\Hospitals")
write.csv(england, file = "Rating/avoid_death_england.csv",row.names=FALSE) 
