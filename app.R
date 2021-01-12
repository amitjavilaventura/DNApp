#########
# DNApp #
#########

### Load required packages, functions... ----------------------------------------------

# load packages
library(shiny)
#library(shinythemes)
library(shinydashboard)
library(DT)
library(tibble)

# general function
source("src/functions_ui_server.R")

# apps functions
source("src/functions_dname.R")
source("src/functions_snap.R")
source("src/functions_dnainspect.R")

# codon usage tables
source("src/tables_dname.R")
source("src/tables_snap.R")
source("src/tables_dnainspect.R")

### ----- load ui and server files -----
source("src/app_ui.R")
source("src/app_server.R")

# Run the application -------------------------
shinyApp(ui = ui, server = server)