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
obesity <- read_excel("obesity.xlsx", 2)
colnames(obesity) <- c("Obesity_Year","Males","Females")
b <- obesity[-c(1:9),-c(4)]
cleaned_data <- b%>%gather("Males", "Females" , key = "Obesity_Gender", value = "Obesity_Percentage")
a1 <- cleaned_data %>% spread(Obesity_Year, 'Obesity_Percentage')
col_name<- a1 %>% gather("Obesity_Year","Obesity_Percentage",-Obesity_Gender)
col_name$Obesity_id = ""
for(i in 1:14){
  col_name$Obesity_id[i] <- i 
}
obesity <- col_name[,c(4,1,2,3)]
write.csv(obesity,file = "CSV/statista_obesity.csv", row.names = FALSE)
