#install.packages("rvest")
#install.packages("dplyr")
#install.packages("XML")
library("XML")
library("dplyr")
library("rvest")

#Royal_Berkshire_Foundation_Trust
Royal_Berkshire_NHS <- read_html("https://www.cqc.org.uk/provider/RHW/survey/3")
Patient_survey <- Royal_Berkshire_NHS %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- Royal_Berkshire_NHS %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
Royal_Berkshire <- df[-c(4),]
Royal_Berkshire_Foun_Trust <- data.frame(Royal_Berkshire)
Royal_Berkshire_Foun_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(Royal_Berkshire_Foun_Trust, file = "Rating/Royal_Berkshire_Foundation_Trust.csv",row.names=FALSE) 


#Guy's and St Thomas' NHS Foundation Trust
Guys_and_St_Thomas_NHS <- read_html("https://www.cqc.org.uk/provider/RJ1/survey/3")
Patient_survey <- Guys_and_St_Thomas_NHS %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- Guys_and_St_Thomas_NHS %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
Guys_and_St_Thomas <- df[-c(4),]
Guys_and_St_Thomas_NHS_Trust <- data.frame(Guys_and_St_Thomas)
Guys_and_St_Thomas_NHS_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(Guys_and_St_Thomas_NHS_Trust, file = "Rating/Guys_and_St_Thomas_NHS_Trust.csv",row.names=FALSE) 


#University Hospital Southampton NHS Foundation Trust 
University_Hospital <- read_html("https://www.cqc.org.uk/provider/RHM/survey/3")
Patient_survey <- University_Hospital %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- University_Hospital %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
University_Hospital <- df[-c(4),]
University_Hospital_NHS_Trust <- data.frame(University_Hospital)
University_Hospital_NHS_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(University_Hospital_NHS_Trust, file = "Rating/University_Hospital_NHS_Trust.csv",row.names=FALSE) 


#Royal United Hospitals Bath NHS Foundation Trust Good
Royal_United <- read_html("https://www.cqc.org.uk/provider/RD1/survey/3")
Patient_survey <- Royal_United %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- Royal_United %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
Royal_United <- df[-c(4),]
Royal_United_Hospital_NHS_Trust <- data.frame(Royal_United)
Royal_United_Hospital_NHS_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(Royal_United_Hospital_NHS_Trust, file = "Rating/Royal_United_Hospital_NHS_Trust.csv",row.names=FALSE) 

#Cambridge University Hospitals NHS Foundation Trust
Cambridge_University <- read_html("https://www.cqc.org.uk/provider/RGT/survey/3")
Patient_survey <- Cambridge_University %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- Cambridge_University %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
Cambridge_University <- df[-c(4),]
Cambridge_University_Hospital_NHS_Trust <- data.frame(Cambridge_University)
Cambridge_University_Hospital_NHS_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(Cambridge_University_Hospital_NHS_Trust, file = "Rating/Cambridge_University_Hospital_NHS_Trust.csv",row.names=FALSE) 
  


#The Royal Marsden NHS Foundation Trust
Royal_Marsden <- read_html("https://www.cqc.org.uk/provider/RPY/survey/3")
Patient_survey <- Royal_Marsden %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- Royal_Marsden %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
Royal_Marsden <- df[-c(4),]
Royal_Marsden_Hospital_NHS_Trust <- data.frame(Royal_Marsden)
Royal_Marsden_Hospital_NHS_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(Royal_Marsden_Hospital_NHS_Trust, file = "Rating/Royal_Marsden_Hospital_NHS_Trust.csv",row.names=FALSE) 

#North Bristol NHS Trust
North_Bristol <- read_html("https://www.cqc.org.uk/provider/RVJ/survey/3")
Patient_survey <- North_Bristol %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- North_Bristol %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
North_Bristol <- df[-c(4),]
North_Bristol_Hospital_NHS_Trust <- data.frame(North_Bristol)
North_Bristol_Hospital_NHS_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(North_Bristol_Hospital_NHS_Trust, file = "Rating/North_Bristol_Hospital_NHS_Trust.csv",row.names=FALSE) 


#University Hospitals of Leicester NHS Trust
University_Leicester <- read_html("https://www.cqc.org.uk/provider/RWE/survey/3")
Patient_survey <- University_Leicester %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- University_Leicester %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
University_Leicester <- df[-c(4),]
University_Leicester_Hospital_NHS_Trust <- data.frame(University_Leicester)
University_Leicester_Hospital_NHS_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(University_Leicester_Hospital_NHS_Trust, file = "Rating/University_Leicester_Hospital_NHS_Trust.csv",row.names=FALSE) 


