#############################
### DNApp SERVER FUNCTION ###
#############################

source("src/app_server_dname.R")
source("src/app_server_snap.R")

server <- function(input, output, session) {
  
  dname_server(input, output, session)
  snap_server(input, output, session)
  
}


