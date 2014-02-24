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
  bigram,
  n_candidates = 20, 
  max_length = 140,
  max_words = 100
){
  candidates = replicate(
    n_candidates, 
    generate_raw(
      transition_matrix = bigram$transition_matrix, 
      word_list = bigram$word_list,
      max_words = max_words
    )
  )
  valid_candidates = candidates[nchar(candidates) < max_length]
  
  # Pick one of the valid candidates at random, favoring candidates whose titles
  # are of similar length to the real titles
  sample(
    valid_candidates,
    1,
    prob = bigram$length_distribution[nchar(valid_candidates)]
  )
}

generate_start = function(
  bigram, word,
  n_candidates = 20, 
  max_length = 140,
  max_words = 100
){
  candidates = replicate(
    n_candidates, 
    generate_rawstart(
      transition_matrix = bigram$transition_matrix, 
      word_list = bigram$word_list,
      max_words = max_words,
      word=word
    )
  )
  valid_candidates = candidates[nchar(candidates) < max_length]
  
  # Pick one of the valid candidates at random, favoring candidates whose titles
  # are of similar length to the real titles
  sample(
    valid_candidates,
    1,
    prob = bigram$length_distribution[nchar(valid_candidates)]
  )
}

generate_rawstart = function(transition_matrix, word_list, max_words, word){
  startindex = which(word_list==word)
  if(length(startindex)==0) stop("Word not in word list")
  indices = integer(max_words)
  indices[1] = 1
  indices[2] = startindex
  for(i in 3:max_words){
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
