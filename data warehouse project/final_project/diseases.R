----------------------->
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_191') 
setwd("D:/data warehouse project/final_project/Test")
library(rJava)
library(readxl)
library(httr)
download.file("https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/adhocs/007824deathsfromdiseasesofthecardiovascularsystemandischaemicheartdisease2010to2016/cvddeathsbyagesexmonth.xls" , destfile = "cvddeathsbyagesexmonth.csv")
data = read_excel("cvddeathsbyagesexmonth.csv")
data
#-------------------------
library("tidyr")

#read csv file
Data <- read.csv("D:/data warehouse project/final_project/Test/Demo/England.csv")
Diseases <- Data

#rename diseases
trial_1 <- Diseases[c(5:14),c(1:15)]
trial_1$Diseases <- "Diseases of the Circulatory System"
trial_2 <- Diseases[c(15:24),c(1:15)]
trial_2$Diseases <- "Ischaemic Heart Disease"
trial1 <- rbind(trial_1,trial_2)
#rename gender
trial_3 <- Diseases[c(5:9),c(2:3)]
trial_3$Gender <- "Males"
trial_4 <- Diseases[c(10:14),c(2:3)]
trial_4$Gender <- "Females"
trial_5 <- Diseases[c(15:19),c(2:3)]
trial_5$Gender <- "Males"
trial_6 <- Diseases[c(20:24),c(2:3)]
trial_6$Gender <- "Females"
trial2 <- rbind(trial_3,trial_4,trial_5,trial_6)
#merge causes and gender
trial <- cbind(trial1,trial2)
df <- trial[,-c(1:2, 17:18)]
gat1 <- df
#give colname
colnames(df) <- c("age_group","jan","feb","mar","apr","may","jun","jul","aug","sep",
                       "oct","nov","dec","causes","Gender")
gat <- df %>% gather("Month","Death",-c(causes,Gender,age_group,causes,Gender))
#add year
gat$Year <- "2010"

#year 2010
Year_2010 <- gat[,c(6,2,3,1,4,5)]

#---------------------------------------------------------------------------
#rename diseases
Data <- read.csv("D:/data warehouse project/final_project/Test/Demo/England.csv")
Diseases <- Data
Diseases <- Diseases[-c(1:3),c(1:27)]
Diseases1 <- Diseases[,-c(4:15)]
trial_1 <- Diseases1[c(1:11),c(1:15)]
trial_1$Diseases <- "Diseases of the Circulatory System"
trial_2 <- Diseases1[c(12:21),c(1:15)]
trial_2$Diseases <- "Ischaemic Heart Disease"
trial1 <- rbind(trial_1,trial_2)
#rename gender
trial_3 <- Diseases1[c(1:6),c(2:3)]
trial_3$Gender <- "Males"
trial_4 <- Diseases[c(7:11),c(2:3)]
trial_4$Gender <- "Females"
trial_5 <- Diseases[c(12:16),c(2:3)]
trial_5$Gender <- "Males"
trial_6 <- Diseases[c(17:21),c(2:3)]
trial_6$Gender <- "Females"
trial2 <- rbind(trial_3,trial_4,trial_5,trial_6)
#merge causes and gender
trial <- cbind(trial1,trial2)
df <- trial[,-c(1:2)]
df <- df[-c(1),-c(15:16)]
gat1 <- df
#give colname
colnames(gat1) <- c("age_group","jan","feb","mar","apr","may","jun","jul","aug","sep",
                  "oct","nov","dec","causes","Gender")
gat <- gat1 %>% gather("Month","Death",-c(causes,Gender,age_group,causes,Gender))
#add year

#year 2011
Year_2011 <- gat[,c(6,2,3,1,4,5)]

