install.packages("rio")
install.packages("xlsx")
install.packages("tidyr")
install.packages("readxl")
library("rio")
library("tidyr")
library("xlsx")
library("dplyr")
library("readxl")
setwd("D:/data warehouse project/final_project/Test")
#file1<-read_xls("statista_age_population.xlsx", Sheet=2)
overweight <- read_excel("overweight.xlsx", 2)
colnames(overweight) <- c("Overweight_Year","Males","Females")
b <- overweight[-c(1:12),-c(4)]
cleaned_data <- b%>%gather("Males", "Females" , key = "Overweight_Gender", value = "Overweight_Percentage")
a1 <- cleaned_data %>% spread(Overweight_Year, 'Overweight_Percentage')
col_name<- a1 %>% gather("Overweight_Year","Overweight_Percentage",-Overweight_Gender)
col_name$Overweight_id = ""
for(i in 1:14){
  col_name$Overweight_id[i] <- i 
}
overweight <- col_name[,c(4,1,2,3)]
write.csv(overweight,file = "CSV/statista_overweight.csv", row.names = FALSE)
