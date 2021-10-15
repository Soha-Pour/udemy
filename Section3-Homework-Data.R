#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution

months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

#profit for each month 
profit <- revenue - expenses 
profit

#------messing around stuff---------------------

profitByMonth <- paste(months, profit)
typeof(profit) #still a double

for (i in profitByMonth){
  print(i) 
}
typeof(profit) #still a double

#-------------------

#profit after tax for each month
profitAfterTax <- round(profit * 0.7, digits = 2)
profitAfterTax


#profit margin for each month
profitMargin <- round(profitAfterTax / revenue, digits = 2) * 100
profitMargin


#good months (profit after tax greater than mean for the year)
meanYear <- mean(profitAfterTax)
meanYear

for (i in profitAfterTax){
  if (i > meanYear){
    print(i)
  }
}

#or 

goodMonths <- profitAfterTax > meanYear
goodMonths

#bad months (profit after tax less than mean for the year)
meanYear <- sum(profitAfterTax) / length(profitAfterTax)
meanYear

for (i in profitAfterTax){
  if (i < meanYear){
    print(i)
  }
}

badMonths <- !goodMonths
badMonths

#the best month
bestMonth <- profitAfterTax == max(profitAfterTax)
bestMonth

#the worst month
worstMonth <- profitAfterTax == min(profitAfterTax)
worstMonth

#units of thousands
revenue.1000 <- round(revenue / 1000, digits = 0)
expenses.1000 <- round(expenses / 1000, digits = 0)
profit.1000 <- round(profit / 1000, digits = 0)
profitAfterTax.1000 <- round(profitAfterTax / 1000, digits = 0) 

#output
revenue.1000
expenses.1000
profit.1000
profitAfterTax.1000
profitMargin
goodMonths
badMonths
bestMonth
worstMonth

#matrices
m <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profitAfterTax.1000,
  profitMargin,
  goodMonths,
  badMonths,
  bestMonth,
  worstMonth
)

m



