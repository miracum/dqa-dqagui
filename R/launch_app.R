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


#' @title Launch the DQA graphical user interface (GUI)
#'
#' @param port The port, the MIRACUM DQA Tool is running on (default: 3838)
#' @param utils_path The path to the utilities-folder, containing the metadata
#'   repository files (`mdr.csv` inside the folder `MDR`), JSON files with SQL
#'   statements (inside the folder `SQL`), config files for the database
#'   connection (`settings_default.yml`) and the email address used for the
#'   data map (`email.yml`), a JSON file containing site names (inside the
#'   folder `MISC`) and a markdown templated to create the PDF report
#'   (`DQA_report.Rmd` inside the folder `RMD`).
#' @param mdr_filename The filename of the mdr (e.g. "mdr_example_data.csv")
#' @param config_file The path to the configuration yaml. E.g. config_file =
#'   system.file("demo_data/utilities/settings/demo_settings.yml",
#'   package = "DQAstats")
#' @param use_env_credentials A boolean. If environment variables should
#'   be used to pass database credentials (default: FALSE). If you want
#'   to use environment variables to pass database credentials, please
#'   provide one variable for the respective data system (the name, which
#'   is stored in the default settings file and correspsondingly in the MDR)
#'   with the following format: *SYSTEMNAME*_PASSWORD, where *SYSTEMNAME*
#'   should be replaced with the name of the datasystem.
#' @param logfile_dir Is the absolute path to the directory where the logfile
#'   will be stored. If not path is provided the tempdir() will be used.
#'
#' @return DQAgui Shiny application
#'
#' @import shiny shinydashboard
#' @importFrom magrittr "%>%"
#' @importFrom data.table .N ":="
#' @importFrom DQAstats feedback
#'
#' @export
#'

launch_app <- function(port = 3838,
                       utils_path = system.file("demo_data/utilities",
                                                package = "DQAstats"),
                       mdr_filename = "mdr_example_data.csv",
                       config_file = system.file(
                         "demo_data/utilities/settings/demo_settings.yml",
                                                 package = "DQAstats"),
                       use_env_credentials = FALSE,
                       logfile_dir = tempdir()) {

  global_env_hack <- function(key,
                              val,
                              pos) {
    assign(
      key,
      val,
      envir = as.environment(pos)
    )
  }

  global_env_hack(
    key = "utils_path",
    val = utils_path,
    pos = 1L
  )

  global_env_hack(
    key = "config_file",
    val = config_file,
    pos = 1L
  )

  global_env_hack(
    key = "mdr_filename",
    val = mdr_filename,
    pos = 1L
  )

  global_env_hack(
    key = "use_env_credentials",
    val = use_env_credentials,
    pos = 1L
  )

  global_env_hack(
    key = "logfile_dir",
    val = logfile_dir,
    pos = 1L
  )

  DQAstats::cleanup_old_logfile()

  options(shiny.port = port)

  shiny::shinyAppDir(
    appDir = system.file("application", package = "DQAgui")
  )
}
