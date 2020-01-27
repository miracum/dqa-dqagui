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
module_config_server <-
  function(input, output, session, rv, input_re) {
    debugging <- T


    # filepath roots dir
    roots_src <- c(home = "/home/")

    # If source-csv-path-button is clicked, read the path and save it:
    # root-folder of shinyFiles::shinyDirChoose

    shinyFiles::shinyDirChoose(
      input = input,
      id = "config_targetdir_in",
      roots = roots_src
    )

    shinyFiles::shinyDirChoose(
      input = input,
      id = "config_sourcedir_in",
      roots = roots_src
    )
    # observe source file directory
    observeEvent(
      input$config_sourcedir_in,
      handlerExpr = {
        settingsdir_src <- shinyFiles::parseDirPath(
          roots = roots_src,
          selection = input_re()[["moduleConfig-config_sourcedir_in"]]
        )
        path_tmp <-
          as.character(DQAstats::clean_path_name(settingsdir_src))
        if (!identical(path_tmp, character(0)) &&
            !is.null(path_tmp) &&
            path_tmp != "") {
          rv$source$settings <- NULL
          rv$source$settings$dir <- path_tmp
        } else {
          # New source path is empty - Backup old path if existing:
          path_old_tmp <- rv$source$settings$dir
          if (!identical(path_old_tmp, character(0)) &&
              !is.null(path_old_tmp) &&
              path_old_tmp != "") {
            # Delete all old settings:
            rv$source$settings <- NULL
            # Re-assign the old path:
            rv$source$settings$dir <- path_old_tmp
          } else {
            # No old path exists so delete all settings:
            rv$source$settings <- NULL
          }
        }

        if (!identical(rv$source$settings$dir, character(0)) &&
            !is.null(rv$source$settings$dir) &&
            rv$source$settings$dir != "") {
          # workaround to tell ui, that it is there
          output$source_csv_dir <- reactive({
            printme(paste0("Source file dir: ",
                           rv$source$settings$dir))
            paste(rv$source$settings$dir)
          })
          outputOptions(output, "source_csv_dir", suspendWhenHidden = FALSE)
          rv$source$system_name <- input$source_csv_presettings_list
          rv$source$system_type <- "csv"
          output$source_system_feedback_txt <-
            renderText({
              feedback_txt(system = "CSV", type = "source")
            })
        }
      })

    # observe target file directory
    observeEvent(
      input$config_targetdir_in,
      handlerExpr = {
        settingsdir_tar <- shinyFiles::parseDirPath(
          roots = roots_src,
          selection = input_re()[["moduleConfig-config_targetdir_in"]]
        )
        path_tmp1 <-
          as.character(DQAstats::clean_path_name(settingsdir_tar))
        if (!identical(path_tmp1, character(0)) &&
            !is.null(path_tmp1) &&
            path_tmp1 != "") {
          rv$target$settings <- NULL
          rv$target$settings$dir <- path_tmp1
        } else {
          # New target path is empty - Backup old path if existing:
          path_old_tmp1 <- rv$target$settings$dir
          if (!identical(path_old_tmp1, character(0)) &&
              !is.null(path_old_tmp1) &&
              path_old_tmp1 != "") {
            # Delete all old settings:
            rv$target$settings <- NULL
            # Re-assign the old path:
            rv$target$settings$dir <- path_old_tmp1
          } else {
            # No old path exists so delete all settings:
            rv$target$settings <- NULL
          }
        }

        if (!identical(rv$target$settings$dir, character(0)) &&
            !is.null(rv$target$settings$dir) &&
            rv$target$settings$dir != "") {
          # workaround to tell ui, that it is there
          output$target_csv_dir <- reactive({
            printme(paste0("Target file dir: ",
                           rv$target$settings$dir))
            paste(rv$target$settings$dir)
          })
          outputOptions(output, "target_csv_dir", suspendWhenHidden = FALSE)
          rv$target$system_name <- input$target_csv_presettings_list
          rv$target$system_type <- "csv"
          output$target_system_feedback_txt <-
            renderText({
              feedback_txt(system = "CSV", type = "target")
            })
        }
      })


    # load mdr
    observeEvent(
      eventExpr = input_re()[["moduleConfig-config_load_mdr"]],
      handlerExpr = {
        if (is.null(rv$mdr)) {
          printme("Reading MDR ...")

          if (debugging)
            printme(paste0("MDR-Filename:", rv$mdr_filename))
          if (debugging)
            printme(paste0("rv$utilspath:", rv$utilspath))

          # read MDR
          rv$mdr <-
            DQAstats::read_mdr(utils_path = rv$utilspath,
                               mdr_filename = rv$mdr_filename)
          stopifnot(data.table::is.data.table(rv$mdr))

          ## Read in the settings
          # - Determine the different systems from mdr:
          vec <-
            c("source_table_name",
              "source_system_name",
              "source_system_type")
          rv$systems <- unique(rv$mdr[, vec, with = F])
          cat(paste0("\nDifferent systems found in MDR:\n"))

          # - Read the settings for all these systems:
          unique_systems <-
            rv$systems[!is.na(get("source_system_name")),
                       unique(get("source_system_name"))]
          rv$settings <-
            lapply(unique_systems, function(x)
              DQAstats::get_config(config_file = rv$config_file,
                                   config_key = tolower(x)))

          # - Different system-types:
          rv$system_types <-
            rv$systems[!is.na(get("source_system_type")),
                       unique(get("source_system_type"))]

          i <- 1
          for (systype in rv$system_types) {
            printme(paste0("System type ", i, " = ", systype))
            i <- i + 1
          }
          if (!("csv" %in% tolower(rv$system_types))) {
            # Remove CSV-Tabs:
            printme("Removing csv-tab from source ...")
            removeTab(inputId = "source_tabs", target = "CSV")

            printme("Removing csv-tab from target ...")
            removeTab(inputId = "target_tabs", target = "CSV")
          } else {
            csv_system_names <-
              rv$systems[get("source_system_type") == "csv" &
                           !is.na(get("source_system_name")),
                         unique(get("source_system_name"))]
            printme(cat("csv_system_names: ", csv_system_names))

            if (length(csv_system_names) > 0) {
              # Show buttons to prefill diff. systems presettings:
              # - Add a button/choice/etc. for each system:
              updateSelectInput(
                session = session,
                inputId = "source_csv_presettings_list",
                choices = csv_system_names)
              updateSelectInput(
                session = session,
                inputId = "target_csv_presettings_list",
                choices = csv_system_names)
            } else {
              # Hide the buttons/choices:
              updateSelectInput(
                session = session,
                inputId = "source_csv_presettings_list",
                choices = "No presets available")
              updateSelectInput(
                session = session,
                inputId = "target_csv_presettings_list",
                choices = "No presets available")
            }
          }
          if (!("postgres" %in% tolower(rv$system_types))) {
            # Remove Postgres-Tabs:
            printme("Removing postgres-tab from source ...")
            removeTab(inputId = "source_tabs", target = "PostgreSQL")

            printme("Removing postgres-tab from target ...")
            removeTab(inputId = "target_tabs", target = "PostgreSQL")
          } else{
            # Fill the tab with presettings
            # - filter for all system_names with
            #% system_type == postgres
            #% select source_system_name from
            #% rv$systems where source_system_type == postgres
            #% GROUP BY source_system_name
            postgres_system_names <-
              rv$systems[get("source_system_type") == "postgres" &
                           !is.na(get("source_system_name")),
                         unique(get("source_system_name"))]
            printme(cat(
              "postgres_system_names: ",
              postgres_system_names))

            if (length(postgres_system_names) > 0) {
              # Show buttons to prefill diff. systems presettings:
              # - Add a button/choice/etc. for each system:
              updateSelectInput(
                session = session,
                inputId = "source_pg_presettings_list",
                choices = postgres_system_names)
              updateSelectInput(
                session = session,
                inputId = "target_pg_presettings_list",
                choices = postgres_system_names)
            } else {
              # Hide the buttons/choices:
              updateSelectInput(
                session = session,
                inputId = "source_pg_presettings_list",
                choices = "No presets available")
              updateSelectInput(
                session = session,
                inputId = "target_pg_presettings_list",
                choices = "No presets available")
            }
          }
          # Optional: Set a tab as active with:
          #% updateTabItems(session = session,
          #%                inputId = "source_tabs",
          #%                selected = "TAB_TITLE")
          #% updateTabItems(session = session,
          #%                inputId = "target_tabs",
          #%                selected = "TAB_TITLE")



          # Store the system-types in output-variable to only
          # show these tabs on the config page:
          output$system_types <- reactive({
            rv$system_types
          })
          outputOptions(output,
                        "system_types",
                        suspendWhenHidden = FALSE)

          # workaround to tell ui, that mdr is there
          output$mdr_present <- reactive({
            return(TRUE)
          })
          outputOptions(output,
                        "mdr_present",
                        suspendWhenHidden = FALSE)

          # workaround to tell ui, that mdr is there
          output$source_system_type <- reactive({
            return(input_re()
                   [["moduleConfig-config_source_system_type"]])
          })
          outputOptions(output,
                        "source_system_type",
                        suspendWhenHidden = FALSE)
        }
      })


    # If the "load presets"-button was pressed, startload & show the presets:
    # observeEvent(input$source_pg_presettings_btn, {
    observeEvent(input$source_pg_presettings_list, {
      printme(
        paste0(
          "Input-preset ",
          input$source_pg_presettings_list,
          " was chosen as SOURCE.",
          " Loading presets ..."
        )
      )
      config_stuff <- DQAstats::get_config(
        config_file = rv$config_file,
        config_key = tolower(input$source_pg_presettings_list)
      )
      printme(paste(
        "Loaded successfully.",
        "Filling presets to global rv-object and UI ..."
      ))
      if (length(config_stuff) != 0) {
        updateTextInput(session = session,
                        inputId = "config_sourcedb_dbname",
                        value = config_stuff[["dbname"]])
        updateTextInput(session = session,
                        inputId = "config_sourcedb_host",
                        value = config_stuff[["host"]])
        updateTextInput(session = session,
                        inputId = "config_sourcedb_port",
                        value = config_stuff[["port"]])
        updateTextInput(session = session,
                        inputId = "config_sourcedb_user",
                        value = config_stuff[["user"]])
        updateTextInput(session = session,
                        inputId = "config_sourcedb_password",
                        value = config_stuff[["password"]])
      } else{
        updateTextInput(session = session,
                        inputId = "config_sourcedb_dbname",
                        value = "")
        updateTextInput(session = session,
                        inputId = "config_sourcedb_host",
                        value = "")
        updateTextInput(session = session,
                        inputId = "config_sourcedb_port",
                        value = "")
        updateTextInput(session = session,
                        inputId = "config_sourcedb_user",
                        value = "")
        updateTextInput(session = session,
                        inputId = "config_sourcedb_password",
                        value = "")
      }
    })

    #observeEvent(input$target_pg_presettings_btn, {
    observeEvent(input$target_pg_presettings_list, {
      printme(
        paste0(
          "Input-preset ",
          input$target_pg_presettings_list,
          " was chosen as TARGET",
          " Loading presets ..."
        )
      )
      config_stuff <- DQAstats::get_config(
        config_file = rv$config_file,
        config_key = tolower(input$target_pg_presettings_list)
      )
      printme(paste(
        "Loaded successfully.",
        "Filling presets to global rv-object and UI ..."
      ))
      if (length(config_stuff) != 0) {
        updateTextInput(session = session,
                        inputId = "config_targetdb_dbname",
                        value = config_stuff[["dbname"]])
        updateTextInput(session = session,
                        inputId = "config_targetdb_host",
                        value = config_stuff[["host"]])
        updateTextInput(session = session,
                        inputId = "config_targetdb_port",
                        value = config_stuff[["port"]])
        updateTextInput(session = session,
                        inputId = "config_targetdb_user",
                        value = config_stuff[["user"]])
        updateTextInput(session = session,
                        inputId = "config_targetdb_password",
                        value = config_stuff[["password"]])
      } else{
        updateTextInput(session = session,
                        inputId = "config_targetdb_dbname",
                        value = "")
        updateTextInput(session = session,
                        inputId = "config_targetdb_host",
                        value = "")
        updateTextInput(session = session,
                        inputId = "config_targetdb_port",
                        value = "")
        updateTextInput(session = session,
                        inputId = "config_targetdb_user",
                        value = "")
        updateTextInput(session = session,
                        inputId = "config_targetdb_password",
                        value = "")
      }
    })

    observeEvent(input$source_pg_test_connection, {
      rv$source$settings <-
        get_db_settings(input = input_re(), target = F)

      if (!is.null(rv$source$settings)) {
        rv$source$db_con <- DQAstats::test_db(settings = rv$source$settings,
                                              headless = rv$headless,
                                              timeout = 2)

        if (!is.null(rv$source$db_con)) {
          printme(
            paste0(
              "\nDB connection for ",
              input$source_pg_presettings_list,
              " successfully established\n"
            )
          )
          # shiny::showModal(modalDialog(
          #   title = paste0(
          #     input$source_pg_presettings_list,
          #     "-database connection successfully tested"
          #   ),
          #   paste0(
          #     "The connection to ",
          #     input$source_pg_presettings_list,
          #     " has been",
          #     " successfully established and tested."
          #   )
          # ))
          showNotification(
            paste0(
              "\U2714 Connection to ",
              input$source_pg_presettings_list,
              " established"
            )
          )
          rv$source$system_name <- input$source_pg_presettings_list
          rv$source$system_type <- "postgres"
          output$source_system_feedback_txt <-
            renderText({
              feedback_txt(system = "PostgreSQL", type = "source")
            })
        } else {
          showNotification(paste0(
            "\U2718 Connection to ",
            input$source_pg_presettings_list,
            " failed"
          ))
          rv$source$system <- ""
        }
      }

    })

    observeEvent(input$target_pg_test_connection, {
      rv$target$settings <-
        get_db_settings(input = input_re(), target = T)

      if (!is.null(rv$target$settings)) {
        rv$target$db_con <- DQAstats::test_db(settings = rv$target$settings,
                                              headless = rv$headless,
                                              timeout = 2)

        if (!is.null(rv$target$db_con)) {
          printme(
            paste0(
              "\nDB connection for ",
              input$target_pg_presettings_list,
              " successfully established\n"
            )
          )
          showNotification(
            paste0(
              "\U2714 Connection to ",
              input$target_pg_presettings_list,
              " established"
            )
          )
          rv$target$system_name <- input$target_pg_presettings_list
          rv$target$system_type <- "postgres"
          output$target_system_feedback_txt <-
            renderText({
              feedback_txt(system = "PostgreSQL", type = "target")
            })
        } else {
          showNotification(paste0(
            "\U2718 Connection to ",
            input$target_pg_presettings_list,
            " failed"
          ))
          rv$target$system <- ""
        }
      }
    })

    observeEvent(input$target_system_to_source_system_btn, {
      if (isTRUE(rv$target_is_source)) {
        ## Target was == source but should become different now:
        rv$target_is_source <- F
        # Show target-settings-tabs again:
        showTab(inputId = "target_tabs", target = "CSV")
        showTab(inputId = "target_tabs", target = "PostgreSQL")
        # Change button-label:
        updateActionButton(session, "target_system_to_source_system_btn",
                           label = " Set TARGET = SOURCE")
        # Feedback to the console:
        feedback("Target != source now.",
                 findme = "ec51b122ee")
      } else {
        ## Target != source and should become equal:
        # Change button-label:
        updateActionButton(session, "target_system_to_source_system_btn",
                           label = "Allow custom settings for target")
        # Hide target-setting-tabs:
        hideTab(inputId = "target_tabs", target = "CSV")
        hideTab(inputId = "target_tabs", target = "PostgreSQL")
        # Assign source-values to target:
        rv <- set_target_equal_to_source(rv)
        # Set internal flag that target == source:
        rv$target_is_source <- T
        # Show feedback-box in the UI:
        output$target_system_feedback_txt <-
          renderText({
            feedback_txt(system = "The source system", type = "target")
          })
        # Feedback to the console:
        feedback("Target == source now.",
                 findme = "94d3a2090c")
      }
    })

    observe({
      if (is.null(rv$sitenames)) {
        # check, if user has provided custom site names
        rv$sitenames <- tryCatch({
          outlist <- jsonlite::fromJSON(
            paste0(rv$utilspath, "/MISC/sitenames.JSON")
          )
          outlist
        }, error = function(e) {
          outlist <- list("No sitenames provided" = "No sitenames provided")
          outlist
          # TODO instead of dropdown menu, render text input field in the
          # case, users have not provided sitenames. This allows them
          # to specify a name of the DQA session (which will be included
          # into the report's title)
        }, finally = function(f) {
          return(outlist)
        })

        updateSelectInput(
          session,
          "config_sitename",
          choices = rv$sitenames,
          selected = ifelse(!is.null(rv$sitename),
                            rv$sitename,
                            character(0))
        )
      }
    })
  }

