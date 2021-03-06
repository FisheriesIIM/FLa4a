\docType{methods}
\name{qqmath}
\alias{qqmath}
\alias{qqmath,a4aFitResiduals,missing-method}
\title{qqplot of standardized log residuals}
\arguments{
  \item{x}{a \code{a4aFitResiduals} object with the
  standardized residuals}

  \item{...}{Additional argument list that might not ever
  be used.}
}
\value{
  a \code{qqplot} with stardardized log residuals
}
\description{
  Method to plot qqplots of standardized residuals
}
\examples{
library(FLa4a)
data(ple4)
data(ple4.index)
fmodel <- ~factor(age) + factor(year)
qmodel <- list(~factor(age))
fit. <- a4a(stock=ple4, qmodel = qmodel, fmodel=fmodel, indices=FLIndices(ple4.index), fit ="assessment", wkdir="test")
flqs <- residuals(fit., ple4, FLIndices(idx=ple4.index))
qqmath(flqs)
}

