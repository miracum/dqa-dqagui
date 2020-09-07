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

#' @title get_db_settings
#'
#' @param input Shiny server input object
#' @param target A boolean (default: TRUE).
#'
#' @export
#'
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
        title = "Invalid database configuration",
        "No empty strings or spaces allowed in database configurations."
      )
    )
    return(NULL)

  } else {
    outlist <- lapply(stats::setNames(vec, vec), function(g) {
      tab[get("keys") == g, get("value")]
    })
    return(outlist)
  }
}

#' @title This function is used in the config-tab and displays the selected
#'   system to the user.
#' @param system (String) e.g. "i2b2", "OMOP" or "CSV"
#' @param type (String) "source" or "target"
#' @return String containing the input params in a propper manner
#'
#'
feedback_txt <- function(system, type) {
  result <- paste0(
    "\U2714 ",
    tags$b(system),
    " will be used as ",
    DIZutils::firstup(type),
    " system.",
    "\n\n",
    "To change, simply select and save another one."
  )
  return(result)
}


#' @title This function is called when the user clicks on the button
#' @description "Set target == source". It sets target settings = source
#'   settings.
#'
#' @inheritParams module_dashboard_server
#'
#'
set_target_equal_to_source <- function(rv) {
  rv$target$settings <- rv$source$settings
  rv$target$system_type <- rv$source$system_type
  rv$target$system_name <- rv$source$system_name
  return(rv)
}

#' @title This function checks if all necessary input parameters
#'   for source and target exist and are valid.
#'
#' @inheritParams module_dashboard_server
#'
#'
validate_inputs <- function(rv) {
  error_tmp <- F
  if (!is.null(rv$source$system_type) &&
      !is.null(rv$target$system_type)) {
    # Check source setting:
    if (rv$source$system_type == "csv") {
      # Check if source-path is valid:
      if (typeof(rv$source$settings$path) == "character" &&
          !is.null(rv$source$settings$path) &&
          length(rv$source$settings$path) > 0) {
        DIZutils::feedback("Source settings seem valid.",
                           findme = "c0bcc9aa31",
                           logfile_dir = rv$log$logfile_dir,
                           headless = rv$headless)
        # valid path, so check if files exist:
        test_source_csv <- DQAstats::test_csv(
          settings = rv$source$settings,
          source_db = rv$source$system_name,
          mdr = rv$mdr,
          logfile_dir = rv$log$logfile_dir,
          headless = rv$headless
        )
        if (isTRUE(test_source_csv)) {
          DIZutils::feedback("All source csv-files were found.",
                             findme = "794c6f3160",
                             logfile_dir = rv$log$logfile_dir,
                             headless = rv$headless)
        } else{
          DIZutils::feedback("Some source csv-files are MISSING.",
                             type = "Error",
                             findme = "926b0c567c",
                             logfile_dir = rv$log$logfile_dir,
                             headless = rv$headless)
          error_tmp <- T
        }
      } else {
        # invalid path:
        DIZutils::feedback(
          print_this = "Source settings not valid.",
          type = "warning",
          findme = "10d5e79d44",
          ui = T,
          logfile_dir = rv$log$logfile_dir,
          headless = rv$headless
        )
        DIZutils::feedback(
          print_this = paste0(
            "rv$source$settings$path = ",
            rv$source$settings$path,
            "(d9b43110bb)",
            logfile_dir = rv$log$logfile_dir,
            headless = rv$headless
          )
        )
        error_tmp <- T
      }
    } else if (rv$source$system_type == "postgres") {
      # Check if source-db settings are valid:
      if (!is.null(rv$source$settings)) {
        rv$source$db_con <-
          DIZutils::db_connection(
            db_name = rv$source$system_name,
            db_type = rv$source$system_type,
            headless = rv$headless,
            logfile_dir = rv$log$logfile_dir
          )
        if (!is.null(rv$source$db_con)) {
          # valid
          DIZutils::feedback(print_this = "Source db-settings seem valid.",
                             findme = "29cc920472",
                             logfile_dir = rv$log$logfile_dir,
                             headless = rv$headless)
        } else {
          # invalid:
          DIZutils::feedback(
            print_this = "Source db-settings not valid.",
            type = "Warning",
            findme = "c63e1ccaf0",
            ui = T,
            logfile_dir = rv$log$logfile_dir,
            headless = rv$headless
          )
          DIZutils::feedback(
            print_this = paste0("rv$source$settings = ",
                                rv$source$settings),
            findme = "2d47f163a9",
            logfile_dir = rv$log$logfile_dir,
            headless = rv$headless
          )
          error_tmp <- T
        }
      } else {
        # invalid 2:
        DIZutils::feedback(
          print_this = "Source db-settings are empty.",
          type = "Warning",
          findme = "127deaebca",
          ui = T,
          logfile_dir = rv$log$logfile_dir,
          headless = rv$headless
        )
        error_tmp <- T
      }
    } else {
      DIZutils::feedback(
        print_this = "Source system not yet implemented.",
        type = "Warning",
        findme = "d0f0bfa2f3",
        ui = T,
        logfile_dir = rv$log$logfile_dir,
        headless = rv$headless
      )
      error_tmp <- T
    }

    # Check target setting:
    if (rv$target$system_type == "csv") {
      # Check if target-path is valid:
      if (typeof(rv$target$settings$path) == "character" &&
          !is.null(rv$target$settings$path) &&
          length(rv$target$settings$path) > 0) {
        DIZutils::feedback("target settings seem valid.",
                           findme = "9979bb57ef",
                           logfile_dir = rv$log$logfile_dir,
                           headless = rv$headless)
        # valid path, so check if files exist:
        test_target_csv <- DQAstats::test_csv(
          settings = rv$target$settings,
          source_db = rv$target$system_name,
          mdr = rv$mdr,
          logfile_dir = rv$log$logfile_dir,
          headless = rv$headless
        )
        if (isTRUE(test_target_csv)) {
          DIZutils::feedback("All target csv-files were found.",
                             findme = "ff8203c831",
                             logfile_dir = rv$log$logfile_dir,
                             headless = rv$headless)
        } else{
          DIZutils::feedback("Some target csv-files are MISSING.",
                             type = "Error",
                             findme = "079525a7de",
                             logfile_dir = rv$log$logfile_dir,
                             headless = rv$headless)
          error_tmp <- T
        }
      } else {
        # invalid path:
        DIZutils::feedback(
          print_this = "Target settings not valid.",
          type = "Warning",
          findme = "f4cc32e068",
          ui = T,
          logfile_dir = rv$log$logfile_dir,
          headless = rv$headless
        )
        DIZutils::feedback(
          print_this = paste0("rv$target$settings$path = ",
                              rv$target$dir),
          findme = "(43c81cb723)",
          logfile_dir = rv$log$logfile_dir,
          headless = rv$headless
        )
        error_tmp <- T
      }
    } else if (rv$target$system_type == "postgres") {
      # Check if target-db settings are valid:
      if (!is.null(rv$target$settings)) {
        rv$target$db_con <-
          DIZutils::db_connection(
            db_name = rv$target$system_name,
            db_type = rv$target$system_type,
            headless = rv$headless,
            logfile_dir = rv$log$logfile_dir
          )
        if (!is.null(rv$target$db_con)) {
          # valid
          DIZutils::feedback("Target db-settings seem valid. (79234d2ba0)",
                             logfile_dir = rv$log$logfile_dir,
                             headless = rv$headless)
        } else {
          # invalid:
          DIZutils::feedback(
            print_this = "Target db-settings not valid.",
            type = "Warning",
            findme = "096341c4c1",
            ui = T,
            logfile_dir = rv$log$logfile_dir,
            headless = rv$headless
          )
          DIZutils::feedback(paste0(
            "rv$target$settings = ",
            rv$target$settings,
            "(2d47f163a9)"
          ),
          logfile_dir = rv$log$logfile_dir,
          headless = rv$headless
          )
          error_tmp <- T
        }
      } else {
        # invalid 2:
        DIZutils::feedback(
          print_this = "Target db-settings are empty.",
          type = "Warning",
          findme = "8440a9e683",
          ui = T,
          logfile_dir = rv$log$logfile_dir,
          headless = rv$headless
        )
        error_tmp <- T
      }
    } else {
      DIZutils::feedback(
        print_this = "Target system not yet implemented.",
        type = "Warning",
        findme = "57b314a1a3",
        ui = T,
        logfile_dir = rv$log$logfile_dir,
        headless = rv$headless
      )
      error_tmp <- T
    }
  } else {
    DIZutils::feedback(
      print_this = "Either source or target system is not set.",
      type = "Warning",
      findme = "4e9400f8c9",
      ui = T,
      logfile_dir = rv$log$logfile_dir,
      headless = rv$headless
    )
    error_tmp <- T
  }
  return(!error_tmp)
}

