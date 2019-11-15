# DQAgui - A graphical user interface (GUI) to the functions implemented in the
# R package 'DQAstats'.
# Copyright (C) 2019 Universitätsklinikum Erlangen
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

#' @title module_visualizations_server
#'
#' @param input Shiny server input object
#' @param output Shiny server output object
#' @param session Shiny session object
#' @param rv The global 'reactiveValues()' object, defined in server.R
#' @param input_re The Shiny server input object, wrapped into a reactive
#'   expression: input_re = reactive({input})
#'
#' @export
#'
# module_visualizations_server
module_visualizations_server <- function(input,
                                         output,
                                         session,
                                         rv,
                                         input_re) {

  output$visualizations_plot <- renderPlot({
    graphics::hist(stats::rnorm(10000))
  })
}

#' @title module_visualizations_ui
#'
#' @param id A character. The identifier of the shiny object
#'
#' @export
#'
# module_visualizations_ui
module_visualizations_ui <- function(id) {
  ns <- NS(id)

  tagList(
    tagList(
      plotOutput(ns("visualizations_plot"))
    )
  )
}
