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

    observeEvent(input_re()[["moduleDashboard-dash_load_btn"]], {
      # Error flag: If an error occurs, the flag will be set to true
      # and the main calculation won't start:
      error_tmp <- F

      # check, if mdr is present. without mdr, we cannot perform any
      # further operations
      if (is.null(rv$mdr)) {
        feedback("Please provide a metadata repository (MDR).",
                 type = "No MDR present")
        error_tmp <- T
        # mdr is present:
      } else {
        # check if sitename is present
        if (nchar(input_re()[["moduleConfig-config_sitename"]]) < 2 ||
            any(grepl("\\s", input_re()[["moduleConfig-config_sitename"]]))) {
          # site name is missing:
          shiny::showModal(modalDialog(
            title = "Invalid values",
            paste0(
              "No empty strings or spaces allowed in ",
              "the site name configuration."
            )
          ))
          ## TODO: Delete the demo-sitename and re-enable the error_tmp
          rv$sitename <- "Demo"
          #% error_tmp <- T
        } else {
          # site name is present:
          rv$sitename <- input_re()[["moduleConfig-config_sitename"]]
        }

        feedback(paste0("Source system is ", rv$source$system_name),
                 findme = "1d61685355")
        feedback(paste0("Target system is ", rv$target$system_name),
                 findme = "eaf72ed747")


        if (!is.null(rv$source$system_type) &&
            !is.null(rv$target$system_type)) {
          # Check source setting:
          if (rv$source$system_type == "csv") {
            # Check if source-path is valid:
            if (typeof(rv$source$settings$dir) == "character" &&
                !is.null(rv$source$settings$dir) &&
                length(rv$source$settings$dir) > 0) {
              feedback("Source settings seem valid.",
                       findme = "c0bcc9aa31")
              # valid path, so check if files exist:
              test_source_csv <- DQAstats::test_csv(
                settings = rv$source$settings,
                source_db = rv$source$system_name,
                mdr = rv$mdr,
                headless = F
              )
              if (isTRUE(test_source_csv)) {
                feedback("All source csv-files were found.",
                         findme = "794c6f3160")
              } else{
                feedback("Some source csv-files are MISSING.",
                         type = "Error",
                         findme = "926b0c567c")
                error_tmp <- T
              }
            } else {
              # invalid path:
              feedback(
                print_this = "Source settings not valid.",
                type = "warning",
                findme = "10d5e79d44",
                ui = T
              )
              printme(
                paste0(
                  "rv$source$settings$dir = ",
                  rv$source$settings$dir,
                  "(d9b43110bb)"
                )
              )
              error_tmp <- T
            }
          } else if (rv$source$system_type == "postgres") {
            # Check if source-db settings are valid:
            if (!is.null(rv$source$settings)) {
              rv$source$db_con <-
                DQAstats::test_db(settings = rv$source$settings,
                                  headless = rv$headless)
              if (!is.null(rv$source$db_con)) {
                # valid
                printme("Source db-settings seem valid. (29cc920472)")
              } else {
                # invalid:
                feedback(
                  print_this = "Source db-settings not valid.",
                  type = "Warning",
                  findme = "c63e1ccaf0",
                  ui = T
                )
                printme(paste0(
                  "rv$source$settings = ",
                  rv$source$settings,
                  "(2d47f163a9)"
                ))
                error_tmp <- T
              }
            } else {
              # invalid 2:
              feedback(
                print_this = "Source db-settings are empty.",
                type = "Warning",
                findme = "127deaebca",
                ui = T
              )
              error_tmp <- T
            }
          } else {
            feedback(
              print_this = "Source system not yet implemented.",
              type = "Warning",
              findme = "d0f0bfa2f3",
              ui = T
            )
            error_tmp <- T
          }

          # Check target setting:
          if (rv$target$system_type == "csv") {
            # Check if target-path is valid:
            if (typeof(rv$target$settings$dir) == "character" &&
                !is.null(rv$target$settings$dir) &&
                length(rv$target$settings$dir) > 0) {
                           feedback("target settings seem valid.",
                       findme = "9979bb57ef")
              # valid path, so check if files exist:
              test_target_csv <- DQAstats::test_csv(
                settings = rv$target$settings,
                source_db = rv$target$system_name,
                mdr = rv$mdr,
                headless = F
              )
              print(test_target_csv)
              if (isTRUE(test_target_csv)) {
                feedback("All target csv-files were found.",
                         findme = "ff8203c831")
              } else{
                feedback("Some target csv-files are MISSING.",
                         type = "Error",
                         findme = "079525a7de")
                error_tmp <- T
              }
            } else {
              # invalid path:
              feedback(
                print_this = "Target settings not valid.",
                type = "Warning",
                findme = "f4cc32e068",
                ui = T
              )
              printme(paste0(
                "rv$target$settings$dir = ",
                rv$target$dir,
                "(43c81cb723)"
              ))
              error_tmp <- T
            }
          } else if (rv$target$system_type == "postgres") {
            # Check if target-db settings are valid:
            if (!is.null(rv$target$settings)) {
              rv$target$db_con <-
                DQAstats::test_db(settings = rv$target$settings,
                                  headless = rv$headless)
              if (!is.null(rv$target$db_con)) {
                # valid
                printme("Target db-settings seem valid. (79234d2ba0)")
              } else {
                # invalid:
                feedback(
                  print_this = "Target db-settings not valid.",
                  type = "Warning",
                  findme = "096341c4c1",
                  ui = T
                )
                printme(paste0(
                  "rv$target$settings = ",
                  rv$target$settings,
                  "(2d47f163a9)"
                ))
                error_tmp <- T
              }
            } else {
              # invalid 2:
              feedback(
                print_this = "Target db-settings are empty.",
                type = "Warning",
                findme = "8440a9e683",
                ui = T
              )
              error_tmp <- T
            }
          } else {
            feedback(
              print_this = "Target system not yet implemented.",
              type = "Warning",
              findme = "57b314a1a3",
              ui = T
            )
            error_tmp <- T
          }
        } else {
          feedback(
            print_this = "Either source or target system is not set.",
            type = "Warning",
            findme = "4e9400f8c9",
            ui = T
          )
          error_tmp <- T
        }
      }


      if (!error_tmp) {
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
              "source_system" = rv$source$settings,
              "target_system" = rv$target$settings,
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
          DQAstats::value_conformance(results = rv$results_descriptive,
                                      headless = rv$headless)

        # reduce categorical variables to display max. 25 values
        rv$results_descriptive <-
          DQAstats::reduce_cat(data = rv$results_descriptive,
                               levellimit = 25)
        invisible(gc())

        if (!is.null(rv$results_plausibility_atemporal)) {
          add_value_conformance <- DQAstats::value_conformance(
            results = rv$results_plausibility_atemporal,
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
          DQAstats::completeness(results = rv$results_descriptive,
                                 headless = rv$headless)

        # generate datamap
        rv$datamap <- DQAstats::generate_datamap(
          results = rv$results_descriptive,
          db = rv$target$system_name,
          mdr = rv$mdr,
          rv = rv,
          headless = rv$headless
        )

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

  tagList(fluidRow(
    box(
      title = "Welcome to your Data-Quality-Analysis Dashboard",
      verbatimTextOutput(ns("dash_instruction")),
      #conditionalPanel(condition = "output['moduleConfig-db_connection']",
      actionButton(ns("dash_load_btn"), "Load data"),
      #),
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
