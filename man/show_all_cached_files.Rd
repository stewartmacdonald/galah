% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/show_all_cached_files.R
\name{show_all_cached_files}
\alias{show_all_cached_files}
\title{List previously cached files}
\usage{
show_all_cached_files()
}
\value{
A \code{list} of
available cached files, the function used to create them, and the filter
object
}
\description{
When using caching by setting \code{galah_config(caching = TRUE)}, show a list of
all previously cached files. This function acheives this by using query
metadata stored in metadata.rds in the cache directory
}
\section{Examples}{


Configure caching and create a query to cache with \code{\link[=galah_config]{galah_config()}}\if{html}{\out{<div class="sourceCode r">}}\preformatted{galah_config(caching = TRUE)
dat <- atlas_counts(group_by = galah_group_by(year))
}\if{html}{\out{</div>}}

Show a listing of previously cached files\if{html}{\out{<div class="sourceCode r">}}\preformatted{show_all_cached_files()
}\if{html}{\out{</div>}}
}

