### DNAinspect function
### ===============================================================================================

# ----- Check if input is DNA -----  
# is.dna ---> function already present in the snap functions

# ----- Search for palindromes ----- 
search_palindromes <- function(input, start = 1, nucleotide = "DNA"){
  
  library(dplyr)
  library(magrittr)
  library(Biostrings)
  
  if(nucleotide == "DNA"){
    if(!is.dna(input, nucleotide)){ return("The input DNA must contain only A,T,G and C.")}
    else{ query      <- DNAString(x = input, start = start) }
  }
  
  else{
    if(!is.dna(input, nucleotide)){ return("The input RNA must contain only A,U,G and C.")}
    else{ query      <- RNAString(x = input, start = start) }
  }
  
  res <- Biostrings::findPalindromes(subject = query)
  out <- bind_cols(as.data.frame((ranges(res))),
                   as.data.frame(res)) %>% 
    set_colnames(c("Start", "End", "Width", "Sequence"))
  
  return(out)
  
}


