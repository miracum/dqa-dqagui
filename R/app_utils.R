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



#' @title Simply prints stuff to the console.
#' @param print_this  The string to be printed.
#' @param type (Optional) The type of message as string.
#'   If type is e.g. "Warning" the printed line will be "[Warning] print_this".
#'
printme <- function(print_this, type = "Info") {
  feedback(print_this, type)
}

#' @title Simple method to feedback messages either to the user and/or to the
#'   console.
#' @description  Extended version of the printme-function.
#'
#' @param ui (Optional) If true, the message will also be printed
#'   to the user in form of a modal.
#' @param console (Optional) If true, the message will also be printed
#'   to the console as is.
#' @param prefix Prefix (String)
#' @param suffix Suffix (String)
#' @param findme (Optional) String to find the message in the code.
#'   E.g. 10-digit random hex from https://www.browserling.com/tools/random-hex
#'   or https://onlinerandomtools.com/generate-random-hexadecimal-numbers
#'
#' @inheritParams printme
#'
#'
feedback <-
  function(print_this,
           type = "Info",
           ui = FALSE,
           console = TRUE,
           prefix = "",
           suffix = "",
           findme = "") {
    if (ui) {
      shiny::showModal(modalDialog(title = type,
                                   easyClose = TRUE,
                                   print_this))
    }
    type <- firstup(type)
    if (console) {
      if (length(print_this) == 1) {
        if (findme == "") {
          message(paste0("[", type, "] ", prefix, print_this, suffix))
        } else {
          message(paste0("[", type, "] ",
                         prefix, print_this, suffix, " (", findme, ")"))
        }
      } else if (length(print_this) > 1) {
        if (findme == "") {
          i <- 1
          for (tmp in print_this) {
            message(paste0("[", type, "] ", prefix, i, ": ", tmp, suffix))
            i <- i + 1
          }
        } else {
          i <- 1
          for (tmp in print_this) {
            message(
              paste0("[", type, "] ",
                     prefix, i, ": ", tmp, suffix, " (", findme, ")"))
            i <- i + 1
          }
        }
      }
    }
  }


#' @title This function is used in the config-tab and displays the selected
#'   system to the user.
#' @param system (String) e.g. "i2b2", "OMOP" or "CSV"
#' @param type (String) "source" or "target"
#'
#'
feedback_txt <- function(system, type) {
  result <- paste0(
    "\U2714 ",
    system,
    " will be used as ",
    firstup(type),
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
      if (typeof(rv$source$settings$dir) == "character" &&
          !is.null(rv$source$settings$dir) &&
          length(rv$source$settings$dir) > 0) {
        feedback("Source settings seem valid.",
                 findme = "c0bcc9aa31")
        # valid path, so check if files exist:
        test_source_csv <- DQAstats::test_csv(
          settings = rv$source$settings,
          source_db = rv$source$system_name,
          mdr = rv$mdr,
          headless = F
        )
        if (isTRUE(test_source_csv)) {
          feedback("All source csv-files were found.",
                   findme = "794c6f3160")
        } else{
          feedback("Some source csv-files are MISSING.",
                   type = "Error",
                   findme = "926b0c567c")
          error_tmp <- T
        }
      } else {
        # invalid path:
        feedback(
          print_this = "Source settings not valid.",
          type = "warning",
          findme = "10d5e79d44",
          ui = T
        )
        printme(
          paste0(
            "rv$source$settings$dir = ",
            rv$source$settings$dir,
            "(d9b43110bb)"
          )
        )
        error_tmp <- T
      }
    } else if (rv$source$system_type == "postgres") {
      # Check if source-db settings are valid:
      if (!is.null(rv$source$settings)) {
        rv$source$db_con <-
          DQAstats::test_db(settings = rv$source$settings,
                            headless = rv$headless)
        if (!is.null(rv$source$db_con)) {
          # valid
          printme("Source db-settings seem valid. (29cc920472)")
        } else {
          # invalid:
          feedback(
            print_this = "Source db-settings not valid.",
            type = "Warning",
            findme = "c63e1ccaf0",
            ui = T
          )
          printme(paste0(
            "rv$source$settings = ",
            rv$source$settings,
            "(2d47f163a9)"
          ))
          error_tmp <- T
        }
      } else {
        # invalid 2:
        feedback(
          print_this = "Source db-settings are empty.",
          type = "Warning",
          findme = "127deaebca",
          ui = T
        )
        error_tmp <- T
      }
    } else {
      feedback(
        print_this = "Source system not yet implemented.",
        type = "Warning",
        findme = "d0f0bfa2f3",
        ui = T
      )
      error_tmp <- T
    }

    # Check target setting:
    if (rv$target$system_type == "csv") {
      # Check if target-path is valid:
      if (typeof(rv$target$settings$dir) == "character" &&
          !is.null(rv$target$settings$dir) &&
          length(rv$target$settings$dir) > 0) {
        feedback("target settings seem valid.",
                 findme = "9979bb57ef")
        # valid path, so check if files exist:
        test_target_csv <- DQAstats::test_csv(
          settings = rv$target$settings,
          source_db = rv$target$system_name,
          mdr = rv$mdr,
          headless = F
        )
        print(test_target_csv)
        if (isTRUE(test_target_csv)) {
          feedback("All target csv-files were found.",
                   findme = "ff8203c831")
        } else{
          feedback("Some target csv-files are MISSING.",
                   type = "Error",
                   findme = "079525a7de")
          error_tmp <- T
        }
      } else {
        # invalid path:
        feedback(
          print_this = "Target settings not valid.",
          type = "Warning",
          findme = "f4cc32e068",
          ui = T
        )
        printme(paste0(
          "rv$target$settings$dir = ",
          rv$target$dir,
          "(43c81cb723)"
        ))
        error_tmp <- T
      }
    } else if (rv$target$system_type == "postgres") {
      # Check if target-db settings are valid:
      if (!is.null(rv$target$settings)) {
        rv$target$db_con <-
          DQAstats::test_db(settings = rv$target$settings,
                            headless = rv$headless)
        if (!is.null(rv$target$db_con)) {
          # valid
          printme("Target db-settings seem valid. (79234d2ba0)")
        } else {
          # invalid:
          feedback(
            print_this = "Target db-settings not valid.",
            type = "Warning",
            findme = "096341c4c1",
            ui = T
          )
          printme(paste0(
            "rv$target$settings = ",
            rv$target$settings,
            "(2d47f163a9)"
          ))
          error_tmp <- T
        }
      } else {
        # invalid 2:
        feedback(
          print_this = "Target db-settings are empty.",
          type = "Warning",
          findme = "8440a9e683",
          ui = T
        )
        error_tmp <- T
      }
    } else {
      feedback(
        print_this = "Target system not yet implemented.",
        type = "Warning",
        findme = "57b314a1a3",
        ui = T
      )
      error_tmp <- T
    }
  } else {
    feedback(
      print_this = "Either source or target system is not set.",
      type = "Warning",
      findme = "4e9400f8c9",
      ui = T
    )
    error_tmp <- T
  }
  return(!error_tmp)
}

#' @title Converts the first letter of the input string to uppercase
#' @description Converts the first letter of the input string to uppercase
#'
#' @inheritParams x String. E.g. "hello world" will become "Hello world"
#'
firstup <- function(x) {
  substr(x, 1, 1) <- toupper(substr(x, 1, 1))
  return(x)
}
