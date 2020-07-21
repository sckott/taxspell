#' download a dictionary
#' @export
#' @param x (character) name of a dictionary to download. options:
#' "tpl" (The Plant List), "taxamatch_ref" (TAXAMATCH reference dictionary)
#' @param ... arguments passed down to [download.file()]
#' @return nothing, downloads dictionary to the cache path, see [ts_cache]
#' @examples
#' # ts_fetch_dictionary("tpl")
ts_fetch_dictionary <- function(x, ...) {
  assert(x, "character")
  assert_len(x, 1)
  paths <- ts_dic_paths(x)
  urls <- ts_dic_remote(x)
  download.file(urls[1], paths[1], ...)
  download.file(urls[2], paths[2], ...)
}
