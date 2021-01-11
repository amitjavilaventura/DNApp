############################
### DNApp USER INTERFACE ###
############################

source("src/app_ui_sidebar.R")
source("src/app_ui_body_about.R")
source("src/app_ui_body_dname.R")
source("src/app_ui_body_snap.R")

ui <- dashboardPage(header = dashboardHeader(title = tags$b("DNApp")),
                    skin = "blue", 
                    title = "DNApp",
                    sidebar = dnapp_ui_sidebar, 
                    body = dashboardBody(
                      tabItems(dnapp_body_about,
                               dnapp_body_dname_about, dnapp_body_dname_app,
                               dnapp_body_snap_about, dnapp_body_snap_app)
                    ) # end of dashboardBody
) # end of user interface



