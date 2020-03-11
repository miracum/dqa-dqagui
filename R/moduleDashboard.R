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


#' @title module_dashboard_server
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
# module_dashboard_server
module_dashboard_server <-
  function(input, output, session, rv, input_re) {
    output$dash_instruction <- renderText({
      paste0(
        "Please load your metadata repository first and then configure ",
        "and test your source and target parameters in the config tab.\n",
        "Results will be displayed here afterwards."
      )
    })

    observe({
      req(rv$start)

      # load all data here
      if (isTRUE(rv$getdata_target) && isTRUE(rv$getdata_source)) {
        # tryCatch({

        stopifnot(length(rv$source$system_type) == 1)


        reactive_to_append <- DQAstats::create_helper_vars(
          mdr = rv$mdr,
          target_db = rv$target$system_name,
          source_db = rv$source$system_name
        )

        # workaround, to keep "rv" an reactiveValues object in shiny app
        #% (rv <- c(rv, reactive_to_append)) does not work!
        for (i in names(reactive_to_append)) {
          rv[[i]] <- reactive_to_append[[i]]
        }
        rm(reactive_to_append)
        invisible(gc())


        # set start_time (e.g. when clicking the 'Load Data'-button in shiny
        rv$start_time <- format(Sys.time(), usetz = T, tz = "CET")

        # load source data:
        temp_dat <- DQAstats::data_loading(
          rv = rv,
          system = rv$source,
          keys_to_test = rv$keys_source
        )
        rv$data_source <- temp_dat$outdata
        rv$source$sql <- temp_dat$sql_statements
        rm(temp_dat)
        invisible(gc())

        # load target_data
        if (rv$target$system_name != rv$source$system_name) {
          # load target
          temp_dat <- DQAstats::data_loading(
            rv = rv,
            system = rv$target,
            keys_to_test = rv$keys_target
          )
          rv$data_target <- temp_dat$outdata
          rv$target$sql <- temp_dat$sql_statements
          rm(temp_dat)
          invisible(gc())
        } else {
          rv$data_target <- rv$data_source
        }

        if (nrow(rv$pl$atemp_vars) != 0) {
          # get atemporal plausibilities
          rv$data_plausibility$atemporal <-
            DQAstats::get_atemp_plausis(
              rv = rv,
              atemp_vars = rv$pl$atemp_vars,
              mdr = rv$mdr,
              headless = rv$headless
            )


          # add the plausibility raw data to data_target and data_source
          for (i in names(rv$data_plausibility$atemporal)) {
            for (k in c("source_data", "target_data")) {
              w <- gsub("_data", "", k)
              raw_data <- paste0("data_", w)
              rv[[raw_data]][[i]] <-
                rv$data_plausibility$atemporal[[i]][[k]][[raw_data]]
              rv$data_plausibility$atemporal[[i]][[k]][[raw_data]] <-
                NULL
            }
            gc()
          }
        }

        # calculate descriptive results
        rv$results_descriptive <-
          DQAstats::descriptive_results(rv = rv,
                                        headless = rv$headless)

        # get time_interval
        # TODO hardcoded for MIRACUM
        rv$time_interval <-
          DQAstats::time_interval(
            rv$results_descriptive[["Entlassungsdatum"]]
          )


        if (!is.null(rv$data_plausibility$atemporal)) {
          # calculate plausibilites
          rv$results_plausibility_atemporal <-
            DQAstats::atemp_pausi_results(
              rv = rv,
              atemp_vars = rv$data_plausibility$atemporal,
              mdr = rv$mdr,
              headless = rv$headless
            )
        }

        if (nrow(rv$pl$uniq_vars) != 0) {
          rv$results_plausibility_unique <- DQAstats::uniq_plausi_results(
            rv = rv,
            uniq_vars = rv$pl$uniq_vars,
            mdr = rv$mdr,
            headless = rv$headless
          )
        }

        # delete raw data
        rv$data_source <- NULL
        rv$data_target <- NULL
        gc()

        # conformance
        rv$conformance$value_conformance <-
          DQAstats::value_conformance(
            results = rv$results_descriptive,
            logfile_dir = rv$log$logfile_dir,
            headless = rv$headless
          )

        # reduce categorical variables to display max. 25 values
        rv$results_descriptive <-
          DQAstats::reduce_cat(data = rv$results_descriptive,
                               levellimit = 25)
        invisible(gc())

        if (!is.null(rv$results_plausibility_atemporal)) {
          add_value_conformance <- DQAstats::value_conformance(
            results = rv$results_plausibility_atemporal,
            logfile_dir = rv$log$logfile_dir,
            headless = rv$headless
          )

          # workaround, to keep "rv" an reactiveValues object in shiny app
          for (i in names(add_value_conformance)) {
            rv$conformance$value_conformance[[i]] <- add_value_conformance[[i]]
          }
          rm(add_value_conformance)
        }
        # completeness
        rv$completeness <-
          DQAstats::completeness(
            results = rv$results_descriptive,
            logfile_dir = rv$log$logfile_dir,
            headless = rv$headless
          )

        # generate datamap
        rv$datamap <- DQAstats::generate_datamap(
          results = rv$results_descriptive,
          db = rv$target$system_name,
          mdr = rv$mdr,
          rv = rv,
          headless = rv$headless
        )
        print(rv$datamap)

        # checks$value_conformance
        rv$checks$value_conformance <-
          DQAstats::value_conformance_checks(
            results = rv$conformance$value_conformance)

        # checks$etl
        rv$checks$etl <-
          DQAstats::etl_checks(results = rv$results_descriptive)


        # get time_interval
        rv$time_interval <-
          DQAstats::time_interval(
            data = rv$results_descriptive$EpisodeOfCare_period_end)

        # set flag that we have all data
        rv$getdata_target <- FALSE
        rv$getdata_source <- FALSE

        # set flag to create report here
        rv$create_report <- TRUE
      }
    })


    # observe for load data button
    observe({
      if (!is.null(rv$db_con_target)) {
        shinyjs::hide("dash_instruction")
        return(TRUE)
      }
    })


    # render dashboard summary
    observe({
      req(rv$datamap$target_data)

      output$dash_datamap_target <- renderUI({
        outlist <- list(
          h5(tags$b(paste0("System name: ", rv$target$system_name))),
          tags$hr(),
          tableOutput("moduleDashboard-dash_datamap_target_tbl")
        )
        do.call(tagList, outlist)
      })

      output$dash_datamap_target_tbl <- renderTable({
        tab <- rv$datamap$target_data
        colnames(tab) <-
          c("Variable", "# n", "# Valid", "# Missing", "# Distinct")
        tab
      })
    })

    observe({
      req(rv$datamap$source_data)

      output$dash_datamap_source <- renderUI({
        outlist <- list(
          h5(tags$b(paste0("System name: ", rv$source$system_name))),
          tags$hr(),
          tableOutput("moduleDashboard-dash_datamap_source_tbl")
        )
        do.call(tagList, outlist)
      })

      output$dash_datamap_source_tbl <- renderTable({
        tab <- rv$datamap$source_data
        colnames(tab) <-
          c("Variable", "# n", "# Valid", "# Missing", "# Distinct")
        tab
      })
    })

    observe({
      req(rv$aggregated_exported)

      # workaround to tell ui, that db_connection is there
      output$etl_results <- reactive({
        return(TRUE)
      })
      outputOptions(output, "etl_results", suspendWhenHidden = FALSE)

      output$dash_quick_etlchecks <- DT::renderDataTable({
        render_quick_checks(rv$checks$etl)
      })
    })

    observe({
      req(rv$aggregated_exported)

      # workaround to tell ui, that db_connection is there
      output$valueconformance_results <- reactive({
        return(TRUE)
      })
      outputOptions(output,
                    "valueconformance_results",
                    suspendWhenHidden = FALSE)

      output$dash_quick_val_conf_checks <-
        DT::renderDataTable({
          render_quick_checks(rv$checks$value_conformance)
        })
    })

    # observe rv$duration
    observe({
      req(rv$duration)
      output$dash_instruction <- renderText({
        paste0(
          "Started: ",
          rv$start_time,
          "\nFinished: ",
          rv$end_time,
          "\nDuration: ",
          round(rv$duration, 2),
          " min."
        )
      })
      shinyjs::show("dash_instruction")
    })
  }


