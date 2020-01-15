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


#' @title module_descriptive_server
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
# module_descriptive_server
module_descriptive_server <-
  function(input, output, session, rv, input_re) {
    observe({
      req(rv$results_descriptive)

      # render select input here
      output$descr_selection_uiout <- renderUI({
        selectInput(
          inputId = "moduleDescriptive-var_select",
          label = "Select variable",
          choices = rv$variable_list,
          multiple = FALSE,
          selectize = FALSE,
          size = 10
        )
      })


      # generate output tables
      observeEvent(input_re()[["moduleDescriptive-var_select"]], {
        cat(input_re()[["moduleDescriptive-var_select"]], "\n")

        sel_ob <- input_re()[["moduleDescriptive-var_select"]]
        # get description object
        desc_out <- rv$results_descriptive[[sel_ob]]$description
        count_out <- rv$results_descriptive[[sel_ob]]$counts
        stat_out <- rv$results_descriptive[[sel_ob]]$statistics

        value_conf <- rv$conformance$value_conformance[[sel_ob]]


        output$descr_description <- renderText({
          d <- desc_out$source_data$description
          # https://community.rstudio.com/t/rendering-markdown-text/11588
          out <- knitr::knit2html(text = d, fragment.only = TRUE)
          # output non-escaped HTML string
          shiny::HTML(out)
        })

        # render source description
        output$descr_selection_descr_source <- renderTable({
          o <- desc_out$source_data
          c <- count_out$source_data
          data.table::data.table(
            " " = c(
              "Variable name:",
              "Source table:",
              "FHIR ressource:",
              "DQ-internal Variable Name:",
              "Variable type:"
            ),
            " " = c(
              o$var_name,
              o$table_name,
              o$fhir,
              c$cnt$variable,
              c$type
            )
          )

        })

        # render target description
        output$descr_selection_descr_target <- renderTable({
          o <- desc_out$target_data
          c <- count_out$target_data
          data.table::data.table(
            " " = c(
              "Variable name:",
              "Source table:",
              "FHIR ressource:",
              "DQ-internal Variable Name:",
              "Variable type:"
            ),
            " " = c(
              o$var_name,
              o$table_name,
              o$fhir,
              c$cnt$variable,
              c$type
            )
          )

        })

        # render source counts
        output$descr_selection_counts_source <- renderTable({
          tryCatch({
            o <-
              count_out$source_data$cnt[, c(
                "variable",
                "n",
                "valids",
                "missings",
                "distinct"
              ), with = F]
            data.table::data.table(
              " " = c(
                "n:",
                "Valid values:",
                "Missing values:",
                "Distinct values:"
              ),
              " " = c(o$n, o$valids, o$missings, o$distinct)
            )
          }, error = function(e) {
            shinyjs::logjs(e)
          })
        })

        # render target counts
        output$descr_selection_counts_target <- renderTable({
          tryCatch({
            o <-
              count_out$target_data$cnt[, c(
                "variable",
                "n",
                "valids",
                "missings",
                "distinct"
              ), with = F]
            data.table::data.table(
              " " = c(
                "n:",
                "Valid values:",
                "Missing values:",
                "Distinct values:"
              ),
              " " = c(o$n, o$valids, o$missings, o$distinct)
            )
          }, error = function(e) {
            shinyjs::logjs(e)
          })
        })


        # render source statistics
        output$descr_selection_source_table <- renderTable({
          stat_out$source_data
        })

        # render target statistics
        output$descr_selection_target_table <- renderTable({
          stat_out$target_data
        })



        # conformance source
        # render conformance checks (only if value set present)
        if (!is.na(desc_out$source_data$checks$constraints)) {
          # workaround to tell ui, that value_set is there
          output$got_valueset_s <- reactive({
            return(TRUE)
          })

          output$descr_checks_source <- renderUI({
            h <- h5(tags$b("Constraining values/rules:"))
            v <- verbatimTextOutput(
              outputId = "moduleDescriptive-descr_checks_source_valueset"
            )


            ch <- h5(tags$b("Value conformance:"))
            ce <-
              h5(paste0(
                "Conformance check: ",
                ifelse(
                  value_conf$source_data$conformance_error,
                  "failed",
                  "passed"
                )
              ))
            cu <-
              uiOutput("moduleDescriptive-descr_conformance_source")
            do.call(tagList, list(h, v, tags$hr(), ch, ce, cu))
          })

          json_obj_src <-
            jsonlite::fromJSON(desc_out$source_data$checks$constraints)

          if (desc_out$source_data$checks$var_type == "permittedValues") {
            output$descr_checks_source_valueset <- renderText({
              json_obj_src$value_set
            })
          } else if (desc_out$source_data$checks$var_type %in%
                     c("integer", "float")) {
            output$descr_checks_source_valueset <- renderPrint({
              json_obj_src$range
            })
          } else if (desc_out$source_data$checks$var_type ==
                     "string") {
            output$descr_checks_source_valueset <- renderText({
              json_obj_src$regex
            })
          }

          # render automatic conformance checks source
          # value conformance
          if (isTRUE(value_conf$source_data$conformance_error)) {
            output$descr_conformance_source <- renderUI({
              v <- verbatimTextOutput(
                outputId = "moduleDescriptive-descr_conform_source_results"
              )
              do.call(tagList, list(v))
            })

            output$descr_conform_source_results <- renderText({
              value_conf$source_data$conformance_results
            })
          } else {
            output$descr_conformance_source <- renderUI({

            })
          }

        } else {
          # workaround to tell ui, that value_set is not there
          output$got_valueset_s <- reactive({
            return(FALSE)
          })
        }
        outputOptions(output, "got_valueset_s", suspendWhenHidden = FALSE)


        # conformance target
        # render conformance checks (only if value set present)
        if (!is.na(desc_out$target_data$checks$constraints)) {
          # workaround to tell ui, that value_set is there
          output$got_valueset_t <- reactive({
            return(TRUE)
          })

          output$descr_checks_target <- renderUI({
            h <- h5(tags$b("Constraining values/rules:"))
            v <- verbatimTextOutput(
              outputId = "moduleDescriptive-descr_checks_target_valueset"
            )


            ch <- h5(tags$b("Value conformance:"))
            ce <-
              h5(paste0(
                "Conformance check: ",
                ifelse(
                  value_conf$target_data$conformance_error,
                  "failed",
                  "passed"
                )
              ))
            cu <-
              uiOutput("moduleDescriptive-descr_conformance_target")
            do.call(tagList, list(h, v, tags$hr(), ch, ce, cu))
          })

          json_obj_tar <-
            jsonlite::fromJSON(desc_out$target_data$checks$constraints)

          if (desc_out$target_data$checks$var_type ==
              "permittedValues") {
            output$descr_checks_target_valueset <- renderText({
              json_obj_tar$value_set
            })
          } else if (desc_out$target_data$checks$var_type %in%
                     c("integer", "float")) {
            output$descr_checks_target_valueset <- renderPrint({
              json_obj_tar$range
            })
          } else if (desc_out$target_data$checks$var_type ==
                     "string") {
            output$descr_checks_target_valueset <- renderText({
              json_obj_src$regex
            })
          }


          # render automatic conformance checks target
          # value conformance
          if (isTRUE(value_conf$target_data$conformance_error)) {
            output$descr_conformance_target <- renderUI({
              v <- verbatimTextOutput(
                outputId = "moduleDescriptive-descr_conform_target_results"
              )
              do.call(tagList, list(v))
            })

            output$descr_conform_target_results <- renderText({
              value_conf$target_data$conformance_results
            })
          } else {
            output$descr_conformance_target <- renderUI({

            })
          }

        } else {
          # workaround to tell ui, that value_set is not there
          output$got_valueset_t <- reactive({
            return(FALSE)
          })
        }
        outputOptions(output, "got_valueset_t", suspendWhenHidden = FALSE)

      })
    })
  }


