# DQAgui - A graphical user interface (GUI) to the functions implemented in the
# R package 'DQAstats'.
# Copyright (C) 2019-2020 Universitätsklinikum Erlangen
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

#' @title module_log_server
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
# module_log_server
module_log_server <-
  function(input, output, session, rv, input_re) {
    path_with_file <- paste0(logfile_dir, "logfile.log")

    # This reader scans the logfile for changes every 500 ms and
    # pupulates the changes to the GUI.
    rawText <-
      reactiveFileReader(
        intervalMillis = 500,
        filePath = path_with_file,
        readFunc = readLines,
        session = session
      )

    output$moduleLog_log_logging_content <- renderUI({
      # Split the text into a list of character vectors so
      # each element in the list contains one line:
      splitText <-
        stringi::stri_split(str = rawText(), regex = '\\n')
      # wrap a paragraph tag around each element in the list:
      replacedText <- lapply(splitText, p)
      return(replacedText)
    })

    # Button to scroll down:
    observeEvent(input$moduleLog_scrolldown_btn, {
      shinyjs::runjs("window.scrollTo(0,document.body.scrollHeight);")
    })

    # Button to scroll up:
    observeEvent(input$moduleLog_scrollup_btn, {
      shinyjs::runjs("window.scrollTo(0,0);")
    })

  }

#' @title module_log_ui
#'
#' @param id A character. The identifier of the shiny object
#'
#' @export
#'
# module_log_ui
module_log_ui <- function(id) {
  ns <- NS(id)
  tagList(fluidRow(
    h2('Logging information'),
    tags$head(tags$style(".logmsg p {
                                      font-family: 'consolas';
                                      line-height: 1;
                                      margin: 0px 0px 2px 0px;
                                      padding-left: 5%;
                                      text-indent:-5%;
                                    }")),
    box(
      width = 12,
      actionButton(
        inputId = ns("moduleLog_scrolldown_btn"),
        label = "Scroll to bottom",
        icon = icon("chevron-down")
      ),
      tags$br(),
      tags$br(),
      uiOutput(ns('moduleLog_log_logging_content'),
               class = "logmsg"),
      actionButton(
        inputId = ns("moduleLog_scrollup_btn"),
        label = "Scroll to top",
        icon = icon("chevron-up")
      ),
    )
  ))
}