#Sheffield Teaching Hospitals NHS Foundation Trust 
Sheffield_Teaching <- read_html("https://www.cqc.org.uk/provider/RHQ/survey/3")
Patient_survey <- Sheffield_Teaching %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- Sheffield_Teaching %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
Sheffield_Teaching <- df[-c(4),]
Sheffield_Teaching_Hospital_NHS_Trust <- data.frame(Sheffield_Teaching)
Sheffield_Teaching_Hospital_NHS_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(Sheffield_Teaching_Hospital_NHS_Trust, file = "Rating/Sheffield_Teaching_Hospital_NHS_Trust.csv",row.names=FALSE) 


#Barts Health NHS Trust
Barts_Health <- read_html("https://www.cqc.org.uk/provider/R1H/survey/3")
Patient_survey <- Barts_Health %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- Barts_Health %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
Barts_Health <- df[-c(4),]
Barts_Health_Hospital_NHS_Trust <- data.frame(Barts_Health)
Barts_Health_Hospital_NHS_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(Barts_Health_Hospital_NHS_Trust, file = "Rating/Barts_Health_Hospital_NHS_Trust.csv",row.names=FALSE) 

#The Newcastle upon Tyne Hospitals NHS Foundation Trust
Newcastle_Hospitals <- read_html("https://www.cqc.org.uk/provider/RTD/survey/3")
Patient_survey <- Newcastle_Hospitals %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- Newcastle_Hospitals %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
Newcastle_Hospitals <- df[-c(4),]
Newcastle_Hospital_NHS_Trust <- data.frame(Newcastle_Hospitals)
Newcastle_Hospital_NHS_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(Newcastle_Hospital_NHS_Trust, file = "Rating/Newcastle_Hospital_NHS_Trust.csv",row.names=FALSE) 

#University Hospitals of North Midlands NHS Trust
University_Hospitals <- read_html("https://www.cqc.org.uk/provider/RJE/survey/3")
Patient_survey <- University_Hospitals %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- University_Hospitals %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
University_Hospitals <- df[-c(4),]
University_Hospital_North_Midlands_NHS_Trust <- data.frame(University_Hospitals)
University_Hospital_North_Midlands_NHS_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(University_Hospital_North_Midlands_NHS_Trust, file = "Rating/University_Hospital_North_Midlands_NHS_Trust.csv",row.names=FALSE) 

#Nottingham University Hospitals NHS
Nottingham_University <- read_html("https://www.cqc.org.uk/provider/RX1/survey/3")
Patient_survey <- Nottingham_University %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- Nottingham_University %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
Nottingham_University <- df[-c(4),]
Nottingham_University_Hospital_NHS_Trust <- data.frame(Nottingham_University)
Nottingham_University_Hospital_NHS_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(Nottingham_University_Hospital_NHS_Trust, file = "Rating/Nottingham_University_Hospital_NHS_Trust.csv",row.names=FALSE) 


#Leeds Teaching Hospitals NHS Trust
Leeds_Teaching <- read_html("https://www.cqc.org.uk/provider/RR8/survey/3")
Patient_survey <- Leeds_Teaching %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- Leeds_Teaching %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
Leeds_Teaching <- df[-c(4),]
Leeds_Teaching_Hospital_NHS_Trust <- data.frame(Leeds_Teaching)
Leeds_Teaching_Hospital_NHS_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(Leeds_Teaching_Hospital_NHS_Trust, file = "Rating/Leeds_Teaching_Hospital_NHS_Trust.csv",row.names=FALSE) 


#Imperial College Healthcare NHS Trust
Imperial_College <- read_html("https://www.cqc.org.uk/provider/RYJ/survey/3")
Patient_survey <- Imperial_College %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- Imperial_College %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
Imperial_College <- df[-c(4),]
Imperial_College_Healthcare_NHS_Trust <- data.frame(Imperial_College)
Imperial_College_Healthcare_NHS_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(Imperial_College_Healthcare_NHS_Trust, file = "Rating/Imperial_College_Healthcare_NHS_Trust.csv",row.names=FALSE) 


#King's College Hospital NHS Foundation Trust
King_College_Hospital <- read_html("https://www.cqc.org.uk/provider/RJZ/survey/3")
Patient_survey <- King_College_Hospital %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- King_College_Hospital %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
King_College_Hospital <- df[-c(4),]
King_College_Hospital_NHS_Trust <- data.frame(King_College_Hospital)
King_College_Hospital_NHS_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(King_College_Hospital_NHS_Trust, file = "Rating/King_College_Hospital_NHS_Trust.csv",row.names=FALSE) 

#Oxford University Hospitals NHS Foundation Trust
Oxford_University_Hospital <- read_html("https://www.cqc.org.uk/provider/RTH/survey/3")
Patient_survey <- Oxford_University_Hospital %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- Oxford_University_Hospital %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
Oxford_University_Hospital <- df[-c(4),]
Oxford_University_Hospital_NHS_Trust <- data.frame(Oxford_University_Hospital)
Oxford_University_Hospital_NHS_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(Oxford_University_Hospital_NHS_Trust, file = "Rating/Oxford_University_Hospital_NHS_Trust.csv",row.names=FALSE) 