#---------------------------------------------------------------------------
#rename diseases
Data <- read.csv("D:/data warehouse project/final_project/Test/Demo/England.csv")
Diseases <- Data
Diseases <- Diseases[-c(1:3),c(1:39)]
Diseases1 <- Diseases[,-c(4:27)]
trial_1 <- Diseases1[c(1:11),c(1:15)]
trial_1$Diseases <- "Diseases of the Circulatory System"
trial_2 <- Diseases1[c(12:21),c(1:15)]
trial_2$Diseases <- "Ischaemic Heart Disease"
trial1 <- rbind(trial_1,trial_2)
#rename gender
trial_3 <- Diseases1[c(1:6),c(2:3)]
trial_3$Gender <- "Males"
trial_4 <- Diseases[c(7:11),c(2:3)]
trial_4$Gender <- "Females"
trial_5 <- Diseases[c(12:16),c(2:3)]
trial_5$Gender <- "Males"
trial_6 <- Diseases[c(17:21),c(2:3)]
trial_6$Gender <- "Females"
trial2 <- rbind(trial_3,trial_4,trial_5,trial_6)
#merge causes and gender
trial <- cbind(trial1,trial2)
df <- trial[,-c(1:2)]
df <- df[-c(1),-c(15:16)]
gat1 <- df
#give colname
colnames(gat1) <- c("age_group","jan","feb","mar","apr","may","jun","jul","aug","sep",
                    "oct","nov","dec","causes","Gender")
gat <- gat1 %>% gather("Month","Death",-c(causes,Gender,age_group,causes,Gender))
#add year
gat$Year <- "2012"

#year 2010
Year_2012 <- gat[,c(7,6,2,3,1,4,5)]

#-----------------------------------------------------------
#rename diseases
Data <- read.csv("D:/data warehouse project/final_project/Test/Demo/England.csv")
Diseases <- Data
Diseases <- Diseases[-c(1:3),c(1:51)]
Diseases1 <- Diseases[,-c(4:39)]
trial_1 <- Diseases1[c(1:11),c(1:15)]
trial_1$Diseases <- "Diseases of the Circulatory System"
trial_2 <- Diseases1[c(12:21),c(1:15)]
trial_2$Diseases <- "Ischaemic Heart Disease"
trial1 <- rbind(trial_1,trial_2)
#rename gender
trial_3 <- Diseases1[c(1:6),c(2:3)]
trial_3$Gender <- "Males"
trial_4 <- Diseases[c(7:11),c(2:3)]
trial_4$Gender <- "Females"
trial_5 <- Diseases[c(12:16),c(2:3)]
trial_5$Gender <- "Males"
trial_6 <- Diseases[c(17:21),c(2:3)]
trial_6$Gender <- "Females"
trial2 <- rbind(trial_3,trial_4,trial_5,trial_6)
#merge causes and gender
trial <- cbind(trial1,trial2)
df <- trial[,-c(1:2)]
df <- df[-c(1),-c(15:16)]
gat1 <- df
#give colname
colnames(gat1) <- c("age_group","jan","feb","mar","apr","may","jun","jul","aug","sep",
                    "oct","nov","dec","causes","Gender")
gat <- gat1 %>% gather("Month","Death",-c(causes,Gender,age_group,causes,Gender))
#add year
gat$Year <- "2013"

#year 2013
Year_2013 <- gat[,c(6,2,3,1,4,5)]


#-----------------------------------------------------------
#rename diseases
Data <- read.csv("D:/data warehouse project/final_project/Test/Demo/England.csv")
Diseases <- Data
Diseases <- Diseases[-c(1:3),c(1:63)]
Diseases1 <- Diseases[,-c(4:51)]
trial_1 <- Diseases1[c(1:11),c(1:15)]
trial_1$Diseases <- "Diseases of the Circulatory System"
trial_2 <- Diseases1[c(12:21),c(1:15)]
trial_2$Diseases <- "Ischaemic Heart Disease"
trial1 <- rbind(trial_1,trial_2)
#rename gender
trial_3 <- Diseases1[c(1:6),c(2:3)]
trial_3$Gender <- "Males"
trial_4 <- Diseases[c(7:11),c(2:3)]
trial_4$Gender <- "Females"
trial_5 <- Diseases[c(12:16),c(2:3)]
trial_5$Gender <- "Males"
trial_6 <- Diseases[c(17:21),c(2:3)]
trial_6$Gender <- "Females"
trial2 <- rbind(trial_3,trial_4,trial_5,trial_6)
#merge causes and gender
trial <- cbind(trial1,trial2)
df <- trial[,-c(1:2)]
df <- df[-c(1),-c(15:16)]
gat1 <- df
#give colname
colnames(gat1) <- c("age_group","jan","feb","mar","apr","may","jun","jul","aug","sep",
                    "oct","nov","dec","causes","Gender")
