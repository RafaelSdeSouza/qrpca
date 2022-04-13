test_that("PCA Comparison time", {
  set.seed(1)
  N <- 1e4
  M <- 1e3
  X <- matrix(rnorm(N*M), M)
  system.time(prcomp(X))
  system.time(qrprcomp(X))
})
