![GitHub](https://img.shields.io/github/license/RafaelSdeSouza/qrprcomp)
# qrpca(R package)

qrprcomp behaves similarly prcomp. But employs a QR-based PCA instead of applying singular value decomposition on the original matrix. The code uses torch under the hood for matrix operations and supports GPU acceleration.

## Installation

Source installation from GitHub:

```R
install.packages('remotes')
remotes::install_github("RafaelSdeSouza/qrpca")
library(qrpca)
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
  system.time(qrprcomp(X,cuda = TRUE))
```
 For an astronomical example, we use a datacube from MaNGA for galaxy. It comprises a tensor [74,74,4563], of two spatial dimensions and one spectral dimension. The following code reads the cube and flattens the spectra into a matrix of dimension [5476,4563]
 
 ``` r
cube   <- FITSio::readFITS("manga-7443-12703-LOGCUBE.fits")
n_row  <- dim(cube$imDat)[1]
n_col  <- dim(cube$imDat)[2]
n_wave <- dim(cube$imDat)[3]
cube2D  <- reticulate::array_reshape(cube$imDat, c(n_row*n_col,n_wave),order = c("F"))
 ```





## Dependencies

`torch`

## References
- Sharma, Alok and Paliwal, Kuldip K. and Imoto, Seiya and Miyano, Satoru 2013, International Journal of Machine Learning and Cybernetics, 4, 6, doi: [10.1007/s13042-012-0131-7](https://doi.org/10.1007/s13042-012-0131-7)
