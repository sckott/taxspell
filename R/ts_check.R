#' Check taxonomic spelling
#' @export
#' @param x (character) vector of taxonomic names. required
#' @param dict (hunspell_dictionary) a hunspell dictionary, see [ts_dict()]
#' @return tibble/data.frame of the form:
#' - supplied (character): the supplied name in the `x` parameter
#' - match (logical): whether an exact match was found
#' - matches (character): the matched named, if an exact match was found
#' - suggestions (list): if no match found, a vector of suggestions
#' @details uninomials only for now
#' @examples \dontrun{
#' x <- c("Helianthus", "Helianthos", "Helionthus",
#' "Helianthuss", "helianthus", "Hellianthos")
#' (z <- ts_check(x))
#' z$suggestions
#' }
ts_check <- function(x, dict = ts_dict("tpl")) {
  assert(x, "character")
  z <- hunspell_check(x, dict = dict)
  matches <- vector(mode = "character", length = length(z))
  suggs <- vector(mode = "list", length = length(z))
  for (i in seq_along(z)) {
    matches[i] <- if (z[i]) x[i] else NA_character_
    if (!z[i]) suggs[[i]] <- hunspell_suggest(x[i], dict = dict)[[1]]
  }
  tibble(supplied = x, match = z, matches = matches,
    suggestions = suggs)
}
