% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gating-functions.R
\name{gate_polygon_draw}
\alias{gate_polygon_draw}
\title{Draw Polygon Gate(s) Around Populations.}
\usage{
gate_polygon_draw(fr, alias = NULL, channels, plot = TRUE,
  label = TRUE, ...)
}
\arguments{
\item{fr}{a \code{\link[flowCore:flowFrame-class]{flowFrame}} object
containing the flow cytometry data for plotting and gating.}

\item{alias}{the name(s) of the populations to be gated. If multiple
population names are supplied (e.g. \code{c("CD3","CD4")}) multiple gates
will be returned. \code{alias} is \code{NULL} by default which will halt
the gating routine.}

\item{channels}{vector of channel names to use for plotting, can be of length
1 for 1-D density histogram or length 2 for 2-D scatter plot.}

\item{plot}{logical indicating whether the data should be plotted. This
feature allows for constructing gates of different types over existing
plots which may already contain a different gate type.}

\item{label}{logical indicating whether to include
\code{\link{cyto_plot_label}} for the gated population(s), \code{TRUE} by
default.}

\item{...}{additional arguments for \code{\link{cyto_plot,flowFrame-method}}.}
}
\value{
a\code{\link[flowCore:filters-class]{filters}} list containing the
  constructed \code{\link[flowCore:polygonGate-class]{polygonGate}}
  object(s).
}
\description{
\code{gate_polygon_draw} constructs an interactive plotting window to allow
manual selection of the co-ordinates of a polygon gate(s) (through mouse
click) which are constructed into
\code{\link[flowCore:polygonGate-class]{polygonGate}} objects and stored in a
\code{\link[flowCore:filters-class]{filters}} list.
}
\examples{
\dontrun{

# Copy and paste into console to interactively draw gates

library(CytoRSuiteData)

# Load in samples to flowSet
fs <- Activation

# Transform fluorescent channels
fs <- transform(fs, estimateLogicle(fs[[4]], cyto_fluor_channels(fs)))

# Get polygonGate using gate_polygon_draw
pg <- gate_polygon_draw(fs[[4]],
  alias = "Cells",
  channels = c("FSC-A", "SSC-A")
)

# pg is a filters object - extract polygonGate using `[[`
pg[[1]]
}

}
\seealso{
\code{\link{cyto_plot,flowFrame-method}}

\code{\link{gate_draw}}
}
\author{
Dillon Hammill (Dillon.Hammill@anu.edu.au)
}
\keyword{draw,}
\keyword{gating,}
\keyword{manual,}
\keyword{openCyto}
\keyword{polygonGate,}
