library()
install.packages(c("ggplot2", "ggthemes", "scales", "dplyr", "mice", "randomForest"))
setwd("/Users/namratapatel/Downloads")

help.start()
?read.csv
titanicData <- read.csv("titanic.csv", header=T, na.strings=c(""), stringsAsFactors = T)

#Encode the following attributes as factors
titanicData$Survived <- as.factor(titanicData$Survived)
titanicData$Pclass <- as.factor(titanicData$Pclass)


#Check all attributes for missing values
sapply(titanicData, function(x) sum(is.na(x)))


install.packages("data.table")
install.packages("Amelia")
library(Amelia)


#Visual representation of missing data 
missmap(titanicData, main = "Missing values vs observed")

?missing


titanicData <- titanicData[!is.na(titanicData$Embarked), ]
paste("PassengerId: ", titanicData[is.na(titanicData$Embarked), 1], "needs to be corrected")

install.packages("dplyr")
library(dplyr)
embarked <- titanicData %>%
  filter(PassengerId != 62 & PassengerId != 830)

#Get these three details (class, fare, and name) of the two passengers.

embarkedNAs <- titanicData %>%
  filter(PassengerId == 62 | PassengerId == 830)
print(embarkedNAs[, c(3,10,4)])

library(ggplot2)
library(ggthemes)
library(scales)

?ggplot
ggplot(embarked, aes(x = Embarked, y = Fare, fill = factor(Pclass))) +
  geom_boxplot() +
  geom_hline(aes(yintercept=80), #<--- the price we know for one passenger
             colour='red', linetype='dashed', lwd=2) + scale_y_continuous(labels=dollar_format()) + theme_few()

?geom_boxplot
?geom_hline

titanicData$Embarked[c(62, 830)] <- 'C'
sum(is.na(titanicData$Embarked))
ImputedAgeMean <- titanicData$Age


#Impute the missing values of ImputedAgeMean to be the mean age

ImputedAgeMean[is.na(ImputedAgeMean)] <- mean(ImputedAgeMean, na.rm = TRUE)


#Use histograms to inspect the distribution of titanicData$Age compared to ImputedAgeMean. Would you happy with the result? If you are, you probably left the missing values in!!

?par
par(mfrow=c(1,2))
hist(titanicData$Age)
hist(ImputedAgeMean)


idx_na <- is.na(titanicData$Age)
age_train <- titanicData[-idx_na, ]
age_test <- titanicData[idx_na, ]
ageModel <-lm(Age~Pclass + Survived + SibSp, data = age_train) 
age_test$Age <- predict(ageModel, newdata = age_test)
ImputedAgeLM <- titanicData
ImputedAgeLM[ImputedAgeLM$PassengerId %in% age_test$PassengerId, "Age"] <- age_test$Age

?lm


ImputedAgeMean[is.na(ImputedAgeMean)] <- mean(ImputedAgeMean, na.rm = T)
par(mfrow=c(2,2)) # allows us to put plots into a 2 x 2 grid -- makes it easier to compare 
hist(titanicData$Age, freq=F, main='Age: Original', col='red', ylim=c(0,0.04))
hist(ImputedAgeMean, freq=F, main='Age: Imputed Age Mean', col='blue', ylim=c(0,0.04))
hist(ImputedAgeLM$Age, freq=F, main='Age: Imputed Age LM', col='green', ylim=c(0,0.04))


titanicData <- titanicData[, -11]

