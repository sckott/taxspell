#' Taxonomic spelling reporter
#' @export
#' @param x (character) vector of taxonomic names. required
#' @param dict (hunspell_dictionary) a hunspell dictionary, see [ts_dict()]
#' @return prints suggestions for names without exact matches
#' @examples \dontrun{
#' x <- c("Helianthus", "Helianthos", "Helionthus",
#' "Helianthuss", "helianthus", "Hellianthos")
#' ts_reporter(x)
#' }
ts_reporter <- function(x, dict = ts_dict("plants_tpl")) {
  z <- hunspell_check(x, dict = dict)
  if (length(x[!z]) > 0) {
    sug <- hunspell_suggest(x[!z], dict = dict)
    sug <- stats::setNames(sug, x[!z])
    cat("spelling suggestions:", sep = "\n")
    for (i in seq_along(sug)) {
      cat(sprintf(" %s:", names(sug)[i]), sep = "\n")
      cat(sprintf("  %s", paste0(sug[[i]], collapse = ", ")), sep = "\n")
    }
  }
}
