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


#' @title module_config_server
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
# module_config_server
module_config2_server <- function(input, output, session, rv, input_re) {

  # load mdr
  observeEvent(
    eventExpr = input_re()[["moduleConfig-config_load_mdr"]],
    handlerExpr = {

      if (is.null(rv$mdr)) {

        cat("\nRead MDR\n")
        # TODO hard-coded
        rv$mdr_filename <- mdr_filename

        # read MDR
        rv$mdr <- DQAstats::read_mdr(utils_path = rv$utilspath,
                                     mdr_filename = mdr_filename)
        stopifnot(data.table::is.data.table(rv$mdr))

        # populate radio buttons
        updateRadioButtons(
          session = session,
          inputId = "config_source_system_type",
          choices = rv$mdr[, unique(get("source_system_type"))],
          selected = character(0)
        )

        # workaround to tell ui, that mdr is there
        output$mdr_present <- reactive({
          return(TRUE)
        })
        outputOptions(output, "mdr_present", suspendWhenHidden = FALSE)

        # workaround to tell ui, that mdr is there
        output$source_system_type <- reactive({
          return(input_re()[["moduleConfig-config_source_system_type"]])
        })
        outputOptions(output, "source_system_type", suspendWhenHidden = FALSE)
      }

      # # read system_types
      # rv$source$system_type <-
      #   rv$mdr[get("source_system_name") ==
      #            rv$source$system_name, unique(get("source_system_type"))]
      # rv$target$system_type <-
      #   rv$mdr[get("source_system_name") ==
      #            rv$target$system_name, unique(get("source_system_type"))]
      #
      #
      # # We only allow one (system) type per system name. There can't e.g. be
      # # system types "csv" and "postgres" both with the system_name "data":
      # stopifnot(length(rv$source$system_type) == 1)
      #
      # reactive_to_append <- DQAstats::create_helper_vars(
      #   mdr = rv$mdr,
      #   target_db = rv$target$system_name,
      #   source_db = rv$source$system_name
      # )
      # # workaround, to keep "rv" an reactiveValues object in shiny app
      # # (rv <- c(rv, reactive_to_append)) does not work!
      # for (i in names(reactive_to_append)) {
      #   rv[[i]] <- reactive_to_append[[i]]
      # }
      # rm(reactive_to_append)
      # invisible(gc())
    })
}

#' @title module_config_ui
#'
#' @param id A character. The identifier of the shiny object
#'
#' @export
#'
# module_config_ui
module_config2_ui <- function(id) {
  ns <- NS(id)

  tagList(fluidRow(
    conditionalPanel(
      condition = "typeof output['moduleConfig-mdr_present'] == 'undefined'",
      box(
        title = "Load Metadata Repository",
        actionButton(ns("config_load_mdr"), "Load MDR"),
        width = 6
      )
    ),
    conditionalPanel(
      condition = "output['moduleConfig-mdr_present']",
      column(6,
             box(
               title = "Source Data System",
               radioButtons(ns("config_source_system_type"),
                            label = "Select System Type",
                            choices = list(""),
                            selected = character(0)),
               width = 12
             ),
             conditionalPanel(
               condition = "output['moduleConfig-source_system_type'] == 'csv'",
               box(
                 title = "Target File Directory",
                 h5(tags$b(
                   paste(
                     "Please choose the directory of your",
                     "\u00A7",
                     "21 source data in csv format (default: '/home/input')."
                   )
                 )),
                 div(
                   class = "row",
                   div(
                     class = "col-sm-3",
                     shinyFiles::shinyDirButton(
                       ns("config_targetdir_in"),
                       "Target Dir",
                       "Please select the target file directory",
                       buttonType = "default",
                       class = NULL,
                       icon = NULL,
                       style = NULL
                     )
                   ),
                   div(class = "col-sm-9", verbatimTextOutput(ns(
                     "config_targetdir_out"
                   )))
                 ),
                 width = 12
               )
             )
      )
      )))
}
