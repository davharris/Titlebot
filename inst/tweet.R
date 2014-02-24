# This script requires oauth tokens to actually tweet
# As written, it auto-tweets to both accounts.
# Could probably refactor it to avoid copy-pasting danger

devtools::load_all()
library(twitteR)

# A simple function to titleize R strings (there's probably a cleaner way to do this).
titleize = function(title) {
  substr(title, 1, 1) = toupper(substr(title, 1, 1))
  return(title)
}

# Ecology -----------------------------------------------------------------
ecology_bigram = load_bigram("data/plos_ecology")
title = generate_title(
  bigram = ecology_bigram,
  n_candidates = 20, 
  max_length = 140,
  max_words = 100
)
title = titleize(title)
title


load("ecology_auth.Rdata") # object is named `auth`
if(registerTwitterOAuth(auth)){
  tweet(title)
}


# Machine learning --------------------------------------------------------

ML_bigram = load_bigram("data/StatMLTitles")
title = generate_title(
  bigram = ML_bigram,
  n_candidates = 20, 
  max_length = 140,
  max_words = 100
)
title = titleize(title)
title


load("ML_titles-auth.Rdata") # object is named `auth`
if(registerTwitterOAuth(auth)){
  tweet(titleize(title))
}


# "Creation Science" --------------------------------------------------------

answers_bigram = load_bigram("data/Answers_Research_Journal")
title = generate_title(
  bigram = answers_bigram,
  n_candidates = 20, 
  max_length = 140,
  max_words = 100
)
title = titleize(title)
title


load("Answers-auth.Rdata") # object is named `auth`
if(registerTwitterOAuth(auth)){
  tweet(titleize(title))
}
