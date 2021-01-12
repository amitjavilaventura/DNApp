#########################
### DNApp UI SIDEBAR ###
########################

dnapp_ui_sidebar <- dashboardSidebar(
  sidebarMenu(
    br(),
    menuItem(text = "About", tabName = "About", icon = icon("at", lib = "font-awesome")),
    menuItem(text = "DNAme", tabName = "dname", icon = icon("dna", lib = "font-awesome"),
             menuSubItem(text = "About", tabName = "dname_about"),
             menuSubItem(text = "DNAme", tabName = "dname_app")),
    menuItem(text = "sNAP+", tabName = "snap", icon = icon("random", lib = "font-awesome"),
             menuSubItem(text = "About", tabName = "snap_about"),
             menuSubItem(text = "sNAP+", tabName = "snap_app")),
    menuItem(text = "DNAinspect", tabName = "dnainspect", icon = icon("eye", lib = "font-awesome"),
             menuSubItem(text = "About", tabName = "dnainspect_about"),
             menuSubItem(text = "DNAinspect", tabName = "dnainspect_app")),
    
    hr(),
    menuItem(text = "Code", href = "https://github.com/amitjavilaventura/", newtab = T, icon = icon("code", lib = "font-awesome"))
  ))