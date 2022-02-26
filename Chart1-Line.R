#Chart 1
five_states <-summarize(group_by(raw.data, state, year, total_pop)) %>% 
  filter(state == "WA" | state == "CA" | state == "TX" | state == "NY" | state == "MA")

five_states <- group_by(five_states, state, year) %>% 
  summarize(total_pop = sum(total_pop, na.rm = TRUE))

library(ggplot2)
ggplot(five_states) +
  geom_line(mapping = aes(x = year, y = total_pop, color = state))+
  labs(title = "Total population of different states from 1970 to 2018", x = "Year", y = "Total Population")
