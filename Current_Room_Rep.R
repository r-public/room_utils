# Sum reputation of current room occupants

library(rvest)
room_page <- "http://chat.stackoverflow.com/rooms/info/25312/r-public"
current_room_rep <- room_page %>% read_html() %>% 
    html_node('#room-usercards-container') %>% 
    html_nodes('.reputation-score') %>% html_attr('title') %>% 
    as.integer() %>% sum()

