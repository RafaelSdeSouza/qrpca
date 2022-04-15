#  Copyright 2022, Rafael S. de Souza
#' QR based PCA
#'
#' Performs a QR based principal component analysis,
#' The result is returned as an object of class \code{prcomp}.
#'
#' \code{qrprcomp} computes a principal component (PC) using QR decomposition as
#' intermediate step. Matrix operations mostly uses  \code{torch} for
#' performance.
#'
#' @import torch
#' @export
#' @param x a numeric matrix or data frame which provides the data
#'   for the principal component analysis.
#' @rdname qrprcomp
#' @param center a logical value indicating whether the empirical mean of (the
#'   columns) of \code{x} should be subtracted.
#' @param scale a logical value indicating whether the columns of \code{x}
#'   should be scaled to have unit variance before the analysis takes place. The
#'   default is \code{FALSE} for consistency with \code{prcomp}.
#' @return \code{qrprcomp} returns a list with class \code{prcomp}
#'   containing the following elements: \item{sdev}{the additional standard
#'   deviation explained by each component.}
#'   \item{rotation}{the matrix of loadings,
#'   containing the principal axes as columns.}
#'   \item{x}{the scores matrix
#'    containing the principal components as columns.}
#'   \item{center, scale}{the centering and
#'   scaling used, or \code{FALSE}}
#' @export
qrprcomp <- function(x,center = TRUE, scale = FALSE){
    x <- scale(x, center = center, scale = scale)
    cen <- attr(x, "scaled:center")
    sc <- attr(x, "scaled:scale")
    x0 <- if (is_torch_dtype(x)) x  else torch_tensor(as.matrix(x))
    out = torch::torch_qr(x0)
    q <- out[[1]]
    r <- out[[2]]
    A <- torch::torch_svd(r$t())
    u =  A[[1]]
    s =  torch::torch_diag(A[[2]])
    v = A[[3]]
    out <- torch::torch_mm(torch_mm(q,v),s)
    sdev <- as.numeric(A[[2]]/sqrt(max(1, nrow(x) - 1)))
    rotation <- as.matrix(u)
    dimnames(rotation) <- list(colnames(x), paste0("PC", seq_len(ncol(u))))
    out <- as.matrix(out)
    colnames(out) <- colnames(rotation)
    r <- list(sdev = sdev, rotation = rotation,
    center = if(is.null(cen)) FALSE else cen,
    scale = if(is.null(sc)) FALSE else sc,
    x = as.matrix(out))
    class(r) <- "prcomp"
    r
  }
