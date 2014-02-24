\docType{methods}
\name{plot}
\alias{Method}
\alias{of}
\alias{plot}
\alias{plot,plot-method}
\alias{residuals}
\alias{scatterplot}
\alias{standardized}
\alias{to}
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
  plot of standardized log residuals
}
\examples{
library(FLa4a)
data(ple4)
data(ple4.index)
fmodel <- ~factor(age) + factor(year)
qmodel <- list(~factor(age))
fit. <- a4a(stock=ple4, qmodel = qmodel, fmodel=fmodel, indices=FLIndices(ple4.index), fit ="assessment", wkdir="test")
flqs <- residuals(fit., ple4, FLIndices(idx=ple4.index))
plot(flqs)
}
\author{
  EJ \email{ernesto.jardim@jrc.ec.europa.eu}
}
