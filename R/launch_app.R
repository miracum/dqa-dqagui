#' @title Launch the DQA graphical user interface (GUI)
#'
#' @param port The port, DQAgui is running on (default: 3838)
#'
#' @return DQAgui Shiny application
#'
#' @import shiny shinydashboard
#' @importFrom magrittr "%>%"
#' @importFrom data.table .N ":="
#'
#' @export
#'

launchApp <- function(port=3838){
  options(shiny.port = port)
  shiny::shinyAppDir(appDir = system.file("application", package = "DQAgui"))
}
