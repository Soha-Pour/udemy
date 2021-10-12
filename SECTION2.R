#TYPES OF VARIABLES

#integer
x <- 2L
typeof()

#double
y <- 2.5
typeof(y)

#complex
z <- 3 + 2i

#character 
a <- "h"
typeof(a)

#logical
q1 <- T
typeof(q1)

#USING VARIABLES

var1 <- 2.5
var2 <- 4

result <- var1/var2
result

greeting <- "hello"
name <- "soha"
message <- paste(greeting, name)

#LOGICAL VARIABLES AND OPERATORS

# ==
# != 
# < 
# >
# <= 
# >= 
# !
# | 
# &
# isTRUE(x)

#THE WHILE LOOP

counter <- 1 
while(counter < 12){
  print(counter)
  counter <- counter + 1
}

number <- 1
while(number < 1000){
  print(number)
  number <- number * 2
}