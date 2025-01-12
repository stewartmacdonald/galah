context("Test retrieval of cached file metadata")

test_that("show_all_cached_files gives an error if no metadata file exists", {
  skip_on_cran()
  galah_config(cache_directory = tempdir())
  # make sure there is no metadata file in directorys
  suppressWarnings(file.remove(file.path(tempdir(), 'metadata.rds')))
  expect_message(show_all_cached_files())
})

test_that("show_all_cached_files reads metadata", {
  # create some metadata
  dir.create('tmp')
  galah_config(caching = TRUE, cache_directory = 'tmp/')
  atlas_counts(group_by = galah_group_by(year))
  expect_type(show_all_cached_files(), "list")
  expect_s3_class(show_all_cached_files()[[1]]$data_request, "data_request")
  unlink('tmp', recursive = TRUE)
  galah_config(caching = FALSE)
})
