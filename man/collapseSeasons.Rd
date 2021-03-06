\docType{methods}
\name{collapseSeasons}
\alias{collapseSeasons}
\title{collapse seasons}
\usage{
  collapseSeasons(stock)
}
\arguments{
  \item{stock}{a FLStock object}
}
\value{
  a FLStock object
}
\description{
  Method to collapse seasons of \code{FLStock} objects. M
  and catch-at-age are summed while mean weights at age,
  maturity at age and mortalities before spawning are
  averaged.
}