gat <- gat1 %>% gather("Month","Death",-c(causes,Gender,age_group,causes,Gender))
#add year
gat$Year <- "2014"

#year 2013
Year_2014 <- gat[,c(6,2,3,1,4,5)]


#-----------------------------------------------------------
#rename diseases
Data <- read.csv("D:/data warehouse project/final_project/Test/Demo/England.csv")
Diseases <- Data
Diseases <- Diseases[-c(1:3),c(1:75)]
Diseases1 <- Diseases[,-c(4:63)]
trial_1 <- Diseases1[c(1:11),c(1:15)]
trial_1$Diseases <- "Diseases of the Circulatory System"
trial_2 <- Diseases1[c(12:21),c(1:15)]
trial_2$Diseases <- "Ischaemic Heart Disease"
trial1 <- rbind(trial_1,trial_2)
#rename gender
trial_3 <- Diseases1[c(1:6),c(2:3)]
trial_3$Gender <- "Males"
trial_4 <- Diseases[c(7:11),c(2:3)]
trial_4$Gender <- "Females"
trial_5 <- Diseases[c(12:16),c(2:3)]
trial_5$Gender <- "Males"
trial_6 <- Diseases[c(17:21),c(2:3)]
trial_6$Gender <- "Females"
trial2 <- rbind(trial_3,trial_4,trial_5,trial_6)
#merge causes and gender
trial <- cbind(trial1,trial2)
df <- trial[,-c(1:2)]
df <- df[-c(1),-c(15:16)]
gat1 <- df
#give colname
colnames(gat1) <- c("age_group","jan","feb","mar","apr","may","jun","jul","aug","sep",
                    "oct","nov","dec","causes","Gender")
gat <- gat1 %>% gather("Month","Death",-c(causes,Gender,age_group,causes,Gender))
#add year
gat$Year <- "2015"

#year 2013
Year_2015 <- gat[,c(6,2,3,1,4,5)]


#-----------------------------------------------------------
#rename diseases
Data <- read.csv("D:/data warehouse project/final_project/Test/Demo/England.csv")
Diseases <- Data
Diseases <- Diseases[-c(1:3),c(1:87)]
Diseases1 <- Diseases[,-c(4:75)]
trial_1 <- Diseases1[c(1:11),c(1:15)]
trial_1$Diseases <- "Diseases of the Circulatory System"
trial_2 <- Diseases1[c(12:21),c(1:15)]
trial_2$Diseases <- "Ischaemic Heart Disease"
trial1 <- rbind(trial_1,trial_2)
#rename gender
trial_3 <- Diseases1[c(1:6),c(2:3)]
trial_3$Gender <- "Males"
trial_4 <- Diseases[c(7:11),c(2:3)]
trial_4$Gender <- "Females"
trial_5 <- Diseases[c(12:16),c(2:3)]
trial_5$Gender <- "Males"
trial_6 <- Diseases[c(17:21),c(2:3)]
trial_6$Gender <- "Females"
trial2 <- rbind(trial_3,trial_4,trial_5,trial_6)
#merge causes and gender
trial <- cbind(trial1,trial2)
df <- trial[,-c(1:2)]
df <- df[-c(1),-c(15:16)]
gat1 <- df
#give colname
colnames(gat1) <- c("age_group","jan","feb","mar","apr","may","jun","jul","aug","sep",
                    "oct","nov","dec","causes","Gender")
gat <- gat1 %>% gather("Month","Death",-c(causes,Gender,age_group,causes,Gender))
#add year
gat$Year <- "2016"

#year 2013
Year_2016 <- gat[,c(6,2,3,1,4,5)]


Diseases <- rbind(Year_2010,Year_2011,Year_2012,Year_2013,Year_2014,Year_2015,Year_2016)

Heart_Diseases_England <- Diseases[,c(7,1,2,3,4,5,6)]

setwd("D:\\data warehouse project\\final_project\\Test");

write.csv(Heart_Diseases, file = "CSV/Heart_Diseases.csv",row.names=FALSE)

