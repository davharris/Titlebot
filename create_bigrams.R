library(stringr)
library(Matrix)

# File name without the directory name and without the .txt at the end
# e.g. StatMLTitles if the title file exists in data/StatMLTitles.txt
data_filename = "davidjayharris"

raw_titles = readLines(paste0("data/", data_filename, ".txt"))

# make everything lowercase; drop quote marks
titles = gsub("\"", "", tolower(raw_titles))
# Drop double-spaces
titles = gsub(" +", " ", titles)
# Drop empty titles
titles = titles[nchar(titles) > 0]

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

# Transition matrix in long format.
index.list = lapply(
  1:length(split_titles),
  function(i){
    get_word_indices(i, split_titles, word_list)
  }
)
indices = t(do.call(cbind, index.list))

# Transition matrix as actual matrix
for(i in unique(indices[,1])){
  rows = indices[ , 1] == i
  tab = table(indices[rows, 2])
  m[i, as.integer(names(tab))] = as.integer(tab)
}

# Probability distribution over title lengths
observed_lengths = nchar(titles)
length_distribution = integer(max(observed_lengths))
for(i in 1:length(length_distribution)){
  length_distribution[i] = sum(observed_lengths == i)
}

length_density = density(
  observed_lengths, 
  from = 1, 
  to = max(observed_lengths), 
  n = max(observed_lengths),
  bw = 5
)

smoothed_length_distribution = length_density$y



dir.create(data_filename, showWarnings = FALSE)
writeMM(m, paste0(data_filename, "/bigram_transitions.mtx"))
write(word_list, paste0(data_filename, "/word_list.txt"))
write(smoothed_length_distribution, paste0(data_filename, "/length_distribution.txt"))
