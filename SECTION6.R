#----------------------Challenge

#Task:A movie reviews website is writing up an article analyzing movie ratings by critics
#and audience as well as movie budgets for the years 2007-2011. 
#They want 5 graphs that tell a story about the data. 
#A 6th one should show how the correlation between audience and critic ratings has evolved by genre. 

#------Read the data

getwd() #Correct
movies <- read.csv("P2-Movie-Ratings.csv")

#------Explore the data

summary(movies)
head(movies)
str(movies)

#----------------------Grammar of graphics - GGPlot2

#Theme
#Coordinates
#Facets
#Statistics
#Geometries
#Aesthetics
#Data

#----------------------What is a factor?

#------Change names of columns

colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(movies)
str(movies)

#------Make genre, years, and film factor variables

movies$Genre <- factor(movies$Genre)

movies$Film <- factor(movies$Film)

movies$Year <- factor(movies$Year)

#----------------------Aesthetics layer
library(ggplot2)

#------Just data layer
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) 

#------Add geometry later
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) + 
  geom_point()

#------Add color
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre)) + 
  geom_point()

#------Add size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre, size=BudgetMillions)) + 
  geom_point()

#----------------------Plotting with layers

#Note: ggplot creates an object, and then you use the + to add layers to it

#Just created an object called p, it contains the data and the aesthetics layers
p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre, size=BudgetMillions))

#Now you can add layers to this object
p + geom_point()
p + geom_line()
p + geom_boxplot() 
p + geom_boxplot() + geom_point()

#----------------------Overriding aesthetics

q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre, size=BudgetMillions))

#Add geom layer
q + geom_point()

#Overriding aesthetics
q + geom_point(aes(size=CriticRating))

q + geom_point(aes(color=BudgetMillions))

q + geom_point(aes(x=BudgetMillions)) +
  xlab("Budget Millions")

q + geom_line(size=.5) + geom_point(size=.5)



