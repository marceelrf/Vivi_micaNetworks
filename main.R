library(tidyverse)
library(multiMiR)



# mirnas ------------------------------------------------------------------

mica <- get_multimir(org = "hsa",target = "MICA",table = "validated")

micb <- get_multimir(org = "hsa",target = "MICB",table = "validated")



# Expand targets ----------------------------------------------------------

targets <- get_multimir(org = "hsa",
                        mirna = unique(c(mica@data$mature_mirna_id,
                                         micb@data$mature_mirna_id)),
                        table = "validated")

write_lines(unique(targets@data$target_symbol),
           file = "output/target_genes.txt",
           sep = "\n")
