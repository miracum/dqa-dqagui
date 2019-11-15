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


#' @title module_mdr_server
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
# module_mdr_server
module_mdr_server <- function(input, output, session, rv, input_re) {
  # read mdr
  observe({
    req(rv$mdr)

    if (rv$db_target %in% rv$mdr[, unique(get("source_system_name"))]) {
      reactive_to_append <- DQAstats::create_helper_vars(
        mdr = rv$mdr,
        target_db = rv$db_target,
        source_db = rv$db_source
      )
      # workaround, to keep "rv" an reactiveValues object in shiny app
      # (rv <- c(rv, reactive_to_append)) does not work!
      for (i in names(reactive_to_append)) {
        rv[[i]] <- reactive_to_append[[i]]
      }

    } else {
      showModal(modalDialog("No keys for target database found in MDR.",
                            title = "No keys found"))
    }
  })

  output$mdr_table <- DT::renderDataTable({
    DT::datatable(rv$mdr, options = list(
      scrollX = TRUE,
      pageLength = 20,
      dom = "ltip"
    ))
  })
}


#' @title module_mdr_ui
#'
#' @param id A character. The identifier of the shiny object
#'
#' @export
#'
# module_mdr_ui
module_mdr_ui <- function(id) {
  ns <- NS(id)

  tagList(fluidRow(
    box(
      title = "DQ Metadatarepository",
      DT::dataTableOutput(ns("mdr_table")),
      width = 12
    )
  ))
}
