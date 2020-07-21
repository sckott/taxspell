library(testthat)
library(taxspell)
if (.Platform$OS.type != "windows") {
  test_check("taxspell")
}
