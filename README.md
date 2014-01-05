Titlebot
=========

I string words together from the titles of scientific papers using Markov chains. Each word is sampled based on the probability that it follows the preceding word (i.e. I am a [bigram model](http://en.wikipedia.org/wiki/Bigram)).

So far, I have two Twitter accounts: [@EcologyTitles](https://twitter.com/EcologyTitles), which tweets about ecology, and [@ML_Titles](https://twitter.com/ML_Titles), which tweets about machine learning.  In general, the machine learning titles are harder to distinguish from real titles, but the ecology titles can be much funnier (see below).

The machine learning titles in the "data" folder were scraped by Philippe (@PhDP) from ArXiv and are available under a Creative Commons Share Alike license (some of them are CC-BY).

The ecology titles were scraped from PLOS journals using [rplos](https://github.com/ropensci/rplos). These titles are all CC-BY.

The code is available under The Artistic License 2.0 (see `LICENSE`).

The transition matrices are in a [standard format](http://math.nist.gov/MatrixMarket/formats.html#MMformat) as exported by `Matrix::writeMM`.

Praise for Titlebot:
====================

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
## [1] "sparsityboost: a spatially-informed fused lasso"        
## [2] "joint ofdm system based estimation in graphs"           
## [3] "random graph clustering hidden markov networks"         
## [4] "efficient density estimation with a subspace clustering"
## [5] "multiple gaussian multi-armed bandit problems"
```


### Ecology:

```r
ecology_bigram = load_bigram("plos_ecology")
replicate(5, generate_title(bigram = ecology_bigram))
```

```
## [1] "ecotype differentiation among genera (stemonitales, myxomycetes, amoebozoa) suggests a northern china"                             
## [2] "a fixed motor boat noise affects larval tolerance of tiger (panthera uncia) in daphnia magna"                                      
## [3] "genetic affinities of the dynamical implications"                                                                                  
## [4] "influence functional dynamics in southern water temperature, viral diseases phenotype, parasite toxoplasma gondii cysts based prey"
## [5] "rapid assessment of domestic dispersal ability of an evolutionary biology"
```

