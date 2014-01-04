Titlebot
=========

I string words together from the titles of scientific papers using Markov chains. Each word is sampled based on the probability that it follows the preceding word (i.e. I am a [bigram model](http://en.wikipedia.org/wiki/Bigram)).

So far, I have two Twitter accounts: [@EcologyTitles](https://twitter.com/EcologyTitles), which tweets about ecology, and [@ML_Titles](https://twitter.com/ML_Titles), which tweets about machine learning.  In general, the machine learning titles are harder to distinguish from real titles, but the ecology titles can be much funnier (see below).

The machine learning titles in the "data" folder were scraped by Philippe (@PhDP) from ArXiv and are available under a Creative Commons Share Alike license (some of them are CC-BY).

The ecology titles were scraped from PLOS journals using [rplos](https://github.com/ropensci/rplos). These titles are all CC-BY.

The code is available under The Artistic License 2.0 (see `LICENSE`).

The transition matrices are in a [standard format](http://math.nist.gov/MatrixMarket/formats.html#MMformat) as exported by `Matrix::writeMM`.

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


