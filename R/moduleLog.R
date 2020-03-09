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
    logfile_name <- "logfile.log"
    path_with_file <- paste0(rv$logfile_dir, logfile_name)

    updateSelectInput(
      session = session,
      inputId = "old_logfiles_list",
      choices = sort(list.files(rv$logfile_dir), decreasing = T)
    )

    observeEvent(input$old_logfiles_list, {
      logfile_name_old <- input$old_logfiles_list
      path_with_file_old <- paste0(rv$logfile_dir, logfile_name_old)
      if (logfile_name_old == "logfile.log") {
        # The current logfile was choosen so show it:
        rv$current_log <-
          reactive({
            paste0(raw_text(), collapse = "\n")
          })
        # ... and disable the button:
        shinyjs::hide("show_current_logfile_btn")
      } else if (logfile_name_old != "") {
        # An old logfile was choosen:
        DQAstats::feedback(
          print_this = paste0("Old logfile ",
                              logfile_name_old,
                              " was chosen to display."),
          findme = "0c1611bc47"
        )
        # ... so show it:
        path_with_file_old <- paste0(rv$logfile_dir, logfile_name_old)
        con <- file(path_with_file_old)
        rv$current_log <-
          reactive({
            paste(readLines(con), collapse = "\n")
          })
        close(con = con)
        # ... and show the button so switch back to current logfile:
        shinyjs::show("show_current_logfile_btn")
      }
    })

    observeEvent(input$show_current_logfile_btn, {
      # Show the current log:
      rv$current_log <-
        reactive({
          paste0(raw_text(), collapse = "\n")
        })
      # ... and show update the list of old logfiles to have the current
      # one selected:
      updateSelectInput(session = session,
                        inputId = "old_logfiles_list",
                        selected = "logfile.log")
    })

    observe({
      output$log_out <- renderText({
        rv$current_log()
      })
    })


    # This reader scans the logfile for changes every 500 ms and
    # pupulates the changes to the GUI.
    raw_text <-
      reactiveFileReader(
        intervalMillis = 500,
        filePath = path_with_file,
        readFunc = readLines,
        session = session
      )


    # Button to scroll down:
    observeEvent(input$moduleLog_scrolldown_btn, {
      shinyjs::runjs(
        paste0(
          "var element = document.getElementById('moduleLog-log_out');",
          "element.scrollTop = element.scrollHeight;"
        )
      )
    })

    # Button to scroll up:
    observeEvent(input$moduleLog_scrollup_btn, {
      shinyjs::runjs(
        paste0(
          "var element = document.getElementById('moduleLog-log_out');",
          "element.scrollTop = 0;"
        )
      )
    })



    output$download_logfile <- downloadHandler(
      filename = function() {
        filename_datetime <- format(Sys.time(), "%Y-%m-%d-%H%M%OS")
        paste0("logfile_", filename_datetime, ".log")
      },
      content = function(file) {
        file.copy(from = path_with_file, file)
      },
      contentType = "text/plain"
    )

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
    # Appearance of the console output:
    # 'padding-left' & 'text-intend' are for auto intending every line
    #   except the first one so that over-long sentences will clearly
    #   be intended after the word/line-wrap.
    # 'margin' & 'line-heigth' reduce the gap between two lines to show
    #   as much information as possible while still be good readable.
    tags$head(
      tags$style(
        ".logmsg p {
                                      font-family: 'consolas';
                                      line-height: 1;
                                      margin: 0px 0px 2px 0px;
                                      padding-left: 5%;
                                      text-indent:-5%;
                                    }"
      )
    ),
    box(
      title = "Log",
      verbatimTextOutput(ns("log_out")),
      tags$head(tags$style(
        paste0(
          "#moduleLog-log_out{overflow-y:scroll; ",
          "max-height: 70vh; background: ghostwhite;}"
        )
      )),
      actionButton(
        inputId = ns("moduleLog_scrolldown_btn"),
        label = "Scroll to bottom",
        icon = icon("chevron-down")
      ),
      actionButton(
        inputId = ns("moduleLog_scrollup_btn"),
        label = "Scroll to top",
        icon = icon("chevron-up")
      ),
      width = 9
    ),

    box(
      title = "Download Log File",
      div(
        class = "row",
        style = "text-align: center;",
        downloadButton(ns("download_logfile"), "Download Log File")),
      tags$hr(),
      selectInput(
        # This will be filled in the server part.
        inputId = ns("old_logfiles_list"),
        label = "Load old logfiles",
        choices = NULL,
        selected = NULL
      ),
      actionButton(
        inputId = ns("show_current_logfile_btn"),
        label = "Show current logfile",
        icon = icon("terminal")
      ),
      width = 3
    )
  ))
}
