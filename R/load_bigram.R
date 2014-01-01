load_bigram = function(path){
  structure(
    list(
      word_list = readLines(paste0(path, "/word_list.txt")),
      transition_matrix = readMM(paste0(path, "/bigram_transitions.mtx")),
      length_distribution = scan(
        paste0(path, "/length_distribution.txt"), 
        quiet = TRUE
      )
    ),
    class = "bigram"
  )
}
