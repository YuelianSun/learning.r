source(here::here("R/package-loading.R"))

#dataframe
head(iris)
colnames(iris)
str(iris)
summary(iris)

# data wrangling ----------------------------------------------------------



# Exercise: Make code more readable ---------------------------------------

# Object names
# DayOne
day_one
#T <- FALSE
F <- FALSE
c <- 9
#mean <- function(x) sum(x)
sum_x <- function(x)
  sum(x)
# Spacing
#x[,1]
x[, 1]
#x[ , 1]
mean (x, na.rm = TRUE)
#mean( x, na.rm = TRUE )
function (x) {
}
#function(x){}
height <- feet * 12 + inches
mean(x, na.rm = 10)
#sqrt(x ^ 2 + y ^ 2)
sqrt(x ^ 2 + y ^ 2)
df$z
#x <- 1 : 10
x <- 1:10
# Indenting
if (y < 0 && debug)
  message("Y is negative")

summing <- function(a, b) {
  add_numbers <- a+b
  return(add_numbers)
}
summing(2, 3)
usethis::use_r("package-loading.R")
write_csv(iris, here::here("data/iris.csv"))
iris_data <- read_csv(here::here("data/iris.csv"))
head(iris_data)


