# make global vectors
vec_outliers <- c(10, 12, 15, 18, 22, 200)
vec_no_outliers <- seq(from = 10, to = 22, by = 2)
x <- c(45, 48, 50, 51, 49, 47, 52, 46, 50, 49,48, 51, 47, 50, 49, 46, 48, 52, 50, 49,-80, -65, 120, 135, 160, 200)
c(45, 48, 50, 51, 49, 47, 52, 46,50, 49, 48, 51, 47, 50, 49, 46, 48, 52, 50, 49)
test_that(" 'outliers' removes outliers", {

  expect_equal(outliers(vec_outliers, FALSE), 200)
  expect_equal(outliers(vec_outliers, TRUE), c(10, 12, 15, 18, 22))
  expect_equal(outliers(c(-100, -5, -4, -3, -2, -1, 0), FALSE), c(-100))
  expect_equal(outliers(vec_no_outliers, TRUE), vec_no_outliers)
  expect_equal(outliers(x),c(-80, -65, 120, 135, 160, 200))
  expect_equal(outliers(x, T),c(45, 48, 50, 51, 49, 47, 52, 46,50, 49, 48, 51, 47, 50, 49, 46, 48, 52, 50, 49))
})

# check for errors

test_that(" 'outliers' returns errors for incorrect usage",{
  expect_error(outliers())
  expect_error(outliers("abc"))
  expect_error(outliers(list(1,2,3)))
  expect_error(outliers(vec_outliers, "TRUE"))
  expect_error(outliers(vec_outliers, c(TRUE, FALSE)))

})

# warning check

test_that(" 'outliers' issues warnings",{
  expect_warning(outliers(numeric(0)))
  expect_warning(outliers(c(1,2,5,NA)))
  expect_warning(outliers(c(1,2,Inf,2)))
  expect_warning(outliers(vec_no_outliers))
  expect_warning(outliers(vec_no_outliers))
})