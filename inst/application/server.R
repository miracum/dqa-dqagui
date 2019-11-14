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

shiny::shinyServer(function(input, output, session) {

    # define reactive values here
    rv <- shiny::reactiveValues()

    # set headless
    rv$headless <- FALSE

    # set utilspath
    rv$utilspath <- DQAstats::clean_path_name(utilspath)

    # initialize sourcefiledir
    rv$sourcefiledir <- NULL

    # read datamap email
    rv$datamap_email <- tryCatch({
        # if existing, set email address for data-map button
        out <- DQAstats::get_config(paste0(utilspath, "email.yml"), "email")
    }, error = function(e){
        print(e)
        # otherwise set it to empty string
        out <- ""
    }, finally = function(f){
        return(out)
    })

    # current date
    rv$current_date <- format(Sys.Date(), "%d. %B %Y", tz = "CET")

    # TODO remove later, when we have more input source
    rv$db_source <- db_source

    # run on_start here
    on_start(session, rv, input, output)

    # handle reset
    shiny::observeEvent(input$reset, {
        shinyjs::js$reset()
    })

    # ########################
    # # tab_config
    # ########################

    shiny::callModule(moduleConfigServer, "moduleConfig", rv, input_re=shiny::reactive({input}))

    shiny::observe({

        # first call (rv$target_getdata = TRUE and rv$source_getdata = TRUE), when load-data-button quality checks in moduleDashboard are passed
        if (!is.null(rv$getdata_target) && !is.null(rv$getdata_source)){

            # hide load data button
            shinyjs::hide("moduleDashboard-dash_load_btn")

            # disable config page
            shinyjs::disable("moduleConfig-config_targetdb_rad")
            shinyjs::disable("moduleConfig-config_targetdb_dbname")
            shinyjs::disable("moduleConfig-config_targetdb_host")
            shinyjs::disable("moduleConfig-config_targetdb_port")
            shinyjs::disable("moduleConfig-config_targetdb_user")
            shinyjs::disable("moduleConfig-config_targetdb_password")
            shinyjs::disable("moduleConfig-config_targetdb_save_btn")
            shinyjs::disable("moduleConfig-config_targetdb_test_btn")
            shinyjs::disable("moduleConfig-config_sitename")
            shinyjs::disable("moduleConfig-config_sourcedir_in")

            rv$start <- TRUE
        }
    })

    shiny::observe({
        req(rv$mdr)
        shinyjs::disable("moduleConfig-config_load_mdr")

        output$mdr <- shinydashboard::renderMenu({
            shinydashboard::sidebarMenu(
                shinydashboard::menuItem("DQ MDR", tabName = "tab_mdr", icon = icon("database"))
            )
        })
        shinydashboard::updateTabItems(session, "tabs", selected = "tab_config")
    })

    shiny::observe({
        shiny::req(rv$report_created)

        # set end_time
        rv$end_time <- format(Sys.time(), usetz = T, tz = "CET")
        # calc time-diff
        rv$duration <- difftime(rv$end_time, rv$start_time, units = "mins")

        # render menu
        output$menu <- shinydashboard::renderMenu({
            shinydashboard::sidebarMenu(
                #shinydashboard::menuItem("Review raw data", tabName = "tab_rawdata1", icon = icon("table")),
                shinydashboard::menuItem("Descriptive Results", tabName = "tab_descriptive", icon = icon("table")),
                shinydashboard::menuItem("Plausibility Checks", tabName = "tab_plausibility", icon = icon("check-circle"),
                                         shinydashboard::menuSubItem("Atemporal Plausibility", tabName = "tab_atemp_plausibility"),
                                         shinydashboard::menuSubItem("Uniqueness Plausibility", tabName = "tab_uniq_plausibility")),
                shinydashboard::menuItem("Completeness", tabName = "tab_completeness", icon = icon("chart-line")),
                #shinydashboard::menuItem("Visualizations", tabName = "tab_visualizations", icon = icon("chart-line")),
                shinydashboard::menuItem("Reporting", tabName = "tab_report", icon = icon("file-alt"))
            )
        })
        shinydashboard::updateTabItems(session, "tabs", "tab_dashboard")
    })

    ########################
    # tab_dashboard
    ########################
    shiny::callModule(moduleDashboardServer, "moduleDashboard", rv, input_re=reactive({input}))

    ########################
    # tab_descriptive
    ########################
    shiny::callModule(moduleDescriptiveServer, "moduleDescriptive", rv, input_re=reactive({input}))

    ########################
    # tab_plausibility
    ########################
    shiny::callModule(moduleAtempPlausibilityServer, "moduleAtempPlausibility", rv, input_re=reactive({input}))
    shiny::callModule(moduleUniquePlausibilityServer, "moduleUniquePlausibility", rv, input_re=reactive({input}))

    ########################
    # tab_completeness
    ########################
    shiny::callModule(moduleCompletenessServer, "moduleCompleteness", rv, input_re=reactive({input}))

    # ########################
    # # tab_visualization
    # ########################
    # shiny::callModule(moduleVisualizationsServer, "moduleVisulizations", rv, input_re=reactive({input}))

    ########################
    # tab_report
    ########################
    shiny::callModule(moduleReportServer, "moduleReport", rv, input_re=reactive({input}))

    ########################
    # tab_mdr
    ########################
    shiny::callModule(moduleMDRServer, "moduleMDR", rv, input_re=reactive({input}))

})
