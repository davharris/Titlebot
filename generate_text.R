data_filename = "plos_ecology"

word_list = readLines(paste0(data_filename, "/word_list.txt"))
m = readMM(paste0(data_filename, "/bigram_transitions.mtx"))

# Prior distribution over title lengths.
length_distribution = scan(
  paste0(data_filename, "/length_distribution.txt"), 
  quiet = TRUE
)

generate_title(
  word_list = word_list, 
  transition_matrix = m, 
  length_distribution = length_distribution,
  n_candidates = 20, 
  max_length = 140,
  max_words = 100
)
