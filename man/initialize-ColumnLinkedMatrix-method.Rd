% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ColumnLinkedMatrix.R, R/RowLinkedMatrix.R
\docType{methods}
\name{initialize,ColumnLinkedMatrix-method}
\alias{initialize,ColumnLinkedMatrix-method}
\alias{initialize,RowLinkedMatrix-method}
\title{Create a LinkedMatrix Object.}
\usage{
\S4method{initialize}{ColumnLinkedMatrix}(.Object, ...)

\S4method{initialize}{RowLinkedMatrix}(.Object, ...)
}
\arguments{
\item{.Object}{Internal, used by \code{\link[methods:initialize]{methods::initialize()}} generic.}

\item{...}{A sequence of matrix-like objects of the same row-dimension (for
\code{ColumnLinkedMatrix}) or column-dimension (for \code{RowLinkedMatrix}).}
}
\value{
Either a \code{ColumnLinkedMatrix} or a \code{RowLinkedMatrix} object.
}
\description{
This function constructs a new \linkS4class{ColumnLinkedMatrix} or
\linkS4class{RowLinkedMatrix} object from a list of matrix-like objects.
}
\details{
A matrix-like object is one that has two dimensions and implements at least
\code{dim} and \code{[}. Each object needs to have the same number of rows (for
\code{ColumnLinkedMatrix}) or columns (for \code{RowLinkedMatrix}) to be linked
together. If no matrix-like objects are given, a single 1x1 node of type
\code{matrix} filled with \code{NA} is returned. \linkS4class{LinkedMatrix} objects can be
nested as long as they are conformable.
}
\examples{
# Create various matrix-like objects that correspond in dimensions
m1 <- ff::ff(initdata = rnorm(50), dim = c(5, 10))
m2 <- bigmemory::big.matrix(init = rnorm(50), nrow = 5, ncol = 10)
m3 <- matrix(data = rnorm(50), nrow = 5, ncol = 10)

# Create a ColumnLinkedMatrix object
cm1 <- ColumnLinkedMatrix(m1, m2, m3)

# Create a RowLinkedMatrix object
rm1 <- RowLinkedMatrix(m1, m2, m3)

# Alternatively, a LinkedMatrix object can also be created using the `new`
# function
cm2 <- new("ColumnLinkedMatrix", m1, m2, m3)

# To specify the matrix-like objects as a list, use the `do.call` function
rm2 <- do.call(RowLinkedMatrix, list(m1, m2, m3))
}
\seealso{
\code{\link[=LinkedMatrix]{LinkedMatrix()}} to create an empty, prespecified
\linkS4class{LinkedMatrix} object.
}
