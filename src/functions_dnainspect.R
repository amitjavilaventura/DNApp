### DNAinspect functions
### ===============================================================================================

# ----- Check if input is DNA/RNA -----  
# is.dna ---> function already present in the snap functions

# ----- Search for palindromes ----- 
palindromes <- function(input, start=1, nucleotide = "DNA"){
  
  library(dplyr)
  library(magrittr)
  library(Biostrings)
  
  if(nucleotide == "DNA"){
    if(!is.dna(input, nucleotide)){ return("The input DNA must contain only A,T,G and C.")}
    else{ query <- DNAString(x = input, start = start) }
  }
  
  else{
    if(!is.dna(input, nucleotide)){ return("The input RNA must contain only A,U,G and C.")}
    else{ query <- RNAString(x = input, start = start) }
  }
  
  res <- Biostrings::findPalindromes(subject = query)
  out <- bind_cols(as.data.frame((ranges(res))),
                   as.data.frame(res)) %>% 
    set_colnames(c("Start", "End", "Width", "Palindrome"))
  
  return(out)
  
}

# ----- Search for start codons -----
start_codons <- function(input, start = 1, nucleotide = "DNA"){
  
  library(dplyr)
  library(magrittr)
  library(magrittr)

  if(nucleotide == "DNA"){
    if(!is.dna(input, nucleotide)){ return("The input DNA must contain only A,T,G and C.")}
    else{ 
      start_codon <- "ATG"
      query <- DNAString(x = input, start = start) 
    }
  }
  
  else{
    if(!is.dna(input, nucleotide)){ return("The input RNA must contain only A,U,G and C.")}
    else{
      start_codon <- "AUG"
      query <- RNAString(x = input, start = start)
    }
  }
  
  res <- Biostrings::matchPattern(pattern = start_codon, subject = query)
  out <- bind_cols(as.data.frame((ranges(res))),
                   as.data.frame(res)) %>% 
    set_colnames(c("Start", "End", "Width", "Codon"))
  
  return(out) 
}

# ----- Search for stop codons -----
stop_codons <- function(input, start=1, nucleotide ="DNA"){}


# ----- DNA stats -----  
dna.stats2 <- function(input, start = 1, nucleotide = "DNA"){
  
  library(Biostrings)
  library(dplyr)
  library(magrittr)
  library(stringr)
  
  if(nucleotide == "DNA"){
    if(!is.dna(input, nucleotide)){ return("The input DNA must contain only A,T,G and C.")}
    else{
      bases      <- str_split(input, "") %>% unlist()
      query      <- DNAString(x = input, start = start)
    }
  }
  
  else{
    if(!is.dna(input, nucleotide)){ return("The input RNA must contain only A,U,G and C.")}
    else{
      bases      <- str_split(input, "") %>% unlist()
      query      <- RNAString(x = input, start = start)
    }
  }
  
  len        <- query@length
  gc         <- gc.content(query)
  codons     <- codons(query)
  n_codons   <- length(codons)
  start_base <- start
  
  palindrome <- palindromes(input, start = start, nucleotide = nucleotide)
  n_palindrome <- nrow(palindrome)
  
  start <- start_codons(input, start = start, nucleotide = nucleotide)
  n_start <- nrow(start)
  
  #stop  <- stop_codons(input, start = start, nucleotide = nucleotide)
  #n_stop <- nrow(stop)
  
  out <- tibble(Stat  = c("Input", "Length", "% GC", "Start base", 
                          "Number of codons", "Number of palindromes",
                          "Possible starting codons"),
                Value = c(input, len, gc, start_base, 
                          n_codons, n_palindrome,
                          n_start))
  
  return(out)
  
}



