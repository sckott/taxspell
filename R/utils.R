#' make a dictionary
#' @keywords internal
#' @param x (character) vector of taxonomic names. required. if names
#' are given with spaces (e.g., a species name like _Poa annua_) we'll
#' split those up, with each written to a new line
#' @param name (character) name to use for the dictionary files
#' @param path (character) path in which to put dictionary files. required
#' @details if `name` is `NULL`, the name of the dictionary files is taken
#' from the file path
#' @examples
#' # ts_make_dictionary("x", name = "foo")
ts_make_dictionary <- function(x, name = NULL, path = NULL) {
  assert(x, "character")
  assert(name, "character")
  assert(path, "character")
  stopifnot(xor(!is.null(name), !is.null(path)))
  
  x <- unique(unlist(lapply(x, function(z) strsplit(z, "\\s")[[1]])))

  base_path <- file.path(ts_cache$cache_path_get(), name)
  
  aff_path <- paste0(base_path, ".aff")
  cat("SET UTF-8\n", file = aff_path)
  
  dic_path <- paste0(base_path, ".dic")
  writeLines(c(length(x), x), dic_path)
}
