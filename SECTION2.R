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
message

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

#THE FOR LOOP
#doesn't have to be "i" it can be anything.
#for (val in sequence)
#{
#  statement
#}
# Sequence is a vector and val takes on each of its values during the loop. In each iteration, statement is evaluated. 

for(i in 1:5){
  print("Hello R")
}

for(i in 1:10){
  print(i * 2)
}

#counts even numbers
x <- c(2,5,3,9,8,11,6)
count <- 0
for (val in x) {
  if(val %% 2 == 0)  count = count+1
}
print(count)

#counts odd numbers
x <- c(2,5,3,9,8,11,6)
count <- 0
for (val in x) {
  if(val %% 2 != 0)  count = count+1
}
print(count)

#THE IF STATEMENT

#rnorm() generates a set of numbers which are randomly distributed according to the normal distribution. 
#falls between -2 and 2.
#rnorm(1) generates exactly one number. 
#rm() removes a variable. we do this so that r doesn't store the answer variable from the last time the code is executed.
#else allows you to specify what happens if the if statement is not true. 

rm(answer)
x <- rnorm(1)
if(x > 1){
  answer <- "Greater than 1"
} else{
  answer <- "Less than or equal to 1"
}

rm(answer)
x <- rnorm(1)
if(x > 1){
  answer <- "Greater than 1"
} else if(x >= -1){
  answer <- "Between -1 and 1"
} else{
  answer <- "Less than -1"
}


