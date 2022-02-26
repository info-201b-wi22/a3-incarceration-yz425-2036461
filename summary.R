library(dplyr)
raw.data <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")

avg_total_pop <- raw.data %>% 
  filter(year == 2002) %>%
  summarize(mean(total_pop))
#The average of total population across all counties in 2002

King_highest_female_pop_yr <- raw.data %>% 
  filter(fips == "53033") %>% 
  filter(female_pop_15to64 == max(female_pop_15to64)) %>% 
  pull(year)
#The year that King County, WA has the highest female population from 15 to 64

King_highest_male_pop_yr <- raw.data %>% 
  filter(fips == "53033") %>% 
  filter(male_pop_15to64 == max(male_pop_15to64)) %>% 
  pull(year)
#The year that King County, WA has the highest male population from 15 to 64

Lowest_jail_pop_2018 <-raw.data %>% 
  filter(year == 2018) %>% 
  filter(total_jail_pop == min(total_jail_pop, na.rm = TRUE)) %>% 
  pull(county_name)
#The county that has the largest land area

Highest_jail_pop_2018 <-raw.data %>% 
  filter(year == 2018) %>% 
  filter(total_jail_pop == max(total_jail_pop, na.rm = TRUE)) %>% 
  pull(county_name)
#The county that has the largest jail population in 2018



 