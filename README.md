Titlebot
=========

I string words together from the titles of scientific papers (and now tweets!) using Markov chains. Each word is sampled based on the probability that it follows the preceding word (i.e. I am a [bigram model](http://en.wikipedia.org/wiki/Bigram)).

So far, I have three Twitter accounts: 
* [@EcologyTitles](https://twitter.com/EcologyTitles)tweets about ecology
* [@ML_Titles](https://twitter.com/ML_Titles) tweets about machine learning.
* [@AnswersInMarkov](https://twitter.com/AnswersInMarkov) tweets about "creation science"
* [@HarrisBot](https://twitter.com/HarrisBot) will destroy you all.

In general, the machine learning titles are harder to distinguish from real titles, but the ecology titles can be much funnier (see below).  Real "Creation science" is indistinguishable for Markov chain output.

The machine learning titles in the "data" folder were scraped by Philippe (@PhDP) from ArXiv and are available under a Creative Commons Share Alike license (some of them are CC-BY).

The ecology titles were scraped from PLOS journals using [rplos](https://github.com/ropensci/rplos). These titles are all CC-BY.

The Answers titles are copyrighted by Answers In Genesis. Their inclusion and transformation is not an infringement of copyright in the United States, however, as they are covered by the fair use doctrine. 

The HarrisBot data are [@davidjayharrs](https://twitter.com/davidjayharris)'s tweets, minus retweets.

The code is available under The Artistic License 2.0 (see `LICENSE`).

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
## [1] "online linear programming using sparse graphical structures in genomics"
## [2] "flexible sampling for non-additive model selection in undirected models"
## [3] "infinite degree corrected kriging update rules"                         
## [4] "generalized canonical dual active collaborative competitive filtering"  
## [5] "evolutionary design of kernel induced random matrices"
```


### Ecology:

```r
ecology_bigram = load_bigram("plos_ecology")
replicate(5, generate_title(bigram = ecology_bigram))
```

```
## [1] "ecotype differentiation among genera (stemonitales, myxomycetes, amoebozoa) suggests a northern china"                             
## [2] "can occur everywhere? an apo-14 promoter-driven transgenic poplars (populus balsamifera)"                                          
## [3] "nitrogen use of america 500 year-old inca mummy"                                                                                   
## [4] "influence functional dynamics in southern water temperature, viral diseases phenotype, parasite toxoplasma gondii cysts based prey"
## [5] "rapid assessment of domestic dispersal ability of an evolutionary biology"
```


### Answers Research Journal:

```r
answers_bigram = load_bigram("Answers_Research_Journal")
replicate(5, generate_title(bigram = answers_bigram))
```

```
## [1] "what sense except in crisis"                                                        
## [2] "genome-wide dna sequences queried against the earth"                                
## [3] "mammalian ark kinds on genesis and is dangerous"                                    
## [4] "is there a further examination of coat color ii"                                    
## [5] "karyotype variability within the light of humans and wood in the dodwell hypothesis"
```


### davidjayharris

```r
answers_bigram = load_bigram("davidjayharris")
replicate(5, generate_title(bigram = answers_bigram))
```

```
## [1] "@phdpqc i tried to matrix-based vector calculus?"                                                   
## [2] "@_nickgolding_ @ethanwhite @bendmorris @ethanwhite even use hashes? cc license without regulation." 
## [3] "@cboettig @_nickgolding_ @bobohara @ucfagls if they also had an iphone person in another context."  
## [4] "@bobohara @ucfagls @noamross @quantecologyabc if they meant @accidental__art just spouting bigrams?"
## [5] "@_nickgolding_ if there's a good point. being net really problematic"
```

