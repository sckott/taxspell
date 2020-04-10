#' Check taxonomic spelling
#' @export
#' @param x (character) dictionary to use. default: "plants_tpl".
#' other options will be added, including custom ones
#' @return path to location of the dictionary files
#' @examples \dontrun{
#' ts_dict()
#' }
ts_dict <- function(x = "plants_tpl") {
  ts_cache$mkdir()
  hunspell::dictionary(ts_find_dict(x))
}

ts_find_dict <- function(x) {
  base_path <- ts_cache$cache_path_get()
  switch(x,
    plants_tpl = file.path(base_path, "tpl.dic"),
    stop("no dictionary files found for ", x, call.=FALSE)
  )
}
