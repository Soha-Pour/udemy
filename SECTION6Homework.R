#Task: Recreate a scatter plot based on it's image. 

#-----Step 1: Load data into R

films <- read.csv("Section6-Homework-Data.csv")

#-----Step 2: Explore data

View(films)
summary(films)
str(films)

#-----Step 3: Change column names

colnames(films) <- c("DayOfWeek", "Director", "Genre", "MovieTitle", "ReleaseDate", "Studio", "AdjustedRev", "Budget", "NonAdustedRev", "IMDBRating", "MovieLensRating", "OverseasRev", "OverseasRev%", "OverallProfit", "OverallProfit%", "RuntimeMin", "USARev", "USARev%")
str(films)

#-----Step 4: Correct variable types

#--Change to factor

films$Genre <- factor(films$Genre)
films$Studio <- factor(films$Studio)

#--Change to numeric

films$AdjustedRev 
films$NonAdustedRev
films$OverseasRev
films$OverallProfit 