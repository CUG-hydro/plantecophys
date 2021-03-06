% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/LeafEnergyBalance.R
\name{PhotosynEB}
\alias{PhotosynEB}
\alias{FindTleaf}
\title{Coupled leaf gas exchange model with energy balance}
\usage{
PhotosynEB(Tair = 25, VPD = 1.5, Wind = 2, Wleaf = 0.02,
  StomatalRatio = 1, LeafAbs = 0.86, RH = NULL, ...)

FindTleaf(gs, Tair, ...)
}
\arguments{
\item{Tair}{Air temperature (C)}

\item{VPD}{The vapour pressure deficit of the air (i.e. not the leaf-to-air VPD) (kPa).}

\item{Wind}{Wind speed (m s-1)}

\item{Wleaf}{Leaf width (m)}

\item{StomatalRatio}{The stomatal ratio (cf. Licor6400 terminology), if it is 1, leaves have stomata only on one side (hypostomatous), 2 for leaves with stomata on both sides (amphistomatous).}

\item{LeafAbs}{Leaf absorptance of solar radiation (0-1).}

\item{RH}{The relative humidity of the air (i.e. not calculated with leaf temperature) (in percent).}

\item{\dots}{Further parameters passed to \code{\link{Photosyn}}. Note that Tleaf is not allowed as an input, since that is calculated by \code{PhotosynEB} from energy balance.}

\item{gs}{For \code{FindTleaf}, the stomatal conductance (mol m-2 s-1).}
}
\description{
As \code{\link{Photosyn}}, but calculates the leaf temperature based on the leaf's energy balance. Including sensible and long-wave heat loss, latent heat loss from evaporation, and solar radiation input. 

#'\strong{Warning:}Do not provide GS as an input to \code{PhotosynEB} directly; the results will not be as expected (filed as issue #27)
}
\details{
Uses the Penman-Monteith equation to calculate the leaf transpiration rate, and finds Tleaf by solving the leaf energy balance iteratively. In the solution, it is accounted for that stomatal conductance (via the dependence of photosynthesis on Tleaf) and net radiation depend on Tleaf.

Also included is the function \code{FindTleaf}, which calculates the leaf temperature if the stomatal conductance is known. The \strong{limitation} to this function is that input stomatal conductance (gs) is not vectorized, i.e. you can only provide one value at a time.
}
