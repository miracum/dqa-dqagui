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

#' @title on_start
#'
#' @param input Shiny server input object
#' @param output Shiny server output object
#' @param session Shiny session object
#' @param rv The global 'reactiveValues()' object, defined in server.R
#'
#' @export
#'
# on_start
# function to run on startup
on_start <- function(session, rv, input, output) {
  if (file.exists(paste0(tempdir(), "/_settings/global_settings.JSON"))) {
    cat("\nglobal_settings.JSON present\n")
    user_settings <-
      jsonlite::fromJSON(paste0(tempdir(), "/_settings/global_settings.JSON"))

    cat("\nUpdate radio button:", user_settings[["db"]], "\n")
    shiny::updateRadioButtons(
      session = session,
      inputId = "moduleConfig-config_targetdb_rad",
      selected = user_settings[["db"]]
    )

    cat("\nUpdate source file path:", user_settings[["source_path"]], "\n")
    rv$sourcefiledir <- user_settings[["source_path"]]
    shinyFiles::shinyDirChoose(
      input = input,
      id = "moduleConfig-config_sourcedir_in",
      updateFreq = 0,
      session = session,
      defaultPath = user_settings[["source_path"]],
      roots = c(home = "/home/"),
      defaultRoot = "home"
    )

    cat("\nUpdate site name:", user_settings[["site_name"]], "\n")
    rv$sitename <- user_settings[["site_name"]]
    shiny::updateSelectInput(
      session = session,
      inputId = "moduleConfig-config_sitename",
      selected = user_settings[["site_name"]]
    )

    rv[["user_settings"]] <- user_settings
  }
}

# create summary tables
summary_table <- function() {
  return(
    data.table::data.table(
      "variable" = character(),
      "distinct" = integer(),
      "valids" = integer(),
      "missings" = integer()
    )
  )
}

# render quick check tables
render_quick_checks <- function(dat_table) {
  out <-
    DT::datatable(
      dat_table,
      options = list(
        dom = "t",
        scrollY = "30vh",
        pageLength = nrow(dat_table)
      ),
      rownames = F
    ) %>%
    DT::formatStyle(columns = 2,
                    backgroundColor = DT::styleEqual(
                      c("passed", "failed"),
                      c("lightgreen", "red")
                    )) %>%
    DT::formatStyle(columns = 3,
                    backgroundColor = DT::styleEqual(
                      c("passed", "failed"),
                      c("lightgreen", "red")
                    )) %>%
    DT::formatStyle(columns = 4,
                    backgroundColor = DT::styleEqual(
                      c("passed", "failed"),
                      c("lightgreen", "red")
                    ))
  return(out)
}


get_db_settings <- function(input) {
  # create description of column selections
  vec <- c("dbname", "host", "port", "user", "password")

  tab <- lapply(vec, function(g) {
    data.table::data.table("keys" = g, "value" = eval(parse(
      text = paste0("input[['moduleConfig-config_targetdb_", g, "']]")
    )))
  })

  tab <- do.call(rbind, tab)

  # if one column is selected multiple times
  if ("" %in% tab[, get("value")] ||
      any(tab[, grepl("\\s", get("value"))])) {
    shiny::showModal(
      modalDialog(
        title = "Invalid values",
        "No empty strings or spaces allowed in database configurations."
      )
    )
    return(NULL)

  } else {
    print(tab)
    outlist <- lapply(stats::setNames(vec, vec), function(g) {
      tab[get("keys") == g, get("value")]
    })
    return(outlist)
  }
}

# The code for source & target is the same and redundant but faster to execute.
# For changes, the code in source and target (both if cases) need to be adapted.
get_tab_panel_csv <- function(source = T) {
  if (source) {
    res <- tabPanel(
      title = "CSV",
      h4("Source CSV Upload"),
      div(
        paste(
          "Please choose the directory of your",
          "\u00A7",
          "21 Source data in csv format (default: '/home/input')."
        )
      ),
      br(),
      # If there is no path set yet: Display the button to choose it
      conditionalPanel(
        condition = "typeof output['moduleConfig-source_csv_dir'] == 'undefined'",
        shinyFiles::shinyDirButton(
          id = "config_sourcedir_in",
          label = "Source Dir",
          title = "Please select the Source directory",
          icon = icon("folder"),
        ),
        style = "text-align:center;"
      ),
      # If the path is already set, display it and offer the possibility to change it:
      conditionalPanel(
        condition =
          "typeof output['moduleConfig-source_csv_dir'] !== 'undefined'",
        verbatimTextOutput("source_csv_dir"),
        style = "text-align:center;",

        shinyFiles::shinyDirButton(
          id = "config_sourcedir_in_changed",
          label = "Change Source Dir",
          title = "Please select the new Source directory",
          icon = icon("folder"),
        ),
      )
    )
  } else {
    res <- tabPanel(
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
          id = "config_targetdir_in",
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
        verbatimTextOutput("target_csv_dir"),
        style = "text-align:center;",

        shinyFiles::shinyDirButton(
          id = "config_targetdir_in_changed",
          label = "Change Target Dir",
          title = "Please select the new target directory",
          icon = icon("folder"),
        ),
      )
    )
  }
  return(res)
}

# The code for source & target is the same and redundant but faster to execute.
# For changes, the code in source and target (both if cases) need to be adapted.
get_tab_panel_postgres <- function(source = T) {
  if (source) {
    res <- tabPanel(
      title = "PostgreSQL",
      h4("Source Database Connection"),
      box(
        title = "Preloadings",
        # background = "blue",
        # solidHeader = TRUE,
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
        inputId = "source_pg_test_connection",
        label = "Test & Save connection",
        icon = icon("database"),
        style = "text-align:center;"
      )
    )
  } else {
    res <- tabPanel(
      title = "PostgreSQL",
      h4("Target Database Connection"),
      box(
        title = "Preloadings",
        # background = "blue",
        # solidHeader = TRUE,
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
        inputId = "target_pg_test_connection",
        label = "Test & Save connection",
        icon = icon("database"),
        style = "text-align:center;"
      )
    )
  }
  return(res)
}


get_config_tabbox <- function(id, tabnames, source = T) {
  res <-
    tabBox(# The id lets us use input$tabset2 on the server to find the current tab
      id = id,
      width = 12,
      if ("csv" %in% tabnames) {
        get_tab_panel_csv(source = source)
      },
      if ("postgres" %in% tabnames) {
        get_tab_panel_postgres(source = source)
      })
  return(res)
}
