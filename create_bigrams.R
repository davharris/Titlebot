library(stringr)
library(Matrix)

# File name without the directory name and without the .txt at the end
# e.g. StatMLTitles if the title file exists in data/StatMLTitles.txt
data_filename = "StatMLTitles"

raw_titles = readLines(paste0("data/", data_filename, ".txt"))

# make everything lowercase; drop quote marks
titles = gsub("\"", "", tolower(raw_titles))
# Drop double-spaces
titles = gsub(" +", " ", titles)
# Drop empty titles
titles = titles[nchar(titles) > 0]



# build index -------------------------------------------------------------

split_titles = sapply(
  strsplit(titles, " "),
  function(x){
    c("START", x, "END")
  }
)

word_list = unique(unlist(split_titles))
index = match(unlist(split_titles), word_list)


# Probability distribution over title lengths -----------------------------
observed_lengths = nchar(titles)
length_distribution = integer(max(observed_lengths))
for(i in 1:length(length_distribution)){
  length_distribution[i] = sum(observed_lengths == i)
}

length_density = density(
  observed_lengths, 
  from = 1, 
  to = max(observed_lengths), 
  n = max(observed_lengths),
  bw = 5
)

smoothed_length_distribution = length_density$y


# save outputs ------------------------------------------------------------

dir.create(data_filename, showWarnings = FALSE)
write(index, paste0(data_filename, "/index.txt"))
write(word_list, paste0(data_filename, "/word_list.txt"))
write(smoothed_length_distribution, paste0(data_filename, "/length_distribution.txt"))
