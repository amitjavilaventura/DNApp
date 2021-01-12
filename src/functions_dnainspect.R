### DNAinspect functions
### ===============================================================================================

# ----- Check if input is DNA/RNA -----  
# is.dna ---> function already present in the snap functions

# ----- Search for palindromes ----- 
palindromes <- function(input, start = 1, nucleotide = "DNA"){
  
  library(dplyr)
  library(magrittr)
  library(Biostrings)
  
  if(nucleotide == "DNA"){
    if(!is.dna(input = input, nucleotide = nucleotide)){ return("The input DNA must contain only A,T,G and C.")}
    else{ query <- DNAString(x = input, start = start) }
  }
  
  else{
    if(!is.dna(input = input, nucleotide = nucleotide)){ return("The input RNA must contain only A,U,G and C.")}
    else{ query <- RNAString(x = input, start = start) }
  }
  
  res <- Biostrings::findPalindromes(subject = query)
  out <- bind_cols(as.data.frame((ranges(res))),
                   as.data.frame(res)) %>% 
    set_colnames(c("Start", "End", "Width", "Palindrome"))
  
  if(nrow(out)==0){ return("There aren't any palindromes in the input sequence.") }
  
  return(out)
  
}

# ----- Search for codons -----
search_codons <- function(input, start = 1, nucleotide = "DNA" , aa = "START"){
  
  library(Biostrings)
  library(dplyr)
  library(magrittr)
  
  if(nucleotide == "DNA"){
    if(!is.dna(input = input, nucleotide = nucleotide)){ return("The input DNA must contain only A,T,G and C.")}
    else{ 
      query <- DNAString(x = input, start = start)
      pattern <- codons$codon_dna[which(codons$aa_3l == aa)]
    }
  }
  else{
    if(!is.dna(input = input, nucleotide = nucleotide)){ return("The input RNA must contain only A,U,G and C.")}
    else{  
      query <- RNAString(x = input, start = start) 
      pattern <- codons$codon_rna[which(codons$aa_3l == aa)]
    }
  }
  
  out <- list()
  for(i in 1:length(pattern)){ 
    res        <- Biostrings::matchPattern(pattern = pattern[i], subject = query) 
    out[[i]]   <- bind_cols(as.data.frame((ranges(res))),
                            as.data.frame(res)) %>% 
      set_colnames(c("Start", "End", "Width", "Codon"))
  }
  
  out <- bind_rows(out)
  
  if(nrow(out)==0){ return(paste("The codon coding for", aa, "is not in the input sequence.")) }
  
  return(out)
  
}


# ----- DNA stats -----  
dna.stats2 <- function(input, start = 1, nucleotide = "DNA"){
  
  library(Biostrings)
  library(dplyr)
  library(magrittr)
  library(stringr)
  
  bases <- str_split(input, "") %>% unlist()
  
  if(nucleotide == "DNA"){
    if(!is.dna(input = input, nucleotide = nucleotide)){ return("The input DNA must contain only A,T,G and C.") }
    else{ query <- DNAString(x = input, start = start) }
  }
  else{
    if(!is.dna(input = input, nucleotide = nucleotide)){ return("The input RNA must contain only A,U,G and C.")}
    else{ query <- RNAString(x = input, start = start) }
  }
  
  len        <- query@length
  gc         <- gc.content(query)
  codons     <- codons(query)
  n_codons   <- length(codons)
  start_base <- start
  
  palindrome   <- palindromes(input, start = start, nucleotide = nucleotide)
  n_palindrome <- nrow(palindrome)
  if(!is.data.frame(palindrome)){n_palindrome <- 0}
  
  start_codon   <- search_codons(input, start = start, nucleotide = nucleotide, aa = "START")
  n_start       <-  nrow(start_codon)
  if(!is.data.frame(start_codon)){n_start <- 0}
  
  stop   <- search_codons(input, start = start, nucleotide = nucleotide, aa = "STOP")
  n_stop <- nrow(stop)
  if(!is.data.frame(stop)){n_stop <- 0}

  out <- tibble(Stat  = c("Input", "Length", "% GC", "Start base", 
                          "Number of codons", "Possible palindromes",
                          "Possible starting codons", "Possible stop codons"),
                Value = c(input, len, gc, start_base, 
                          n_codons, n_palindrome,
                          n_start, n_stop))
  
  return(out)
  
}

# ----- Search for patterns -----
search_pattern <- function(input, start = 1, nucleotide ="DNA", pattern = "ATG"){
  
  library(Biostrings)
  library(dplyr)
  library(magrittr)
  
  if(nucleotide == "DNA"){
    if(!is.dna(input = input, nucleotide = nucleotide)){ return("The input DNA must contain only A,T,G and C.") }
    #else if(!is.dna(pattern, nucleotide)){ return("The pattern DNA must contain only A,T,G and C.") }
    else{ query <- DNAString(x = input, start = start) }
  }
  else{
    if(!is.dna(input = input, nucleotide = nucleotide)){ return("The input RNA must contain only A,U,G and C.") }
    #else if(!is.dna(pattern, nucleotide)){ return("The pattern RNA must contain only A,U,G and C.") }
    else{  query <- RNAString(x = input, start = start) }
  }
  
  res <- Biostrings::matchPattern(pattern = pattern, subject = query)
  out <- bind_cols(as.data.frame(ranges(res)),
                   as.data.frame(res)) %>% 
    set_colnames(c("Start", "End", "Width", "Pattern"))
  
  if(nrow(out) == 0){ return("The input pattern has not been found in the input sequence.")  }
  
  return(out)
  
}