#' @title module_descriptive_ui
#'
#' @param id A character. The identifier of the shiny object
#'
#' @export
#'
# module_descriptive_ui
module_descriptive_ui <- function(id) {
  ns <- NS(id)

  tagList(
    fluidRow(
      box(title = "Select variable",
          uiOutput(ns("descr_selection_uiout")),
          width = 4),
      box(title = "Description",
          htmlOutput(ns("descr_description")),
          width = 8)
    ),
    fluidRow(
      box(
        title = "Source Data System",
        width = 6,
        fluidRow(
          column(8,
                 h5(
                   tags$b("Metadata")
                 ),
                 tableOutput(
                   ns("descr_selection_descr_source")
                 )),
          column(4,
                 h5(
                   tags$b("Completeness Overview")
                 ),
                 tableOutput(
                   ns("descr_selection_counts_source")
                 ))),
        fluidRow(
          column(8,
                 h5(
                   tags$b("Results")
                 ),
                 tableOutput(
                   ns("descr_selection_source_table")
                 )),
          column(
            4,
            conditionalPanel(
              condition = "output['moduleDescriptive-got_valueset_s']",
              uiOutput(ns("descr_checks_source")))
          ))
      ),
      box(
        title = "Target Data System",
        width = 6,
        fluidRow(
          column(8,
                 h5(
                   tags$b("Metadata")
                 ),
                 tableOutput(
                   ns("descr_selection_descr_target")
                 )),
          column(4,
                 h5(
                   tags$b("Completeness Overview")
                 ),
                 tableOutput(
                   ns("descr_selection_counts_target")
                 ))),
        fluidRow(
          column(8,
                 h5(
                   tags$b("Results")
                 ),
                 tableOutput(
                   ns("descr_selection_target_table")
                 )),
          column(
            4,
            conditionalPanel(
              condition = "output['moduleDescriptive-got_valueset_t']",
              uiOutput(ns("descr_checks_target")))
          ))
      )
    ))
}
