#Chart3
jail_pop_data_state <- group_by(raw.data, county_name, year, total_jail_pop) %>% 
  filter(year == 2010)
jail_pop_data_state <- group_by(raw.data,state) %>% 
  summarize(total_jail_pop = sum(total_jail_pop, na.rm = TRUE))

state_shape <- map_data('state')
state_abbrevs <- data.frame(state.abb, state.name)
jail_pop_data_state <- left_join(jail_pop_data_state, state_abbrevs, by=c('state'= 'state.abb'))
jail_pop_data_state <- jail_pop_data_state %>%  mutate(region = tolower(state.name))
state_shape <- left_join(state_shape, jail_pop_data_state)

ggplot(state_shape)+
  geom_polygon(mapping = aes(x = long, y = lat, group = group, fill = total_jail_pop)) +
  scale_fill_continuous(low = 'white', high ='blue', labels = scales::label_number_si()) +
  labs(title = "The total jail population in 2010 by states")
