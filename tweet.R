# This script requires oauth tokens to actually tweet
# As written, it auto-tweets to both accounts.
# Could probably refactor it to avoid copy-pasting danger

devtools::load_all()
library(twitteR)

# Ecology -----------------------------------------------------------------
ecology_bigram = load_bigram("plos_ecology")
title = generate_title(
  bigram = ecology_bigram,
  n_candidates = 20, 
  max_length = 140,
  max_words = 100
)
title


load("ecology_auth.Rdata") # object is named `auth`
if(registerTwitterOAuth(auth)){
  tweet(title)
}


# Machine learning --------------------------------------------------------

ML_bigram = load_bigram("StatMLTitles")
title = generate_title(
  bigram = ML_bigram,
  n_candidates = 20, 
  max_length = 140,
  max_words = 100
)
title


load("ML_titles-auth.Rdata") # object is named `auth`
if(registerTwitterOAuth(auth)){
  tweet(title)
}
