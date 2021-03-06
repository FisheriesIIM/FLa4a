\docType{methods}
\name{plot}
\alias{plot}
\alias{plot,a4aFitResiduals,missing-method}
\title{plot of standardized log residuals}
\arguments{
  \item{x}{a \code{a4aFitResiduals} object with the
  standardized residuals}

  \item{...}{Additional argument list that might not ever
  be used.}
}
\value{
  a \code{plot} with stardardized log residuals
}
\description{
  Method to plot scatterplot of standardized residuals
}
\examples{
data(ple4)
data(ple4.index)
obj <- sca(ple4, FLIndices(ple4.index))
}

