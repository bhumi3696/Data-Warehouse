x <- c(1:3, 7, 8:10)
attributes(x)

class(x)
z <- 0:9
class(z)

digits <- as.character(z)
class(digits)

d <- as.integer(digits)
class(d)

d <- as.factor(digits)
class(d)


d <- as.data.frame(digits)
class(d)

name <- c("Amy", "Bill", "Carl")
DAD <- c(80, 65, 50)
BDA <- c(70, 50, 80)
gender <- as.factor(c("F", "M", "M"))
nationality <- as.factor(c("IRL", "UK", "IRL"))
age <- c(20, 21, 22)

student.df <- data.frame(name, age, gender, nationality, DAD, BDA)
attributes(student.df)
print(student.df)
str(student.df)
summary(student.df)
student.df['gender']
student.df$gender
student.df$name
student.df$gender[2]
mean(student.df$BDA)


student.df$average <- (student.df$BDA + student.df$DAD)/2
student.df

str(student.df)


#Complete the following to cast student.df$name to a character vector

student.df$name <- as.character(student.df$name)


?rbind
student.df <- rbind(student.df, c("Dennis", 23, "M", "UK", 55, 70))


#Cast nationality to a character vector
student.df$nationality <- as.character(student.df$nationality)


#Add another 5-10 students, not all with the same nationality or gender!

student.df <- rbind(student.df, c("Namrata", 25 ,"F", "IND", 75,74))
student.df <- rbind(student.df, c("lyan", 25 ,"F", "FRN", 85,59))
student.df <- rbind(student.df, c("Batman", 25 ,"F", "USA", 79,85))
student.df <- rbind(student.df, c("Iornman", 25 ,"F", "IND", 65,60))
student.df <- rbind(student.df, c("Spiderman", 25 ,"F", "IRN", 64,70))
student.df <- rbind(student.df, c("Hulk", 25 ,"F", "AUS", 83,78))
student.df <- rbind(student.df, c("Deadpool", 25 ,"F", "UK", 70,64))
student.df <- rbind(student.df, c("Captainamerica", 25 ,"F", "IND", 59,84))
student.df <- rbind(student.df, c("Thor", 25 ,"F", "AUS", 72,54))

student.df$average <- (student.df$BDA + student.df$DAD)/2
student.df

student.df$average <- as.(student.df$average)
student.df

str(student.df)
student.df <- student.df[ , -7] # remove the average column
student.df$DAD <- as.numeric(student.df$DAD)
student.df$BDA <- as.numeric(student.df$BDA)


student.df$average <- (student.df$BDA + student.df$DAD)/2
head(student.df) # check again
?head
tail(student.df)


#Rebuild the nationality factor
student.df$nationality <- as.factor(student.df$nationality)
levels(student.df$nationality)


?levels
?tapply
averages <- tapply(student.df$BDA, student.df$nationality, mean)
averages

table(student.df$nationality)
barplot(table(student.df$nationality), xlab = "Nationality", ylab="Count")



#. compute the min, max, and standard deviation for BDA, and DAD
min(student.df$BDA)
min(student.df$DAD)
max(student.df$BDA)
max(student.df$DAD)
sd(student.df$BDA)
sd(student.df$DAD)


#build a data.frame of the results from 1. one row for BDA and one for DAD with min, max, mean and
#sd as the columns

mins <- c(min(student.df$BDA),min(student.df$DAD))
maxs <- c(max(student.df$BDA),max(student.df$DAD))
means <- c(mean(student.df$BDA),mean(student.df$DAD))
sds <- c(sd(student.df$BDA), sd(student.df$DAD))


subjects <- data.frame(mins, maxs, means, sds, row.names = c("BDA", "DAD"))
names(subjects) <- c("min", "max", "mean", "sd")
print(subjects)

data(mtcars)
str(mtcars)
summary(mtcars)

mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$am <- factor(mtcars$am, labels=c("Automatic", "Manual"), levels=c(0,1))

#Rerun str and summary to see the changes we made
str(mtcars)
summary(mtcars)


hist(mtcars$mpg, breaks = 10) 
boxplot(mtcars$hp)
barplot(table(mtcars$cyl))


#Are there more automatic or manual cars?
table(mtcars$am)


#Which car is heaviest, and which is fastest?
maxWeight <- max(mtcars$wt)
(mtcars[mtcars$wt >= maxWeight,])

minQSec <- min(mtcars$qsec)
(mtcars[mtcars$qsec==minQSec, ])


#Do automatic or manual cars have on average a better mpg?
meanMPG <- tapply(mtcars$mpg, mtcars$am, mean) 


#How many cars have above average hp?
meanHp <- mean(mtcars$hp)
abovAvergeHP <- (mtcars[mtcars$hp > meanHp ,])  

?dim

dim(abovAvergeHP)

#Of the cars that have above average hp, how many have 6 cylinders?

moreThanSix <- abovAvergeHP[abovAvergeHP$cyl == 6, ]
dim(moreThanSix)


#Of the cars that have above average hp, and 6 cylinders, how many are automatic?
automatic <- moreThanSix[moreThanSix$am == "Automatic",]
dim(automatic)

#Make a boxplot of mpg split by no. of cylinders
boxplot(mpg ~ cyl , data = mtcars)
?boxplot

#In the above boxplot are there outliers?
#It looks like there aren???t really any outliers, just the one with a very low MPG and 8 cylinders.


#Take a random 50% sample of the dataset, and rerun questions above to see what changes
?sample
mySample <- mtcars[sample(1:nrow(mtcars), nrow(mtcars)/2 , replace = FALSE ),]


#Split the dataset in 2, one half containing only automatics, and one half containing only manual
#transmissions

automaticDataset <- mtcars[mtcars$am == "Automatic" ,]
manualDataset <- mtcars[mtcars$am != "Automatic" ,]


#For each half, plot mpg against hp using the plot function

?plot

plotAutomatic <- plot(automaticDataset$hp, automaticDataset$mpg, main = "mpg vs. hp Automatic")
plotManual <- plot(manualDataset$hp, manualDataset$mpg, main = "mpg vs. hp Automatic")


#Add an ???abline??? that ???fits??? a linear model between the two variables in the plots you just drew

?abline
?lm

lmAutomatics <- lm(mpg ~ hp ,automaticDataset)
plot(automaticDataset$hp , automaticDataset$mpg , main = "mpg vs. hp Automatic")
abline(lmAutomatics)

lmManual <- lm(mpg ~ hp ,manualDataset)
plot(manualDataset$hp , manualDataset$mpg , main = "mpg vs. hp Automatic")
abline(lmManual)

