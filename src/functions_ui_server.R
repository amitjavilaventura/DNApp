#################
# UI functions ##
#################

# function to put inline things (side-by-side)
inline = function (x) { tags$div(style="display:inline-block;", x) }


# function to wrap table text
wrap_table_text <- tags$head(tags$style(
    HTML("#stats_table table tr td {word-wrap: break-word}"),
    HTML("#conversion_table table tr td {word-wrap: break-word}"),
    HTML("#dna2prot_table table tr td {word-wrap: break-word}"),
  ))