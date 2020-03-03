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
    outlist <- lapply(stats::setNames(vec, vec), function(g) {
      tab[get("keys") == g, get("value")]
    })
    return(outlist)
  }
}

#' @title Simple method to feedback messages either to the user and/or to the
#'   console.
#' @description This functino is to provide feedback for any kind of
#'   information.  This might be a simple info, a warning or an error.
#'   The function can be used to select the output (console, ui, logfile).
#'   If no output is selected, the print_this string will be printed to the
#'   console and to logfile.
#'   One of these must be a string with length > 0: print_me, console, ui
#' @param print_this (Optional, String)
#' @param type (Optional, String)
#' @param ui (Optional, Boolean/String) If true, the message will
#'   also be printed to the user in form of a modal. Can also be a string.
#' @param console (Optional, Boolean/String) If true, the message will also
#'   be printed to the console as is. Can also be a string.
#' @param prefix Prefix (Optional, String) This is useful if
#'   print_this is an array/list.
#'   Each entry will then be new row with this prefix.
#' @param suffix Suffix (Optional, String). Same like prefix but at the
#'   end of each line.
#' @param findme (Optional, String) String to find the message in the code.
#'   E.g. 10-digit random hex from https://www.browserling.com/tools/random-hex
#'   or https://onlinerandomtools.com/generate-random-hexadecimal-numbers
#'
#' @export
#'
feedback <-
  function(print_this = "",
           type = "Info",
           ui = FALSE,
           console = TRUE,
           logfile = TRUE,
           prefix = "",
           suffix = "",
           findme = "") {
    # Make the first letter of type Uppercase:
    type <- firstup(type)

    # we need parts of the rv object here so if it is not set yet
    # initialize it now:
    if (!exists("rv")) {
      rv <- c()
    }

    # If the gui is active, show the message to the user.
    # If its an error message, also show the error messages in the gui
    # even if the user did not explicitely said it should be displayed
    # in the gui
    if (isTRUE(ui) ||
        (isFALSE(rv$headless) && isTRUE(type == "Error") && isFALSE(ui))) {
      feedback_to_ui(print_this = print_this, type = type)
    }

    if (isTRUE(console) && isFALSE(print_this == "")) {
      feedback_to_console(
        print_this = print_this,
        type = type,
        findme = findme,
        prefix = prefix,
        suffix = suffix
      )
    }

    # If there is text defined in 'ui' and/or 'console', print this one
    # (this is uesful if one will provide both, feedback to the ui AND
    # feedback to the console but with different texts).
    # Hint: Everything printed to the console will also
    #       be printed to the logfile.
    if (isTRUE(typeof(ui) == "character")) {
      feedback_to_ui(print_this = print_this, type = type)
    }
    if (isTRUE(typeof(console) == "character")) {
      feedback_to_console(
        print_this = print_this,
        type = type,
        findme = findme,
        prefix = prefix,
        suffix = suffix
      )
    }
  }

#' @title Print to the console. Internal use.
#' @description  Helper function for the feedback function to print
#'   stuff to the console. Everything will also be added to the logfile.
#'   Internal use. Use the robust 'feedback' function instead.
#'
#' @inheritParams feedback
#'
feedback_to_console <- function(print_this, type, findme, prefix, suffix) {
  if (length(print_this) == 1) {
    res <-
      feedback_get_formatted_string(
        print_this = print_this,
        type = type,
        findme = findme,
        prefix = prefix,
        suffix = suffix
      )
    message(res)
    feedback_to_logfile(
      print_this = print_this,
      type = type,
      findme = findme,
      prefix = prefix,
      suffix = suffix
    )
  } else if (length(print_this) > 1) {
    i <- 1
    for (tmp in print_this) {
      res <-
        feedback_get_formatted_string(
          print_this = tmp,
          type = type,
          findme = findme,
          prefix = paste0(prefix, i, ": "),
          suffix = suffix
        )
      message(res)
      feedback_to_logfile(
        print_this = tmp,
        type = type,
        findme = findme,
        prefix = prefix,
        suffix = suffix
      )
      i <- i + 1
    }
  }
}

#' @title Feedback to the user with a modal. Internal use.
#' @description  Helper function for the feedback function to show modals
#'   to the gui/user. Everything will also be added to the logfile.
#'   Internal use. Use the robust 'feedback' function instead.
#' @inheritParams feedback
#'
feedback_to_ui <- function(print_this, type) {
  if (isTRUE(type == "Error")) {
    title <- "Sorry, an error has occured"
  } else {
    title <- type
  }
  shiny::showModal(modalDialog(title = title,
                               easyClose = TRUE,
                               print_this))
}

