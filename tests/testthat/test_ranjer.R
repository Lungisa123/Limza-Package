# export file
test_vec <- 1:10
test_vec2 <-c(-5, -2, 0, 2, 5)

test_that(" 'ranjer' returns correct output",{
  expect_equal(ranjer(test_vec,3,7), c(4,5,6))
  expect_equal(ranjer(test_vec,3,7, inclusive = TRUE), c(3,4,5,6,7))
  expect_equal(ranjer(test_vec,3,7,inside = F),c(1,2,3,7,8,9,10))
  expect_equal(ranjer(test_vec,3,7,inside =F, inclusive =T), c(1,2,8,9,10))
  expect_equal(ranjer(test_vec2,-2,2, inclusive = TRUE), c(-2,0,2))
})

# return errors
test_that(" 'ranjer' returns errors for invalid input",{
  expect_error(ranjer())
  expect_error(ranjer("abc",1,5))
  expect_error(ranjer(test_vec2,"1",5))
  expect_error(ranjer(test_vec,5,3))
  expect_error(ranjer(test_vec, 1, 5, inclusive = "TRUE"))

})
# warnings
test_that(" 'ranjer' issues warnings",{
  expect_warning(ranjer(numeric(0),1,5))
  expect_warning(ranjer(c(1, 2, NA, 4), 1, 5))
  expect_warning(ranjer(test_vec, 20, 30))
  expect_warning(ranjer(1:5,1,5, inside = F, inclusive = T))
  expect_warning(ranjer(1:5, 6, 10, inclusive = T))
})