#' @title module_config_ui
#'
#' @param id A character. The identifier of the shiny object
#'
#' @export
#'
# module_config_ui
module_config_ui <- function(id) {
  ns <- NS(id)

  tagList(
    fluidRow(
      box(title = "Sitename",
          div(
            class = "row",
            div(
              class = "col-sm-8",
              selectInput(
                ns("config_sitename"),
                "Please enter the name of your site",
                selected = F,
                choices = NULL,
                multiple = F
              )
            ),
            div(class = "col-sm-4")
          ),
          width = 12),

      conditionalPanel(
        condition = "typeof output['moduleConfig-mdr_present'] == 'undefined'",
        box(
          title = "Load Metadata Repository",
          actionButton(
            inputId = ns("config_load_mdr"),
            label = "Load MDR",
            icon = icon("table")
          ),
          width = 12
        )
      ),

      ## This will be displayed after the MDR is loaded successfully:
      conditionalPanel(
        condition =
          "typeof output['moduleConfig-system_types'] !== 'undefined'",
        box(
          title =  "SOURCE settings",
          width = 6,
          solidHeader = TRUE,
          # status = "primary",
          box(
            # title = "Selected Source System",
            width = 12,
            solidHeader = T,
            id = ns("source_system_feedback_box"),
            h4(textOutput(ns("source_system_feedback_txt")))
          ),
          tabBox(
            # The id lets us use input$source_tabs
            # on the server to find the current tab
            id = ns("source_tabs"),
            width = 12,
            # selected = "CSV",

            tabPanel(
              title = "CSV",
              h4("Source CSV Upload"),
              box(
                title = "Available CSV-Systems",
                # background = "blue",
                # solidHeader = TRUE,
                width = 12,
                selectInput(
                  # This will be filled in the server part.
                  inputId = ns("source_csv_presettings_list"),
                  label = NULL,
                  choices = NULL,
                  selected = NULL
                ),
                style = "text-align:center;"
              ),
              div(
                paste(
                  "Please choose the directory of your",
                  "\u00A7",
                  "21 source data in csv format (default: '/home/input')."
                )
              ),
              br(),

              # If the path is already set, display it
              conditionalPanel(
                condition = paste0(
                  "typeof ",
                  "output['moduleConfig-source_csv_dir']",
                  " !== 'undefined'"
                ),
                verbatimTextOutput(ns("source_csv_dir")),
                style = "text-align:center;",

                # shinyFiles::shinyDirButton(
                #   id = ns("config_sourcedir_in_changed"),
                #   label = "Change Source Dir",
                #   title = "Please select the new source directory",
                #   icon = icon("folder"),
                # ),
              ),
              br(),

              # If there is no path set yet: Display the button to choose it
              div(
                shinyFiles::shinyDirButton(
                  id = ns("config_sourcedir_in"),
                  label = "Source Dir",
                  title = "Please select the source directory",
                  buttonType = "default",
                  icon = icon("folder"),
                  class = NULL,
                  style = "text-align:center;"
                ),
                style = "text-align:center;"
              )
            ),

            tabPanel(
              title = "PostgreSQL",
              h4("Source Database Connection"),
              box(
                title = "Preloadings",
                # background = "blue",
                #solidHeader = TRUE,
                width = 12,
                selectInput(
                  # This will be filled in the server part.
                  inputId = ns("source_pg_presettings_list"),
                  label = NULL,
                  choices = NULL,
                  selected = NULL
                ),
                style = "text-align:center;"
              ),
              textInput(
                inputId = ns("config_sourcedb_dbname"),
                label = "DB Name",
                placeholder = "Enter the name of the database ..."
              ),
              textInput(
                inputId = ns("config_sourcedb_host"),
                label = "IP",
                placeholder = "Enter the IP here in format '192.168.1.1' ..."
              ),
              textInput(
                inputId = ns("config_sourcedb_port"),
                label = "Port",
                placeholder = "Enter the Port of the database connection ..."
              ),
              textInput(
                inputId = ns("config_sourcedb_user"),
                label = "Username",
                placeholder =
                  "Enter the Username for the database connection ..."
              ),
              passwordInput(
                inputId = ns("config_sourcedb_password"),
                label = "Password",
                placeholder = "Enter the database password ..."
              ),
              br(),
              actionButton(
                inputId = ns("source_pg_test_connection"),
                label = "Test & Save connection",
                icon = icon("database"),
                style = "text-align:center;"
              )
            )
          )
        ),
        box(
          title =  "TARGET settings",
          width = 6,
          solidHeader = TRUE,
          # status = "warning",
          box(
            # title = "Selected Source System",
            width = 12,
            solidHeader = T,
            id = ns("target_system_feedback_box"),
            h4(textOutput(ns("target_system_feedback_txt")))
          ),
          box(
            width = 12,
            solidHeader = T,
            id = ns("target_system_to_source_system_box"),
            actionButton(
              inputId = ns("target_system_to_source_system_btn"),
              icon = icon("cogs"),
              label = " Set TARGET = SOURCE"
            ),
            style = "text-align:center;"
          ),
          tabBox(
            # The id lets us use input$target_tabs
            # on the server to find the current tab
            id = ns("target_tabs"),
            width = 12,
            # selected = "PostgreSQL",
            tabPanel(
              # ATTENTION: If you change the title, you also have to change the
              # corresponding part above for the "target == source" button
              # reaction. Otherwise the tabs won't hide/show up anymore.
              # >> ATTENTION <<
              title = "CSV",
              # >> ATTENTION << for title. See above.
              id = ns("target_tab_csv"),
              h4("Target CSV Upload"),
              box(
                title = "Available CSV-Systems",
                # background = "blue",
                # solidHeader = TRUE,
                width = 12,
                selectInput(
                  # This will be filled in the server part.
                  inputId = ns("target_csv_presettings_list"),
                  label = NULL,
                  choices = NULL,
                  selected = NULL
                ),
                style = "text-align:center;"
              ),
              div(
                paste(
                  "Please choose the directory of your",
                  "\u00A7",
                  "21 target data in csv format (default: '/home/input')."
                )
              ),
              br(),
              # If the path is already set, display it
              conditionalPanel(
                condition = paste0(
                  "typeof ",
                  "output['moduleConfig-target_csv_dir']",
                  " !== 'undefined'"
                ),
                verbatimTextOutput(ns("target_csv_dir")),
                style = "text-align:center;",

                # shinyFiles::shinyDirButton(
                #   id = ns("config_targetdir_in_changed"),
                #   label = "Change target Dir",
                #   title = "Please select the new target directory",
                #   icon = icon("folder"),
                # ),
              ),
              br(),

              # If there is no path set yet: Display the button to choose it
              div(
                shinyFiles::shinyDirButton(
                  id = ns("config_targetdir_in"),
                  label = "Target Dir",
                  title = "Please select the target directory",
                  buttonType = "default",
                  icon = icon("folder"),
                  class = NULL,
                  style = "text-align:center;"
                ),
                style = "text-align:center;"
              )
            ),
            tabPanel(
              # ATTENTION: If you change the title, you also have to change the
              # corresponding part above for the "target == source" button
              # reaction. Otherwise the tabs won't hide/show up anymore.
              # >> ATTENTION <<
              title = "PostgreSQL",
              # >> ATTENTION << for title. See above.
              id = ns("target_tab_pg"),
              h4("Target Database Connection"),
              box(
                title = "Preloadings",
                # background = "blue",
                #solidHeader = TRUE,
                width = 12,
                selectInput(
                  # This will be filled in the server part.
                  inputId = ns("target_pg_presettings_list"),
                  label = NULL,
                  choices = NULL,
                  selected = NULL
                ),
                style = "text-align:center;"
              ),
              textInput(
                inputId = ns("config_targetdb_dbname"),
                label = "DB Name",
                placeholder = "Enter the name of the database ..."
              ),
              textInput(
                inputId = ns("config_targetdb_host"),
                label = "IP",
                placeholder = "Enter the IP here in format '192.168.1.1' ..."
              ),
              textInput(
                inputId = ns("config_targetdb_port"),
                label = "Port",
                placeholder = "Enter the Port of the database connection ..."
              ),
              textInput(
                inputId = ns("config_targetdb_user"),
                label = "Username",
                placeholder =
                  "Enter the Username for the database connection ..."
              ),
              passwordInput(
                inputId = ns("config_targetdb_password"),
                label = "Password",
                placeholder = "Enter the database password ..."
              ),
              br(),
              actionButton(
                inputId = ns("target_pg_test_connection"),
                label = "Test & Save connection",
                icon = icon("database"),
                style = "text-align:center;"
              )
            )
          )
        )
      )
    )
  )
}
