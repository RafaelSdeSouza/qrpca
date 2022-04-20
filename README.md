![GitHub](https://img.shields.io/github/license/RafaelSdeSouza/qrprcomp)
# qrprcomp (R package)

qrprcomp behaves similarly prcomp. But employes a QR based PCA instead of applying singular value decomposition on the original matrix. The code uses torch for matrix operations and provides support for gpu acceleration. 

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
  system.time(qrprcomp(X,center = TRUE, scale = FALSE,cuda = FALSE))

```

## Dependencies

`torch`

## References
- Sharma, Alok and Paliwal, Kuldip K. and Imoto, Seiya and Miyano, Satoru 2013, International Journal of Machine Learning and Cybernetics, 4, 6, doi: [10.1007/s13042-012-0131-7](https://doi.org/10.1007/s13042-012-0131-7)
