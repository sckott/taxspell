# https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0107510#s6
library("readxl")
library("dplyr")
x <- read_xls("inst/ignore/taxamatch_supp_file_s1.xls", skip = 1)
select(x, INPUT_NAME, TARGET_NAME)
misspelled <- x$INPUT_NAME
correct <- x$TARGET_NAME
ts_make_dictionary(correct, "taxamatch_ref")

ms <- lapply(misspelled, function(z) strsplit(z, "\\s")[[1]])
ts_check(vapply(ms, "[[", "", 1), hunspell::dictionary("/Users/sckott/Library/Caches/R/taxspell/taxamatch_ref.dic"))
ts_check(vapply(ms, "[[", "", 2), hunspell::dictionary("/Users/sckott/Library/Caches/R/taxspell/taxamatch_ref.dic"))
ts_reporter(vapply(ms, "[[", "", 2), hunspell::dictionary("/Users/sckott/Library/Caches/R/taxspell/taxamatch_ref.dic"))
