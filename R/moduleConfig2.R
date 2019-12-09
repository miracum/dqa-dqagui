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
                         DQAstats::get_config(config_file = config_file, config_key = tolower(x)))
                     cat(paste0("\nSettings found for systems:\n"))
                     print(typeof(rv$settings))
                     print(rv$settings)

                     # - Different system-types:
                     rv$system_types <-
                       as.list(rv$systems[, unique(get("source_system_type"))])
                     cat(paste0("\nDifferent system types::\n"))
                     print(rv$system_types)

                     i = 1
                     for (systype in rv$system_types) {
                       cat(paste0("System type ", i, " = ", systype, "\n"))
                       i <- i + 1
                     }

                     # Store the system-types in output-variable to only
                     # show these tabs on the config page:
                     output$system_types <- reactive({
                       rv$system_types
                     })
                     outputOptions(output, "system_types", suspendWhenHidden = FALSE)

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
      settingsdir_src <-
        shinyFiles::parseDirPath(roots = roots_src_changed,
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

    if (logik ==T ){
      appendTab("moduleConfig-tabs", tab = tabItem(
        id = "123",
      ))
    }

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
                   # print(cat("Test1", rv$target$settings$dir))
                 })
    observeEvent(input_re()[["moduleConfig-config_targetdir_in_changed"]], {
      settingsdir_tar <-
        shinyFiles::parseDirPath(roots = roots_tar_changed,
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



    #uiOutput("module_config2_ui"),

    ## Just for debugging:
    # conditionalPanel(condition = "output['moduleConfig-system_types'].includes('LKJGHJGFGFFKJFKJFLGLKDGLKGE')",
    #                  box(
    #                    status = "warning",
    #                    h1(
    #                      "This should never appear in the GUI!"
    #                    ))),


    ## This will be displayed after the MDR is loaded successfully:
    conditionalPanel(
      condition = "typeof output['moduleConfig-system_types'] !== 'undefined'",
      box(
        title =  "INPUT settings",
        width = 6,
        solidHeader = TRUE,
        # status = "primary",
        tabsetPanel(id = ns("tabs"))
        #get_config_tabbox("tabset2", tabnames = c("csv", "postgres"), source = T)
      ),
      box(
        title =  "OUTPUT settings",
        width = 6,
        solidHeader = TRUE,
        # status = "warning",
        get_config_tabbox("tabset2", tabnames = c("csv", "postgres"), source = F)
      )
    )
  ))
}
