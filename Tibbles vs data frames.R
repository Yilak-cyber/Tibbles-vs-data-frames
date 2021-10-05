##########################
# Tibbles vs data frames #
##########################


# R Studio Blog 
# tibble 1.0.0
# Hadley Wickham 2016-03-24
# Tibbles are a modern reimagining of the data.frame, keeping what time has 
  # proven to be effective, and throwing out what is not. 

install.packages("tibble")
library(tidyverse)

# Creating tibbles


#You can create a tibble from an existing object with as_data_frame():
as_data_frame(iris)
# This works for data frames, lists, matrices, and tables.
# You can also create a new tibble from individual vectors with data_frame():
data_frame(x = 1:5, y = 1, z = x ^ 2 + y)
# data_frame() does much less than data.frame(): 
# it never changes the type of the inputs (e.g. it never converts strings 
  # to factors!), 
# it never changes the names of variables, and it never creates row.names().
# You can define a tibble row-by-row with frame_data():

frame_data(
  ~x, ~y,  ~z,
  "a", 2,  3.6,
  "b", 1,  8.5
)
tribble(
  ~x, ~y,  ~z,
  "a", 2,  3.6,
  "b", 1,  8.5
)

# Tibbles vs data frames
# There are two main differences in the usage of a data frame vs a tibble: 
  # printing, and subsetting.
# Tibbles have a refined print method that shows only the first 10 rows, 
  # and all the columns that fit on screen. This makes it much easier to work with large data. In addition to its name, each column reports its type, a nice feature borrowed from str():
install.packages(nycflights13)
library(nycflights13)
flights
# Tibbles also clearly delineate [ and [[: [ always returns another tibble, 
  # [[ always returns a vector. No more drop = FALSE!
class(iris[ , 1])
#> [1] "numeric"
class(iris[ , 1, drop = FALSE])
#> [1] "data.frame"
class(as_data_frame(iris)[ , 1])
#> [1] "tbl_df"     "tbl"        "data.frame"
str(flights)
A<-data.frame(flights)


xtabs(~month+carrier, data=A)