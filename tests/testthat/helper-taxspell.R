library(taxspell)
paths <- ts_dic_paths("tpl")
if (!file.exists(paths[1]) && !file.exists(paths[2])) {
  ts_fetch_dictionary("tpl")
}
