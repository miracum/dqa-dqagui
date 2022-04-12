context("app-file")
# This file is for testing the applications in the inst/ directory.

test_that("DQAgui shiny app / launch_app() works", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  #%app <- shiny::shinyAppDir("tests/testthat/apps/dqagui/")
  app <- shiny::shinyAppDir("apps/dqagui/")

  local_edition(3)

  # https://mastering-shiny.org/scaling-testing.html#testing-reactivity
  # https://rstudio.github.io/shinytest/articles/shinytest.html
  # https://rstudio.github.io/shinytest/articles/in-depth.html
  shiny::testServer(app = app, expr = {
    session$setInputs(tabs = "tab_config")
    session$setInputs(`moduleConfig-config_load_mdr` = "click")
    rv$restricting_date$use_it <- FALSE
    rv$source$system_name <- "exampleCSV_source"
    rv$target$system_name <- "exampleCSV_target"
    rv$source$system_type <- "csv"
    rv$target$system_type <- "csv"
    rv$target_is_source <- FALSE
    rv$source$settings$path <- Sys.getenv("CSV_SOURCE_BASEPATH")
    rv$target$settings$path <- Sys.getenv("CSV_SOURCE_BASEPATH")
    DQAgui:::check_load_data_button(rv, session)
    session$flushReact()
    session$setInputs(`moduleConfig-config_sitename` = "undefined")
    session$setInputs(`moduleConfig-date_restriction_slider` = FALSE)
    session$setInputs(`moduleConfig-select_dqa_assessment_variables` =
                        rv$dqa_assessment[["designation"]])
    session$setInputs(`moduleConfig-dash_load_btn` = "click")
    expect_snapshot(rv)
    expect_snapshot(rv$results_descriptive)
    expect_snapshot(rv$results_plausibility_atemporal)
    expect_snapshot(rv$datamap)
  })
})