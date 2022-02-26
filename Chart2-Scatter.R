#Chart2
jail_pop_data <- summarize(group_by(raw.data, county_name, year, white_prison_pop_rate, black_prison_pop_rate, latinx_prison_pop_rate, total_prison_pop)) %>% 
  filter(year == 2015)

jail_pop_data <- group_by(raw.data, county_name) %>% 
  summarize (white_prison_pop_rate = sum (white_prison_pop_rate, na.rm = TRUE), black_prison_pop_rate = sum(black_prison_pop_rate, na.rm = TRUE), latinx_prison_pop_rate = sum(latinx_prison_pop_rate, na.rm = TRUE), total_prison_pop = sum (total_prison_pop, na.rm = TRUE))

white_prison_rate <- ggplot(jail_pop_data)+
  geom_point(mapping = aes(x = total_prison_pop, y = white_prison_pop_rate))+
  labs(title = "Correlation between white prison population rate and total prison population", x = "total prison population ", y = "white prison rate")

black_prison_rate <- ggplot(jail_pop_data)+
  geom_point(mapping = aes(x = total_prison_pop, y = black_prison_pop_rate))+
  labs(title = "Correlation between black prison population rate and total prison population", x = "total prison population ", y = "black prison rate")

latinx_prison_rate <- ggplot(jail_pop_data)+
  geom_point(mapping = aes(x = total_prison_pop, y = latinx_prison_pop_rate))+
  labs(title = "Correlation between latinx prison population rate and total prison population", x = "total prison population ", y = "latinx prison rate")

library(ggpubr)
ggarrange(white_prison_rate, black_prison_rate, latinx_prison_rate + rremove("x.text"), 
          ncol = 1, nrow = 3)