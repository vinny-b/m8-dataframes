# Exercise 4: Working with Data Frames

# Load R's "USPersonalExpenditure" dataest using the `data()` function
data("USPersonalExpenditure")


# The variable USPersonalExpenditure is now accessible to you. Unfortunately, it's not a data.frame
# Test this using the is.data.frame function
is.data.frame(USPersonalExpenditure)

# Luckily, you can simply pass the USPersonalExpenditure variable to the data.frame function
# to convert it a data.farme

# Create a new variable by passing the USPersonalExpenditure to the data.frame function
USP <- data.frame(USPersonalExpenditure)

# What are the column names of your dataframe?
colnames(USP)

# Why are they so strange?
"They're the years"

# What are the row names of your dataframe?
row.names(USP)

# Create a column `category` that is equal to your rownames
USP$category <- row.names(USP)

# How much money was spent on personal care in 1940?
USP[4,1]

# How much money was spent on Food and Tobacco in 1960
USP[1,5]

# What was the highest expenditure category in 1960?
USP$category[USP$X1960 == max(USP$X1960)]

### Bonus ###

# Write a function that takes in a year as a parameter, and 
# returns the highest spending category of that year
HighestSpendingFunction <- function(year){
  return(USP$category[USP[year] == max(USP[year])])

}
# Using your function, determine the highest spending category of each year
HighestSpendingFunction("X1960")

# Write a loop to cycle through the years, and store the highest spending category of
# each year in a list
highest <- list()
for(year in seq(1940, 1960, 5)) {
  year.index <- paste0('X', year)
  highest[year.index] <- HighestSpendingFunction(year.index)
}