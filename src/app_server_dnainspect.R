
# DNAinspect server function
# =================================================================================================

# -----  Inspect stats -----
inspect_stats <- function(input, output, session){
  
  observeEvent(input$inspect_stats, {
    output$inspect_stats <- renderTable({ 
      query <- tibble(seq = isolate(input$input_inspect), nucleotide = isolate(input$nucleotide_inspect), start = isolate(input$start_inspect))
      dna.stats2(input = query$seq, start = query$start, nucleotide = query$nucleotide)
      
    })
  })
}

# -----  Inspect palindrome -----
inspect_palindrome <- function(input, output, session){
  
  observeEvent(input$inspect_palindrome, {
    output$inspect_palindrome <- renderTable({ 
      query <- tibble(seq = isolate(input$input_inspect), nucleotide = isolate(input$nucleotide_inspect), start = isolate(input$start_inspect))
      palindromes(input = query$seq, start = query$start, nucleotide = query$nucleotide)
    })
  })
}

# -----  Inspect palindrome -----
inspect_start_codon <- function(input, output, session){
  
  observeEvent(input$inspect_codons, {
    output$inspect_start_codon <- renderTable({ 
      query <- tibble(seq = isolate(input$input_inspect), nucleotide = isolate(input$nucleotide_inspect), start = isolate(input$start_inspect))
      start_codons(input = query$seq, start = query$start, nucleotide = query$nucleotide)
    })
  })
}

# ----- DNAinspect server -----
inspect_server <- function(input, output, session){
  
  inspect_stats(input, output, session)
  inspect_palindrome(input, output, session)
  inspect_start_codon(input, output, session)
}
