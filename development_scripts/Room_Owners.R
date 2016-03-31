#Code to list the room owners

library(rvest)
room_page <- "http://chat.stackoverflow.com/rooms/info/25312/r-public"
list_of_names <- room_page %>% read_html() %>% html_node('#room-ownercards') %>% 
  html_nodes('h3') %>%  html_text(trim = TRUE)

