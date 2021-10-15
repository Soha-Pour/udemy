#takes each randomly generated number, checks if it's greater than 1, and if it is, adds it to the count variable
x <- rnorm(3)
count <- 0 
for(val in x) {
  if(val > 1) 
    count = count+1 
}
print(count)

#checks each randomly generated number for being between -1 and 1 and adds to count
x <- rnorm(3)
count <- 0 
for(val in x) {
  if(val > 1) {
    count = count+0 }
  else if(val >= -1) {
    count = count+1 }
  else {
    count = count+0
  }
}
print(count)

#checks each randomly generated number for being between -1 and 1 and adds to count, divide by length of x 
x <- rnorm(10000)
count <- 0 
for(val in x) {
  if(val > 1) {
    count = count+0 }
  else if(val >= -1) {
    count = count+1 }
  else {
    count = count+0
  }
}
print(count)
mean <- count/length(x)
mean

#same as above but shorter code
x <- rnorm(10000)
count <- 0 
for(i in x) {
  if(i >= -1 & i <= 1) {
    count = count+1 }
}
print(count)
mean <- count/length(x)
mean

#answer provided
N <- 1000
counter <- 0
for(i in rnorm(N)){
  if(i > -1 & i < 1){
    counter <- counter+1
  }
}
counter / N

