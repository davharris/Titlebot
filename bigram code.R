library(stringr)
library(Matrix)

raw_titles = readLines("data/StatMLTitles.txt")

# make everything lowercase; drop quote marks
titles = gsub("\"", "", tolower(raw_titles))

split_titles = sapply(
  strsplit(titles, " "),
  function(x){
    c("START", x, "END")
  }
)

word_list = unique(unlist(split_titles))

m = sparseMatrix(
  i = integer(0),
  j = integer(0),
  x = integer(0),
  dims = c(length(word_list), length(word_list)), 
  dimnames = list(word_list, word_list)
)


get_word_indices = function(i, split_titles, word_list){
  sapply(
    1:(length(split_titles[[i]]) - 1),
    function(j){
      match(split_titles[[i]][j + 0:1], word_list)
    }
  )
}

for(i in 1:length(split_titles)){
  indices = get_word_indices(i, split_titles, word_list)
  for(j in 1:ncol(indices)){
    m[indices[1, j], indices[2, j]] = m[indices[1, j], indices[2, j]] + 1
  }
}

writeMM(m, "ML_bigram_transitions.mtx")
write(word_list, "word_list.txt")
