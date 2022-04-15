![GitHub](https://img.shields.io/github/license/RafaelSdeSouza/qrprcomp)
# qrprcomp (R package)

The qrprcomp package offers a fast QR based principal components analysis implementation with similar
functionalities as the prcomp package. 

## Installation

Source installation from GitHub:

```R
install.packages('remotes')
remotes::install_github("RafaelSdeSouza/qrprcomp")
library(qrprcomp)
```
## Usage

An example of using the package to run a PCA:

``` r
library(qrprcomp)
set.seed(42)
  N <- 1e4
  M <- 1e3
  X <- matrix(rnorm(N*M), M)
  system.time(prcomp(X))
  system.time(qrprcomp(X))

```

## Dependencies

`torch`

## References
