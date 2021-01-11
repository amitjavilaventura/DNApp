# ========================= #
#   sNAP+ server function   #
# ========================= #

# ----- sNAP stats -----
snap_stats <- function(input, output, session, query){
  
  observeEvent(input$show_stats, {
    output$stats_table <- renderTable({ 
      query <- tibble(seq = isolate(input$input_snap), nucleotide = isolate(input$nucleotide_snap), start = isolate(input$start_snap))
      dna.stats(input = query$seq, start = query$start, nucleotide = query$nucleotide)
      
    })
  })
}

# ----- sNAP conversion -----
snap_conversion <- function(input, output, session, query){
  
  observeEvent(input$do_conversion, {
    output$conversion_table <- renderTable({ 
      query <- tibble(seq = isolate(input$input_snap), nucleotide = isolate(input$nucleotide_snap), start = isolate(input$start_snap))
      dna.conversion(input = query$seq, start = query$start, nucleotide = query$nucleotide)
    })
  })
}

# ----- sNAP dna2prot -----
snap_dna2prot <- function(input, output, session, query){
  
  observeEvent(input$do_dna2prot, {
    output$dna2prot_table <- renderTable({ 
      query <- tibble(seq = isolate(input$input_snap), nucleotide = isolate(input$nucleotide_snap), start = isolate(input$start_snap))
      dna2prot(input = query$seq, start = query$start, nucleotide = query$nucleotide)
    })
  })
}


# ----- sNAP server -----
snap_server <- function(input, output, session){
  
  snap_stats(input, output, session)
  snap_conversion(input, output, session)
  snap_dna2prot(input, output, session)
  
}

