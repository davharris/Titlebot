devtools::load_all()


ecology_bigram = load_bigram("plos_ecology")
generate_title(
  bigram = ecology_bigram,
  n_candidates = 20, 
  max_length = 140,
  max_words = 100
)


ML_bigram = load_bigram("StatMLTitles")
generate_title(
  bigram = ML_bigram,
  n_candidates = 20, 
  max_length = 140,
  max_words = 100
)
