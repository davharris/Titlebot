generate_raw = function(index, word_list, max_words, first_word = "START"){
  title_int = integer(max_words)
  word_id = match(first_word, word_list)
  
  for(i in 1:max_words){
    if(word_list[word_id] == "END"){
      break
    }
    if(i == max_words){
      title_int = title_int * 0
      break
    }
    if(
      word_list[word_id] != "START"
    ){
      title_int[i] = word_id
    }
    options = index[which(index == word_id) + 1]
    word_id = options[sample.int(length(options), 1)]
  }
  paste(word_list[title_int], collapse = " ")
}

generate_title = function(
  bigram,
  n_candidates = 20, 
  max_length = 140,
  max_words = 100,
  first_word = "START"
){
  candidates = replicate(
    n_candidates, 
    generate_raw(
      index = bigram$index, 
      word_list = bigram$word_list,
      max_words = max_words,
      first_word = first_word
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

# Replace @mentions with ᘓmentions, to eliminate spamming.
unmention = function(tweet){
  gsub("@", "ᘓ", tweet)
}

# Replace &amp; with &
fix_xml = function(tweet){
  gsub("&amp;", "&", tweet)
  gsub("&lt;", "<", tweet)
  gsub("&gt;", ">", tweet)
}
