#install.packages("rvest")
install.packages("xml2")
install.packages("magrittr")
library(rvest)
library(xml2)
library(magrittr)
URL <- 'https://en.wikipedia.org/wiki/Demography_of_England'
URL <- read_html(URL)
Population_table <- URL %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/div/table[5]') %>%
  html_table(fill = TRUE) 

Population_table <- Population_table[[1]]
Population_table
Population_table <- data.frame(Population_table)
Population_table1 <- Population_table[-c(1:70, 78),-c(3,5,6,7,8,9)]
colnames(Population_table1) <- c("England_Year","England_Population","England_Death")
Population_table1$England_id = ""
for(i in 1:7){
  Population_table1$England_id[i] <- i 
}
Population_table1 <- Population_table1[,c(4,1,2,3)]
setwd("D:\\data warehouse project\\final_project\\Test");
write.csv(Population_table1, file = "CSV/England_Population.csv",row.names=FALSE)
