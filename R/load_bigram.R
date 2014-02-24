load_bigram = function(path){
  structure(
    list(
      word_list = readLines(paste0(path, "/word_list.txt")),
      index = scan(
        paste0(path, "/index.txt"),
        quiet = TRUE
      ),
      length_distribution = scan(
        paste0(path, "/length_distribution.txt"), 
        quiet = TRUE
      )
    ),
    class = "bigram"
  )
}
