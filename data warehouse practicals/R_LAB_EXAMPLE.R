help.start()
?mean   #search for function


# ploting values
x<- rnorm(50)
y<- rnorm(x)

plot(x,y)   #plot function used for ploting x and y value

?rnorm  #random genration for the normal distribution with mean= 0 anad sd = 1

?boxplot
boxplot(x)
hist(x)

x<- NULL   #null object
rm(y)  #remove object from a environment

x<- c(10.4, 5.6, 3.1, 6.4, 21.7)
1/x
y<- 1/x


x+2
x*3
x %% 2
x/2
log(x)
sqrt(x)
sin(x)
sin(y)
min(x)
max(x)
mean(x)
length(x)
sum(x)
?prod
prod(x)


temp <- x>13

#Identify the values of x between 3 and 7
x>3 & x<7


#Identify which values of x are greater than the mean of x
m<- mean(x)
x[x>m]


#Identify which values of x are more than 1 standard deviation from the mean of x.
s <- sd(x)
x[x<(m-s) | x>(m+s)]

?sd
c("hello","world")

paste(c("X","Y"),1:10,sep="")
?paste

z<-c(1:3,NA)
is.na(z)


#Try it on the vector z produced above
z == NA

0/0
is.na(xx)
y <- x[!is.na(x)]
y <- x[(!is.na(x)) & x>0]
y
y <- x[-(1:5)]
y
money <- c(10,100000,-10,NA,15)
strangeAnswers <- money[(is.na(x)) & money<0]
normalPeople <- money[(!is.na(x)) & money>=0 & money < 200]
toffs <- money[money > 10000]

#Check the contents of lunch.

fruit <- c(5, 10, 1, 20)
?name
names(fruit) <- c("orange", "banana", "apple", "peach")
lunch <- fruit[c("apple","orange")]
print(lunch)

x[is.na(x)] <- 0
x

#Instead of replacing NAs with 0 replace them instead with the mean of x. Note you will need to reassign
#the original values to x, as right now the NAs are 0s.

x <- c(-1:-6, NA , NA , 1:3)
m <- mean(x)
print(m)


x[is.na(x)] <- mean(x, na.rm=TRUE)
print(x)