#----------------------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------
#read csv file
Data <- read.csv("D:/data warehouse project/final_project/Test/Demo/Wales.csv")
Diseases <- Data

#rename diseases
trial_1 <- Diseases[c(5:14),c(1:15)]
trial_1$Diseases <- "Diseases of the Circulatory System"
trial_2 <- Diseases[c(15:24),c(1:15)]
trial_2$Diseases <- "Ischaemic Heart Disease"
trial1 <- rbind(trial_1,trial_2)
#rename gender
trial_3 <- Diseases[c(5:9),c(2:3)]
trial_3$Gender <- "Males"
trial_4 <- Diseases[c(10:14),c(2:3)]
trial_4$Gender <- "Females"
trial_5 <- Diseases[c(15:19),c(2:3)]
trial_5$Gender <- "Males"
trial_6 <- Diseases[c(20:24),c(2:3)]
trial_6$Gender <- "Females"
trial2 <- rbind(trial_3,trial_4,trial_5,trial_6)
#merge causes and gender
trial <- cbind(trial1,trial2)
df <- trial[,-c(1:2, 17:18)]
gat1 <- df
#give colname
colnames(df) <- c("age_group","jan","feb","mar","apr","may","jun","jul","aug","sep",
                  "oct","nov","dec","causes","Gender")
gat <- df %>% gather("Month","Death", -c(causes,Gender,age_group))
#add year
gat$Year <- "2010"

#year 2010
Year_2010 <- gat[,c(6,2,3,1,4,5)]

#-------------------------------------------------------
#rename diseases
Data <- read.csv("D:/data warehouse project/final_project/Test/Demo/Wales.csv")
Diseases <- Data
Diseases <- Diseases[-c(1:3),c(1:27)]
Diseases1 <- Diseases[,-c(4:15)]
trial_1 <- Diseases1[c(1:11),c(1:15)]
trial_1$Diseases <- "Diseases of the Circulatory System"
trial_2 <- Diseases1[c(12:21),c(1:15)]
trial_2$Diseases <- "Ischaemic Heart Disease"
trial1 <- rbind(trial_1,trial_2)
#rename gender
trial_3 <- Diseases1[c(1:6),c(2:3)]
trial_3$Gender <- "Males"
trial_4 <- Diseases[c(7:11),c(2:3)]
trial_4$Gender <- "Females"
trial_5 <- Diseases[c(12:16),c(2:3)]
trial_5$Gender <- "Males"
trial_6 <- Diseases[c(17:21),c(2:3)]
trial_6$Gender <- "Females"
trial2 <- rbind(trial_3,trial_4,trial_5,trial_6)
#merge causes and gender
trial <- cbind(trial1,trial2)
df <- trial[,-c(1:2)]
df <- df[-c(1),-c(15:16)]
gat1 <- df
#give colname
colnames(gat1) <- c("age_group","jan","feb","mar","apr","may","jun","jul","aug","sep",
                    "oct","nov","dec","causes","Gender")
gat <- gat1 %>% gather("Month","Death",-c(causes,Gender,age_group,causes,Gender))
#add year
gat$Year <- "2011"

#year 2011
Year_2011 <- gat[,c(6,2,3,1,4,5)]

#---------------------------------------------------------------------------
#rename diseases
Data <- read.csv("D:/data warehouse project/final_project/Test/Demo/Wales.csv")
Diseases <- Data
Diseases <- Diseases[-c(1:3),c(1:39)]
Diseases1 <- Diseases[,-c(4:27)]
trial_1 <- Diseases1[c(1:11),c(1:15)]
trial_1$Diseases <- "Diseases of the Circulatory System"
trial_2 <- Diseases1[c(12:21),c(1:15)]
trial_2$Diseases <- "Ischaemic Heart Disease"
trial1 <- rbind(trial_1,trial_2)
#rename gender
trial_3 <- Diseases1[c(1:6),c(2:3)]
trial_3$Gender <- "Males"
trial_4 <- Diseases[c(7:11),c(2:3)]
trial_4$Gender <- "Females"
trial_5 <- Diseases[c(12:16),c(2:3)]
trial_5$Gender <- "Males"
trial_6 <- Diseases[c(17:21),c(2:3)]
trial_6$Gender <- "Females"
trial2 <- rbind(trial_3,trial_4,trial_5,trial_6)
#merge causes and gender
trial <- cbind(trial1,trial2)
df <- trial[,-c(1:2)]
df <- df[-c(1),-c(15:16)]
gat1 <- df
#give colname
colnames(gat1) <- c("age_group","jan","feb","mar","apr","may","jun","jul","aug","sep",
                    "oct","nov","dec","causes","Gender")
