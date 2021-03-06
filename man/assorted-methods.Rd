\docType{methods}
\name{a4amethods}
\alias{getYidx}
\alias{getYidx,FLQuant-method}
\alias{getYidx-methods}
\alias{is.empty}
\alias{dims,a4aStkParams-method}
\alias{niters}
\alias{niters,FLModelSim-method}
\alias{niters-methods}
\alias{pars2dim,FLPar-method}
\title{Assorted methods needed by FLa4a}
\usage{
  is.empty(object)
}
\arguments{
  \item{object}{Argument to the various methods}
}
\description{
  Assorted methods needed by FLa4a
}
\section{dims}{
	Extracts the dims of the parameters.
}

\section{is.empty}{
  Method \code{is.empty} checks if object is empty. Takes
  any object returns a logical, \code{TRUE} if object is of
  length 0.
}

\section{pars2dim}{
  Checks that the name of the second dimension in params is
  "iter". For internal use, not very interesting for users.
  It takes a \code{FLPar} object and returns a
  \code{logical}
}

\section{getYidx}{
  Gets the FLQuant's numeric id for a vector of "years".
  For internal use, not very interesting for users. It
  takes a \code{FLQuant} and a \code{vector} of years and
  returns a \code{numeric vector} that can be used to
  subset the \code{FLQuant}.
}

\section{niters}{
  Compute number of iterations. Takes an object of any
  \code{FLR} class and returns a \code{numeric}.
}
\examples{
is.empty(list())
is.empty(list(a=2))
pars2dim(FLPar())
pars2dim(FLPar(array(dim=c(1,1,1))))
data(ple4)
flq <- catch(ple4)
getYidx(flq, 2000:2004)
flq[, getYidx(flq, 2000:2004)]
}

