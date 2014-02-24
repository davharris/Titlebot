require(stringr)
user = "davidjayharris"

#greptweet gets tweets getting around twitter's API.  Go there and enter a 
#user to create the associated url
rawtweets = getURL(paste0("http://greptweet.com/u/", user, "/" ,user, ".txt"))
tweets = strsplit(rawtweets, "\n")
tweets = str_replace_all(tweets[[1]], ".*\\|.*\\|", "")  # remove header
tweets = tweets[!str_detect(tweets, "RT\\s@\\w+:\\s")] #remove RTs
tweets = str_replace_all(tweets, "https?://\\S+", "")  # remove URLs
tweets = str_trim(tweets)
cat(tweets, file = paste0("data/", user, ".txt"), sep="\n")
