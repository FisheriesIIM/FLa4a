\docType{methods}
\name{genFLQuant}
\alias{genFLQuant}
\alias{genFLQuant,FLQuant-method}
\alias{genFLQuant-methods}
\title{Methods to generate FLQuant objects}
\arguments{
  \item{object}{an FLQuant}

  \item{cv}{the coefficient of variation}

  \item{method}{the ethod used to compute the correlation
  matrix, for now only "ac" - autocorrelation}

  \item{niter}{number of iterations to be generated}
}
\value{
  an FLQuant
}
\description{
  This method uses the age correlation matrix of the
  \code{FLQuant} and generates a new \code{FLQuant} using a
  lognormal multivariate distribution
}
\examples{
data(ple4)
sim.F <- genFLQuant(harvest(ple4))
}

