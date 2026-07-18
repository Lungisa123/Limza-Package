\name{delete_col}
\alias{delete_col}
\title{Delete column(s) from a dataframe}
\description{A function that deletes a single or a vector of columns, given a dataframe.}
\usage{
delete_col(df, cols = "")
}
\arguments{
\item{df}{The dataframe with the columns that you want to remove}
\item{cols}{The column(s)  to be delete as string(s) }
}
\value{
A dataframe containing only the columns that were not deleted.
}

\examples{
test_df <- data.frame(
  ID = 1:5,
  Name = c("A","B","C","D","E"),
  Age = 18:22,
  Score = seq(from = 75, to = 95, by = 5 ),
  Gender = c("M", "F", "F", "M", "F"),
  Passed = c(TRUE, TRUE, FALSE, TRUE, FALSE)
)
cat(delete_col(test_df, "Age"))

cat(delete_col(test_df, c("ID", "Gender", "Name")))
}