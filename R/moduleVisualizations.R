#' @title moduleVisualizationsServer
#'
#' @param input Shiny server input object
#' @param output Shiny server output object
#' @param session Shiny session object
#' @param rv The global 'reactiveValues()' object, defined in server.R
#' @param input_re The Shiny server input object, wrapped into a reactive expression: input_re = reactive({input})
#'
#' @export
#'
# moduleVisualizationsServer
moduleVisualizationsServer <- function(input, output, session, rv, input_re){

  output$visualizations_plot <- renderPlot({
    graphics::hist(stats::rnorm(10000))
  })
}

#' @title moduleVisualizationsUI
#'
#' @param id A character. The identifier of the shiny object
#'
#' @export
#'
# moduleVisualizationsUI
moduleVisualizationsUI <- function(id){
  ns <- NS(id)

  tagList(
    tagList(
      plotOutput(ns("visualizations_plot"))
    )
  )
}
