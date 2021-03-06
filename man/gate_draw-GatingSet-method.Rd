% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gate_draw-methods.R
\docType{methods}
\name{gate_draw,GatingSet-method}
\alias{gate_draw,GatingSet-method}
\title{gate_draw GatingSet Method}
\usage{
\S4method{gate_draw}{GatingSet}(x, group_by = NULL, select = NULL,
  parent = "root", alias = NULL, channels = NULL, type = "polygon",
  gatingTemplate = NULL, display = NULL, axis = "x",
  density_smooth = 1.5, label = TRUE, plot = TRUE, ...)
}
\arguments{
\item{x}{object of class
\code{\link[flowWorkspace:GatingSet-class]{GatingSet}}.}

\item{group_by}{vector of pData column names (e.g.
c("Treatment","Concentration") indicating how the samples should be grouped
prior to gating, set to the length of x by default to construct a single
gate for all samples. If group_by is supplied a different gate will be
constructed for each group.}

\item{select}{vector containing the indices of samples within each group to
use for plotting.}

\item{parent}{name of the \code{parent} population to extract for gating.}

\item{alias}{the name(s) of the populations to be gated. If multiple
population names are supplied (e.g. \code{c("CD3,"CD4)}) multiple gates
will be returned. \code{alias} is \code{NULL} by default which will halt
the gating routine.}

\item{channels}{vector of channel names to use for plotting, can be of length
1 for 1-D density histogram or length 2 for 2-D scatter plot.}

\item{type}{vector of gate type names used to construct the gates. Multiple
gate types are supported but should be accompanied with an \code{alias}
argument of the same length (i.e. one \code{type} per \code{alias}).
Supported gate types are \code{polygon, rectangle, ellipse, threshold,
boundary, interval, quadrant and web} which can be abbreviated as upper or
lower case first letters as well. Default \code{type} is \code{"interval"}
for 1D gates and \code{"polygon"} for 2D gates.}

\item{gatingTemplate}{name of \code{gatingTemplate} csv file to be saved.}

\item{display}{numeric [0,1] to control the percentage of events to be
plotted. Specifying a value for \code{display} can substantial improve
plotting speed for less powerful machines.}

\item{axis}{indicates whether the \code{"x"} or \code{"y"} axis should be
gated for 2-D interval gates.}

\item{density_smooth}{smoothing factor passed to
\code{\link[stats:density]{density}} for 1-D plots (defaults to 1.5).}

\item{label}{logical indicating whether to include
\code{\link{cyto_plot_label}} for the gated population(s), \code{TRUE} by
default.}

\item{plot}{logical indicating whether a plot should be drawn, set to
\code{TRUE} by default.}

\item{...}{additional arguments for \code{\link{cyto_plot,GatingSet-method}}.}
}
\value{
drawn gates are applied to the
  \code{\link[flowWorkspace:GatingSet-class]{GatingSet}} and saved to a
  \code{\link[openCyto:gatingTemplate-class]{gatingTemplate}}.
}
\description{
Manually draw gates around populations for analysis of flow cytometry data.
}
\examples{
\dontrun{
library(CytoRSuiteData)

# Load in samples
fs <- Activation
gs <- GatingSet(fs)

# Apply compensation
gs <- compensate(gs, fs[[1]]@description$SPILL)

# Transform fluorescent channels
trans <- estimateLogicle(gs[[4]], cyto_fluor_channels(fs))
gs <- transform(gs, trans)

# Gate using gate_draw
gating(Activation_gatingTemplate, gs)

# draw gates using gate_draw - add contour lines & overlay control
gate_draw(gs,
  parent = "Dendritic Cells",
  channels = c("Alexa Fluor 488-A", "Alexa Fluor 700-A"),
  alias = c("CD8+ DC", "CD4+ DC"),
  gatingTemplate = "Example-gatingTemplate.csv",
  type = "rectangle",
  contour_lines = 15
)

# Constructed gate applied directly to GatingSet
getNodes(gs)
}

}
\seealso{
\code{\link{cyto_plot,GatingSet-method}}

\code{\link{gate_draw,flowFrame-method}}

\code{\link{gate_draw,flowSet-method}}
}
\author{
Dillon Hammill, \email{Dillon.Hammill@anu.edu.au}
}
