#Task: Produce a scatter plot depicting life expectancy (y-axis) 
#and fertility rate (x-axis) stats by country 
#categorized by country regions

#----------------------------------

#Step1: Load data into R

#----Data that's in a vector provided in the course materials

#Just open the file in R and run the code 

#----Data that's in an excel file 

data <- read.csv("P2-Section5-Homework-Data.csv")

#Step2: Explore the data

summary(data)
head(data)
tail(data)
str(data)

#Step3: Create two data frames, one for 1960 and one for 2013 via filtering

data1960 <- data[data$Year == "1960",]

data2013 <- data[data$Year == "2013",]

#Step4: Build data frames for data that is in vector form right now (life expectancy), and give columns new names

df1960 <- data.frame(Country.Code=Country_Code, Life.Expectancy=Life_Expectancy_At_Birth_1960)

df2013 <- data.frame(Country.Code=Country_Code, Life.Expectancy=Life_Expectancy_At_Birth_2013)

#Step5: Merge dfs so that all data is in one df for each year

merged1960 <- merge(data1960, df1960, by.x="Country.Code", by.y="Country.Code")

merged2013 <- merge(data2013, df2013, by.x="Country.Code", by.y="Country.Code")

#Step6: Produce scatter plots

install.packages("ggplot2")
library(ggplot2)

#-----1960

qplot(data=merged1960, x=Fertility.Rate, y=Life.Expectancy, 
      color=Region, size=I(3), shape=I(19), alpha=I(0.6),
      main="Life Expectancy vs Fertility Rate (1960)")

#-----2013

qplot(data=merged2013, x=Fertility.Rate, y=Life.Expectancy, 
      color=Region, size=I(3), shape=I(19), alpha=I(0.6),
      main="Life Expectancy vs Fertility Rate (2013)")
