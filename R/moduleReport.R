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


#' @title module_report_server
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
# module_report_server
module_report_server <- function(input,
                               output,
                               session,
                               rv,
                               input_re) {

  observe({
    # wait here for flag to create report; this can be done, when everything
    # we need for the report is there
    req(rv$create_report)

    if (is.null(rv$report_created)) {
      DQAstats::create_markdown(
        rv = rv,
        utils_path = rv$utilspath,
        outdir = tempdir(),
        headless = rv$headless
      )
      rv$report_created <- TRUE
    }
  })

  # TODO swiched off for debugging
  # observe({
  #   req(rv$report_created)
  #
  #   # create export dir
  #   exportdir <- paste0(tempdir(), "/export/")
  #   cat("\nCreate ", exportdir, "\n\n")
  #   dir.create(exportdir)
  #
  #   # write files
  #   # datamap
  #   data.table::fwrite(
  #     x = rv$datamap$target_data,
  #     file = paste0(exportdir, "datamap_target.csv")
  #   )
  #   data.table::fwrite(
  #     x = rv$datamap$source_data,
  #     file = paste0(exportdir, "datamap_source.csv")
  #   )
  #
  #   # completeness
  #   data.table::fwrite(
  #     x = rv$checks$etl,
  #     file = paste0(exportdir, "etl_checks.csv")
  #   )
  #   data.table::fwrite(
  #     x = rv$completeness,
  #     file = paste0(exportdir, "completeness.csv")
  #   )
  #
  #   # conformance
  #   data.table::fwrite(
  #     x = rv$checks$value_conformance,
  #     file = paste0(exportdir, "value_conformance.csv")
  #   )
  # })


  output$download_report <- downloadHandler(
    filename = function() {
      paste0("DQA_report_",
             gsub("\\-|\\:| ",
                  "",
                  substr(rv$start_time, 1, 16)),
             "_",
             rv$sitename,
             ".pdf")
    },
    content = function(file) {
      file.copy(
        paste0(tempdir(),
               "/DQA_report_",
               gsub("\\-|\\:| ",
                    "",
                    substr(rv$start_time, 1, 16)),
               ".pdf"),
        file
      )
    },
    contentType = "application/pdf"
  )


  output$download_results <- downloadHandler(
    filename = function() {
      paste0("DQA_results_",
             gsub("\\-|\\:| ",
                  "",
                  substr(rv$start_time, 1, 16)),
             "_",
             rv$sitename,
             ".zip")
    },
    content = function(fname) {

      # temporarily set tempdir as wd
      oldwd <- getwd()
      setwd(tempdir())
      print(getwd())

      exportdir <- paste0(tempdir(), "/export/")

      # export files
      utils::zip(
        zipfile = fname,
        files = c(
          paste0("export/",
                 list.files(exportdir))
        ))

      # return to old wd
      setwd(oldwd)
      print(getwd())
    },
    contentType = "application/zip"
  )
}

#' @title module_report_ui
#'
#' @param id A character. The identifier of the shiny object
#'
#' @export
#'
# module_report_ui
module_report_ui <- function(id) {
  ns <- NS(id)

  tagList(
    fluidRow(
      column(6,
             box(
               title = "Reporting",
               downloadButton(
                 ns("download_report"),
                 "Download Report",
                 style = paste0(
                   "white-space: normal; ",
                   "text-align:center; ",
                   "padding: 9.5px 9.5px 9.5px 9.5px; ",
                   "margin: 6px 10px 6px 10px;")),
               width = 12
             )
      ),
      column(6,
             box(
               title = "Results",
               downloadButton(
                 ns("download_results"),
                 "Download Results (ZIP)",
                 style = paste0(
                   "white-space: normal; ",
                   "text-align:center; ",
                   "padding: 9.5px 9.5px 9.5px 9.5px; ",
                   "margin: 6px 10px 6px 10px;")),
               width = 12
             )
      )
    )
  )
}
