#Code to list the room owners

library(rvest)
room_page <- read_html("http://chat.stackoverflow.com/rooms/info/25312/r-public")
list_of_names <- html_node(room_page,"div#room-ownercards")

