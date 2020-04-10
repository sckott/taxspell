test_that("ts_check", {
  x <- c("Helianthus", "Helianthos", "Helionthus",
    "Helianthuss", "helianthus", "Hellianthos")
  z <- ts_check(x)

  expect_is(z, "tbl_df")
  expect_is(z, "data.frame")
  expect_is(z$supplied, "character")
  expect_is(z$match, "logical")
  expect_is(z$matches, "character")
  expect_is(z$suggestions, "list")
  expect_null(z$suggestions[[1]])
  expect_is(z$suggestions[[2]], "character")
})

test_that("ts_check fails well", {
  expect_error(ts_check())
  expect_error(ts_check(5), class = "simpleError")
})
