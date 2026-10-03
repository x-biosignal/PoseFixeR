#' Flag statistical outliers
#'
#' Flags values lying more than `k` standard deviations from the mean.
#'
#' @param x A numeric vector.
#' @param k Number of standard deviations for the threshold (default 2).
#' @return A list with `caselist` (logical outlier flags) and `abnormal.values`
#'   (the sorted flagged values).
#' @examples
#' set.seed(1)
#' x <- c(rnorm(30), 8)        # a series with one clear outlier
#' flags <- anomaly(x, k = 2)
#' which(flags$caselist)       # position of the flagged value(s)
#' flags$abnormal.values       # the flagged value(s)
#' @export
anomaly <- function(x, k=2) {

  result <- NULL
  result$caselist <- x >= mean(x)+k*stats::sd(x) | x <= mean(x)-k*stats::sd(x)
  result$abnormal.values <- sort(x[result$caselist])
  result
}
