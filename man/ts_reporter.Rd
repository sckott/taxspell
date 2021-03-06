% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ts_reporter.R
\name{ts_reporter}
\alias{ts_reporter}
\title{Taxonomic spelling reporter}
\usage{
ts_reporter(x, dict = ts_dict("plants_tpl"))
}
\arguments{
\item{x}{(character) vector of taxonomic names. required}

\item{dict}{(hunspell_dictionary) a hunspell dictionary, see \code{\link[=ts_dict]{ts_dict()}}}
}
\value{
prints suggestions for names without exact matches
}
\description{
Taxonomic spelling reporter
}
\examples{
\dontrun{
x <- c("Helianthus", "Helianthos", "Helionthus",
"Helianthuss", "helianthus", "Hellianthos")
ts_reporter(x)
}
}
