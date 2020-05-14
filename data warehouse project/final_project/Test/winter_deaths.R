#install.packages("rio")
#install.packages("xlsx")
#install.packages("tidyr")
#install.packages("readxl")
library("rio")
library("tidyr")
library("xlsx")
library("dplyr")
library("readxl")
setwd("D:/data warehouse project/final_project/Test")
#file1<-read_xls("statista_age_population.xlsx", Sheet=2)
winter_deaths <- read_excel("winter_deaths.xlsx", 2)
colnames(winter_deaths) <- c("W_Age_Group","Females","Males")
b <- winter_deaths[-c(1:2),]
cleaned_data <- b%>%gather("Females", "Males" , key = "W_Gender", value = "W_Percentage")
a1 <- cleaned_data %>% spread(W_Age_Group, 'W_Percentage')
col_name<- a1 %>% gather("W_Age_Group","W_Percentage",-W_Gender)
col_name$W_id = ""
for(i in 1:14){
  col_name$W_id[i] <- i 
}
winter_deaths <- col_name[,c(4,1,2,3)]
write.csv(winter_deaths,file = "CSV/statista_winter_deaths.csv", row.names = FALSE)
