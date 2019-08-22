# DQAgui - A graphical user interface (GUI) to the functions implemented in the R package 'DQAstats'.
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

#' @title moduleReportServer
#'
#' @param input Shiny server input object
#' @param output Shiny server output object
#' @param session Shiny session object
#' @param rv The global 'reactiveValues()' object, defined in server.R
#' @param input_re The Shiny server input object, wrapped into a reactive expression: input_re = reactive({input})
#'
#' @export
#'
# moduleReportServer
moduleReportServer <- function(input, output, session, rv, input_re){

  observe({
    # wait here for flag to create report; this can be done, when everything we need for the report is there
    req(rv$create_report)

    if (is.null(rv$report_created)){
      DQAstats::createMarkdown_(rv = rv, utils = rv$utilspath, outdir = tempdir(), headless = rv$headless)
      rv$report_created <- TRUE
    }
  })


  output$download_report <- downloadHandler(
    filename = function(){paste0("DQA_report_", gsub("\\-|\\:| ", "", substr(rv$start.time, 1, 16)), ".pdf")},
    content = function(file){
      file.copy(paste0(tempdir(), "/DQA_report_", gsub("\\-|\\:| ", "", substr(rv$start.time, 1, 16)), ".pdf"), file)
    },
    contentType = "application/pdf"
  )
}

#' @title moduleReportUI
#'
#' @param id A character. The identifier of the shiny object
#'
#' @export
#'
# moduleReportUI
moduleReportUI <- function(id){
  ns <- NS(id)

  tagList(
    fluidRow(
      box(title = "Reporting",
          downloadButton(ns("download_report"), "Download Report", style="white-space: normal; text-align:center;
                                                                  padding: 9.5px 9.5px 9.5px 9.5px;
                                                                  margin: 6px 10px 6px 10px;"),
          width = 6
      )
    )
  )
}
