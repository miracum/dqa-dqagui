#' @title moduleMDRServer
#'
#' @param input Shiny server input object
#' @param output Shiny server output object
#' @param session Shiny session object
#' @param rv The global 'reactiveValues()' object, defined in server.R
#' @param input_re The Shiny server input object, wrapped into a reactive expression: input_re = reactive({input})
#'
#' @export
#'
# moduleMDRServer
moduleMDRServer <- function(input, output, session, rv, input_re){

  # read mdr
  observe({
    req(rv$db_target)
    if (is.null(rv$mdr)){
      cat("\nRead MDR\n")
      # read MDR
      rv$mdr <- DQAstats::readMDR_(utils)
    }

    if (rv$db_target %in% rv$mdr[,unique(get("source_system"))]){

      reactive_to_append <- DQAstats::createHelperVars_(mdr = rv$mdr, target_db = rv$db_target, source_db = rv$db_source)
      # workaround, to keep "rv" an reactiveValues object in shiny app
      # (rv <- c(rv, reactive_to_append)) does not work!
      for (i in names(reactive_to_append)){
        rv[[i]] <- reactive_to_append[[i]]
      }

    } else {
      showModal(modalDialog(
        "No keys for target database found in MDR.",
        title = "No keys found")
      )
    }
  })

  output$mdr_table <- DT::renderDataTable({
    DT::datatable(rv$mdr, options = list(scrollX = TRUE, pageLength = 20, dom="ltip"))
  })
}


#' @title moduleMDRUI
#'
#' @param id A character. The identifier of the shiny object
#'
#' @export
#'
# moduleMDRUI
moduleMDRUI <- function(id){
  ns <- NS(id)

  tagList(
    fluidRow(
      box(
        title = "DQ Metadatarepository",
        DT::dataTableOutput(ns("mdr_table")),
        width = 12
      )
    )
  )
}
