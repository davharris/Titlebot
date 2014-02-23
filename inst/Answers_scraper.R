library(RCurl)
library(CSS)
library(stringr)

## get webpage and process

titles = unique(
  unlist(
    sapply(
      1:7, function(i){
        url <- paste0("http://www.answersingenesis.org/articles/arj/v", i, "/n1")
        
        z = strsplit(content(GET(url), as = "text"), "\n")[[1]]
        
        gsub(
          "^.*ID=\"[0-9]*\">(.*)</A>.*$",
          "\\1",
          grep("ajaxTip", z, value = TRUE)
        )
        
      }
    )
  )
)

titles = gsub("</?i>", "", titles)
write(titles, "data/Answers_Research_Journal.txt")
