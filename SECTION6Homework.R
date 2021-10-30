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

#install.packages("ggplot2")
library(ggplot2)

#--Filter

#Method 1: Filter data frame with logical operator "OR"

GenresOfInterest <- (films$Genre == "action") | (films$Genre == "adventure") | (films$Genre == "animation") | (films$Genre == "comedy") | (films$Genre == "drama")

#Method 2: Filter data frame with %in% operator, which returns TRUE if anything inside the df matches the values in the vector provided.

StudiosOfInterest <- films$Studio %in% c("Buena Vista Studios", "Fox", "Paramount Pictures", "Sony", "Universal", "WB")

#--Combine the filters (to be in the visualization, the movie has to match both filters). What you do is create a new df. 

films2 <- films[GenresOfInterest & StudiosOfInterest, ]
View(films2)

#--Prepare the plot's data and aes layers

a <- ggplot(data=films2, aes(x=Genre, y=USARevPercent))

#--Add geometries 
b <- a + geom_jitter(aes(size=Budget, color=Studio)) + geom_boxplot(alpha=.5, outlier.color=NA)

#-----Step 5: Add non-data ink

c <- b + 
  xlab("Genre") + 
  ylab("Gross US % (Revenue in US / Revenue Total)") +
  ggtitle("Domestic Gross % by Genre") +
  
  theme(axis.title.x = element_text(color="DarkGreen", size=15), 
        axis.title.y = element_text(color="DarkGreen", size=15),
        
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        
        legend.title = element_text(size=15), 
        legend.text = element_text(size=10), 
        
        plot.title = element_text(hjust=.5, color="Black", 
                                  size=30),
        
        text = element_text(family="Comic Sans MS")
        
        )

c$labels$size <- "Budget $M"

c 
