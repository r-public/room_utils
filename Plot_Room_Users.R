library(rworldmap)
library(ggmap)
library(rvest)

get_location <- function(rel_url){
  user_page <- paste0('http://www.stackoverflow.com/',rel_url,'?tab=profile')
  return(user_page %>% read_html() %>% html_nodes('.user-links') %>% html_nodes(xpath = "//span[@class='icon-location']/..") %>% html_text(trim = TRUE))
}

room_page <- "http://chat.stackoverflow.com/rooms/info/25312/r-public"
room_users <- room_page %>% read_html() %>% html_node('#room-usercards-container') %>% html_nodes('h3') %>%  html_nodes('a') %>% html_attr("href")

room_owners <- room_page %>% read_html() %>% html_node('#room-ownercards') %>% html_nodes('h3') %>%  html_nodes('a') %>% html_attr("href")

list_of_loc_names <- as.character(lapply(room_users,get_location))
list_of_gcodes <- t(sapply(list_of_loc_names[list_of_loc_names!="character(0)"],geocode))
final <- as.data.frame(list_of_gcodes)
newmap <- getMap(resolution = "low")
plot(newmap)
points(final$lon,final$lat,col='red',cex=2,pch=21)
