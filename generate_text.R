library(Matrix)
max_length = 140
n_candidates = 20

word_list = readLines("word_list.txt")
m = readMM("ML_bigram_transitions.mtx")
observed_lengths = nchar(readLines("data//StatMLTitles.txt"))

length_distribution = integer(max_length)

for(i in 1:max_length){
  length_distribution[i] = sum(observed_lengths == i)
}


generate_raw = function(transition_matrix, word_list){
  indices = integer(100)
  indices[1] = 1
  for(i in 2:length(indices)){
    indices[i] = sample.int(
      length(word_list),
      size = 1,
      prob = m[indices[i - 1], ]
    )
    if(word_list[indices[i]] == "END" | indices[i] == length(indices)){
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
