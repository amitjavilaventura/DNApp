dnapp_body_about <- 
  tabItem(tabName = "About",
          HTML('<p style="font-size:30px;font-family:Helvetica;color:black;"><u>Welcome to DNApp!</u></p>'),
          HTML('<img align="right" src="dnapp.png" width="400px">'),
          br(),
          h3("What is DNApp?"),
          p("DNApp is a Shiny application that collects all my DNA-related Shiny apps"),
          br(),
          h3("Author"),
          tags$p("All apps in DNApp are developed by:",
                 tags$ul(tags$li(tags$a(href = "https://amitjavilaventura.github.io","Adrià Mitjavila Ventura", target="_blank")))),
          br(),
          h3("List of apps"),
          tags$p("The apps currently present in DNApp are:",
                 tags$ul(tags$li("DNAme"),
                         tags$li("sNAP+"))),
          br(),br(),br(),br(),
          HTML('<center><a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">
               <img alt="Creative Commons Licence" style="border-width:0" 
               src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" />
               </a><br />This work is licensed under a 
               <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">
               Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.</center>'))
