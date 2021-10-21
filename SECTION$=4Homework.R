
#Create a function to visualize our data

myplot <- function(data, rows=1:10){ 
  Data <- data[rows, ,drop=F] 
  matplot(t(Data), type="b", pch=15:18, col=c(1:4, 6)) 
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4, 6), pch=15:18, horiz=F)
}


#Free throw attempts per game
myplot(FreeThrowAttempts/Games) 

#Accuracy of free throws
myplot(FreeThrows/FreeThrowAttempts)

#Player playing style
myplot((Points - FreeThrows) / FieldGoals)
