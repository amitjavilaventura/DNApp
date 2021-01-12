# DNAinspect user interface 
# =================================================================================================

# ----- DNAinspect about tab -----
dnapp_body_dnainspect_about <- 
  tabItem(tabName = "dnainspect_about",
          HTML('<p style="font-size:30px;font-family:Helvetica;color:black;"><u>Welcome to DNAinspect!</u></p>'),
          HTML('<img align="right" src="DNAinspect.png" width="350px">'),
          
          br(), 
          
          h3("What is DNAinspect?"),
          p("DNAinspect is a Shiny app that searches for patterns in a given DNA sequence."),
          
          br(),
          
          h3("Author"),
          tags$p("DNAinspect is an app deveolped by:",
                 tags$ul(tags$li(tags$a(href = "https://amitjavilaventura.github.io","Adrià Mitjavila Ventura", target="_blank")))),
          
          br(),br(),br(),br(),br(),
          
          HTML('<center><a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">
               <img alt="Creative Commons Licence" style="border-width:0" 
               src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a>
               <br />This work is licensed under a <a rel="license" 
               href="http://creativecommons.org/licenses/by-nc-nd/4.0/">
               Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.
               </center>'))


# ----- DNAinspect app tab -----
dnapp_body_dnainspect_app <- 
  tabItem(tabName = "dnainspect_app",
          splitLayout(cellWidths = c("30%", "70%"),
                      column(width = 12,
                             box(width = 12, collapsible = F, collapsed = F,
                                 title = tagList(icon("keyboard"), "Query sequence"), solidHeader = T,
                                 textAreaInput(inputId = "input_inspect", label = "Write the query sequence", height = "150px")),
                             box(width = 12, collapsible = T, collapsed = T,
                                 title = tagList(icon("gear"), "General params"), solidHeader = T,
                                 selectInput(inputId = "nucleotide_inspect", label = "Select the nucleic acid:", choices = c("DNA", "RNA"), selected = "DNA", selectize = T),
                                 sliderInput(inputId = "start_inspect", label = "Base to start reading (1,2,3)", value = 1, min = 1, max = 3, step = 1)),
                             box(title = tagList(icon("calculator"), " Stats. params."), width = 12, collapsible = T, collapsed = T,
                                 actionButton(inputId = "inspect_stats", label = "Show stats")),
                             box(title = tagList(icon("equals"), " Match params."), width = 12, collapsible = T, collapsed = T,
                                 textInput(inputId = "match_text", label = "Write a pattern to search:", width = "100%"),
                                 actionButton(inputId = "inspect_match", label = "Search patterns")),
                             box(title = tagList(icon("exchange-alt"), " Palindrome params."), width = 12, collapsible = T, collapsed = T,
                                 actionButton(inputId = "inspect_palindrome", label = "Search palindromes")),
                             #box(title = tagList(icon("cut"), "Restriction params."), width = 12, collapsible = T, collapsed = F,
                             #    actionButton(inputId = "inspect_restriction", label = "Search restriction targets")),
                             box(title = tagList(icon("dice-three"), " Codons prams."), width = 12, collapsible = T, collapsed = T,
                                 selectInput(inputId = "inspect_search_codon", 
                                             label = "Select the aminoacid to look at its codons:", 
                                             choices = codons$aa_3l, multiple = F, width = "100%"),
                                 actionButton(inputId = "inspect_codons", label = "Search codons"))),
                      
                      column(width = 12,
                             box(title = tagList(icon("calculator"), " Statistics"), width = 12, collapsible = T, collapsed = F,
                                 tags$div(tableOutput(outputId = "inspect_stats"), style = "font-family:courier;")),
                             box(title = tagList(icon("equals"), " Matches"), width = 12, collapsible = T, collapsed = F,
                                 tags$div(tableOutput(outputId = "inspect_match"), style = "font-family:courier;")),
                             box(title = tagList(icon("exchange-alt"), " Palindromes"), width = 12, collapsible = T, collapsed = F,
                                 tags$div(tableOutput(outputId = "inspect_palindrome"), style = "font-family:courier;")),
                             #box(title = tagList(icon("cut"), "Restriction targets"),  width = 12, collapsible = T, collapsed = F),
                             box(title = tagList(icon("dice-three"), " Codons"), width = 12, collapsible = T, collapsed = F,
                                 tags$div(tableOutput(outputId = "inspect_search_codon"), style = "font-family:courier;"))
                             )))







