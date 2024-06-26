% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotsBioTIME.R
\name{plotSlopes}
\alias{plotSlopes}
\alias{themeBioTIME}
\title{Plot slopes BioTIME}
\usage{
plotSlopes(x, metric, cols, taxa, method, assemblageID, divType)

themeBioTIME(lp, fontSize, colx, coly)
}
\arguments{
\item{x}{Parameter description}

\item{metric}{Parameter description}

\item{cols}{Parameter description}

\item{taxa}{Parameter description}

\item{method}{Parameter description}

\item{assemblageID}{Parameter description}

\item{divType}{Parameter description}

\item{lp}{description}

\item{fontSize}{description}

\item{colx}{description}

\item{coly}{description}
}
\value{
A plot
}
\description{
Plot slopes BioTIME

ggplot2 theme for BioTIME plots
}
\examples{
\donttest{
fig1 <- ggplot2::ggplot() +
          themeBioTIME("none", 12, "black", "grey90")
}
}
\keyword{internal}