#' @title Add to the logfile. Internal use.
#' @description  Helper function for the feedback function to add content
#'   to the logfile. Internal use.
#'   Use the robust 'feedback' function instead.
#' @param input The input string to be added to the logfile.
#'
feedback_to_logfile <- function(print_this, type, findme, prefix, suffix) {
  # Get the formatted string out of the parameters which looks like
  # "[Info] System is running (1234567890)":
  res <- feedback_get_formatted_string(print_this = print_this,
                                       type = type,
                                       findme = findme,
                                       prefix = prefix,
                                       suffix = suffix)
  # Set the string for the logfile containing the current time and date
  # and a linebreak at the end:
  res <- paste0("[", Sys.time(), "] ", res, "\n")

  # Check if last character of the path is a slash and add one if not:
  if (substr(logfile_dir, nchar(logfile_dir), nchar(logfile_dir)) != "/") {
    logfile_dir <- paste0(logfile_dir, "/")
  }

  path_with_file <- paste0(logfile_dir, "logfile.log")

  # Check if logfile.log is already the logfile for this session:
  if (isTRUE(check_file_current_runtime_id(path_with_file = path_with_file))) {
    # There is a logfile for the current runtime id,
    # so append the existing logfile:
    # Open the connection to the logfile:
    log_con <- file(path_with_file, open = "a")
    # Write to the logfile:
    cat(res, file = log_con)
    # Close the connection to logfile:
    close(log_con)
  } else {
    # There is no logfile for the current runtime id,
    # so rename the logfile.log to logfile_2020-01-01-1234h and
    # create a new logfile and write the current runtime id to it:
    filename_datetime <- format(Sys.time(), "%Y-%m-%d-%H%M%OS")
    path_with_file_datetime <-
      paste0(logfile_dir, "logfile_", filename_datetime, ".log")
    file.rename(from = path_with_file, to = path_with_file_datetime)
    # ... create a new logfile.log and paste the current runtime_id here:
    if (!file.exists(path_with_file)) {
      # Open the connection to the logfile:
      log_con <- file(path_with_file, open = "a")
      # Write current runtime_id to the logfile:
      runtime_id <- paste0("runtime_id=", get_runtime_id(), "\n\n")
      cat(runtime_id, file = log_con)
      # Write current message to the logfile:
      cat(res, file = log_con)
      # Close the connection to logfile:
      close(log_con)
    }
  }
}

#' @title Returns the current runtime_id and stores it to rv$runtime_id
#' @description  Helper function for the feedback function, especially
#'   the logfile function. If there is already a runtime_id, the current
#'   one will be returned. Otherwise a new one will be set,
#'   stored to rv$runtime_id and also be returned.
#' @param force If true, a new runtime_id will be created.
#'   If false (default) it depends wether there already is one or not.
#'
get_runtime_id <- function(force = FALSE) {
  runtime_id_length <- 20
  if (isTRUE(exists("runtime_id") &&
             !is.na(runtime_id)) &&
      nchar(runtime_id) == runtime_id_length && isFALSE(force)) {
    return(runtime_id)
  } else {
    print("Getting a new runtime_id...")
    # runtime_id <- sample(x = 0:10e6, size = 1)
    runtime_id <-
      paste0(sample(c(0:9, LETTERS[1:6]), runtime_id_length, T), collapse = "")
    return(runtime_id)
  }
}

#' @title Is current runtime_id the one in this file?
#' @description  Helper function for the feedback function, especially
#'   the logfile function. Extracts the runtime_id from the
#'   logfile and compares it to the current runtime_id.
#'   If equal, return = TRUE.
#' @param path_with_file The path with the file to look at
#'
check_file_current_runtime_id <- function(path_with_file) {
  tryCatch({
    con <- file(path_with_file, "r")
    first_line <- readLines(con, n = 1)
    runtime_id_tmp <- gsub("([runtime_id\\=])", "", first_line)
    if (isTRUE(runtime_id_tmp == runtime_id)) {
      return(TRUE)
    } else {
      return(FALSE)
    }
    close(con)
  },
  error = function(cond) {
    return(FALSE)
  },
  warning = function(cond) {
    return(FALSE)
  }, finally = close(con))
}

#' @title Format the feedback string
#' @description  Helper function for the feedback function to combine the input
#'   parameters in proper manner to ge a pretty and informative string which
#'   than can be added to the logfile and/or be displayed in the console.
#'   CAUTION: 'print_this' must be of length 1! For arrays loop through them
#'   by hand and call this function several times!
#'   Internal use. Use the robust 'feedback' function instead.
#' @inheritParams feedback
#'
feedback_get_formatted_string <-
  function(print_this, type, findme, prefix, suffix) {

    if (length(print_this) == 1) {
      if (findme == "") {
        res <- paste0("[", type, "] ", prefix, print_this, suffix)
      } else {
        res <- paste0("[", type, "] ",
                      prefix, print_this, suffix, " (", findme, ")")
      }
    } else {
      res <- paste0("Length of input 'print_this' is not == 1. ",
                    "See function description. (55a445fe57)")
    }
    return(res)
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
        feedback(
          print_this = paste0(
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
          feedback(print_this = "Source db-settings seem valid.",
                   findme = "29cc920472")
        } else {
          # invalid:
          feedback(
            print_this = "Source db-settings not valid.",
            type = "Warning",
            findme = "c63e1ccaf0",
            ui = T
          )
          feedback(
            print_this = paste0("rv$source$settings = ",
                                rv$source$settings),
            findme = "2d47f163a9"
          )
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
        feedback(
          print_this = paste0("rv$target$settings$dir = ",
                              rv$target$dir),
          findme = "(43c81cb723)"
        )
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
          feedback("Target db-settings seem valid. (79234d2ba0)")
        } else {
          # invalid:
          feedback(
            print_this = "Target db-settings not valid.",
            type = "Warning",
            findme = "096341c4c1",
            ui = T
          )
          feedback(paste0(
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
#' @param x A character string. E.g. "hello world" will become "Hello world".
#'
firstup <- function(x) {
  substr(x, 1, 1) <- toupper(substr(x, 1, 1))
  return(x)
}


fix_sql_display <- function(text) {
  t <- text
  t <- gsub("\\\n", "<br>\n", t)
  t <- gsub("\\\t", "&nbsp;&nbsp;&nbsp;&nbsp;", t)
  return(t)
}
