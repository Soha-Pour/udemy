#Task: Recreate a scatter plot based on it's image. 

#-----Step 1: Load data into R

films <- read.csv("Section6-Homework-Data.csv")

#-----Step 2: Explore data

View(films)
summary(films)
str(films)

#-----Step 3: Change column names

colnames(films) <- c("DayOfWeek", "Director", "Genre", "MovieTitle", "ReleaseDate", "Studio", "AdjustedRev", "Budget", "NonAdustedRev", "IMDBRating", "MovieLensRating", "OverseasRev", "OverseasRev%", "OverallProfit", "OverallProfit%", "RuntimeMin", "USARev", "USARevPercent")
str(films)

#-----Step 4: Correct variable types

#--Change to factor

films$Genre <- factor(films$Genre)
films$Studio <- factor(films$Studio)

#--Change to numeric

films$AdjustedRev <- as.numeric(gsub(",", "", films$AdjustedRev, fixed=TRUE))
films$NonAdustedRev <- as.numeric(gsub(",", "", films$NonAdustedRev, fixed=TRUE))
films$OverseasRev <- as.numeric(gsub(",", "", films$OverseasRev, fixed=TRUE))
films$OverallProfit <- as.numeric(gsub(",", "", films$OverallProfit, fixed=TRUE))

str(films)

#Figuring out how to change overall profit to numeric. I had to remove a comma in the larger numbers so that the as.numeric function would work. Source: https://stackoverflow.com/questions/15236440/as-numeric-with-comma-decimal-separators.

example <- films$OverallProfit 
class(films$OverallProfit)
no.commas <- gsub(",", "", example, fixed=TRUE)
numeric <- as.numeric(no.commas)
class(numeric)

##-----Step 5: Create the data visualization

install.packages("ggplot2")
library(ggplot2)

a <- ggplot(data=films, aes(x=Genre, y=USARevPercent))
a + geom_jitter(aes(size=Budget)) + geom_boxplot(size=1.2, alpha=.5)
