shiny::shinyUI(shinydashboard::dashboardPage(skin = "black",

                      # Application title
                      shinydashboard::dashboardHeader(title = "DQAgui"),

                      shinydashboard::dashboardSidebar(

                        # Include shinyjs in the UI Sidebar
                        shinyjs::useShinyjs(),
                        shinyjs::extendShinyjs(script = "reset.js", functions = "reset"), # Add the js code to the page

                        #Sidebar Panel
                        shinydashboard::sidebarMenu(id = "tabs",
                                                    shinydashboard::menuItem("Dashboard", tabName = "tab_dashboard", icon = icon("tachometer-alt")),
                                                    shinydashboard::sidebarMenuOutput("menu"),
                                                    shinydashboard::menuItem("Config", tabName = "tab_config", icon = icon("cogs")),
                                                    shinydashboard::sidebarMenuOutput("mdr"),
                                                    shiny::tags$hr(),
                                                    shiny::actionButton("reset", "Reset DQA Tool")
                        )),

                      shinydashboard::dashboardBody(

                        # Include shinyjs in the UI Body
                        shinyjs::useShinyjs(),

                        # js reset function
                        # https://stackoverflow.com/questions/25062422/restart-shiny-session
                        shinyjs::extendShinyjs(script = "reset.js", functions = "reset"), # Add the js code to the page

                        shinydashboard::tabItems(
                          shinydashboard::tabItem(tabName = "tab_dashboard",
                                  moduleDashboardUI("moduleDashboard")
                          ),

                          shinydashboard::tabItem(tabName = "tab_config",
                                  moduleConfigUI("moduleConfig")
                          ),

                          shinydashboard::tabItem(tabName = "tab_descriptive",
                                  moduleDescriptiveUI("moduleDescriptive")
                          ),

                          shinydashboard::tabItem(tabName = "tab_atemp_plausibility",
                                  moduleAtempPlausibilityUI("moduleAtempPlausibility")
                          ),

                          shinydashboard::tabItem(tabName = "tab_unique_plausibility",
                                  moduleUniquePlausibilityUI("moduleUniquePlausibility")
                          ),

                          shinydashboard::tabItem(tabName = "tab_visualizations",
                                  moduleVisualizationsUI("moduleVisulizations")
                          ),

                          shinydashboard::tabItem(tabName = "tab_report",
                                  moduleReportUI("moduleReport")
                          ),

                          shinydashboard::tabItem(tabName = "tab_mdr",
                                  moduleMDRUI("moduleMDR")
                          )

                        )
                      )
))
