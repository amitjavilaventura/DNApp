# ========================= #
#   DNAme server function   #
# ========================= #

# Render input name in text        
dname_input <- function(input, output, session) {
    
    output$name <-  renderText({
      isolate({input$dna_name})
    })
}

# Render output name (dna name) in text
dname_outname <- function(input, output, session) {
    output$text_output <- renderText({
      
      nucl_acid <- isolate({input$nucleicacid})
      if(nucl_acid == "DNA"){ table = dna_codon_aa }
      else if(nucl_acid == "mRNA"){ table = rna_codon_aa }
      
      DNAme <- name2dna(input = isolate({input$dna_name}), nucleic_acid = nucl_acid,
                        table = table, codon_usage = isolate({input$codon_usage}), 
                        sep = isolate({input$separator}))
      if(is.list(DNAme)){ paste(DNAme$name) }
      else{ paste(DNAme) }
    })
}

# Render table with all 1-letter, 3-letter aa, aa names and most frequent codons for several species.
dname_table <- function(input, output, session) {
  output$table_output <- renderTable({
    
    nucl_acid <- isolate({input$nucleicacid})
    if(nucl_acid == "DNA"){ table = dna_codon_aa }
    else if(nucl_acid == "mRNA"){ table = rna_codon_aa }
    
    DNAme <- name2dna(input = isolate({input$dna_name}), nucleic_acid = nucl_acid,
                      table = table, codon_usage = isolate({input$codon_usage}), 
                      sep = isolate({input$separator}))    
    
    if(is.list(DNAme)){ DNAme$df }
    else{ paste(DNAme) }
  })
}

dname_dsDNA <- function(input, output, session) {
  output$dsDNA_name <- renderTable({
    
    nucl_acid <- isolate({input$nucleicacid})
    if(nucl_acid == "DNA"){ table = dna_codon_aa }
    else if(nucl_acid == "mRNA"){ table = rna_codon_aa }
    
    DNAme <- name2dna(input = isolate({input$dna_name}), nucleic_acid = nucl_acid,
                      table = table, codon_usage = isolate({input$codon_usage}), 
                      sep = isolate({input$separator}))
    
    if(is.list(DNAme)){ DNAme$ds_name }
    else{ paste(DNAme) }
  }, spacing = "xs")
}

# DNAme server function complete
dname_server <- function(input, output, session) {
  
  observeEvent(input$submit_dname, {
    dname_input(input, output, session)
    dname_outname(input, output, session)
    dname_table(input, output, session)
    dname_dsDNA(input, output, session)
  })
  
}
  