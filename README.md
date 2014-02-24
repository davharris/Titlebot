Titlebot
=========

I string words together from the titles of scientific papers using Markov chains. Each word is sampled based on the probability that it follows the preceding word (i.e. I am a [bigram model](http://en.wikipedia.org/wiki/Bigram)).

So far, I tweet about three kinds of titles: 
* [@EcologyTitles](https://twitter.com/EcologyTitles) tweets about ecology based on PLOS titles.
* [@ML_Titles](https://twitter.com/ML_Titles) tweets about machine learning based on ArXiV titles.
* [@AnswersInMarkov](https://twitter.com/AnswersInMarkov) tweets about "creation science" based on articles published by [Answers in Genesis' "peer-reviewed" "journal"](http://www.answersingenesis.org/arj).

Additionally, @noamross thought it would be funny to create [@HarrisBot](https://twitter.com/HarrisBot), which tweets about whatever [@davidjayharris](https://twitter.com/davidjayharris) tweets about. This repository contains a model based on [@kara_woo](https://twitter.com/kara_woo)'s tweets as well.

In general, the machine learning titles are harder to distinguish from real titles, but the ecology titles can be much funnier (see below).  Real "creation science" is, of course, indistinguishable for Markov chain output.

The transition matrices are in a [standard format](http://math.nist.gov/MatrixMarket/formats.html#MMformat) as exported by `Matrix::writeMM`.

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
## [1] "directional statistics in infinite latent force models for efficient exact and tracking"
## [2] "fast convergence analysis of tuned models"                                              
## [3] "dintucker: scaling up robust support"                                                   
## [4] "thompson sampling for large-scale svm and observed graphs"                              
## [5] "generalized canonical dual active collaborative competitive filtering"
```


### Ecology:

```r
ecology_bigram = load_bigram("plos_ecology")
replicate(5, generate_title(bigram = ecology_bigram))
```

```
## [1] "biodiversity effects of host–pathogen interactions: testing the hermit spiders"          
## [2] "what are maternal corticosterone levels of sylvatic dengue virus infection in ants"      
## [3] "nitrogen use of america 500 year-old inca mummy"                                         
## [4] "fungi that favor ‘gang’ foraging performance but not advance of arabidopsis inbred lines"
## [5] "influence of functional landscape in social amoeba"
```


### Answers Research Journal:

```r
answers_bigram = load_bigram("Answers_Research_Journal")
replicate(5, generate_title(bigram = answers_bigram))
```

```
## [1] "an initial estimate toward identifying and the soul"                     
## [2] "a creationist defense of uluṟu, australia: reply"                        
## [3] "numerical simulations of human holobaramin"                              
## [4] "“in-place” fossils by chance"                                            
## [5] "there a warm ocean: continuous zonal flow, gulf of plasma astronomy 2013"
```


### kara_woo

```r
woo_bigram = load_bigram("kara_woo")
replicate(5, generate_title(bigram = woo_bigram))
```

```
## [1] "@dr_kalmia i need to prep for others, but now i'm all for @cbahlai. if it’s right now i'm really good!"
## [2] "@cbahlai definitely should!"                                                                           
## [3] "the impression that this one:"                                                                         
## [4] "@davidjayharris @recology_ @accidental__art got to eastern wa in is particularly like?"                
## [5] "$18 for me."
```




### davidjayharris

```r
harris_bigram = load_bigram("davidjayharris")
replicate(5, generate_title(bigram = harris_bigram))
```

```
## [1] "ok, thanks. wasn't a summary or take ten emails"                                                       
## [2] "@ucfagls prior information). freq. optimizes both files to get that logo is different, except for you?"
## [3] "hm, looks like a2?"                                                                                    
## [4] ".@zachweiner did you encounter (apart from nearby."                                                    
## [5] "@kwbroman just cause many of the original matrix, databases could be at the tax"
```


Licensing
========
The code is available under The Artistic License 2.0 (see `LICENSE`).

The machine learning titles in the "data" folder were scraped by Philippe (@PhDP) from ArXiv and are available under a Creative Commons Share Alike license (some of them are CC-BY).

The ecology titles were scraped from PLOS journals using [rplos](https://github.com/ropensci/rplos). These titles are all CC-BY.

The Answers titles are copyrighted by Answers In Genesis. Their inclusion and transformation is not an infringement of copyright in the United States, however, as they are covered by the fair use doctrine. 

The HarrisBot data are [@davidjayharrs](https://twitter.com/davidjayharris)'s tweets, minus retweets. These are hereby released as CC-BY.

Kara Woo's tweets are used with her permission.
