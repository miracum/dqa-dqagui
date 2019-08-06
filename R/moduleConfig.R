#' @title moduleConfigServer
#'
#' @param input Shiny server input object
#' @param output Shiny server output object
#' @param session Shiny session object
#' @param rv The global 'reactiveValues()' object, defined in server.R
#' @param input_re The Shiny server input object, wrapped into a reactive expression: input_re = reactive({input})
#'
#' @export
#'
# moduleConfigServer
moduleConfigServer <- function(input, output, session, rv, input_re){

  # root-folder of shinyFiles::shinyDirChoose
  roots = c(home="/home/")
  shinyFiles::shinyDirChoose(input, "config_sourcedir_in", updateFreq = 0, session = session, defaultPath = "", roots = roots, defaultRoot = "home")

  # observe source file directory
  observeEvent(input_re()[["moduleConfig-config_sourcedir_in"]], {
    settingsdir <- shinyFiles::parseDirPath(roots, input_re()[["moduleConfig-config_sourcedir_in"]])
    rv$sourcefiledir <- DQAstats::cleanPathName_(settingsdir)
  })

  output$config_sourcedir_out <- reactive({
    cat("\nSource file dir:", rv$sourcefiledir, "\n")
    paste(rv$sourcefiledir)
  })

  # observe target database configuration
  observeEvent(input_re()[["moduleConfig-config_targetdb_rad"]], {

    # set db_target
    print(input_re()[["moduleConfig-config_targetdb_rad"]])
    rv$db_target <- input_re()[["moduleConfig-config_targetdb_rad"]]

    # remove existing global_settings here as they will newly be created once loading the data
    if (file.exists(paste0(tempdir(), "/_settings/global_settings.JSON"))){
      if (input_re()[["moduleConfig-config_targetdb_rad"]] != rv$user_settings[["db"]]){
        cat("\nRemoving '_settings/global_settings.JSON'")
        file.remove(paste0(tempdir(), "/_settings/global_settings.JSON"))
        rv$user_settings <- NULL
      }
    }

    # if paste0(tempdir(), "/_settings/settings_"{DBname}) is not present, try to read default settings list here and populate textInputs
    if (!file.exists(paste0(tempdir(), "/_settings/settings_", input_re()[["moduleConfig-config_targetdb_rad"]], ".JSON"))){

      # try to read default settings -> possible, if "utils" is defined and "settings_default.yml" exist:
      tryCatch({
      cat("\nReading default settings\n")
      rv$settings_target <- config::get(input_re()[["moduleConfig-config_targetdb_rad"]], file = paste0(utils, "/settings_default.yml"))

      showModal(modalDialog(
        "Loading default configuration.",
        title = "Loading default database configuration")
      )
      }, error = function(e){
        print(e)
      })

    } else {
      rv$db_settings <- jsonlite::fromJSON(paste0(tempdir(), "/_settings/settings_", input_re()[["moduleConfig-config_targetdb_rad"]], ".JSON"))
    }

    shiny::updateTextInput(session, "config_targetdb_dbname", value = rv$settings_target$dbname)
    shiny::updateTextInput(session, "config_targetdb_host", value = rv$settings_target$host)
    shiny::updateTextInput(session, "config_targetdb_port", value = rv$settings_target$port)
    shiny::updateTextInput(session, "config_targetdb_user", value = rv$settings_target$user)
    shiny::updateTextInput(session, "config_targetdb_password", value = rv$settings_target$password)
  })

  # observe saving of settings
  observeEvent(input_re()[["moduleConfig-config_targetdb_save_btn"]],{
    rv$settings_target <- getDBsettings(input_re())

    if (!is.null(rv$settings_target)){
      print(rv$settings_target)

      if (!dir.exists(paste0(tempdir(), "/_settings/"))){
        dir.create(paste0(tempdir(), "/_settings/"))
      }

      writeLines(jsonlite::toJSON(rv$settings_target,
                        pretty = T,
                        auto_unbox = F),
                 paste0(tempdir(), "/_settings/settings_", input_re()[["moduleConfig-config_targetdb_rad"]], ".JSON"))
    }
  })

  # test db-connection
  observeEvent(input_re()[["moduleConfig-config_targetdb_test_btn"]], {
    rv$settings_target <- getDBsettings(input_re())

    if (!is.null(rv$settings_target)){

      rv$db_con_target <- DQAstats::testTargetDB_(target_settings = rv$settings_target, headless = headless)

      if (!is.null(rv$db_con_target)){
        cat("\nDB connection successfully established\n")
        shiny::showModal(modalDialog(
          title = "Database connection successfully tested",
          "The database connection has been successfully established and tested."
        ))
      }
    }
  })

  # load sql statements
  observe({
    req(rv$db_con_target)

    if (is.null(rv$sql_target)){
      rv$sql_target <- DQAstats::loadSQLs_(utils = utils, db = rv$db_target)
    }
  })

  # workaround to tell ui, that db_connection is there
  output$dbConnection <- reactive({
    if (!is.null(rv$db_con_target)){
      return(TRUE)
    }
  })
  shiny::outputOptions(output, 'dbConnection', suspendWhenHidden=FALSE)


  observe({
    if (is.null(rv$sitenames)){
      rv$sitenames <- jsonlite::fromJSON(paste0(utils, "/MISC/sitenames.JSON"))

      updateSelectInput(session, "config_sitename", choices = rv$sitenames,
                        selected = ifelse(!is.null(rv$sitename), rv$sitename, character(0)))
    }
  })
}

#' @title moduleConfigUI
#'
#' @param id A character. The identifier of the shiny object
#'
#' @export
#'
# moduleConfigUI
moduleConfigUI <- function(id){
  ns <- NS(id)

  tagList(
    fluidRow(
      column(6,
             box(
               title = "Target Database Configuration",
                radioButtons(inputId = ns("config_targetdb_rad"),
                             label = "Please select the target database",
                             choices = list("i2b2" = "i2b2",
                                            "OMOP" = "omop"),
                             selected = NULL,
                             inline = TRUE),
                textInput(ns("config_targetdb_dbname"), label = "Database name"),
                textInput(ns("config_targetdb_host"), label = "Host name"),
                textInput(ns("config_targetdb_port"), label = "Port"),
                textInput(ns("config_targetdb_user"), label = "Username"),
                passwordInput(ns("config_targetdb_password"), label = "Password"),
                div(class = "row", style = "text-align: center;",
                    actionButton(ns("config_targetdb_save_btn"), "Save settings"),
                    actionButton(ns("config_targetdb_test_btn"), "Test connection")),
               width = 12
             )),
      column(6,

             box(title = "Sitename",
                 div(class = "row",
                     div(class = "col-sm-8", selectInput(ns("config_sitename"), "Please enter the name of your site",
                                                         selected = F, choices = NULL, multiple = F)),
                     div(class = "col-sm-4")
                 ),
                 width = 12
             ),
             box(title = "Source File Directory",
                 h5(tags$b(paste("Please choose the directory of your", "\u00A7", "21 source data in csv format (default: '/home/i2b2/start/Input')."))),
                 div(class = "row",
                     div(class="col-sm-3", shinyFiles::shinyDirButton(ns("config_sourcedir_in"),
                                                          "Source Dir",
                                                          "Please select the source file directory",
                                                          buttonType = "default",
                                                          class = NULL,
                                                          icon = NULL,
                                                          style = NULL)),
                     div(class = "col-sm-9", verbatimTextOutput(ns("config_sourcedir_out")))
                 ),
                 width = 12
             )
      )
    )
  )
}
