generate_raw_trigram = function(index, word_list, max_words, first_word = "START"){
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
    if(i <= 2){
      options = index[which(index == word_id) + 1]
    }else{
      options = index[which(c((index == word_id), FALSE) + c(FALSE, (index == last_word_id)) == 2) + 1]
    }
    last_word_id = word_id
    word_id = options[sample.int(length(options), 1)]
  }
  paste(word_list[title_int], collapse = " ")
}