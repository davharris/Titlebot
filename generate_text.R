word_list = readLines("word_list.txt")
m = readMM("ML_bigram_transitions.mtx")

indices = integer(100)
indices[1] = 1
for(i in 2:length(indices)){
  indices[i] = sample.int(
    length(word_list),
    size = 1,
    prob = m[indices[i - 1], ]
  )
  if(word_list[indices[i]] == "END"){
    indices[i] = 0
    break
  }
}
paste(word_list[indices[-1]], collapse = " ")
