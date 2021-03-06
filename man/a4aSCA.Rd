\docType{methods}
\name{a4aSCA}
\alias{a4aSCA}
\alias{a4aSCA,FLStock,FLIndices-method}
\alias{a4aSCA-methods}
\title{statistical catch-at-age advanced method}
\arguments{
  \item{stock}{an FLStock object containing catch and stock
  information}

  \item{indices}{an FLIndices object containing survey
  indices}

  \item{fmodel}{a formula object depicting the model for
  log fishing mortality at age}

  \item{qmodel}{a list of formula objects depicting the
  models for log survey catchability at age}

  \item{srmodel}{a formula object depicting the model for
  log recruitment}

  \item{n1model}{a formula object depicting the model for
  the population in the first year of the time series}

  \item{vmodel}{a list of formula objects depicting the
  model for the variance of fishing mortality and the
  indices}

  \item{covar}{a list with covariates}

  \item{wkdir}{used to set a working directory for the admb
  optimiser.  If wkdir is set all admb files are saved to
  this folder otherwise they are deleted.}

  \item{verbose}{if true admb fitting information is
  printed to the screen}

  \item{fit}{Character with type of fit, 'MP' or
  'assessment', the first doesn't require the hessian to be
  computed, while the former does.}

  \item{center}{Logical defining if the data should be
  centered before fitting}
}
\value{
  an \code{a4aFit} object if fit is "MP" or an
  \code{a4aFitSA} if fit is "assessment"
}
\description{
  Advanced user interface to the statistical catch-at-age
  method of the a4a stock assessment framework.
}
\examples{
data(ple4)
data(ple4.index)

# fishing mortality by age and year (~separable) AND catchability at age without year trend
fmodel <- ~factor(age) + factor(year)
qmodel <- list(~factor(age))
fit1 <-  a4aSCA(fmodel=fmodel, qmodel=qmodel, stock=ple4, indices=FLIndices(ple4.index))

# fishing mortality as a smoother by age and year AND catchability at age without year trend
fmodel <- ~ s(age, k=4) + s(year, k=10)
fit2 <-  a4aSCA(fmodel=fmodel, qmodel=qmodel, stock=ple4, indices=FLIndices(ple4.index))

# fishing mortality as a smoother by age and year AND catchability at age without year trend
fmodel <- ~ s(age, k=4) + s(year, k=10)
qmodel <- list(~s(age, k=4) + year)
fit3 <-  a4aSCA(fmodel=fmodel, qmodel=qmodel, stock=ple4, indices=FLIndices(ple4.index))

# fishing mortality as a smoother by age and year AND catchability at age with year trend
fmodel <- ~ te(age, year, k=c(4, 10))
qmodel <- list(~s(age, k=4))
fit4 <-  a4aSCA(fmodel=fmodel, qmodel=qmodel, stock=ple4, indices=FLIndices(ple4.index))

# It's a statistical model
BIC(fit1, fit2, fit3)

# fit3 + smoother in recruitment
fmodel <- ~ s(age, k=4) + s(year, k=20)
qmodel <- list(~s(age, k=4))
rmodel <- ~s(year, k=20)
fit5 <-  a4aSCA(fmodel=fmodel, qmodel=qmodel, srmodel=rmodel, ple4, FLIndices(ple4.index))

# fit3 + bevholt
rmodel <- ~ bevholt(CV=0.05)
fit6 <-  a4aSCA(fmodel=fmodel, qmodel=qmodel, srmodel=rmodel, ple4, FLIndices(ple4.index))
}

