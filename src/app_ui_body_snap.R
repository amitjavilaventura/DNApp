# ======================== #
#   sNAP+ user interface   #
# ======================== #

dnapp_body_snap_about <-
tabItem(tabName = "snap_about", 
        HTML('<p style="font-size:30px;font-family:Helvetica;color:black;"><u>Welcome to sNAP+!</u></p>'),
        HTML('<img align="right" src="snap_plus.png" width="450px">'),
        
        br(),
        
        h3("What is sNAP+?"),
        p("sNAP+ is a shiny application to work with nucleic acids (DNA and RNA)"),
        
        br(),
        
        h3("Author"),
        tags$p("sNAP+ is an app deveolped by:",
               tags$ul(tags$li(tags$a(href = "https://amitjavilaventura.github.io","Adrià Mitjavila Ventura", target="_blank")))),
        
        br(),
        
        h3("Uses:"),
        tags$ul(tags$li("Analytics of a DNA/RNA sequence (% of GC...)"),
                tags$li("Complementary, Reverse or Complementary Reverse from the input sequence"),
                #tags$li("Targets of restriction enzymes"),
                tags$li("Convert the input sequence to a protein sequence.")),
        
        br(),br(),br(),br(),
        HTML('<center><a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">
             <img alt="Creative Commons Licence" style="border-width:0" 
             src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" />
             </a><br />This work is licensed under a <a rel="license" 
             href="http://creativecommons.org/licenses/by-nc-nd/4.0/">
             Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.</center>'))


dnapp_body_snap_app <-
tabItem(tabName = "snap_app",
        splitLayout(cellWidths = c("30%", "70%"),
          column(width = 12,
                 box(width = 12, collapsible = F, collapsed = F,
                     title = tagList(icon("keyboard"), "Query sequence"), solidHeader = T,
                     textAreaInput(inputId = "input_snap", label = "Write the query sequence", height = 150)),
                 box(width = 12, collapsible = T, collapsed = T,
                     title = tagList(icon("gear"), "General params"), solidHeader = T,
                     selectInput(inputId = "nucleotide_snap", label = "Select the nucleic acid:", choices = c("DNA", "RNA"), selected = "DNA", selectize = T),
                     sliderInput(inputId = "start_snap", label = "Base to start reading (1,2,3)", value = 1, min = 1, max = 3, step = 1)),
                 box(title = tagList(icon("calculator"), " Stats. params."), width = 12, collapsible = T, collapsed = F,
                     actionButton(inputId = "show_stats", label = "Show stats")),
                 box(title = tagList(icon("sort-alpha-down"), " Conversion params."), width = 12, collapsible = T, collapsed = T,
                     actionButton(inputId = "do_conversion", label = "Do conversions")),
                 box(title = tagList(icon("dna"), " DNA2Prot prams."), width = 12, collapsible = T, collapsed = T,
                     actionButton(inputId = "do_dna2prot", label = "Translate DNA"))),
           column(width = 12,
              box(title = tagList(icon("calculator"), " Statistics"), width = 12, collapsible = T, collapsed = F,
                  tags$div(tableOutput(outputId = "stats_table"), style = "font-family:courier;")),
              box(title = tagList(icon("sort-alpha-down"), " Seq. conversion"), width = 12, collapsible = T, collapsed = F,
                  tags$div(tableOutput(outputId = "conversion_table"), style = "font-family:courier;")),
              box(title = tagList(icon("dna"), " DNA2Prot"), width = 12, collapsible = T, collapsed = F,
                  tags$div(tableOutput(outputId = "dna2prot_table"), style = "font-family:courier;")))))
