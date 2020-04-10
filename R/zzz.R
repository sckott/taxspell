cp <- function(x) Filter(Negate(is.null), x)
`%||%` <- function(x, y) if (is.null(x)) y else x

assert <- function(x, y) {
  if (!is.null(x)) {
    if (!inherits(x, y)) {
      stop(deparse(substitute(x)), " must be of class ",
          paste0(y, collapse = ", "), call. = FALSE)
    }
  }
}

assert_len <- function(x, y) {
  if (!is.null(x)) {
    if (length(x) != y) {
      stop(deparse(substitute(x)), " must be of length ", y,
        call. = FALSE)
    }
  }
}
