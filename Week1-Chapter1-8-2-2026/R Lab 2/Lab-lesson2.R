# "Time series graphics"
# "Lab Session 2"

#install.packages(c( "tidyverse", "fpp3")) 

library(fpp3)
library(tidyverse)

global_economy
tourism

# Creating tsibble
set.seed(1)
ts <- tsibble(time = seq(36),
              y = rnorm(36), 
              index = time) 
ts


mydata <- tsibble(
  year = 2016:2020,
  y = c(123, 39, 78, 52, 110),
  index = year)

mydata


# Creating tsibble from tibble
mytibble <- tibble(
  year = 2012:2016,
  y = c(123, 39, 78, 52, 110)
) 
mytibble # This is a tibble

mytsibble <- mytibble %>%
  as_tsibble(index = year)
mytsibble  # This is a tsibble




## Pipe
head(as_tsibble(mytibble, 
                index = year))
mytibble %>% 
  as_tsibble(index = year) %>% 
  head()

z <- tibble(
  Month = paste(2019, month.abb[1:5]), Observation = c(50, 23, 34, 30, 25))
z

z %>%
  mutate(Month = yearmonth(Month)) %>% 
  as_tsibble(index = Month)
