% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/deprecated_functions.R
\name{deprecated}
\alias{deprecated}
\alias{select_taxa}
\alias{select_columns}
\alias{select_filters}
\alias{select_locations}
\alias{ala_occurrences}
\alias{ala_counts}
\alias{ala_species}
\alias{ala_taxonomy}
\alias{ala_media}
\alias{ala_citation}
\alias{find_reasons}
\alias{find_cached_files}
\alias{find_ranks}
\alias{find_profiles}
\alias{find_atlases}
\alias{ala_config}
\title{Deprecated functions}
\usage{
select_taxa(query, is_id = FALSE)

select_columns(..., group)

select_filters(..., profile = NULL)

select_locations(query)

ala_occurrences(
  taxa = NULL,
  filters = NULL,
  locations = NULL,
  columns = select_columns(group = "basic"),
  mint_doi = FALSE,
  doi = NULL,
  refresh_cache = FALSE
)

ala_counts(
  taxa = NULL,
  filters = NULL,
  locations = NULL,
  limit = 100,
  type = c("record", "species"),
  refresh_cache = FALSE
)

ala_species(
  taxa = NULL,
  filters = NULL,
  locations = NULL,
  refresh_cache = FALSE
)

ala_taxonomy(taxa, down_to)

ala_media(
  taxa = NULL,
  filters = NULL,
  locations = NULL,
  columns = select_columns(group = "basic"),
  download_dir,
  refresh_cache = FALSE
)

ala_citation(data)

find_reasons()

find_cached_files()

find_ranks()

find_profiles()

find_atlases()

ala_config(..., profile_path = NULL)
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}

Use \code{\link[=galah_identify]{galah_identify()}} instead of \code{select_taxa()}.

Use \code{\link[=galah_select]{galah_select()}} instead of \code{select_columns()}.

Use \code{\link[=galah_filter]{galah_filter()}} instead of \code{select_filters()}.

Use \code{\link[=galah_geolocate]{galah_geolocate()}} instead of \code{select_locations()}.

Use \code{\link[=atlas_occurrences]{atlas_occurrences()}} instead of \code{ala_occurrences()}.

Use \code{\link[=atlas_counts]{atlas_counts()}} instead of \code{ala_counts()}.

Use \code{\link[=atlas_species]{atlas_species()}} instead of \code{ala_species()}.

Use \code{\link[=atlas_taxonomy]{atlas_taxonomy()}} instead of \code{ala_taxonomy()}.

Use \code{\link[=atlas_media]{atlas_media()}} instead of \code{ala_media()}.

Use \code{\link[=atlas_citation]{atlas_citation()}} instead of \code{ala_citation()}.

Use \code{\link[=show_all_reasons]{show_all_reasons()}} instead of \code{find_reasons()}.

Use \code{\link[=show_all_cached_files]{show_all_cached_files()}} instead of \code{find_cached_files()}.

Use \code{\link[=show_all_ranks]{show_all_ranks()}} instead of \code{find_ranks()}.

Use \code{\link[=show_all_profiles]{show_all_profiles()}} instead of \code{find_profiles()}.

Use \code{\link[=show_all_atlases]{show_all_atlases()}} instead of \code{find_atlases()}.

Use \code{\link[=galah_config]{galah_config()}} instead of \code{ala_config()}.
}
\keyword{internal}
