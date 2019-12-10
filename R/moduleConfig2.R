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
module_config2_server <-
  function(input, output, session, rv, input_re) {
    debugging <- T

    # load mdr
    observeEvent(eventExpr = input_re()[["moduleConfig-config_load_mdr"]],
                 handlerExpr = {
                   if (is.null(rv$mdr)) {
                     cat("\nRead MDR\n")
                     # TODO hard-coded
                     rv$mdr_filename <- mdr_filename

                     if (debugging)
                       print(cat("MDR-Filename:", mdr_filename))
                     if (debugging)
                       print(cat("rv$utilspath:", rv$utilspath))

                     # read MDR
                     rv$mdr <-
                       DQAstats::read_mdr(utils_path = rv$utilspath,
                                          mdr_filename = mdr_filename)
                     stopifnot(data.table::is.data.table(rv$mdr))

                     ## Read in the settings
                     # - Determine the different systems from mdr:
                     vec <-
                       c("source_table_name",
                         "source_system_name",
                         "source_system_type")
                     rv$systems <- unique(rv$mdr[, vec, with = F])
                     cat(paste0("\nDifferent systems found in MDR:\n"))
                     print(rv$systems)

                     # - Read the settings for all these systems:
                     unique_systems <-
                       rv$systems[, get("source_system_name")]
                     rv$settings <-
                       lapply(unique_systems, function(x)
                         DQAstats::get_config(config_file = config_file,
                                              config_key = tolower(x)))


                     # cat(paste0("\nSettings found for systems:\n"))
                     # print(config_file)
                     # print(rv$settings)


                     # - Different system-types:
                     rv$system_types <-
                       rv$systems[, unique(get("source_system_type"))]

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
                       # TODO: Fill the tabs with presettings
                     }
                     if (!("postgres" %in% tolower(rv$system_types))) {
                       # Remove Postgres-Tabs:
                       printme("Removing postgres-tab from source ...")
                       removeTab(inputId = "source_tabs", target = "PostgreSQL")

                       printme("Removing postgres-tab from target ...")
                       removeTab(inputId = "target_tabs", target = "PostgreSQL")
                     } else{
                       # Fill the tab with presettings
                       # - filter for all system_names with system_type == postgres
                       # select source_system_name from rv$systems where source_system_type == postgres GROUP BY source_system_name
                       postgres_system_names <- rv$systems[source_system_type == "postgres", source_system_name]

                       if (length(postgres_system_names) > 0) {
                         # Show buttons to prefill different systems presettings:
                         # - Activate the buttton box:

                         # - Add a button/choice/etc. for each system:
                         updateSelectInput(session = session,
                                           inputId = "source_pg_presettings_list",
                                           choices = postgres_system_names)
                         updateSelectInput(session = session,
                                           inputId = "target_pg_presettings_list",
                                           choices = postgres_system_names)
                       } else {
                         # Hide the buttons/choices:
                         updateSelectInput(session = session,
                                           inputId = "source_pg_presettings_list",
                                           choices = "No presets available")
                         updateSelectInput(session = session,
                                           inputId = "target_pg_presettings_list",
                                           choices = "No presets available")
                       }





                       # updateTextInput(session = session, inputId = "source_pg_dbname", value = TODO)
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
                       return(input_re()[["moduleConfig-config_source_system_type"]])
                     })
                     outputOptions(output,
                                   "source_system_type",
                                   suspendWhenHidden = FALSE)
                   }
                 })

    # If source-csv-path-button is clicked, read the path and save it:
    # root-folder of shinyFiles::shinyDirChoose
    roots_src <- c(home = "/home/")
    shinyFiles::shinyDirChoose(
      input = input,
      id = "config_sourcedir_in",
      updateFreq = 0,
      session = session,
      defaultPath = "",
      roots = roots_src,
      defaultRoot = "home"
    )
    roots_src_changed <- c(home = "/home/")
    shinyFiles::shinyDirChoose(
      input = input,
      id = "config_sourcedir_in_changed",
      updateFreq = 0,
      session = session,
      defaultPath = "",
      roots = roots_src_changed,
      defaultRoot = "home"
    )
    # observe source file directory
    observeEvent(input_re()[["moduleConfig-config_sourcedir_in"]], {
      settingsdir_src <- shinyFiles::parseDirPath(roots = roots_src,
                                                  selection = input_re()[["moduleConfig-config_sourcedir_in"]])
      rv$source$settings$dir <-
        as.character(DQAstats::clean_path_name(settingsdir_src))
    })
    observeEvent(input_re()[["moduleConfig-config_sourcedir_in_changed"]], {
      settingsdir_src <-
        shinyFiles::parseDirPath(roots = roots_src_changed,
                                 selection = input_re()[["moduleConfig-config_sourcedir_in_changed"]])
      rv$source$settings$dir <-
        as.character(DQAstats::clean_path_name(settingsdir_src))
    })

    observe({
      req(rv$source$settings$dir)

      if (rv$source$settings$dir != "") {
        # workaround to tell ui, that it is there
        output$source_csv_dir <- reactive({
          cat("\nSource file dir:",
              rv$source$settings$dir,
              "\n")
          paste(rv$source$settings$dir)
        })
        outputOptions(output, "source_csv_dir", suspendWhenHidden = FALSE)
      }
    })


    roots_tar <- c(home = "/home/")
    shinyFiles::shinyDirChoose(
      input = input,
      id = "config_targetdir_in",
      updateFreq = 0,
      session = session,
      defaultPath = "",
      roots = roots_tar,
      defaultRoot = "home"
    )
    roots_tar_changed <- c(home = "/home/")
    shinyFiles::shinyDirChoose(
      input = input,
      id = "config_targetdir_in_changed",
      updateFreq = 0,
      session = session,
      defaultPath = "",
      roots = roots_tar_changed,
      defaultRoot = "home"
    )
    # observe target file directory
    observeEvent(eventExpr = input_re()[["moduleConfig-config_targetdir_in"]],
                 handlerExpr = {
                   settingsdir_tar <- shinyFiles::parseDirPath(roots = roots_tar,
                                                               selection = input_re()[["moduleConfig-config_targetdir_in"]])
                   rv$target$settings$dir <-
                     as.character(DQAstats::clean_path_name(settingsdir_tar))
                 })
    observeEvent(input_re()[["moduleConfig-config_targetdir_in_changed"]], {
      settingsdir_tar <-
        shinyFiles::parseDirPath(roots = roots_tar_changed,
                                 selection = input_re()[["moduleConfig-config_targetdir_in_changed"]])
      rv$target$settings$dir <-
        as.character(DQAstats::clean_path_name(settingsdir_tar))
    })

    observe({
      req(rv$target$settings$dir)

      if (rv$target$settings$dir != "") {
        # workaround to tell ui, that it is there
        output$target_csv_dir <- reactive({
          cat("\ntarget file dir:",
              rv$target$settings$dir,
              "\n")
          paste(rv$target$settings$dir)
        })
        outputOptions(output, "target_csv_dir", suspendWhenHidden = FALSE)
      }
    })

    # If the "load presets"-button was pressed, startload & show the presets:
    observeEvent(input$source_pg_presettings_btn, {
      printme(
        paste0(
          "Input-preset ",
          input$source_pg_presettings_list,
          " was chosen as SOURCE.",
          " Loading presets ..."
        )
      )
      config_stuff <- DQAstats::get_config(
        config_file = config_file,
        config_key = tolower(input$source_pg_presettings_list)
      )
      printme(paste(
        "Loaded successfully.",
        "Filling presets to global rv-object and UI ..."
      ))
      rv$source$settings <- config_stuff
      if (length(config_stuff) != 0) {
        updateTextInput(session = session,
                        inputId = "source_pg_dbname",
                        value = config_stuff[["dbname"]])
        updateTextInput(session = session,
                        inputId = "source_pg_ip",
                        value = config_stuff[["host"]])
        updateTextInput(session = session,
                        inputId = "source_pg_port",
                        value = config_stuff[["port"]])
        updateTextInput(session = session,
                        inputId = "source_pg_username",
                        value = config_stuff[["user"]])
        updateTextInput(session = session,
                        inputId = "source_pg_password",
                        value = config_stuff[["password"]])
      } else{
        updateTextInput(session = session,
                        inputId = "source_pg_dbname",
                        value = "")
        updateTextInput(session = session,
                        inputId = "source_pg_ip",
                        value = "")
        updateTextInput(session = session,
                        inputId = "source_pg_port",
                        value = "")
        updateTextInput(session = session,
                        inputId = "source_pg_username",
                        value = "")
        updateTextInput(session = session,
                        inputId = "source_pg_password",
                        value = "")
      }
    })

    observeEvent(input$target_pg_presettings_btn, {
      printme(
        paste0(
          "Input-preset ",
          input$target_pg_presettings_list,
          " was chosen as TARGET",
          " Loading presets ..."
        )
      )
      config_stuff <- DQAstats::get_config(
        config_file = config_file,
        config_key = tolower(input$target_pg_presettings_list)
      )
      printme(paste(
        "Loaded successfully.",
        "Filling presets to global rv-object and UI ..."
      ))
      rv$target$settings <- config_stuff
      if (length(config_stuff) != 0) {
        updateTextInput(session = session,
                        inputId = "target_pg_dbname",
                        value = config_stuff[["dbname"]])
        updateTextInput(session = session,
                        inputId = "target_pg_ip",
                        value = config_stuff[["host"]])
        updateTextInput(session = session,
                        inputId = "target_pg_port",
                        value = config_stuff[["port"]])
        updateTextInput(session = session,
                        inputId = "target_pg_username",
                        value = config_stuff[["user"]])
        updateTextInput(session = session,
                        inputId = "target_pg_password",
                        value = config_stuff[["password"]])
      } else{
        updateTextInput(session = session,
                        inputId = "target_pg_dbname",
                        value = "")
        updateTextInput(session = session,
                        inputId = "target_pg_ip",
                        value = "")
        updateTextInput(session = session,
                        inputId = "target_pg_port",
                        value = "")
        updateTextInput(session = session,
                        inputId = "target_pg_username",
                        value = "")
        updateTextInput(session = session,
                        inputId = "target_pg_password",
                        value = "")
      }
    })

    observeEvent(input$source_pg_test_connection, {
      showNotification("Testing the connection is not yet implemented.\nKeep calm =)")
    })
    observeEvent(input$target_pg_test_connection, {
      showNotification("Testing the connection is not yet implemented.\nKeep calm =)")
    })
  }

