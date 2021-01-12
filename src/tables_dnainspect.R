### DNAinspect tables
### ===============================================================================================

c("TTT", "TTC", "TTA", "TTG", "TCT", "TCC", "TCA", "TCG", "TAT", "TAC", "TAA", "TAG",
  "TGT", "TGC", "TGA", "TGG", "CTT", "CTC", "CTA", "CTG", "CCT", "CCC", "CCA", "CCG",
  "CAT", "CAC", "CAA", "CAG", "CGT", "CGC", "CGA", "CGG", "ATT", "ATC", "ATA", "ATG",
  "ACT", "ACC", "ACA", "ACG", "AAT", "AAC", "AAA", "AAG", "AGT", "AGC", "AGA", "AGG",
  "GTT", "GTC", "GTA", "GTG", "GCT", "GCC", "GCA", "GCG", "GAT", "GAC", "GAA", "GAG",
  "GGT", "GGC", "GGA", "GGG")


codons <- data.frame(aa_1l = c("F", "F", "L", "L", "S", "S", "S", "S", "Y", "Y", "*", "*", 
                               "C", "C", "*", "W", "L", "L", "L", "L", "P", "P", "P", "P", 
                               "H", "H", "Q", "Q", "R", "R", "R", "R", "I", "I", "I", "M", 
                               "T", "T", "T", "T", "N", "N", "K", "K", "S", "S", "R", "R", 
                               "V", "V", "V", "V", "A", "A", "A", "A", "D", "D", "E", "E", 
                               "G", "G", "G", "G"),
                     aa_3l = c("Phe", "Phe", "Leu", "Leu", "Ser", "Ser", "Ser", "Ser", "Tyr", "Tyr", "STOP", "STOP",
                               "Cys", "Cys", "STOP", "Trp", "Leu", "Leu", "Leu", "Leu", "Pro", "Pro", "Pro", "Pro",
                               "His", "His", "Gln", "Gln", "Arg", "Arg", "Arg", "Arg", "Ile", "Ile", "Ile", "Met",
                               "Thr", "Thr", "Thr", "Thr", "Asn", "Asn", "Lys", "Lys", "Ser", "Ser", "Arg", "Arg",
                               "Val", "Val", "Val", "Val", "Ala", "Ala", "Ala", "Ala", "Asp",  "Asp", "Glu", "Glu",
                               "Gly", "Gly", "Gly", "Gly"),
                     aa_name = c("Phenylalanine", "Phenylalanine", "Leucine", "Leucine", "Serine", "Serine", "Serine", "Serine", "Tyrosine", "Tyrosine", "STOP", "STOP",
                                 "Cysteine", "Cysteine", "STOP", "Tryptophan", "Leucine", "Leucine", "Leucine", "Leucine", "Proline", "Proline", "Proline", "Proline",
                                 "Histidine", "Histidine", "Glutamine", "Glutamine", "Arginine", "Arginine", "Arginine", "Arginine", "Isoleucine", "Isoleucine", "Isoleucine", "Methionine",
                                 "Threonine", "Threonine", "Threonine", "Threonine", "Asparagine", "Asparagine", "Lysine", "Lysine", "Serine", "Serine", "Arginine", "Arginine",
                                 "Valine", "Valine", "Valine", "Valine", "Alanine", "Alanine", "Alanine", "Alanine", "Aspartic acid",  "Aspartic acid", "Glutamic acid", "Glutamic acid",
                                 "Glycine", "Glycine", "Glycine", "Glycine"),
                     codon = c("TTT", "TTC", "TTA", "TTG", "TCT", "TCC", "TCA", "TCG", "TAT", "TAC", "TAA", "TAG",
                               "TGT", "TGC", "TGA", "TGG", "CTT", "CTC", "CTA", "CTG", "CCT", "CCC", "CCA", "CCG",
                               "CAT", "CAC", "CAA", "CAG", "CGT", "CGC", "CGA", "CGG", "ATT", "ATC", "ATA", "ATG",
                               "ACT", "ACC", "ACA", "ACG", "AAT", "AAC", "AAA", "AAG", "AGT", "AGC", "AGA", "AGG",
                               "GTT", "GTC", "GTA", "GTG", "GCT", "GCC", "GCA", "GCG", "GAT", "GAC", "GAA", "GAG",
                               "GGT", "GGC", "GGA", "GGG")
)




