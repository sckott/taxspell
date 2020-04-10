#' @title Caching
#'
#' @description Manage cached `taxspell` files with \pkg{hoardr}
#'
#' @export
#' @name ts_cache
#'
#' @details The dafault cache directory is
#' `paste0(rappdirs::user_cache_dir(), "/R/taxspell")`, but you can set
#' your own path using `cache_path_set()`
#'
#' `cache_delete` only accepts 1 file name, while
#' `cache_delete_all` doesn't accept any names, but deletes all files.
#' For deleting many specific files, use `cache_delete` in a [lapply()]
#' type call
#'
#' @section Useful user functions:
#'
#' - `ts_cache$cache_path_get()` get cache path
#' - `ts_cache$cache_path_set()` set cache path. You can set the
#'    entire path directly via the `full_path` arg like
#'   `ts_cache$cache_path_set(full_path = "your/path")`
#' - `ts_cache$list()` returns a character vector of full
#'    path file names
#' - `ts_cache$files()` returns file objects with metadata
#' - `ts_cache$details()` returns files with details
#' - `ts_cache$delete()` delete specific files
#' - `ts_cache$delete_all()` delete all files, returns nothing
#'
#' @examples \dontrun{
#' ts_cache
#'
#' # list files in cache
#' ts_cache$list()
#'
#' # delete certain database files
#' # ts_cache$delete("file path")
#' # ts_cache$list()
#'
#' # delete all files in cache
#' # ts_cache$delete_all()
#' # ts_cache$list()
#' }
NULL
