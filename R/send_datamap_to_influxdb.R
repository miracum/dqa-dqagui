
#' @title send_datamap_to_influxdb
#'
#' @param rv The global rv object. Only the rv$datamap part will be used.
#'
#' @export
#'
send_datamap_to_influxdb <- function(rv) {
  if (isTRUE(!is.null(rv$datamap$target_data))) {
    ## TODO Outsource these settings:
    scheme = "http"
    host = "influxdb"
    port = 8086
    user = "user"
    pass = "pass"
    path = "/"
    db = "db123"


    body <- datamap_to_body(rv)



    # body <- toJSON(rv$datamap$target_data, pretty = T)
    body
    DQAgui::feedback(paste0("Body: ", body),
                     type = "InfluxDB",
                     findme = "7f5da7c889")

    url <- paste0(scheme, "://", host, ":", port, path)

    url_write <- paste0(url, "write?db=", db)
    url_query <- paste0(url, "query?db=", db, "&pretty=true&q=")
    q_read = "SELECT * FROM item_count"
    url_read <- paste0(url_query, q_read)

    DQAgui::feedback(paste0("URL-write: ", url_write),
             type = "InfluxDB",
             findme = "83935041e2")
    DQAgui::feedback(paste0("URL-read: ", url_read),
             type = "InfluxDB",
             findme = "5b99c9a91d")

    DQAgui::feedback("Starting to write results to API ...",
             type = "InfluxDB",
             findme = "77a1933130")
    res <- POST(url_write, body = body, encode = "raw")
    DQAgui::feedback("POST job finished.", type = "InfluxDB", findme = "a0b33a6a42")

    DQAgui::feedback("Show results of the POST job:",
             type = "InfluxDB",
             findme = "2b7f08438a")
    print(res)

    DQAgui::feedback("Showing results via GET:",
             type = "InfluxDB",
             findme = "368d24adef")
    res <- GET(url_read)
  } else {
    DQAgui::feedback("Can't send target datamap to influxdb, because data is missing.",
             findme = "b5db144e73")
  }
}

#' @title This function creates the string for the raw-body
#'    used by the influxdb to transfer the datamap
#' @param rv The global rv object.
#' @param type (String) The type of the output. E.g. "raw" or "json"
#'
datamap_to_body <- function(rv, type = "raw") {
  list <- rv$datamap$target_data
  if (type == "raw") {
    res <- ''
    for (i in 1:nrow(list)) {
      paste0(res,
             'item_count,site=',
             rv$sitename,
             ',item="',
             list[i, "variable"],
             '" n=',
             list[i, "n"],
             '\n')
    }
    return(res)
  } else if (type == "json") {
    res <- toJSON(list)
    res
    return(res)
  }
}
