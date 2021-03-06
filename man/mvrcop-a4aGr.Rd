\name{mvrcop for a4aGr}
\alias{mvrcop for a4aGr}
\alias{mvrcop,numeric,a4aGr-method}
\title{mvrcop}
\arguments{
  \item{n}{the number of iterations}

  \item{object}{the \code{FLModelSim} object}

  \item{...}{arguments to be passed to the rMvdc and copula
  methods}
}
\value{
  a \code{FLModelSim} object with n groups of parameters
}
\description{
  Method to simulate model parameters using self defined
  copulas and margins for \code{a4aGr} objects.
}
\examples{
mm <- matrix(NA, ncol=3, nrow=3)
diag(mm) <- c(50, 0.001,0.001)
mm[upper.tri(mm)] <- mm[lower.tri(mm)] <- c(0.1,0.01,0.00004)
vbObj <- a4aGr(grMod=~linf*(1-exp(-k*(t-t0))), grInvMod=~t0-1/k*log(1-len/linf), params=FLPar(linf=58.5, k=0.086, t0=0.001, units=c("cm","ano-1","ano")), vcov=mm, distr="norm")
pars <- list(list(a=90, b=125, c=120), list(a=0.2, b=0.4), list(a=0, b=0.4, c=0.1))
vbObj <- mvrcop(10000, vbObj, copula="archmCopula", family="clayton", param=2, margins="triangle", paramMargins=pars)
splom(data.frame(t(params(vbObj)@.Data)), pch=".")
}

