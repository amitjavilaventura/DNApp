#######################
### sNAP+ FUNCTIONS ###
#######################

# ----- Check if input is DNA -----  
is.dna <- function(input, nucleotide = "DNA"){
  
  library(dplyr)
  library(stringr)
  
  splited <- stringr::str_split(string = input, pattern = "") %>% unlist()
  
  if(nucleotide == "DNA") { check.dna <- grepl("[ATGCatgc]", splited) }
  else{ check.dna <- grepl("[AUGCaugc]", splited) }
  if(FALSE %in% check.dna){ return(FALSE) }
  else{ return(TRUE) }

}

# ----- Check % of GC -----  
gc.content <- function(query, start = 1){
  
  library(Biostrings)
  library(dplyr)
  library(magrittr)
  
  gc <- letterFrequency(x = query, letters = c("G", "C")) %>% as_tibble() %>% sum() / query@length * 100
  
  return( round(gc, 2) )
}

# ----- DNA stats -----  
dna.stats <- function(input, start = 1, nucleotide = "DNA"){
  
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
  
  out <- tibble(Stat  = c("Input", "Length", "% GC", "Start base", "Number of codons"),
                Value = c(input, len, gc, start_base, n_codons))
    
  return(out)
  
}

# ----- DNA conversion -----  
dna.conversion <- function(input, start = 1, nucleotide = "DNA"){
  
  library(dplyr)
  library(magrittr)
  library(Biostrings)
  
  if(nucleotide == "DNA"){
    if(!is.dna(input, nucleotide)){ return("The input DNA must contain only A,T,G and C.")}
    else{ query    <- DNAString(x = input, start = start) }
  }
  
  else{
    if(!is.dna(input, nucleotide)){ return("The input RNA must contain only A,U,G and C.")}
    else{ query    <- RNAString(x = input, start = start) }
  }
  
  rev      <- reverse(query) %>% as.character()
  comp     <- complement(query) %>% as.character()
  rev.comp <- reverseComplement(query) %>% as.character()
  
  out <- bind_cols(input, rev, comp, rev.comp) %>% t() %>% as_tibble() %>%
    set_colnames("Sequence") %>% 
    mutate(Name = c("Input", "Reverse", "Complementary", "Complementary reverse"),
           Direction = c("5'->3'", "3'->5'", "3'->5'", "5'->3'")) %>% 
    select(Name, Direction, Sequence)
  
  return(out)
}


# ----- DNA to protein -----
dna2prot <- function(input, start = 1, code = "standard", nucleotide = "DNA"){
  
  library(Biostrings)
  library(dplyr)
  library(magrittr)
  
  if(nucleotide=="DNA"){
    if(!is.dna(input, nucleotide)){ return("The input DNA must contain only A,T,G and C.")}
    else{ query <- DNAString(x = input, start = start) }
  }
  
  else{
    if(!is.dna(input, nucleotide)){ return("The input RNA must contain only A,U,G and C.")}
    else{ query <- RNAString(x = input, start = start) }
  }
  
  aa_1l   <- translate(query) %>% as.character() %>% str_split(pattern = "") %>% unlist()
    
  aa_seq  <- tibble() 
  for(i in 1:length(aa_1l)){
    aa_seq <- bind_rows(aa_seq, aa_table %>% filter(one_letter == aa_1l[i]))
  }
    
  codons     <- codons(query)
  n_codons   <- length(codons)
  codon_list <- character(length = n_codons)
  for(i in 1:length(codons)){
    codon <- paste(query[IRanges::as.data.frame(codons@ranges)$start[i]:IRanges::as.data.frame(codons@ranges)$end[i]], collapse = "")
    codon_list[i] <- codon
  }
  codon_list <- paste(codon_list, collapse = "-")
    
  out <- tibble(input   = input,
                codon   = codon_list,
                aa_name = paste(aa_seq$aminoacid, collapse = " - "), 
                aa_3l   = paste(aa_seq$three_letter, collapse = " - "),
                aa_1l   = paste(aa_seq$one_letter, collapse = " ")) %>% t() %>% as_tibble() %>% 
      set_colnames("Sequence") %>%
      mutate(Name = c("Input", "Codon", "Aminoacid name",  "3-letter code", "1-letter code")) %>%
      select(Name, Sequence)
    
  return(out)
}

