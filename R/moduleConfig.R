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
module_config_server <- function(input, output, session, rv, input_re) {

  observe({
    # TODO hard-coded
    if (is.null(rv$source)) {

      config_file <- paste0(rv$utilspath, "settings/demo_settings.yml")
      # save source/target vars
      rv$source$system_name <- "exampleCSV_source"
      rv$target$system_name <- "exampleCSV_target"
    }

    # get configs
    rv$source$settings <- DQAstats::get_config(
      config_file = config_file,
      config_key = tolower(rv$source$system_name)
    )
    rv$target$settings <- DQAstats::get_config(
      config_file = config_file,
      config_key = tolower(rv$target$system_name)
    )
  })
    # load mdr
    observeEvent(
      eventExpr = input_re()[["moduleConfig-config_load_mdr"]],
      handlerExpr = {
        if (is.null(rv$mdr)) {
          cat("\nRead MDR\n")
          # TODO hard-coded
          rv$mdr_filename <- mdr_filename

          # read MDR
          rv$mdr <- DQAstats::read_mdr(utils_path = rv$utilspath,
                                       mdr_filename = mdr_filename)
          stopifnot(data.table::is.data.table(rv$mdr))

          # read system_types
          rv$source$system_type <-
            rv$mdr[get("source_system_name") ==
                     rv$source$system_name, unique(get("source_system_type"))]
          rv$target$system_type <-
            rv$mdr[get("source_system_name") ==
                     rv$target$system_name, unique(get("source_system_type"))]


          # We only allow one (system) type per system name. There can't e.g. be
          # system types "csv" and "postgres" both with the system_name "data":
          stopifnot(length(rv$source$system_type) == 1)

          reactive_to_append <- DQAstats::create_helper_vars(
            mdr = rv$mdr,
            target_db = rv$target$system_name,
            source_db = rv$source$system_name
          )
          # workaround, to keep "rv" an reactiveValues object in shiny app
          # (rv <- c(rv, reactive_to_append)) does not work!
          for (i in names(reactive_to_append)) {
            rv[[i]] <- reactive_to_append[[i]]
          }
          rm(reactive_to_append)
          invisible(gc())

          # workaround to tell ui, that mdr is there
          output$mdr_present <- reactive({
            return(TRUE)
          })
          outputOptions(output, "mdr_present", suspendWhenHidden = FALSE)
        }
      })

    # root-folder of shinyFiles::shinyDirChoose
    # TODO hard-coded
    # roots <- c(home = "/home/")
    roots <- c(home = system.file(
      "demo_data/",
      package = "DQAstats"
    ))
    shinyFiles::shinyDirChoose(
      input,
      "config_sourcedir_in",
      updateFreq = 0,
      session = session,
      defaultPath = "",
      roots = roots,
      defaultRoot = "home"
    )

    # observe source file directory
    observeEvent(input_re()[["moduleConfig-config_sourcedir_in"]], {
      settingsdir <- shinyFiles::parseDirPath(
        roots = roots,
        selection = input_re()[["moduleConfig-config_sourcedir_in"]]
      )
      rv$source$settings$dir <- system.file(
        "demo_data",
        package = "DQAstats"
      )
    })

    output$config_sourcedir_out <- reactive({
      cat("\nSource file dir input:", rv$source$settings$dir, "\n")
      paste(rv$source$settings$dir)
    })


    shinyFiles::shinyDirChoose(
      input,
      "config_targetdir_in",
      updateFreq = 0,
      session = session,
      defaultPath = "",
      roots = roots,
      defaultRoot = "home"
    )

    # observe source file directory
    observeEvent(input_re()[["moduleConfig-config_targetdir_in"]], {
      settingsdir <- shinyFiles::parseDirPath(
        roots = roots,
        selection = input_re()[["moduleConfig-config_targetdir_in"]]
      )
      rv$target$settings$dir <- system.file(
        "demo_data",
        package = "DQAstats"
      )
    })

    output$config_targetdir_out <- reactive({
      cat("\nSource file dir input:", rv$target$settings$dir, "\n")
      paste(rv$target$settings$dir)
    })

    # observe target database configuration
    # observeEvent(
    #   eventExpr = input_re()[["moduleConfig-config_targetdb_rad"]],
    #   handlerExpr = {
    #     # set db_target
    #     print(input_re()[["moduleConfig-config_targetdb_rad"]])
    #     rv$db_target <- input_re()[["moduleConfig-config_targetdb_rad"]]
    #
    #     # remove existing global_settings here as they will newly be created
    #     # once loading the data
    #     if (file.exists(
    #       paste0(tempdir(),
    #              "/_settings/global_settings.JSON")
    #     )) {
    #       if (input_re()[["moduleConfig-config_targetdb_rad"]] !=
    #           rv$user_settings[["db"]]) {
    #         cat("\nRemoving '_settings/global_settings.JSON'")
    #         file.remove(paste0(
    #           tempdir(),
    #           "/_settings/global_settings.JSON")
    #         )
    #         rv$user_settings <- NULL
    #       }
    #     }
    #
    #     # if paste0(tempdir(), "/_settings/settings_"{DBname}) is not present,
    #     # try to read default settings list here and populate textInputs
    #     if (!file.exists(paste0(
    #       tempdir(),
    #       "/_settings/settings_",
    #       input_re()[["moduleConfig-config_targetdb_rad"]],
    #       ".JSON"
    #     ))) {
    #       # try to read default settings -> possible, if "utils" is defined and
    #       # "settings_default.yml" exist:
    #       tryCatch(
    #         expr = {
    #           cat("\nReading default settings\n")
    #           rv$settings_target <- config::get(
    #             value = input_re()[["moduleConfig-config_targetdb_rad"]],
    #             file = paste0(rv$utils_path, "/settings_default.yml")
    #           )
    #
    #           showModal(
    #             modalDialog(
    #               "Loading default configuration.",
    #               title = "Loading default database configuration"
    #             )
    #           )
    #         }, error = function(e) {
    #           print(e)
    #         })
    #
    #     } else {
    #       rv$db_settings <- jsonlite::fromJSON(
    #           paste0(
    #             tempdir(),
    #             "/_settings/settings_",
    #             input_re()[["moduleConfig-config_targetdb_rad"]],
    #             ".JSON"
    #           )
    #         )
    #     }
    #
    #     shiny::updateTextInput(session,
    #                            "config_targetdb_dbname",
    #                            value = rv$settings_target$dbname)
    #     shiny::updateTextInput(session,
    #                            "config_targetdb_host",
    #                            value = rv$settings_target$host)
    #     shiny::updateTextInput(session,
    #                            "config_targetdb_port",
    #                            value = rv$settings_target$port)
    #     shiny::updateTextInput(session,
    #                            "config_targetdb_user",
    #                            value = rv$settings_target$user)
    #     shiny::updateTextInput(session,
    #                            "config_targetdb_password",
    #                            value = rv$settings_target$password)
    #   })
    #
    # # observe saving of settings
    # observeEvent(input_re()[["moduleConfig-config_targetdb_save_btn"]], {
    #   rv$settings_target <- get_db_settings(input_re())
    #
    #   if (!is.null(rv$settings_target)) {
    #     print(rv$settings_target)
    #
    #     if (!dir.exists(paste0(tempdir(), "/_settings/"))) {
    #       dir.create(paste0(tempdir(), "/_settings/"))
    #     }
    #
    #     writeLines(
    #       jsonlite::toJSON(
    #         rv$settings_target,
    #         pretty = T,
    #         auto_unbox = F
    #       ),
    #       paste0(
    #         tempdir(),
    #         "/_settings/settings_",
    #         input_re()[["moduleConfig-config_targetdb_rad"]],
    #         ".JSON"
    #       )
    #     )
    #   }
    # })
    #
    # # test db-connection
    # observeEvent(input_re()[["moduleConfig-config_targetdb_test_btn"]], {
    #   rv$settings_target <- get_db_settings(input_re())
    #
    #   if (!is.null(rv$settings_target)) {
    #     rv$db_con_target <- DQAstats::test_target_db(
    #       target_settings = rv$settings_target,
    #       headless = rv$headless
    #     )
    #
    #     if (!is.null(rv$db_con_target)) {
    #       cat("\nDB connection successfully established\n")
    #       shiny::showModal(
    #         modalDialog(
    #           title = "Database connection successfully tested",
    #           paste0("The database connection has been ",
    #                  "successfully established and tested.")
    #         )
    #       )
    #     }
    #   }
    # })
    #
    # # load sql statements
    # observe({
    #   req(rv$db_con_target)
    #
    #   if (is.null(rv$sql_target)) {
    #     rv$sql_target <- DQAstats::load_sqls(
    #       utils = rv$utils_path,
    #       db = rv$db_target
    #     )
    #   }
    # })
    #
    # # workaround to tell ui, that db_connection is there
    # output$db_connection <- reactive({
    #   if (!is.null(rv$db_con_target)) {
    #     return(TRUE)
    #   }
    # })
    # shiny::outputOptions(output, "db_connection", suspendWhenHidden = FALSE)


    observe({
      if (is.null(rv$sitenames)) {
        # check, if user has provided custom site names
        rv$sitenames <- tryCatch({
          outlist <- jsonlite::fromJSON(
            paste0(rv$utils_path, "/MISC/sitenames.JSON")
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

  tagList(fluidRow(
    conditionalPanel(
      condition = "typeof output['moduleConfig-mdr_present'] == 'undefined'",
      box(
        title = "Load Metadata Repository",
        actionButton(ns("config_load_mdr"), "Load MDR"),
        width = 6
      )
    ),
    conditionalPanel(
      condition = "output['moduleConfig-mdr_present']",
      column(
        6,
        # TODO hard-coded
        box(
          title = "Target File Directory",
          h5(tags$b(
            paste(
              "Please choose the directory of your",
              "\u00A7",
              "21 source data in csv format (default: '/home/input')."
            )
          )),
          div(
            class = "row",
            div(
              class = "col-sm-3",
              shinyFiles::shinyDirButton(
                ns("config_targetdir_in"),
                "Target Dir",
                "Please select the target file directory",
                buttonType = "default",
                class = NULL,
                icon = NULL,
                style = NULL
              )
            ),
            div(class = "col-sm-9", verbatimTextOutput(ns(
              "config_targetdir_out"
            )))
          ),
          width = 12
        )
        # box(
        #   title = "Target Database Configuration",
        #   radioButtons(
        #     inputId = ns("config_targetdb_rad"),
        #     label = "Please select the target database",
        #     choices = list("i2b2" = "i2b2",
        #                    "OMOP" = "omop"),
        #     selected = NULL,
        #     inline = TRUE
        #   ),
        #   textInput(ns("config_targetdb_dbname"),
        #             label = "Database name"),
        #   textInput(ns("config_targetdb_host"),
        #             label = "Host name / IP-Address"),
        #   textInput(ns("config_targetdb_port"),
        #             label = "Port"),
        #   textInput(ns("config_targetdb_user"),
        #             label = "Username"),
        #   passwordInput(ns("config_targetdb_password"),
        #                 label = "Password"),
        #   div(
        #     class = "row",
        #     style = "text-align: center;",
        #     actionButton(ns("config_targetdb_save_btn"),
        #                  "Save settings"),
        #     actionButton(ns("config_targetdb_test_btn"),
        #                  "Test connection")
        #   ),
        #   width = 12
        # )
      ),
      column(
        6,

        box(
          title = "Sitename",
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
          width = 12
        ),
        box(
          title = "Source File Directory",
          h5(tags$b(
            paste(
              "Please choose the directory of your",
              "\u00A7",
              "21 source data in csv format (default: '/home/input')."
            )
          )),
          div(
            class = "row",
            div(
              class = "col-sm-3",
              shinyFiles::shinyDirButton(
                ns("config_sourcedir_in"),
                "Source Dir",
                "Please select the source file directory",
                buttonType = "default",
                class = NULL,
                icon = NULL,
                style = NULL
              )
            ),
            div(class = "col-sm-9", verbatimTextOutput(ns(
              "config_sourcedir_out"
            )))
          ),
          width = 12
        )
      ))
  ))
}
