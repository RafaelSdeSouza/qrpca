
# qrprcomp (R package)

A QR based PCA

## Installation

Source installation from GitHub:

```R
install.packages('remotes')
remotes::install_github("RafaelSdeSouza/qrprcomp")
library(qrprcomp)
```
## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(qrprcomp)
set.seed(1)
  N <- 1e4
  M <- 1e3
  X <- matrix(rnorm(N*M), M)
  system.time(prcomp(X))
  system.time(qrprcomp(X))

```

