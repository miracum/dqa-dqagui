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
module_dashboard_server <- function(input, output, session, rv, input_re) {
  output$dash_instruction <- renderText({
    paste0(
      "Please load your metadata repository first and then configure ",
      "and test your database connection in the settings tab.\n",
      "Return here to load the data."
    )
  })

  observeEvent(input_re()[["moduleDashboard-dash_load_btn"]], {
    # check, if mdr is present. without mdr, we cannot perform any
    # further operations
    if (is.null(rv$mdr)) {
      shiny::showModal(
        shiny::modalDialog(title = "No MDR present",
                           "Please provide a metadata repository (MDR).")
      )

      # mdr is present:
    } else {
      # check if sitename is present
      if (nchar(input_re()[["moduleConfig-config_sitename"]]) < 2 ||
          any(grepl("\\s", input_re()[["moduleConfig-config_sitename"]]))) {
        # reset sql
        rv$sql_target <- NULL

        shiny::showModal(
          modalDialog(
            title = "Invalid values",
            paste0("No empty strings or spaces allowed in ",
                   "the site name configuration.")
          )
        )

        # site name is present
      } else {
        rv$sitename <- input_re()[["moduleConfig-config_sitename"]]

        # check if valid source path is present
        if (identical(rv$sourcefiledir, character(0)) ||
            any(grepl("\\s", rv$sourcefiledir)) ||
            is.null(rv$sourcefiledir)) {
          # reset sql
          rv$sql_target <- NULL

          shiny::showModal(
            modalDialog(
              title = "Invalid values",
              paste0("No empty strings or spaces allowed in the ",
                     "source file path configuration.")
            )
          )

          # valid sourcepath is present
        } else {
          test_source <-
            DQAstats::test_source_db(
              source_settings = list(dir = rv$sourcefiledir),
              source_db = rv$db_source,
              headless = rv$headless
            )

          if (is.null(test_source)) {
            # reset sql
            rv$sql_target <- NULL
          }
        }
      }
    }

    print(rv$sql_target)


    if (is.null(rv$sql_target)) {
      cat("\nSQL not loaded yet\n")

    } else {
      # set flags to inactivate config-widgets and start loading of
      # data
      rv$getdata_target <- TRUE
      rv$getdata_source <- TRUE

      if (!dir.exists(paste0(tempdir(), "/_settings/"))) {
        dir.create(paste0(tempdir(), "/_settings/"))
      }

      # save user settings
      writeLines(
        jsonlite::toJSON(
          list(
            "db" = rv$db_target,
            "source_path" = rv$sourcefiledir,
            "site_name" = rv$sitename
          ),
          pretty = T,
          auto_unbox = F
        ),
        paste0(tempdir(), "/_settings/global_settings.JSON")
      )
    }
  })

  observe({
    req(rv$start)

    # load all data here
    if (isTRUE(rv$getdata_target) && isTRUE(rv$getdata_source)) {
      # set start_time, when clicking the button
      rv$start_time <- format(Sys.time(), usetz = T, tz = "CET")

      # load source data
      rv$data_source <- DQAstats::load_source(
        rv = rv,
        keys_to_test = rv$keys_source,
        headless = rv$headless
      )

      # load target data
      rv$data_target <- DQAstats::load_target(
        rv = rv,
        keys_to_test = rv$keys_target,
        headless = rv$headless
      )

      # get atemporal plausibilities
      rv$data_plausibility$atemporal <- DQAstats::get_atemp_plausis(
        rv = rv,
        atemp_vars = rv$pl$atemp_vars,
        mdr = rv$mdr,
        headless = rv$headless
      )

      # add the plausibility raw data to data_target and data_source
      for (i in names(rv$data_plausibility$atemporal)) {
        for (k in c("source_data", "target_data")) {
          w <- gsub("_data", "", k)
          n_key <- paste0(i, "_", w)
          raw_data <- paste0("data_", w)
          rv[[raw_data]][[n_key]] <-
            rv$data_plausibility$atemporal[[i]][[k]][[raw_data]]
          rv$data_plausibility$atemporal[[i]][[k]][[raw_data]] <-
            NULL
        }
        gc()
      }

      # calculate descriptive results
      rv$results_descriptive <- DQAstats::descriptive_results(
        rv = rv,
        headless = rv$headless
      )

      # calculate plausibilites
      rv$results_plausibility_atemporal <- DQAstats::atemp_pausi_results(
        rv = rv,
        headless = rv$headless
      )
      rv$results_plausibility_unique <- DQAstats::uniq_plausi_results(
        rv = rv,
        uniq_vars = rv$pl$uniq_vars,
        mdr = rv$mdr,
        headless = rv$headless
      )

      # delete raw data (this is the earliest point, where we don't need
      # the raw data anymore)
      rv$data_source <- NULL
      rv$data_target <- NULL
      gc()

      # conformance
      rv$conformance$value_conformance <-
        DQAstats::value_conformance(
          results = rv$results_descriptive,
          headless = rv$headless
        )
      # reduce categorical variables to display max. 25 values
      rv$results_descriptive <- DQAstats::reduce_cat(
        data = rv$results_descriptive,
        levellimit = 25
      )
      invisible(gc())

      value_conformance <- DQAstats::value_conformance(
        results = rv$results_plausibility_atemporal,
        headless = rv$headless
      )

      # workaround, to keep "rv" an reactiveValues object in shiny app
      for (i in names(value_conformance)) {
        rv$conformance$value_conformance[[i]] <- value_conformance[[i]]
      }

      # completeness
      rv$completeness <- DQAstats::completeness(
        results = rv$results_descriptive,
        headless = rv$headless
      )

      # generate datamap
      rv$datamap <- DQAstats::generate_datamap(
        results = rv$results_descriptive,
        db = rv$db_target,
        mdr = rv$mdr,
        headless = rv$headless
      )

      # checks$value_conformance
      rv$checks$value_conformance <-
        DQAstats::value_conformance_checks(
          results = rv$conformance$value_conformance
        )

      # checks$etl
      rv$checks$etl <- DQAstats::etl_checks(
        results = rv$results_descriptive
      )

      # get time_interval
      rv$time_interval <- DQAstats::time_interval(
        data = rv$results_descriptive$EpisodeOfCare_period_end
      )

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
    output$dash_datamap_target <- renderTable({
      tab <- rv$datamap$target_data
      colnames(tab) <-
        c("Variable", "# n", "# Valid", "# Missing", "# Distinct")
      tab
    })
  })
  observe({
    req(rv$datamap$source_data)
    output$dash_datamap_source <- renderTable({
      tab <- rv$datamap$source_data
      colnames(tab) <-
        c("Variable", "# n", "# Valid", "# Missing", "# Distinct")
      tab
    })
  })

  observe({
    req(rv$checks$etl)

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
    req(rv$checks$value_conformance)

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

    # render mail button
    output$dash_mail_button <- renderUI({
      # encode datamap to json string
      json_string <-
        jsonlite::toJSON(c(
          list(
            "Sitename" = rv$sitename,
            "Lastrun" = as.character(rv$end_time),
            "Run duration" = as.character(round(rv$duration, 2))
          ),
          lapply(rv$datamap, function(x) {
            unname(split(x, seq_len(nrow(x))))
          })
        ))
      # to decode do
      #% jsonlite::fromJSON(jsonstring)

      tags$a(
        actionButton(
          "moduleDashboard-dash_send_datamap",
          "Send Data Map",
          icon = icon("envelope", lib = "font-awesome")
        ),
        # https://stackoverflow.com/questions/27650331/adding-an-email-
        # button-in-shiny-using-tabletools-or-otherwise
        # https://stackoverflow.com/questions/37795760/r-shiny-add-
        # weblink-to-actionbutton
        # https://stackoverflow.com/questions/45880437/r-shiny-use-onclick-
        # option-of-actionbutton-on-the-server-side
        # https://stackoverflow.com/questions/45376976/use-actionbutton-to-
        # send-email-in-rshiny

        href = paste0(
          "mailto:",
          rv$datamap_email,
          "?",
          "body=",
          utils::URLencode(
            paste0(
              "Site name: ",
              rv$sitename,
              "\n\n(this is an automatically created email)\n\n",
              "\n\nR-Package version 'DQAstats': ",
              utils::packageVersion("DQAstats"),
              "\nR-Package version 'DQAgui': ",
              utils::packageVersion("DQAgui"),
              "\n\nLast run: ",
              rv$end_time,
              "\nRun duration: ",
              round(rv$duration, 2),
              " min.",
              "\n\nDatamap (JSON):\n",
              json_string
            )
          ),
          "&subject=",
          paste0("'Data Map - '", rv$sitename)
        )
      )
    })
  })


  observeEvent(input_re()[["moduleDashboard-dash_send_datamap"]], {
    # https://stackoverflow.com/questions/27650331/adding-an-email-button-
    # in-shiny-using-tabletools-or-otherwise
    shinyjs::logjs("Send datamap")
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

  tagList(
    fluidRow(
      column(
        6,
        box(
          title = "Welcome to your Data-Quality-Analysis Dashboard",
          verbatimTextOutput(ns("dash_instruction")),
          conditionalPanel(condition = "output['moduleConfig-db_connection']",
                           actionButton(ns("dash_load_btn"), "Load data")),
          width = 12
        ),
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
            tableOutput(ns("dash_datamap_target")),
            tags$hr(),
            uiOutput(ns("dash_mail_button")),
            width = 12
          ),
          box(title = "Source System Overview",
              tableOutput(ns(
                "dash_datamap_source"
              )),
              width = 12)
        )
      )
    ))
}
