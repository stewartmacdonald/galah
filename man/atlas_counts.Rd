% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/atlas_counts.R
\name{atlas_counts}
\alias{atlas_counts}
\title{Return a count of records}
\usage{
atlas_counts(
  request = NULL,
  identify = NULL,
  filter = NULL,
  geolocate = NULL,
  group_by = NULL,
  limit = 100,
  type = c("record", "species"),
  refresh_cache = FALSE
)
}
\arguments{
\item{request}{optional \code{data_rquest} object: generated by a call to
\code{\link[=galah_call]{galah_call()}}.}

\item{identify}{\code{data.frame}: generated by a call to
\code{\link[=galah_identify]{galah_identify()}}.}

\item{filter}{\code{data.frame}: generated by a call to
\code{\link[=galah_filter]{galah_filter()}}}

\item{geolocate}{\code{string}: generated by a call to
\code{\link[=galah_geolocate]{galah_geolocate()}}}

\item{group_by}{\code{data.frame}: An object of class \code{galah_group_by},
as returned by \code{\link[=galah_group_by]{galah_group_by()}}. Alternatively a vector of field
names (see \code{\link[=search_fields]{search_fields()}} and \code{\link[=show_all_fields]{show_all_fields()}}.}

\item{limit}{\code{numeric}: maximum number of categories to return, defaulting to 100.
If limit is NULL, all results are returned. For some categories this will
take a while.}

\item{type}{\code{string}: one of \code{c("record", "species")}. Defaults to
"record". If "species", the number of species matching the criteria will be
returned, if "record", the number of records matching the criteria will be
returned.}

\item{refresh_cache}{\code{logical}: if set to \code{TRUE} and
\code{galah_config(caching = TRUE)} then files cached from a previous query will
be replaced by the current query}
}
\value{
An object of class \code{tbl_df} and \code{data.frame} (aka a tibble) returning:
\itemize{
\item A single number, if \code{group_by} is not specified or,
\item A summary of counts grouped by field(s), if \code{group_by} is specified
}
}
\description{
Prior to downloading data it is often valuable to have some estimate of how
many records are available, both for deciding if the query is feasible,
and for estimating how long it will take to download. Alternatively, for some kinds
of reporting, the count of observations may be all that is required, for example
for understanding how observations are growing or shrinking in particular
locations, or for particular taxa. To this end, \code{atlas_counts()} takes
arguments in the same format as \code{\link[=atlas_occurrences]{atlas_occurrences()}}, and
provides either a total count of records matching the criteria, or a
\code{data.frame} of counts matching the criteria supplied to the \code{group_by}
argument.
}
\section{Examples}{


With no arguments, return the total number of records in the ALA\if{html}{\out{<div class="sourceCode r">}}\preformatted{atlas_counts()
#> # A tibble: 1 x 1
#>       count
#>       <int>
#> 1 102070026
}\if{html}{\out{</div>}}

You can group counts by state and territory with \code{galah_group_by}\if{html}{\out{<div class="sourceCode r">}}\preformatted{galah_call() |>
  galah_group_by(stateProvince) |>
  atlas_counts()
#> # A tibble: 100 x 2
#>   stateProvince      count
#>   <chr>              <int>
#> 1 New South Wales 24938082
#> 2 Victoria        21775800
#> 3 Queensland      17550396
#> 4 South Australia  8449336
#> # ... with 96 more rows
}\if{html}{\out{</div>}}

You can add a filter to narrow your search\if{html}{\out{<div class="sourceCode r">}}\preformatted{galah_call() |>
  galah_filter(basisOfRecord == "FossilSpecimen")
#> An object of type `data_request` containing:
#> 
#> $filter
#> # A tibble: 1 x 4
#>   variable      logical value          query                               
#>   <chr>         <chr>   <chr>          <chr>                               
#> 1 basisOfRecord ==      FossilSpecimen "(basisOfRecord:\\"FossilSpecimen\\")"
  atlas_counts() 
#> # A tibble: 1 x 1
#>       count
#>       <int>
#> 1 102070026
}\if{html}{\out{</div>}}

Specify \code{type = species} to count the number of species, and group record
counts by kingdom\if{html}{\out{<div class="sourceCode r">}}\preformatted{records <- galah_call() |>
  galah_group_by(kingdom) |>
  atlas_counts(type = "species")
}\if{html}{\out{</div>}}\if{html}{\out{<div class="sourceCode r">}}\preformatted{records
#> # A tibble: 10 x 2
#>    kingdom   count
#>    <chr>     <dbl>
#>  1 Animalia  90821
#>  2 Plantae   39883
#>  3 Fungi     16752
#>  4 Chromista  1822
#>  5 Protista    635
#>  6 Bacteria    525
#>  7 Protozoa    493
#>  8 Archaea       0
#>  9 Eukaryota     0
#> 10 Virus         0
}\if{html}{\out{</div>}}

Using \code{galah_group_by} allows you to cross-tabulate using two different
variables, similar to using \code{dplyr::group_by() \%>\% dplyr::count()}\if{html}{\out{<div class="sourceCode r">}}\preformatted{records <- galah_call() |>
  galah_filter(year > 2015) |>
  galah_group_by(year, basisOfRecord) |>
  atlas_counts()
}\if{html}{\out{</div>}}\if{html}{\out{<div class="sourceCode r">}}\preformatted{records
#> # A tibble: 41 x 3
#>   basisOfRecord     year    count
#>   <chr>             <chr>   <int>
#> 1 HUMAN_OBSERVATION 2020  5825030
#> 2 HUMAN_OBSERVATION 2019  5401216
#> 3 HUMAN_OBSERVATION 2018  5267959
#> 4 HUMAN_OBSERVATION 2017  4348547
#> # ... with 37 more rows
}\if{html}{\out{</div>}}
}