#' @title module_config_ui
#'
#' @param id A character. The identifier of the shiny object
#'
#' @export
#'
# module_config_ui
module_config2_ui <- function(id) {
  ns <- NS(id)

  tagList(fluidRow(
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
    conditionalPanel(
      condition = "typeof output['moduleConfig-mdr_present'] !== 'undefined'",
      box(
        title = "MDR was loaded successfully",
        # status = "success",
        solidHeader = TRUE,
        width = 12,
        "Please load the source and target data now:"
      ),
    ),

    ## This will be displayed after the MDR is loaded successfully:
    conditionalPanel(
      condition = "typeof output['moduleConfig-system_types'] !== 'undefined'",

      box(
        title =  "SOURCE settings",
        width = 6,
        solidHeader = TRUE,
        # status = "primary",
        tabBox(
          # The id lets us use input$source_tabs
          # on the server to find the current tab
          id = ns("source_tabs"),
          width = 12,
          # selected = "CSV",

          tabPanel(
            title = "CSV",
            h4("Source CSV Upload"),
            div(
              paste(
                "Please choose the directory of your",
                "\u00A7",
                "21 source data in csv format (default: '/home/input')."
              )
            ),
            br(),
            # If there is no path set yet: Display the button to choose it
            conditionalPanel(
              condition = paste0(
                "typeof output[",
                "'moduleConfig-source_csv_dir'",
                "] == 'undefined'"
              ),
              shinyFiles::shinyDirButton(
                id = ns("config_sourcedir_in"),
                label = "Source Dir",
                title = "Please select the source directory",
                icon = icon("folder"),
              ),
              style = "text-align:center;"
            ),
            # If the path is already set, display it
            # and offer the possibility to change it:
            conditionalPanel(
              condition =
                "typeof output['moduleConfig-source_csv_dir'] !== 'undefined'",
              verbatimTextOutput(ns("source_csv_dir")),
              style = "text-align:center;",

              shinyFiles::shinyDirButton(
                id = ns("config_sourcedir_in_changed"),
                label = "Change Source Dir",
                title = "Please select the new source directory",
                icon = icon("folder"),
              ),
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
              actionButton(
                label = "Load preset",
                inputId = ns("source_pg_presettings_btn"),
                icon = NULL
              ),
              style = "text-align:center;"
            ),
            textInput(
              inputId = ns("source_pg_dbname"),
              label = "DB Name",
              placeholder = "Enter the name of the database ..."
            ),
            textInput(
              inputId = ns("source_pg_ip"),
              label = "IP",
              placeholder = "Enter the IP here in format '192.168.1.1' ..."
            ),
            textInput(
              inputId = ns("source_pg_port"),
              label = "Port",
              placeholder = "Enter the Port of the database connection ..."
            ),
            textInput(
              inputId = ns("source_pg_username"),
              label = "Username",
              placeholder = "Enter the Username for the database connection ..."
            ),
            passwordInput(
              inputId = ns("source_pg_password"),
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
        title =  "Target settings",
        width = 6,
        solidHeader = TRUE,
        # status = "warning",
        tabBox(
          # The id lets us use input$target_tabs
          # on the server to find the current tab
          id = ns("target_tabs"),
          width = 12,
          # selected = "PostgreSQL",
          tabPanel(
            title = "CSV",
            h4("Target CSV Upload"),
            div(
              paste(
                "Please choose the directory of your",
                "\u00A7",
                "21 target data in csv format (default: '/home/input')."
              )
            ),
            br(),
            # If there is no path set yet: Display the button to choose it
            conditionalPanel(
              condition = paste0(
                "typeof output[",
                "'moduleConfig-target_csv_dir'",
                "] == 'undefined'"
              ),
              shinyFiles::shinyDirButton(
                id = ns("config_targetdir_in"),
                label = "Target Dir",
                title = "Please select the target directory",
                icon = icon("folder"),
              ),
              style = "text-align:center;"
            ),
            # If the path is already set,
            # display it and offer the possibility to change it:
            conditionalPanel(
              condition =
                "typeof output['moduleConfig-target_csv_dir'] !== 'undefined'",
              verbatimTextOutput(ns("target_csv_dir")),
              style = "text-align:center;",

              shinyFiles::shinyDirButton(
                id = ns("config_targetdir_in_changed"),
                label = "Change Target Dir",
                title = "Please select the new target directory",
                icon = icon("folder"),
              ),
            )
          ),
          tabPanel(
            title = "PostgreSQL",
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
              actionButton(
                label = "Load preset",
                inputId = ns("target_pg_presettings_btn"),
                icon = NULL
              ),
              style = "text-align:center;"
            ),
            textInput(
              inputId = ns("target_pg_dbname"),
              label = "DB Name",
              placeholder = "Enter the name of the database ..."
            ),
            textInput(
              inputId = ns("target_pg_ip"),
              label = "IP",
              placeholder = "Enter the IP here in format '192.168.1.1' ..."
            ),
            textInput(
              inputId = ns("target_pg_port"),
              label = "Port",
              placeholder = "Enter the Port of the database connection ..."
            ),
            textInput(
              inputId = ns("target_pg_username"),
              label = "Username",
              placeholder = "Enter the Username for the database connection ..."
            ),
            passwordInput(
              inputId = ns("target_pg_password"),
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


  ))

}
