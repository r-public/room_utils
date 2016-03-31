#' @import rvest ggmap leaflet rworldmap httr jsonlite data.table
NULL

#' @importFrom dplyr filter
NULL

### UTILS

url_stub <- function(room_id) {
  sprintf("http://chat.stackoverflow.com/rooms/info/%s", room_id)
}
NULL

getDots <- function(...) {
  sapply(substitute(list(...))[-1], function(x) {
    if (is.character(x)) x else deparse(x)
  }) 
} 
NULL
