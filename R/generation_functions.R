generate_raw = function(transition_matrix, word_list, max_words){
  indices = integer(max_words)
  indices[1] = 1
  for(i in 2:max_words){
    indices[i] = sample.int(
      length(word_list),
      size = 1,
      prob = transition_matrix[indices[i - 1], ]
    )
    if(word_list[indices[i]] == "END" | indices[i] == max_words){
      indices[i] = 0
      break
    }
  }
  paste(word_list[indices[-1]], collapse = " ")
}

generate_title = function(
  transition_matrix, 
  word_list, 
  length_distribution,
  n_candidates = 20, 
  max_length = 140,
  max_words = 100
){
  candidates = replicate(
    n_candidates, 
    generate_raw(
      transition_matrix = transition_matrix, 
      word_list = word_list,
      max_words = max_words
    )
  )
  valid_candidates = candidates[nchar(candidates) < max_length]
  
  # Pick one of the valid candidates at random, favoring candidates whose titles
  # are of similar length to the real titles
  sample(
    valid_candidates,
    1,
    prob = length_distribution[nchar(valid_candidates)]
  )
}
