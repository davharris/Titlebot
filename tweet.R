# This script requires an oauth token to actually tweet

devtools::load_all()
library(twitteR)

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
