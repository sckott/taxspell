#' Check taxonomic spelling
#' @export
#' @param x (character) dictionary to use. options:
#' "tpl" (The Plant List), "taxamatch_ref" (TAXAMATCH
#' reference dictionary). default: "tpl".
#' @return path to location of the dictionary files
#' @examples \dontrun{
#' ts_dict()
#' }
ts_dict <- function(x = "tpl") {
  ts_cache$mkdir()
  hunspell::dictionary(ts_dic_path(x))
}

ts_dic_path <- function(x) {
  base_path <- ts_cache$cache_path_get()
  switch(x,
    tpl = file.path(base_path, "tpl.dic"),
    taxamatch_ref = file.path(base_path, "taxamatch_ref.dic"),
    stop("no dictionary files found for ", x, call.=FALSE)
  )
}

ts_dic_paths <- function(x) {
  base_path <- ts_cache$cache_path_get()
  switch(x,
    tpl = file.path(base_path, c("tpl.dic", "tpl.aff")),
    taxamatch_ref = file.path(base_path, c("taxamatch_ref.dic", "taxamatch_ref.aff")),
    stop("no dictionary files found for ", x, call.=FALSE)
  )
}

ts_dic_remote <- function(x) {
  base <-
    "https://raw.githubusercontent.com/ropenscilabs/taxdictionaries/master"
  switch(x,
    tpl = file.path(base, c("tpl.dic", "tpl.aff")),
    taxamatch_ref = file.path(base, c("taxamatch_ref.dic", "taxamatch_ref.aff")),
    stop("no dictionary files found for ", x, call.=FALSE)
  )
}
