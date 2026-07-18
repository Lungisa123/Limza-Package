\name{outliers}
\alias{outliers}
\title{Remove or identify outliers in a vector}
\description{A function that can be used to identify outliers or remove outliers using IQR method }
\usage{
outliers(vec, out_rm = FALSE)
}
\arguments{
\item{vec}{A vector of numeric values}
\item{out_rm}{ A logica/bool if 'FALSE' a vector of outliers will be returned, if 'TRUE' a cleaned vector without any outliers will be returned}
}
\value{
A Vector.
}
\examples{
x <- c( 45, 48, 50, 51, 49, 47, 52, 46, 50, 49, 48, 51, 47, 50, 49, 46, 48, 52, 50, 49,-80, -65, 120, 135, 160, 200)
outliers(x)

outliers(x, out_rm = TRUE)


}