fix_sql_display <- function(text) {
  t <- text
  t <- gsub("\\\n", "<br>\n", t)
  t <- gsub("\\\t", "&nbsp;&nbsp;&nbsp;&nbsp;", t)
  return(t)
}



#' @title Evaluates whether the load-data button needs to be shown or not.
#' @description If there is a valid source system and a valid target system
#'   (this is also the case if the user set target == source), the result
#'   of this function will be TRUE and the button will be displayed via
#'   shinyjs. Otherwise the result is FALSE and the button will be hidden.
#'   This function also displays (or hides) the variables which can be
#'   assessed.
#'
#' @inheritParams module_config_server
#'
#'
check_load_data_button <- function(rv, session) {
  #TODO: Read the systems from mdr:
  systems <- c("csv", "postgres")

  res <- ""
  if (!is.null(rv$source$system_type)) {
    if (rv$source$system_type %in% systems &&
        isTRUE(rv$target_is_source)) {
      # Source is set and target is not necessary:
      res <- T

      # Catch the case where target should be source but rv$target
      # is not set yet (so assign it):
      if (is.null(rv$target$system_type) ||
          (rv$source$system_type != rv$target$system_type)) {
        rv$target <- rv$source
      }
    } else if (rv$source$system_type %in% systems &&
               !is.null(rv$target$system_type) &&
               rv$target$system_type %in% systems) {
      # Source and target are set:
      res <- T
    } else {
      res <- F
    }
  } else {
    res <- F
  }

  if (res) {
    # Determine the different dataelements:
    helper_vars_tmp <- DQAstats::create_helper_vars(
      mdr = rv$mdr,
      target_db = rv$target$system_name,
      source_db = rv$source$system_name
    )
    rv$dqa_assessment <- helper_vars_tmp$dqa_assessment

    # Update the checkboxgroup to the determined dataelemets:
    updateCheckboxGroupInput(
      session = session,
      inputId = "select_dqa_assessment_variables",
      choices = sort(rv$dqa_assessment[["designation"]]),
      selected = rv$dqa_assessment[["designation"]]
    )

    # Show the checkboxgroup:
    shinyjs::show("config_select_dqa_assessment_box")

    # Show load-data button:
    shinyjs::show("dash_load_btn")

    # Show sitename-configuration:
    shinyjs::show("config_sitename")
  } else {
    shinyjs::hide("config_select_dqa_assessment_box", anim = TRUE)
    shinyjs::hide("dash_load_btn")

    # Hide sitename-configuration:
    shinyjs::hide("config_sitename")
  }
  return(res)
}
