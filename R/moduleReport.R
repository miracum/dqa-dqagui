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
    filename = function(){"DQA_report.pdf"},
    content = function(file){
      file.copy(paste0(tempdir(), "/DQA_report.pdf"), file)
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
