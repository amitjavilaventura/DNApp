#############################
### DNApp SERVER FUNCTION ###
#############################

source("src/app_server_dname.R")

server <- function(input, output, session) {
  
  dname_server(input, output, session)
  
}


