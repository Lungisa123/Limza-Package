# make global dataframe
test_df <- data.frame(
  ID = 1:5,
  Name = c("A","B","C","D","E"),
  Age = 18:22,
  Score = seq(from = 75, to = 95, by = 5 ),
  Gender = c("M", "F", "F", "M", "F"),
  Passed = c(TRUE, TRUE, FALSE, TRUE, FALSE)
)

test_that(" 'delete_col' delete passed columns",{
  expect_equal(
    delete_col(test_df, c("Age","Score")),test_df[,c("ID","Name","Gender", "Passed")]
  )

  # 2nd test
  expect_equal(
    delete_col(test_df, "Age"),test_df[,c("ID","Name", "Score","Gender", "Passed")]
  )

  # 3rd test
  expect_equal(
    delete_col(test_df, "ID"),test_df[,c("Name","Age", "Score","Gender", "Passed")]
  )

  # 4th test
  expect_equal(
    delete_col(test_df, "Passed"),test_df[,c("ID","Name","Age", "Score","Gender")]
  )

  #Last test

  expect_equal(
    delete_col(test_df, c("ID","Name","Passed")),test_df[,c("Age", "Score","Gender")]
  )
})

# test errors
test_that(" 'delete_col' returns errors for incorrect usage",{

  expect_error(delete_col())
  expect_error(delete_col(c(1,2,3), "ID"))
  expect_error(delete_col(test_df,1))
  expect_error(delete_col(test_df,character(0)))
  expect_error(delete_col(test_df, c("Age", "Salary")))
  expect_error(delete_col(test_df[,FALSE], character(0)))

})

# test warnings

test_that(" 'delete_col' returns warnings",{

  expect_warning(delete_col(test_df, c("Age","Age")))
  expect_warning(delete_col(test_df, c("ID", "Age", "ID")))
  expect_warning(delete_col(test_df, c("Passed","Passed")))

})
