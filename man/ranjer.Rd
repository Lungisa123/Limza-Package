\name{ranjer}
\alias{ranjer}
\title{Get values within a specified range}
\description{A function that can be used to get values within/outside a specified range }
\usage{
ranjer(x,lb,ub, inside = TRUE, inclusive = FALSE)
}
\arguments{
\item{x}{A vector of numeric values}
\item{lb}{ lower bound}
\item{ub}{ upper bound}
\item{inside}{A bool if 'TRUE' it return values between 'lb' and 'ub', if 'FALSE' returns values outside }
\item{inclusive}{ A bool/logical if 'True' it includes the 'lb' and 'ub' in tha ranje given that values equal to 'lb' and 'ub' exist in 'x'}
}
\value{
A Vector.
}
\examples{
x <- c( 45, 48, 50, 51, 49, 47, 52, 46, 50, 49, 48, 51, 47, 50, 49, 46, 48, 52, 50, 49,-80, -65, 120, 135, 160, 200)
ranjer(x, 48,60)

outliers(x,48,60, inclusive = TRUE)
outliers(x,48,60, inside = TRUE, inclusive = TRUE)
outliers(x,48,60, inside = FALSE, inclusive = TRUE)
}
