library(elife)

elife.dois = readLines("data/elife_dois.txt")

doi = sample(elife.dois, 1)

raw_keywords = elife_doi(dois=c(doi), ret="keywords")[[1]]

doge = c("much", "many", "very", "such", "what", "so", "good", "nice")
doge.probs = c(1, 1, 1, 1, .1, 1, .1, .1)

conclusions = c("wow.", "amaze.", "excite.")
conclusions.probs = c(1, .1, .1)

conclude = sample(conclusions, 1, prob = conclusions.probs)


keywords = unique(tolower(unlist(strsplit(raw_keywords, " "))))

selected.words = sample(keywords, 3) 

selected.doge = sample(
  doge, 
  length(selected.words), 
  prob = doge.probs, 
  replace = FALSE
)

phrases = sapply(
  1:length(selected.words),
  function(i){
    paste(selected.doge[i], selected.words[i])
  }
)

out = paste0(
  paste(phrases, collapse = ". "),
  ". ",
  conclude,
  " http://doi.org/",
  doi
)

out

