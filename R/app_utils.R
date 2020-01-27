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


get_db_settings <- function(input, target = T) {
  # create description of column selections
  vec <- c("dbname", "host", "port", "user", "password")

  tab <- lapply(vec, function(g) {
    if (target) {
      data.table::data.table("keys" = g, "value" = eval(parse(
        text = paste0("input[['moduleConfig-config_targetdb_", g, "']]")
      )))
    } else {
      data.table::data.table("keys" = g, "value" = eval(parse(
        text = paste0("input[['moduleConfig-config_sourcedb_", g, "']]")
      )))
    }
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



# Simply prints stuff to the console.
# @param print_this:  The string to be printed.
# @param type:        (Optional) The type of message as string.
#                     If type is e.g. "Warning"
#                     the printed line will be "[Warning] print_this".
printme <- function(print_this, type = "Info") {
  feedback(print_this, type)
}

# Simple method to feedback messages either to the user and/or to the console.
# Extended version of the printme-function.
# @param print_this:  The string to be showed
# @param type:        (Optional) The type of message as string.
#                     This is also the headline of the modal.
#                     If type is e.g. "Warning"
#                     the printed line will be "[Warning] print_this".
# @param ui:          (Optional) If true, the message will also be printed
#                     to the user in form of a modal.
# @param console:     (Optional) If true, the message will also be printed
#                     to the console as is.
# @param findme:      (Optional) String to find the message in the code.
#                     E.g. 10-digit random hex from
#                     https://www.browserling.com/tools/random-hex
feedback <-
  function(print_this,
           type = "Info",
           ui = FALSE,
           console = TRUE,
           findme = "") {
    if (ui) {
      shiny::showModal(modalDialog(title = type,
                                   easyClose = TRUE,
                                   print_this))
    }
    if (console) {
      if (findme == "") {
        message(paste0("[", type, "] ", print_this))
      } else {
        message(paste0("[", type, "] ", print_this, " (", findme, ")"))
      }
    }
  }


# This function is used in the config-tab and displays the selected system
# to the user.
# @param system:      (String) e.g. "i2b2", "OMOP" or "CSV"
# @param type:        (String) "source" or "target"
feedback_txt <- function(system, type) {
  result <- paste0(
    "\U2714 ",
    system,
    " will be used as ",
    type,
    " system.",
    "\n\n",
    "To change, simply select and save another one."
  )
  return(result)
}


# This function is called when the user clicks on the button
# "Set target == source". It sets target settings = source settings.
# @param rv:          The global rv-object
set_target_equal_to_source <- function(rv) {
  rv$target$settings <- rv$source$settings
  rv$target$system_type <- rv$source$system_type
  rv$target$system_name <- rv$source$system_name
  return(rv)
}