#Frimley Health NHS Foundation Trust
Frimley_Health <- read_html("https://www.cqc.org.uk/provider/RDU/survey/3")
Patient_survey <- Frimley_Health %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- Frimley_Health %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
Frimley_Health <- df[-c(4),]
Frimley_Health_NHS_Trust <- data.frame(Frimley_Health)
Frimley_Health_NHS_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(Frimley_Health_NHS_Trust, file = "Rating/Frimley_Health_NHS_Trust.csv",row.names=FALSE) 

#The Pennine Acute Hospitals NHS Trust
Pennine_Acute <- read_html("https://www.cqc.org.uk/provider/RW6/survey/3")
Patient_survey <- Pennine_Acute %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- Pennine_Acute %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
Pennine_Acute <- df[-c(4),]
Pennine_Acute_Hospitals_NHS_Trust <- data.frame(Pennine_Acute)
Pennine_Acute_Hospitals_NHS_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(Pennine_Acute_Hospitals_NHS_Trust, file = "Rating/Pennine_Acute_Hospitals_NHS_Trust.csv",row.names=FALSE) 

#East Kent Hospitals University NHS Foundation Trust 
East_kent_hospitals <- read_html("https://www.cqc.org.uk/provider/RVV/survey/3")
Patient_survey <- Pennine_Acute %>%
  html_nodes(".accordion-title") %>%
  html_text() %>% 
  strsplit(split = "\n") %>%
  unlist() %>%
  .[. != ""]
Patient_survey_NHS <- data.frame(Patient_survey)
Patient_survey <- Patient_survey_NHS[-c(2,3,4,5,7,8,9,10,12,13,14,15,17,18,19,20,22,23,24,25,27,28,29,30,32,33,34,35,37,38,39,40,42,43,44,45,47,48,49,50,52,53,54),]
Patient_score  <- East_kent_hospitals %>%html_nodes(".patient_score")%>%html_text()
Patient_score
df <- merge(data.frame(Patient_survey, row.names=NULL),data.frame(Patient_score, row.names=NULL), by = 0, all = TRUE)[-1]
East_kent_hospitals <- df[-c(4),]
East_kent_Hospitals_NHS_Trust <- data.frame(East_kent_hospitals)
Pennine_Acute_Hospitals_NHS_Trust
#save file
setwd("D:\\data warehouse project\\Hospitals");
write.csv(Pennine_Acute_Hospitals_NHS_Trust, file = "Rating/Pennine_Acute_Hospitals_NHS_Trust.csv",row.names=FALSE) 



#--------------------------------------------------------
Pennine_Acute_Hospitals_NHS_Trust
Frimley_Health_NHS_Trust
install.packages("tidyr")
library("tidyr")

hey <- Pennine_Acute_Hospitals_NHS_Trust %>% spread("Patient_survey","Patient_score")

rownames(hey) <- "The Pennine Acute Hospitals NHS Trust"

hey1 <- Frimley_Health_NHS_Trust %>% spread("Patient_survey","Patient_score")
rownames(hey1) <- "Frimley_Health_NHS_Trust"

hey2 <- rbind(hey,hey1)
hey2$Survey_ID <- c("1","2")

hey2 <- hey2[,c(12,1,2,3,4,5,6,7,8,9,10,11)]
#----------------------------------------------------------

#-----------------------
#Hospital detail
Hospital_table <- read_html("http://hospitals.webometrics.info/en/europe/united%20kingdom")
Rank <- Hospital_table %>%html_nodes("td:nth-child(1) center")%>%html_text(trim = TRUE)
World_Rank  <- Hospital_table %>%html_nodes("td:nth-child(2) center")%>%html_text(trim = TRUE)
Hospital_name <- Hospital_table%>%html_nodes("td:nth-child(3)")%>%html_text()
Hospital_details <- data.frame(Rank,World_Rank,Hospital_name)
Hospital_details
setwd("D:\\data warehouse project\\Hospitals");
write.csv( Hospital_details, file = "Rating/Hospital_Scrape1.csv",row.names=FALSE) 


Hospital_table1 <- read_html("http://hospitals.webometrics.info/en/europe/united%20kingdom?page=1")
Rank <- Hospital_table1 %>%html_nodes("td:nth-child(1) center")%>%html_text(trim = TRUE)
World_Rank  <- Hospital_table1 %>%html_nodes("td:nth-child(2) center")%>%html_text(trim = TRUE)
Hospital_name <- Hospital_table1%>%html_nodes("td:nth-child(3)")%>%html_text()
Hospital_details1 <- data.frame(Rank,World_Rank,Hospital_name)
Hospital_details1
setwd("D:\\data warehouse project\\Hospitals");
write.csv( Hospital_details1, file = "Rating/Hospital_Scrape2.csv",row.names=FALSE) 
