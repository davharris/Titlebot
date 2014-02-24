Titlebot
=========

I string words together from the titles of scientific papers using Markov chains. Each word is sampled based on the probability that it follows the preceding word (i.e. I am a [bigram model](http://en.wikipedia.org/wiki/Bigram)).

So far, I tweet about three kinds of titles: 
* [@EcologyTitles](https://twitter.com/EcologyTitles) tweets about ecology based on PLOS titles.
* [@ML_Titles](https://twitter.com/ML_Titles) tweets about machine learning based on ArXiV titles.
* [@AnswersInMarkov](https://twitter.com/AnswersInMarkov) tweets about "creation science" based on articles published by [Answers in Genesis' "peer-reviewed" "journal"](http://www.answersingenesis.org/arj).

Additionally, @noamross thought it would be funny to create [@HarrisBot](https://twitter.com/HarrisBot), which tweets about whatever [@davidjayharris](https://twitter.com/davidjayharris) tweets about. This repository contains a model based on [@kara_woo](https://twitter.com/kara_woo)'s tweets as well.

In general, the machine learning titles are harder to distinguish from real titles, but the ecology titles can be much funnier (see below).  Real "creation science" is, of course, indistinguishable for Markov chain output.

Praise for Titlebot:
====================

* "[This is exactly what I need to finish my PhD.](http://www.reddit.com/r/MachineLearning/comments/1ukbo5/tightening_mrf_relaxations_really_solve_sparse/cej8yel)

* "[an excellent example for why "no one has ever studied X" is not a sufficient reason to do a study!](https://twitter.com/duffy_ma/status/419629166787436546)"

* "[a good place to hunt for inspiring project ideas](https://twitter.com/noamross/status/419629657965617152)"

* "[That could be the title of the grant we just submitted](https://twitter.com/noamross/status/417781836626935808)"

* "[That sounds delicious](https://twitter.com/kara_woo/status/417781958476054528)"

* "[I actually would like to read this one. Would you mind writing it?](https://twitter.com/_NickGolding_/status/414848962164953088)"


Examples
========




### Machine learning:

```r
ML_bigram = load_bigram("StatMLTitles")
replicate(5, generate_title(bigram = ML_bigram))
```

```
## [1] "structured signal processing with missing data"                             
## [2] "determining full conditional sparse gradients with distributional estimates"
## [3] "a new york workshop on grouse and their contextual bandits"                 
## [4] "randomized kaczmarz algorithm and response data"                            
## [5] "learning with applications to colombian conflict analysis"
```


### Ecology:

```r
ecology_bigram = load_bigram("plos_ecology")
replicate(5, generate_title(bigram = ecology_bigram))
```

```
## [1] "nowhere to predict the composition on population persistence of smart urban environment"                     
## [2] "two constraints are not infection"                                                                           
## [3] "randomization modeling of the short-lived annual forb dominated forests"                                     
## [4] "climate change in the himalaya: water and indigenous burning or increase with the high-throughput sequencing"
## [5] "radiographs reveal unexpected fine-scale analysis of biodiversity"
```


### Answers Research Journal:

```r
answers_bigram = load_bigram("Answers_Research_Journal")
replicate(5, generate_title(bigram = answers_bigram))
```

```
## [1] "numerical simulation of peer review of any kind exist before the dodwell hypothesis" 
## [2] "adam, free choice, and unification theory for studies"                               
## [3] "numerical simulations of retroviruses"                                               
## [4] "numerical simulation of precipitation in yellowstone national park with a warm ocean"
## [5] "more abundant than stars"
```


### davidjayharris

```r
harris_bigram = load_bigram("davidjayharris")
replicate(5, generate_title(bigram = harris_bigram))
```

```
## [1] "@srsupp you meant to anything today:"                                                                 
## [2] "@johnmyleswhite does #rstats will take."                                                              
## [3] "@algaebarnacle @rstudioapp is there a typical to the word in #rstats' matrix multiplies"              
## [4] "apple could still valuable. we live in daphnia magna. delightful work, documentation, popularity...)."
## [5] "@kara_woo @algaebarnacle"
```


### kara_woo

```r
woo_bigram = load_bigram("kara_woo")
replicate(5, generate_title(bigram = woo_bigram))
```

```
## [1] "@alexhanna less of trying to get any reason i get a long, multi-state road trip to was going up on an unrelated note, i'm going to shame."
## [2] "@polesasunder talk on reaching quadruple-digit tweets."                                                                                   
## [3] "@queerscientist oh but no sticker to recruit me a lovelier day of negging *shudder*"                                                      
## [4] "@ansonmackay definitely should!"                                                                                                          
## [5] "@bashir9ist @markcc @rachelapaul @dr24hours @mbeisen not for an account in ca."
```


Licensing
========
The code is available under The Artistic License 2.0 (see `LICENSE`).

The machine learning titles in the "data" folder were scraped by Philippe (@PhDP) from ArXiv and are available under a Creative Commons Share Alike license (some of them are CC-BY).

The ecology titles were scraped from PLOS journals using [rplos](https://github.com/ropensci/rplos). These titles are all CC-BY.

The Answers titles are copyrighted by Answers In Genesis. Their inclusion and transformation is not an infringement of copyright in the United States, however, as they are covered by the fair use doctrine. 

The HarrisBot data are [@davidjayharrs](https://twitter.com/davidjayharris)'s tweets, minus retweets. These are hereby released as CC-BY.

Kara Woo's tweets are used with her permission.
