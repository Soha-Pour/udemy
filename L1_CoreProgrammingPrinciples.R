##section2: core programming principles

#integer (the "L" makes the value an integer. Without it, R stores the variable as "double.")
x <- 2L
typeof(x)

#double 
y <- 2.5
typeof(y)

#complex
z <- 3 + 2i 
typeof(z)

#character
a <- "h"
typeof(a)

#logical 
q <- TRUE
typeof(q)

#using variables
A <- 10
B <- 5
C <- A+B
C

var1 <- 2.5
var2 <- 4

result <- var1 / var2
result

answer <- sqrt(var2)
answer

greeting <- "hello"
name <- "bob"
message <- paste(greeting, name)
message

<<<<<<< HEAD
#logical 

4 < 5 
10 > 100
4 == 5 
4 != 5
4 >= 5

result <- 4 < 5
result

result2 <- !(5 > 1)
result2

# | is the or operator. It will come back true if either side of the operation is true. 

4 == 4 | 4 == 5 
result | result2

# & is the and operator. It will come back true only if both sides of the operation are true. 

4 == 4 & 4 == 5 
result & result2

# isTRUE() just tells you if the thing inside the parentheses is true or not. 

isTRUE(4 == 4)
