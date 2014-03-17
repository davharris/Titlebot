library(elife)

searchelife(terms="hormone", searchin="article_title", boolean="matches")

elife.dois = searchelife(
  terms = c("a", "the", "an"), 
  term2 = "or",
  searchin = c("article_title","abstract", "subject_area"), 
  give = "doi",
  boolean = "matches"
)

write(elife.dois, "data/elife_dois.txt")
