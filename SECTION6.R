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

#----------------------Mapping vs setting

#Create object
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

#Layer plot type
r + geom_point()

#Add color
#1. Mapping:
r + geom_point(aes(color=Genre))

#2: Setting:
r + geom_point(color="DarkGreen")

#----------------------Practice

#Mapping to set size to a variable:
r + geom_point(aes(size=BudgetMillions))

#Setting to set the size of the points on the plot:
r + geom_point(size=2, color="Blue")

#----------------------Histograms 

s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth=10)

#add color
s + geom_histogram(binwidth=10, aes(fill=Genre))

#add a border
s + geom_histogram(binwidth=10, aes(fill=Genre), color="Black")

#----------------------Density chart

s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position="stack")

#----------------------Starting layer tips

#Use this way if you're pretty much set on having x be audience rating
t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth=10, 
                   fill="White", color="Blue")

#Another way of achieving the same chart:
#Use this if you want to visualize other things on the x axis
t <- ggplot(data=movies)
t + geom_histogram(binwidth=10,
                   aes(x=AudienceRating),
                   fill="White", color="Blue")

#----------------------Practice

#One way of creating a chart
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre, size=BudgetMillions)) + 
  geom_point()

#Same chart, but we're using layering and we're setting the aesthetics inside the layer, not the original object
u <- ggplot(data=movies)
u + geom_point(aes(x=CriticRating, y=AudienceRating, color=Genre, size=BudgetMillions)) 

#One way of creating a chart
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#Same chart, but we're using layering and we're setting the aesthetics inside the layer, not the original object
r <- ggplot(data=movies)
r + geom_point(aes(x=CriticRating, y=AudienceRating),
               color="DarkGreen", size=3, alpha=.5)

#One way of creating a chart
s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth=10, aes(fill=Genre), color="Black")

#Same chart, but we're using layering and we're setting the aesthetics inside the layer, not the original object
s <- ggplot(data=movies)
s + geom_histogram(binwidth=10, 
                   aes(x=BudgetMillions, fill=Genre), 
                   color="Black")

#----------------------Statistical transformations


y <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre))
y + geom_point() + geom_smooth(fill=NA)

#-----------Boxplots

z <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, color=Genre))
z + geom_boxplot(size=1.2) 

z <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, color=Genre))
z + geom_boxplot(size=1.2) + geom_jitter(size=.5)

#If you put jitter first, the boxplot goes on top of the points

z + geom_jitter(size=.5) + geom_boxplot(size=1.2, alpha=.5) 

z + geom_jitter(size=.5) + geom_boxplot(size=1.2, alpha=.5, aes(y=CriticRating)) 

#----------------------Using facets

#Chart without facets
aa <- ggplot(data=movies, aes(x=BudgetMillions))
aa + geom_histogram(binwidth=10, aes(fill=Genre),
                    color="Black")

#Chart with facets
aa + geom_histogram(binwidth=10, aes(fill=Genre),
                    color="Black") +
  facet_grid(Genre~., scales="free")

#---

#Chart without facets
bb <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre))
bb + geom_point(size=3)

#Chart with facets
bb + geom_point(size=1) +
  facet_grid(Genre~.)

bb + geom_point(size=1) +
  facet_grid(Year~.)

bb + geom_point(size=1) +
  facet_grid(Genre~Year) 

bb + geom_point(size=1) +
  facet_grid(Genre~Year) + 
  geom_smooth()

bb + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year)  

#----------------------Coordinates

cc <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, size=BudgetMillions, color=Genre))
cc + geom_point() 

#How to visualize just part of the chart: method 1 is setting limits
cc + geom_point() +
  xlim(50,100) +
  ylim(50, 100)

#Method 2 is zooming
dd <- ggplot(data=movies, aes(x=BudgetMillions))

dd + geom_histogram(binwidth=10, aes(fill=Genre), color="Black") + 
  coord_cartesian(ylim=c(0,50))

#Practice 
bb + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) + 
  coord_cartesian(ylim=c(0,100))

#----------------------Perfecting by adding themes

ee <- ggplot(data=movies, aes(x=BudgetMillions)) 
ee + geom_histogram(binwidth=10, aes(fill=Genre), color="Black")

#Add axes labels

#---First put second layer into object

ff <- ee + geom_histogram(binwidth=10, aes(fill=Genre), color="Black")

#---Add x and y axis labels, change font size and color

ff + xlab("Budget in Millions") + ylab("Number of Movies") + 
  theme(axis.title.x = element_text(color="DarkGreen", size=15), 
        axis.title.y = element_text(color="DarkGreen", size=15))

#---Add tick mark formatting

ff + xlab("Budget in Millions") + ylab("Number of Movies") + 
  theme(axis.title.x = element_text(color="DarkGreen", size=15), 
        axis.title.y = element_text(color="DarkGreen", size=15), 
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10))

#---Legend formatting
ff + xlab("Budget in Millions") + ylab("Number of Movies") + 
  theme(axis.title.x = element_text(color="DarkGreen", size=15), 
        axis.title.y = element_text(color="DarkGreen", size=15), 
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        legend.title = element_text(size=15), 
        legend.text = element_text(size=10), 
        legend.position = c(1,1), 
        legend.justification = c(1,1)
        )

#---Title
ff + 
  xlab("Budget in Millions") + 
  ylab("Number of Movies") + 
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(color="DarkGreen", size=15), 
        axis.title.y = element_text(color="DarkGreen", size=15), 
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
     
        legend.title = element_text(size=15), 
        legend.text = element_text(size=10), 
        legend.position = c(1,1), 
        legend.justification = c(1,1),
        
        plot.title = element_text(hjust=.5, color="DarkGreen", 
                                  size=30, 
                                  family="Courier"))

?theme