gat <- gat1 %>% gather("Month","Death",-c(causes,Gender,age_group,causes,Gender))
#add year
gat$Year <- "2012"

#year 2010
Year_2012 <- gat[,c(6,2,3,1,4,5)]

#-----------------------------------------------------------
#rename diseases
Data <- read.csv("D:/data warehouse project/final_project/Test/Demo/Wales.csv")
Diseases <- Data
Diseases <- Diseases[-c(1:3),c(1:51)]
Diseases1 <- Diseases[,-c(4:39)]
trial_1 <- Diseases1[c(1:11),c(1:15)]
trial_1$Diseases <- "Diseases of the Circulatory System"
trial_2 <- Diseases1[c(12:21),c(1:15)]
trial_2$Diseases <- "Ischaemic Heart Disease"
trial1 <- rbind(trial_1,trial_2)
#rename gender
trial_3 <- Diseases1[c(1:6),c(2:3)]
trial_3$Gender <- "Males"
trial_4 <- Diseases[c(7:11),c(2:3)]
trial_4$Gender <- "Females"
trial_5 <- Diseases[c(12:16),c(2:3)]
trial_5$Gender <- "Males"
trial_6 <- Diseases[c(17:21),c(2:3)]
trial_6$Gender <- "Females"
trial2 <- rbind(trial_3,trial_4,trial_5,trial_6)
#merge causes and gender
trial <- cbind(trial1,trial2)
df <- trial[,-c(1:2)]
df <- df[-c(1),-c(15:16)]
gat1 <- df
#give colname
colnames(gat1) <- c("age_group","jan","feb","mar","apr","may","jun","jul","aug","sep",
                    "oct","nov","dec","causes","Gender")
gat <- gat1 %>% gather("Month","Death",-c(causes,Gender,age_group,causes,Gender))
#add year
gat$Year <- "2013"
#add id
#Year 2013
Year_2013 <- gat[,c(6,2,3,1,4,5)]


#-----------------------------------------------------------
#rename diseases
Data <- read.csv("D:/data warehouse project/final_project/Test/Demo/Wales.csv")
Diseases <- Data
Diseases <- Diseases[-c(1:3),c(1:63)]
Diseases1 <- Diseases[,-c(4:51)]
trial_1 <- Diseases1[c(1:11),c(1:15)]
trial_1$Diseases <- "Diseases of the Circulatory System"
trial_2 <- Diseases1[c(12:21),c(1:15)]
trial_2$Diseases <- "Ischaemic Heart Disease"
trial1 <- rbind(trial_1,trial_2)
#rename gender
trial_3 <- Diseases1[c(1:6),c(2:3)]
trial_3$Gender <- "Males"
trial_4 <- Diseases[c(7:11),c(2:3)]
trial_4$Gender <- "Females"
trial_5 <- Diseases[c(12:16),c(2:3)]
trial_5$Gender <- "Males"
trial_6 <- Diseases[c(17:21),c(2:3)]
trial_6$Gender <- "Females"
trial2 <- rbind(trial_3,trial_4,trial_5,trial_6)
#merge causes and gender
trial <- cbind(trial1,trial2)
df <- trial[,-c(1:2)]
df <- df[-c(1),-c(15:16)]
gat1 <- df
#give colname
colnames(gat1) <- c("age_group","jan","feb","mar","apr","may","jun","jul","aug","sep",
                    "oct","nov","dec","causes","Gender")
gat <- gat1 %>% gather("Month","Death",-c(causes,Gender,age_group,causes,Gender))
#add year
gat$Year <- "2014"
#add id
#year 2013
Year_2014 <- gat[,c(6,2,3,1,4,5)]


