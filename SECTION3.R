#creating vectors

vector <- c(3, 45, 56, 435)
is.numeric(vector)
is.integer(vector)
is.double(vector)
typeof(vector)

vector2 <- c(3L, 45L, 56L, 435L)
is.numeric(vector2)
is.integer(vector2)

#vectors can only contain one data type. in this vector, r will turn the 7 into a character
vector3 <- c("a", "B23", "Hello", 7)
is.character(vector3)
is.numeric(vector3)

#other ways to create vectors
seq() #sequence - like ':'
rep() #replicate

seq(1,15)
1:15
seq(1,15,2) #gives you a vector with values from 1 to 15 with a step of 2...so only odd numbers here
z <- seq(1,15,4)
z

rep(3, 100) #replicate the number three 50 times
d <- rep(3, 50)
rep("a", 5)

#you can also replicate a vector 
vectortorep <- c(80, 20)
vectortorep
rep(vectortorep, 10)

q <- c("My", "name", "is", "soha")
q
rep(q, 4)

r <- seq(0, 50, 2)
r

#accessing values/elements in a vector individually
w <- c("a", "b", "c", "d", "e")
w

w[1] #get access to the first value
w[-1] #get access to all the values/elements except for the first one

wVector <- w[-3]
wVector
w[1:3] #get all elements between 1 and 3
w[3:5]
w[c(1, 3, 5)] #get the first, third, and fifth elements from the vector
w[c(-2, -4)] #get everything expect for the second and fourth elements
w[-3:-5] #get everything except what's between the third and fifth elements 

#VECTORIZED OPERATIONS
#you can add and subtract and do basically any other function with two vectors together

x <- seq(0, 49, 7)
x

y <- rep(7, 8)
y

x+y
x*y
x/y
x>y

z <- rep(1,16) #if vectors don't have same length but the shorter length is a multiple of the longer one then r will recycle through and repeat the shorter one
z
length(z)

z+y

z <- rep(1,17) #if vectors don't have same length and the shorter length is not a multiple of the longer one then r will recycle through but it'll give you a warning
z
length(z)

z+y


#THE POWER OF VECTORIZED OPERATIONS 


x <- rnorm(5)
x

#get each element to print out individually
#i is a variable that takes on the value of each element in x

for (i in x){
  print(i)
}

print(x[4])

#conventional programming loop
#the variable inside the bracket changes from 1-5 

for(j in 1:5){
  print(x[j])
}