install.packages("mice")
library(mice)
# Perform mice imputation, excluding some variables that probably won't help:
  mice_mod <- mice(titanicData[, !names(titanicData) %in%
c('PassengerId','Name','Ticket','Cabin','Survived')], method='rf')

  # Complete the missing values
  mice_output <- complete(mice_mod)
  #Plot all the results to compare
  par(mfrow=c(2,2)) # allows us to put plots into a 2 x 2 grid -- makes it easier to compare 
  hist(titanicData$Age, freq=F, main='Age: Original', col='red', ylim=c(0,0.04))
  hist(ImputedAgeMean, freq=F, main='Age: Imputed Age Mean', col='blue', ylim=c(0,0.04))
  hist(ImputedAgeLM$Age, freq=F, main='Age: Imputed Age LM', col='green', ylim=c(0,0.04)) 
  hist(mice_output$Age, freq=F, main='Age: MICE Output', col='orange', ylim=c(0,0.04))

  
  #Replace mean with median and see what difference it makes. There are occasions where the median can be a better choice.
  ImputedAgeMedian <- titanicData$Age
  ImputedAgeMedian[is.na(ImputedAgeMedian)] <- median(ImputedAgeMedian, na.rm = TRUE)
  par(mfrow=c(1,2))
  hist(titanicData$Age)
  hist(ImputedAgeMedian)

  #Try a few different combinations of explanatory variables for the LM (not categorical variables!) and see if you can improve it.
  df <- data.frame(titanicData$Age, ImputedAgeMean, ImputedAgeMedian)
  summary(df)
  
 
  # Perform mice imputation, excluding some variables that probably won't help:
  mice_mod <- mice(titanicData[, !names(titanicData) %in%
                                 c('PassengerId','Name','Ticket','Cabin','Survived')], method='rf')  
  
  
  
  # Complete the missing values
  mice_output <- complete(mice_mod)
  df <- data.frame(titanicData$Age, ImputedAgeMean, ImputedAgeMedian,
                   ImputedAgeLM$Age, mice_output$Age)
  
  summary(df)
  sapply(df, function(x) sd(x, na.rm=T))  

  
  # Make a barplot of the survived variable, to gauge the survival rate.
  barplot(table(titanicData$Survived))  

  #Make a barplot of the Sex variable, to see the distribution of gender.
  barplot(table(titanicData$Sex))

  
  ggplot(titanicData, aes(x = Sex, fill = factor(Survived))) + geom_bar(stat='count', position='dodge') +
    labs(x = 'Sex') +
    theme_few()  
  
  
  titanicData$Age <- mice_output$Age
  ggplot(titanicData, aes(Age, fill = factor(Survived))) + geom_histogram() +
    # I include Sex since we know (a priori) it's a significant predictor 
    facet_grid(.~Sex) +
    theme_few()
  
  
  #Try out different combinations of Survived with other explanatory variables. If you use a numerical explanatory variable, you may need to add scale_x_continuous(breaks=c(1:N)) where N is the number of values you want on the x-axis.
  library(ggplot2)
  library(ggthemes)
  ggplot(titanicData, aes(Pclass, fill = factor(Survived))) +
    geom_bar(stat='count', position='dodge') +
    facet_grid(.~Sex) +
    theme_few()
  
  ggplot(titanicData, aes(Pclass, fill = factor(Survived))) +
    geom_bar(stat='count', position='dodge') +
    facet_grid(.~Embarked) +
    theme_few()
  
  #first inspect Fare
  hist(titanicData$Fare)
  titanicData$binnedFare <- cut(titanicData$Fare, breaks=c(-1, 0, 10, 25, 50, 100, 600),
                                labels = c("Free", "Cheapest", "Cheaper", "Mid Range", "Expensive", "Most Expensive"))
  ggplot(titanicData, aes(binnedFare, fill = factor(Survived))) +
    geom_bar(stat='count', position='dodge') +
    facet_grid(.~Sex) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))  
  
  
  #Create a new factor called Child that has the value ???N??? if the passenger is greater than or equal to 18, and ???Y??? otherwise.
    titanicData$Child[titanicData$Age < 18] <- "Y"
    titanicData$Child[titanicData$Age >= 18] <- "N"
    titanicData$Child <- as.factor(titanicData$Child)
  
    #Create the plot below with the new Child column.
    
    ggplot(titanicData, aes(Child, fill = factor(Survived))) +
      geom_bar(stat='count', position='dodge') +
      facet_grid(.~Sex) +
      theme_few()
    
    
    length(unique(titanicData$Name))
    # Grab title from passenger names
    titanicData$Title <- gsub('(.*, )|(\\..*)', '', titanicData$Name)
    # Show title counts by sex
    table(titanicData$Sex, titanicData$Title)    
    
    
    # Titles with very low cell counts to be combined to "rare" level
    rare_title <- c('Dona', 'Lady', 'the Countess','Capt', 'Col', 'Don', 'Dr', 'Major', 'Rev', 'Sir', 'Jonkheer')
    # Also reassign mlle, ms, and mme accordingly
    titanicData$Title[titanicData$Title == 'Mlle']
    titanicData$Title[titanicData$Title == 'Ms']
    titanicData$Title[titanicData$Title == 'Mme']
    titanicData$Title[titanicData$Title %in% rare_title]  <- 'Rare Title'
    # Show title counts by sex again
    table(titanicData$Sex, titanicData$Title)
    
    #engineer a surname attribute
    titanicData$Name <- as.character(titanicData$Name)
    #R assumed it to be a factor when we read in the data
    titanicData$Surname <- sapply(titanicData$Name, FUN=function(x) {strsplit(x, split='[,.]')[[1]][1]})
    # Create a family size variable including the passenger themselves
    titanicData$Fsize <- titanicData$SibSp + titanicData$Parch + 1
    # Create a family variable
    titanicData$Family <- paste(titanicData$Surname, titanicData$Fsize, sep='_')
    
    #Make the plot below, to help us understand if Fsize has any relationship with survival
    ggplot(titanicData, aes(x = Fsize, fill = factor(Survived))) +
      geom_bar(stat='count', position='dodge') +
      scale_x_continuous(breaks=c(1:11)) +
      labs(x = 'Family Size') +
      theme_few()
    
    
    #Make a variable called FsizeD in accordance to the following rules:
    titanicData$FsizeD[titanicData$Fsize == 1] <- 'singleton'
    titanicData$FsizeD[titanicData$Fsize < 5 & titanicData$Fsize > 1] <- 'small'
    titanicData$FsizeD[titanicData$Fsize > 4] <- 'large'
    titanicData$FsizeD <- as.factor(titanicData$FsizeD)
    table(titanicData$FsizeD)
    
    
    titanicData$FsizeO[titanicData$Fsize == 1] <- 'singleton'
    titanicData$FsizeO[titanicData$Fsize < 5 & titanicData$Fsize > 1] <- 'small'
    titanicData$FsizeO[titanicData$Fsize > 4] <- 'large'
    titanicData$FsizeO <- factor(titanicData$FsizeO, ordered = TRUE,
                                 levels = c("singleton", "small", "large"))
    table(titanicData$FsizeO)
    
    # Show family size by survival using a mosaic plot
    mosaicplot(table(titanicData$FsizeD, titanicData$Survived), 
               main='Family Size by Survival', shade=TRUE)
    
    
    titanicData$Pclass <- as.factor(titanicData$Pclass) 
    titanicData$Survived <- as.factor(titanicData$Survived) 
    titanicData$Title <- as.factor(titanicData$Title)
    
    index <- sample(1:nrow(titanicData), nrow(titanicData) * .75, replace=FALSE)
    train <- titanicData[index, ]
    test <- titanicData[-index, ]
    
    install.packages("randomForest")
    library(randomForest)
    rf_model <- randomForest(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked +
                               Title + FsizeD, data = train)
    
    
    survived <- test$Survived
    #strip out the attributes that we don't want; this is strictly speaking
    #needed, but it's useful to see how we could filter if we wanted to 
    wantedAttributes <- c('Pclass', 'Sex', 'Age', 'SibSp', 'Parch','Fare', 'Embarked', 'Title', 'FsizeD') 
    test <- test[, names(test) %in% wantedAttributes]
    str(test)
    
    
    ?predict
    forestPrediction <- predict(rf_model, test, type = "class") 
    forestMissclassificationRate <- mean(forestPrediction != survived) 
    print(paste('Accuracy randomForest: ',1-forestMissclassificationRate, ' %'))
    
    Gender <- rep(0,nrow(test))
    Gender[test$Sex == 'female'] <- 1
    GenderMissclassificationRate <- mean(Gender != survived)
    print(paste('Accuracy all women survive: ',1-GenderMissclassificationRate, ' %'))
    
    table(survived, forestPrediction)
    table(survived, Gender)    
    