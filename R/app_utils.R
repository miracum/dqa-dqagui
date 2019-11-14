# DQAgui - A graphical user interface (GUI) to the functions implemented in the R package 'DQAstats'.
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
on_start <- function(session, rv, input, output){
  if (file.exists(paste0(tempdir(), "/_settings/global_settings.JSON"))){
    cat("\nglobal_settings.JSON present\n")
    user_settings <- jsonlite::fromJSON(paste0(tempdir(), "/_settings/global_settings.JSON"))

    cat("\nUpdate radio button:", user_settings[["db"]], "\n")
    shiny::updateRadioButtons(session, "moduleConfig-config_targetdb_rad", selected = user_settings[["db"]])

    cat("\nUpdate source file path:", user_settings[["source_path"]], "\n")
    rv$sourcefiledir <- user_settings[["source_path"]]
    shinyFiles::shinyDirChoose(input, "moduleConfig-config_sourcedir_in", updateFreq = 0, session = session, defaultPath = user_settings[["source_path"]], roots = c(home="/home/"), defaultRoot = "home")

    cat("\nUpdate site name:", user_settings[["site_name"]], "\n")
    rv$sitename <- user_settings[["site_name"]]
    shiny::updateSelectInput(session, "moduleConfig-config_sitename", selected = user_settings[["site_name"]])

    rv[["user_settings"]] <- user_settings
  }
}

# create summary tables
summary_table <- function(){
  return(data.table::data.table("variable" = character(),
                    "distinct" = integer(),
                    "valids" = integer(),
                    "missings" = integer()))
}

# render quick check tables
renderQuickChecks <- function(dat_table){
  out <- DT::datatable(dat_table, options=list(dom = "t", scrollY="30vh", pageLength = nrow(dat_table)), rownames = F) %>%
    DT::formatStyle(columns=2,
                backgroundColor = DT::styleEqual(c("passed", "failed"), c("lightgreen", "red"))) %>%
    DT::formatStyle(columns=3,
                backgroundColor = DT::styleEqual(c("passed", "failed"), c("lightgreen", "red"))) %>%
    DT::formatStyle(columns=4,
                    backgroundColor = DT::styleEqual(c("passed", "failed"), c("lightgreen", "red")))
  return(out)
}


getDBsettings <- function(input){
  # create description of column selections
  vec <- c("dbname", "host", "port", "user", "password")

  tab <- lapply(vec, function(g) {
    data.table::data.table("keys" = g, "value" = eval(parse(text=paste0("input[['moduleConfig-config_targetdb_", g, "']]"))))
  })

  tab <- do.call(rbind, tab)

  # if one column is selected multiple times
  if ("" %in% tab[,get("value")] || any(tab[,grepl("\\s", get("value"))])){
    shiny::showModal(modalDialog(
      title = "Invalid values",
      "No empty strings or spaces allowed in database configurations."
    ))
    return(NULL)

  } else {
    print(tab)
    outlist <- lapply(stats::setNames(vec, vec), function(g){
      tab[get("keys")==g,get("value")]
    })
    return(outlist)
  }
}
