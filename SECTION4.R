#Matrices 


#Index matrices 

Salary

Salary[10] #Item in tenth row
Salary[1,5] #Item in the first row, fifth column
Salary[10,] #Everything in tenth row
Salary[,5] #Everything in the fifth column

Games
MinutesPlayed

#Building a matrix

matrix() #Not used very often; used to make a vector into a matrix
rbind() #Binds vectors of the same length into a matrix; putting each in as a row
cbind() #Binds vectors of the same length into a matrix; putting each in as a column

?matrix()
my.data <- 1:20
my.data

A <- matrix(my.data, nrow = 4, ncol = 5)
A

B <- matrix(my.data, nrow = 4, ncol = 5, byrow = T)
B

#rbind()

r1 <- c("I", "am", "happy")
r2 <- c("What", "a", "day")
r3 <- c(1, 2, 3) #Turns into characters because matrices can only contain one type of data

C <- rbind(r1, r2, r3)
C

row1 <- 10:20
row2 <- 100:110
row3 <- 1000:1010

K <- rbind(row1, row2, row3)
K

#cbind()
c1 <- 1:5
c2 <- -1:-5

D <- cbind(c1, c2)
D

col1 <- c("I", "love", "pizza")
col2 <- c("You", "love", "pizza")

P <- cbind(col1, col2)
P

#naming dimensions

P[1, 2]
P[1, "col2"]


#NAMING VECTORS

Charlie <- 1:5
Charlie

names(Charlie) #returns NULL because this vector doesn't have any names yet
names(Charlie) <- c("a", "b", "c", "d", "e") #we're assigning the new vector to the function names()

Charlie
Charlie["d"]
names(Charlie)

#clear names
names(Charlie) <- NULL
names(Charlie)

#NAMING MATRICES

temp.vec <- rep(c("a", "b", "Zz"), each = 3)
temp.vec

Bravo <- matrix(temp.vec, 3, 3)
Bravo

rownames(Bravo) <- c("S", "G", "H")
Bravo

colnames <- c("1", "2", "3")
Bravo

#Replace a value in the matrix

Bravo["G", 2] <- 0
Bravo

#get rid of names

rownames(Bravo) <- NULL
Bravo

#MATRIX OPERATIONS

Games
rownames(Games)
colnames(Games)
Games["LeBronJames", "2012"]

#you can divide a matrix by a matrix
FieldGoals
Games
FieldGoals/Games
round(FieldGoals/Games, 1)

round(MinutesPlayed/Games, 0)

round(FieldGoals/FieldGoalAttempts, 2)
round(FieldGoalAttempts/Games, 1)

#visualizing with matplot()

?matplot() #only plots by column 

matplot(FieldGoals) #this doesn't give us useful data because we want to plot by player (row) not year
t(FieldGoals) #this functions allows us to flip the matrix around so the rows are columns and the columns are rows
matplot(FieldGoals)

matplot(t(FieldGoals), type="b", pch=15:18, col=c(1:4, 6)) #col is colors
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz=F)

matplot(t(FieldGoals/FieldGoalAttempts), type="b", pch=15:18, col=c(1:4, 6)) #col is colors
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz=F)

MinutesPlayed
Salary

matplot(t(Salary/MinutesPlayed), type = "b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz=F)


#SUBSETTING

x <- c("a", "b", "c", "d", "e")
x

x[c(1, 5)]
x[1]

Games
Games[1:3, 6:10] #first 3 rows, last 5 columns
Games[c(1, 10),]
Games[ ,c("2008", "2009")]

#so far, it seems that everything we produce from subsetting a matrix is another matrix. 
#but it isn't so!

Games[1,] #this isn't a matrix, it's a vector

Games[1,5] #vector

#to make those into matrices

Games[1, ,drop=F]
Games[1, 5, drop=F]


#Visualizing subsets

Data <- MinutesPlayed[1:3,] #just the top 3 players

matplot(t(Data), type="b", pch=15:18, col=c(1:4, 6)) #col is colors
legend("bottomleft", inset=0.01, legend=Players[1:3], col=c(1:4, 6), pch=15:18, horiz=F)


Data <- MinutesPlayed[1, ,drop=F] #just Kobe Bryant, must do drop because otherwise r would turn that into a vector and it wouldn't work.

matplot(t(Data), type="b", pch=15:18, col=c(1:4, 6)) #col is colors
legend("bottomleft", inset=0.01, legend=Players[1], col=c(1:4, 6), pch=15:18, horiz=F)


#CREATING YOUR FIRST FUNCTION





















