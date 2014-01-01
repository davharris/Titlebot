library(Matrix)
max_length = 140
n_candidates = 20

data_filename = "plos_ecology"

word_list = readLines(paste0(data_filename, "/word_list.txt"))
m = readMM(paste0(data_filename, "/bigram_transitions.mtx"))

# Prior distribution over title lengths.
length_distribution = scan(
  paste0(data_filename, "/length_distribution.txt"), 
  quiet = TRUE
)
length_distribution = length_distribution[1:max_length]


generate_raw = function(transition_matrix, word_list, max_words = 100){
  indices = integer(max_words)
  indices[1] = 1
  for(i in 2:max_words){
    indices[i] = sample.int(
      length(word_list),
      size = 1,
      prob = m[indices[i - 1], ]
    )
    if(word_list[indices[i]] == "END" | indices[i] == max_words){
      indices[i] = 0
      break
    }
  }
  paste(word_list[indices[-1]], collapse = " ")
}


candidates = replicate(
  n_candidates, 
  generate_raw(transition_matrix = m, word_list = word_list)
)
valid_candidates = candidates[nchar(candidates) < max_length]

# Pick one of the valid candidates at random, favoring candidates whose titles
# are of similar length to the real titles
sample(
  valid_candidates,
  1,
  prob = length_distribution[nchar(valid_candidates)]
)
