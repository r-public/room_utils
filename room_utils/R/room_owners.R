#' Lists the Room Owners of a Specified Stack Overflow Room 
#' 
#' Lists the owners of a specified room.
#' 
#' @param room_id The ID number of the room you want to retrieve. Defaults to
#' \code{"25312"} which is the "R Public" room.
#' 
#' @return A character vector.
#' 
#' @examples 
#' 
#' room_owners()
#' room_owners("106")
#' 
#' @export
room_owners <- function(room_id = "25312") {
  url_stub(room_id) %>% 
    read_html %>% 
    html_node('#room-ownercards') %>% 
    html_nodes('h3') %>%
    html_text(trim = TRUE)
}
NULL