#-----------------------------------------------------------
#rename diseases
Data <- read.csv("D:/data warehouse project/final_project/Test/Demo/Wales.csv")
Diseases <- Data
Diseases <- Diseases[-c(1:3),c(1:75)]
Diseases1 <- Diseases[,-c(4:63)]
trial_1 <- Diseases1[c(1:11),c(1:15)]
trial_1$Diseases <- "Diseases of the Circulatory System"
trial_2 <- Diseases1[c(12:21),c(1:15)]
trial_2$Diseases <- "Ischaemic Heart Disease"
trial1 <- rbind(trial_1,trial_2)
#rename gender
trial_3 <- Diseases1[c(1:6),c(2:3)]
trial_3$Gender <- "Males"
trial_4 <- Diseases[c(7:11),c(2:3)]
trial_4$Gender <- "Females"
trial_5 <- Diseases[c(12:16),c(2:3)]
trial_5$Gender <- "Males"
trial_6 <- Diseases[c(17:21),c(2:3)]
trial_6$Gender <- "Females"
trial2 <- rbind(trial_3,trial_4,trial_5,trial_6)
#merge causes and gender
trial <- cbind(trial1,trial2)
df <- trial[,-c(1:2)]
df <- df[-c(1),-c(15:16)]
gat1 <- df
#give colname
colnames(gat1) <- c("age_group","jan","feb","mar","apr","may","jun","jul","aug","sep",
                    "oct","nov","dec","causes","Gender")
gat <- gat1 %>% gather("Month","Death",-c(causes,Gender,age_group,causes,Gender))
#add year
gat$Year <- "2015"
#year 2013
Year_2015 <- gat[,c(6,2,3,1,4,5)]


#-----------------------------------------------------------
#rename diseases
Data <- read.csv("D:/data warehouse project/final_project/Test/Demo/Wales.csv")
Diseases <- Data
Diseases <- Diseases[-c(1:3),c(1:87)]
Diseases1 <- Diseases[,-c(4:75)]
trial_1 <- Diseases1[c(1:11),c(1:15)]
trial_1$Diseases <- "Diseases of the Circulatory System"
trial_2 <- Diseases1[c(12:21),c(1:15)]
trial_2$Diseases <- "Ischaemic Heart Disease"
trial1 <- rbind(trial_1,trial_2)
#rename gender
trial_3 <- Diseases1[c(1:6),c(2:3)]
trial_3$Gender <- "Males"
trial_4 <- Diseases[c(7:11),c(2:3)]
trial_4$Gender <- "Females"
trial_5 <- Diseases[c(12:16),c(2:3)]
trial_5$Gender <- "Males"
trial_6 <- Diseases[c(17:21),c(2:3)]
trial_6$Gender <- "Females"
trial2 <- rbind(trial_3,trial_4,trial_5,trial_6)
#merge causes and gender
trial <- cbind(trial1,trial2)
df <- trial[,-c(1:2)]
df <- df[-c(1),-c(15:16)]
gat1 <- df
#give colname
colnames(gat1) <- c("age_group","jan","feb","mar","apr","may","jun","jul","aug","sep",
                    "oct","nov","dec","causes","Gender")
gat <- gat1 %>% gather("Month","Death",-c(causes,Gender,age_group,causes,Gender))
#add year
gat$Year <- "2016"

#year 2013
Year_2016 <- gat[,c(6,2,3,1,4,5)]


Diseases <- rbind(Year_2010,Year_2011,Year_2012,Year_2013,Year_2014,Year_2015,Year_2016)
gat$id = ""
for(i in 1:1680){
  Diseases$id[i] <- i 
}
Heart_Diseases_Wales <- Diseases[,c(7,1,2,3,4,5,6)]
a <- read.csv("D:/data warehouse project/final_project/Test/CSV/Heart_Diseases.csv")
Heart_Diseases_England <- a
Death_Wales <- Heart_Diseases_Wales$Death
Heart_Diseases_England <- cbind(Heart_Diseases_England,Death_Wales)
colnames(Heart_Diseases_England) <- c("id","Year","Causes","Gender","Age_Group","Month","Death_England","Death_Wales")
Heart_Diseases <- Heart_Diseases_England[,-c(9)]
setwd("D:\\data warehouse project\\final_project\\Test");

write.csv(Heart_Diseases, file = "CSV/Heart_Diseases.csv",row.names=FALSE)

