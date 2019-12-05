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

                     # workaround to tell ui, that mdr is there
                     output$mdr_present <- reactive({
                       return(TRUE)
                     })
                     outputOptions(output, "mdr_present", suspendWhenHidden = FALSE)

                     # workaround to tell ui, that mdr is there
                     output$source_system_type <- reactive({
                       return(input_re()[["moduleConfig-config_source_system_type"]])
                     })
                     outputOptions(output, "source_system_type", suspendWhenHidden = FALSE)
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
      # print(cat("Test1", rv$source$settings$dir))
    })
    observeEvent(input_re()[["moduleConfig-config_sourcedir_in_changed"]], {
      settingsdir_src <- shinyFiles::parseDirPath(roots = roots_src_changed,
                                                  selection = input_re()[["moduleConfig-config_sourcedir_in_changed"]])
      rv$source$settings$dir <-
        as.character(DQAstats::clean_path_name(settingsdir_src))
      # print(cat("Test1", rv$source$settings$dir))
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
    observeEvent(input_re()[["moduleConfig-config_targetdir_in"]], {
      settingsdir_tar <- shinyFiles::parseDirPath(roots = roots_tar,
                                              selection = input_re()[["moduleConfig-config_targetdir_in"]])
      rv$target$settings$dir <-
        as.character(DQAstats::clean_path_name(settingsdir_tar))
      # print(cat("Test1", rv$target$settings$dir))
    })
    observeEvent(input_re()[["moduleConfig-config_targetdir_in_changed"]], {
      settingsdir_tar <- shinyFiles::parseDirPath(roots = roots_tar_changed,
                                                  selection = input_re()[["moduleConfig-config_targetdir_in_changed"]])
      rv$target$settings$dir <-
        as.character(DQAstats::clean_path_name(settingsdir_tar))
      # print(cat("Test1", rv$target$settings$dir))
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
    box(
      title =  "INPUT settings",
      width = 6,
      solidHeader = TRUE,
      # status = "primary",
      tabBox(
        # The id lets us use input$tabset1 on the server to find the current tab
        id = ns("input_tabs"),
        width = 12,
        selected = "CSV",

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
            condition = "typeof output['moduleConfig-source_csv_dir'] == 'undefined'",
            shinyFiles::shinyDirButton(
              id = ns("config_sourcedir_in"),
              label = "Source Dir",
              title = "Please select the source directory",
              icon = icon("folder"),
            ),
            style = "text-align:center;"
          ),
          # If the path is already set, display it and offer the possibility to change it:
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
            tags$i(
              "These options should only appear if there are db-settings in the settings-file."
            ),
            br(),
            fluidRow(column(
              6,
              actionButton(
                inputId = "config_source_pg_i2b2",
                label = "i2b2",
                style = "float:left"
              )
            ),
            column(
              6,
              actionButton(
                inputId = "config_sourcedir_omop",
                label = "OMOP",
                style = "float:right"
              )
            )),
          ),
          textInput(
            inputId = "source_pg_dbname",
            label = "DB Name",
            placeholder = "Enter the name of the database ..."
          ),
          textInput(
            inputId = "source_pg_ip",
            label = "IP",
            placeholder = "Enter the IP here in format '192.168.1.1' ..."
          ),
          textInput(
            inputId = "source_pg_port",
            label = "Port",
            placeholder = "Enter the Port of the database connection ..."
          ),
          textInput(
            inputId = "source_pg_username",
            label = "Username",
            placeholder = "Enter the Username for the database connection ..."
          ),
          passwordInput(
            inputId = "source_pg_password",
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
      title =  "OUTPUT settings",
      width = 6,
      solidHeader = TRUE,
      # status = "warning",
      tabBox(
        # The id lets us use input$tabset2 on the server to find the current tab
        id = "tabset2",
        width = 12,
        selected = "PostgreSQL",
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
            condition = "typeof output['moduleConfig-target_csv_dir'] == 'undefined'",
            shinyFiles::shinyDirButton(
              id = ns("config_targetdir_in"),
              label = "Target Dir",
              title = "Please select the target directory",
              icon = icon("folder"),
            ),
            style = "text-align:center;"
          ),
          # If the path is already set, display it and offer the possibility to change it:
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
            tags$i(
              "These options should only appear if there are db-settings in the settings-file."
            ),
            br(),
            fluidRow(column(
              6,
              actionButton(
                inputId = "config_target_pg_i2b2",
                label = "i2b2",
                style = "float:left"
              )
            ),
            column(
              6,
              actionButton(
                inputId = "config_targetdir_omop",
                label = "OMOP",
                style = "float:right"
              )
            )),
          ),
          textInput(
            inputId = "target_pg_dbname",
            label = "DB Name",
            placeholder = "Enter the name of the database ..."
          ),
          textInput(
            inputId = "target_pg_ip",
            label = "IP",
            placeholder = "Enter the IP here in format '192.168.1.1' ..."
          ),
          textInput(
            inputId = "target_pg_port",
            label = "Port",
            placeholder = "Enter the Port of the database connection ..."
          ),
          textInput(
            inputId = "target_pg_username",
            label = "Username",
            placeholder = "Enter the Username for the database connection ..."
          ),
          passwordInput(
            inputId = "target_pg_password",
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
  ))
}
