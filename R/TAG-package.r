#' Text Analytics Gateway
#' 
#' The Text Analytics Gateway (TAG) is an interactive webapp for performing
#' simple analyses on unstructured text.
#' 
#' \tabular{ll}{ 
#'    Package: \tab textgateway \cr 
#'    Type: \tab Package \cr 
#'    License: \tab AGPL-3 \cr 
#' }
#' 
#' @name textgateway-package
#' @docType package
#' @author Drew Schmidt
#' 
#' @references 
#' Project home page: \url{https://github.com/XSEDEScienceGateways/textgateway}
#' 
#' @useDynLib TAG R_levenshtein_dist R_find_closest_word R_wc
#' 
#' @import shiny
#' @import ggplot2
#' @import SnowballC
#' @import tm
#' @import memuse
#' @import LDAvis
#' 
#' @importFrom wordcloud wordcloud
#' @importFrom RColorBrewer brewer.pal
#' @importFrom qdap apply_as_df word_cor as.dtm
#' @importFrom markdown markdownToHTML
#' @importFrom rmarkdown render html_fragment
#' @importFrom topicmodels LDA terms
#' @importFrom ngram ngram get.phrasetable babble
#' @importFrom rvest html html_text
#' 
#' @keywords Package
NULL
