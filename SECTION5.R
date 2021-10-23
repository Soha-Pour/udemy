#------------------------------------- Getting data into R

#Method 1: Select the file manually
stats <- read.csv(file.choose())

#Method 2: Set working directory and read data
getwd() #If this is already correct, no need to setwd
setwd("/Users/spourpirali/Desktop/udemy_course/udemy") 
stats <- read.csv("P2-Demographic-Data.csv")

#------------------------------------- Exploring data

nrow(stats) #Gives you number of rows
ncol(stats) #Gives you number of columns
dim(stats) #Gives you dimensions of the df my row and col
head(stats) #Gives you top 5 rows
head(stats, n=10) #You can specify how many rows you want to see
tail(stats) #Gives you bottom 5 rows
str(stats) #Overview of structure of the data
summary(stats) #Summary of data
View(stats) #Opens up a spreadsheet like view of df

#------------------------------------- Using the $ sign

#Note: The $ specifies columns

stats$Internet.users
stats$Internet.users[2] #Get internet users in the 2nd country on the list (Afghanistan)
stats[ ,"Internet.users"] #This does the exact same thing as above
levels(stats$Income.Group) #Gives you names of levels in income group column

#Note: I needed to convert my Income.Group column into a factor variable because it came as a chr
stats$Income.Group <- factor(stats$Income.Group)
str(stats)
                  
#------------------------------------- Basic operations with a data frame
  
stats[1:10, ] #subsetting for first 10 rows, all columns   
stats[c(4,100),] #subsetting for 4th and 100th rows, all columns

#Note: Let's review how the square brackets work

stats[1,] #Just the first row
is.data.frame(stats[1,]) #In a df, if you extract one row, it remains a df.
is.data.frame(stats[,1]) #However, if you extract one column, it turns into a vector. 
is.data.frame(stats[,1,drop=F]) #This is how you would preserve it as a df. 

#Note: To add a column to a df, you just "pretend" like it already exists, name it, add it, and it shows up

stats$My.Calc <- stats$Birth.rate * stats$Internet.users 
head(stats)
stats$My.Calc <- NULL #To remove a column

#Practice

#A df of internet users for just the first 5 countries 
stats[1:5,4,drop=F]
#A df of just Iran 
stats[83,]
stats[c(83),] 
stats[stats$Country.Name == "Iran, Islamic Rep.",]
#A df of just United States
stats[182,]
stats[stats$Country.Name == "United States",]
#A df of both Iran and US
stats[c(83, 182),]
#Find difference between US internet users and Iran internet users
IRN.internet.users <- stats[83,4]
USA.internet.users <- stats[182,4]
USA.internet.users - IRN.internet.users
#A df of the last 5 countries
stats[190:195,]
tail(stats)

#------------------------------------- Filtering a data frames 

#Notes: This is useful for filtering on rows in a df

head(stats)
stats$Internet.users < 2 #Compares every value in the vector with the number 2
filter <- stats$Internet.users < 2 #We create an object that compares values in the internet users column with 2
stats[filter,] #R now takes the vector (that is the same length as the df) and every time it comes across a TRUE, it'll display the row

stats[stats$Birth.rate > 40 & stats$Internet.users < 2,] #Skip the intermediary step of creating a filter and instead create the object right in the subsetting brackets
stats[stats$Income.Group == "Lower middle income" & stats$Birth.rate > 40,]
levels(stats$Income.Group)

stats[stats$Country.Name == "Malta",]

#------------------------------------- Introduction to qplot

install.packages("ggplot2")
library(ggplot2)

qplot(data=stats, x=Internet.users, )
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(.5))
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(.5), color=I("blue"))
qplot(data=stats, x=Income.Group, y=Birth.rate, geom="boxplot")

#------------------------------------- Visualizing with qplot part I

qplot(data=stats, x=Internet.users, y=Birth.rate, 
      size=I(4), color=I("red"))

#Here, we're mapping color to income.group 
qplot(data=stats, x=Internet.users, y=Birth.rate, 
      size=I(4), color=Income.Group)

#------------------------------------- Building data frames

mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset) #turns vectors into data frames
head(mydf)

#Note: How to changes names of column names

colnames(mydf) <- c("Country", "Code", "Region")
#OR
rm(mydf)
mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset, Region=Regions_2012_Dataset)
head(mydf)

#------------------------------------- Merging data frames

head(stats)
head(mydf)

#Note: The merge function allows you to merge two data frames. In this case, we have a column in common (country code) and we're using that to match the columns up
merged <- merge(stats, mydf, by.x="Country.Code", by.y="Code")
head(merged)
str(merged)

merged$Country <- NULL #to remove duplicate country column
head(merged)
summary(merged)

#------------------------------------- Practice 

#Task: Create a scatter plot illustrating birth rate and internet usage by country, categorized by country regions
#Note: alpha=I() sets transparency 
#Note: main="Title" sets title 

qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Region, size=I(3), shape=I(19), alpha=I(0.6),
      main="Birth Rate vs Internet Users")

#------------------------------------- Homework: World Trends

#Task: Produce a scatter plot depicting life expectancy (y-axix) and fertility rate (x-axis) stats by country, categorized by countrie's regions

#Load data into R

wt.data <- read.csv("P2-Section5-Homework-Data.csv")
head(wt.data)
View(wt.data)

#Filter data set and produce two different df for years 1960 and 2013

wt.data.1960 <- wt.data[wt.data$Year == "1960",]
summary(wt.data.1960)

wt.data.2013 <- wt.data[wt.data$Year == "2013",]
summary(wt.data.2013)

#Build data frames. turn provided vectors into df and give columns better names

wt.mydf <- data.frame(Country.Code=Country_Code, Life.Ex.1960=Life_Expectancy_At_Birth_1960, Life.Ex.2013=Life_Expectancy_At_Birth_2013)

head(wt.mydf)
head(wt.data)

#Merge data frames

#Just 1960
merged.df.1960 <- merge(wt.data.1960, wt.mydf, by.x="Country.Code", by.y="Country.Code")
merged.df.1960$Life.Ex.2013 <- NULL
head(merged.df.1960)
str(merged)

#Just 2013
merged.df.2013 <- merge(wt.data.2013, wt.mydf, by.x="Country.Code", by.y="Country.Code")
merged.df.2013$Life.Ex.1960 <- NULL
head(merged.df.2013)
str(merged)

#Produce scatter plot 1960

qplot(data=merged.df.1960, x=Life.Ex.1960, y=Fertility.Rate, 
      color=Region, size=I(3), shape=I(19), alpha=I(0.6),
      main="Life Expectancy vs Fertility Rate")

qplot(data=merged.df.2013, x=Life.Ex.2013, y=Fertility.Rate, 
      color=Region, size=I(3), shape=I(19), alpha=I(0.6),
      main="Life Expectancy vs Fertility Rate")