#' @title module_dashboard_ui
#'
#' @param id A character. The identifier of the shiny object
#'
#' @export
#'
# module_dashboard_ui
module_dashboard_ui <- function(id) {
  ns <- NS(id)

  tagList(fluidRow(
    box(
      title = "Welcome to your Data-Quality-Analysis Dashboard",
      verbatimTextOutput(ns("dash_instruction")),
      width = 12
    ),
    column(
      6,
      conditionalPanel(
        condition = "output['moduleDashboard-etl_results']",
        box(
          title = "Completeness Checks (Validation): ",
          helpText(
            paste0(
              "Completeness checks (validation) evaluate the ",
              "'correctness' of the ETL (extract transform load) jobs. ",
              "They compare for each variable the exact matching ",
              "of the number of distinct values, the number of ",
              "valid values, and the number of missing values ",
              "between the source data system and the target data system."
            )
          ),
          DT::dataTableOutput(ns("dash_quick_etlchecks")),
          width = 12
        )
      ),
      conditionalPanel(
        condition = "output['moduleDashboard-valueconformance_results']",
        box(
          title = "Value Conformance Checks (Verification): ",
          helpText(
            paste0(
              "Value conformance checks (verification) compare for ",
              "each variable the values of each data system to ",
              "predefined constraints. Those constraints can be ",
              "defined for each variable and data system individually ",
              "in the metadata repository (MDR)."
            )
          ),
          DT::dataTableOutput(ns("dash_quick_val_conf_checks")),
          width = 12
        )
      )
    ),
    column(
      6,
      conditionalPanel(
        condition = "output['moduleDashboard-etl_results']",
        box(
          title = "Target System Overview (Data Map)",
          uiOutput(ns("dash_datamap_target")),
          tags$hr(),
          actionButton(
            ns("dash_send_datamap_btn"),
            "Send Datamap",
            icon = icon("server")
          ),
          width = 12
        ),
        box(
          title = "Source System Overview",
          uiOutput(ns("dash_datamap_source")),
          width = 12
        )
      )
    )
  ))
}
