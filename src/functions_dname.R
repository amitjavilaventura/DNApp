#######################
### DNAme functions ###
#######################

# ----- Is.Letter ----- #
# Helper function to see if the input name characters of name2dna is a letter or not
is.letter <- function(input){
  
  library(dplyr)
  
  splited <- stringr::str_split(string = input, pattern = "") %>% unlist()
  check.letter <- grepl("[[:alpha:]]", splited)
  
  return(check.letter)
}
# ----- Is.Letter.Normal ----- #
# Helper function to see if the input name characters of name2dna is a non-accented (i.e. à) letter or not
is.letter.normal <- function(input){
  
  library(dplyr)
  
  splited <- stringr::str_split(string = input, pattern = "") %>% unlist()
  
  check.letter <- grepl("[a-zA-Z[:space:]]", splited)
  check.accent <- grepl("[àáâãçèéêìíîñòóôõùúûÀÁÂÃÇÈÉÊÌÍÎÑÒÓÔÕÙÚÛ]", splited)
  
  if(FALSE %in% check.letter | TRUE %in% check.accent){
    check.normal <- FALSE
  }
  else if(!(FALSE %in% check.letter & TRUE %in% check.accent)){
    check.normal <- TRUE
  }
  
  return(check.normal)
}

# ----- is.aa.letter ----- # 
# function to check if all letters in input have an associated amino acid
is.not.aa <- function(input){
  
  library(dplyr)
  
  splited <- stringr::str_split(string = input, pattern = "") %>% unlist()
  check.aa.letter <- grepl("[bçjñouxzBÇJÑOUXZ]", splited)
  
  return(check.aa.letter)
}

# ----- Get complementary sequence ----- # 
# function to make the complementary sequence of an input
dna_complementary <- function(input, sep=""){
  
  library(stringr)
  library(dplyr)
  library(magrittr)
  
  query <- str_to_upper(input) %>% str_split(pattern = "") %>% unlist()
  complement <- character(length = length(query))

  for(i in 1:length(query)){
      complement[i] <- if_else(str_detect(query[i], "A"), "T",
                               if_else(str_detect(query[i], "G"), "C",
                                       if_else(str_detect(query[i], "T"), "A",
                                               if_else(str_detect(query[i], "C"), "G", " ")))) 
  }
  
  ds_name <- data_frame(`5' -> 3'` = paste(query, collapse = sep),
                        `3' <- 5'` = paste(complement, collapse = sep)) %>% 
    t() %>% 
    as.data.frame() %>%
    set_colnames(c(" "))
  
  return(ds_name)
  
}


# ----- Convert Name to DNA ----- #
name2dna <- function(input="DNAme", nucleic_acid = "DNA", table = dna_codon_aa, codon_usage = "Human", sep = "-"){
  
  library(stringr)
  library(dplyr)
  library(magrittr)
  
  # split name in 
  name <- str_to_upper(input) %>% str_split(pattern = "") %>% unlist()
  
  # if input is not character --> stop
  if(!is.letter.normal(input)){
    
    message <- paste("The written name must not contain any special characters (i.e. 'à', '-',...)")
    return(message)
  
  }
  else{
    
    # if there are not allowed letters --> stop
    if(TRUE %in% is.not.aa(input)){
      
      message <- paste("One of the letters in", input, "does not have an associated amminoacid.")
      return(message)
      
    }
    else{
      
      # create a dataframe with all the information of each letter of the name
      dna_name <- c()
      for(i in name){
        dna_name <- rbind(dna_name, table[which(table$one_letter %in% i),])
      }
      
      # create a list with the data.frame object and the name
      DNAme <- list()
      DNAme$df <- dna_name %>% 
        set_colnames(c("Aminoacid (1-letter code)", "Aminoacid (3-letter code)", "Amino acid", 
                       "Most frequent codon (Human)", "Most frequent codon (Mouse)", 
                       "Most frequent codon (C. elegans)", "Most frequent codon (A. thaliana)",
                       "Most frequent codon (E. coli)"))
      
      DNAme$name <- paste((dna_name %>% select(codon_usage))[1:length(name),1], collapse = sep)
      
      if(nucleic_acid == "DNA"){
        DNAme$ds_name <- dna_complementary(paste((dna_name %>% select(codon_usage))[1:length(name),1], collapse = ""), sep = "")
      }
      
      # return list
      return(DNAme)
      }
  }
  
}


