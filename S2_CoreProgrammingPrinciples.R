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

#the while loop 
#R would examine whatever is in the () and if it's true, it will execute whatever is in the curly brackets. 
#Then it'll keep doing that until () becomes false.  
#In this first example, the logical statement inside the () is always going to be true because it's just the logical operator TRUE. 
#So we've created an infinite loop that will print Hello forever. 
#To stop an infinite loop, hit escape. 

while(TRUE){
  print("Hello")
} 

counter <- 1 

while(counter < 12) {
  print(counter)
  counter <- counter + 1
}

number <- 1 

while(number < 1000){
  print(number)
  number <- number * 2 
}


