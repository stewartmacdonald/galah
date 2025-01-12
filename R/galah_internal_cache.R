# Internal function to store objects generated from `show_all_` functions
# This increases speed by ensuring that the atlas is only queried when needed.
# When run with no arguments, it returns a list with currently stored objects.
# When a named field is given, it stores that field in options("galah_internal")
galah_internal_cache <- function(...){

  # set all options
  ala_option_name <- "galah_internal_cache"
  current_options <- getOption(ala_option_name)
  atlas <- getOption("galah_config")$atlas
  user_options <- list(...)
  
  # load an archived version as the default
  default_options <- galah_internal_archived # stored in R/sysdata.rda
  # get0("galah_internal_archived", envir = asNamespace("galah")) # alternate code
    
  # deal with different kinds of query
  if (length(user_options) == 0 && !is.null(current_options)) {
    return(current_options)
  }
  if (is.null(current_options)) {
    ## galah options have not been set yet, so set them to the defaults
    current_options <- default_options
    ## set the global option
    temp <- list(current_options)
    names(temp) <- ala_option_name
    options(temp)
    return(current_options)
  } else {
    # check all the options are valid, if so, set as options
    for (x in names(user_options)) {
      current_options[[x]] <- user_options[[x]]
    }
    ## set the global option
    temp <- list(current_options)
    names(temp) <- ala_option_name
  }
  options(temp)
 
}

internal_cache_update_needed <- function(function_name){
  df <- galah_internal_cache()[[function_name]]
  is_local <- !is.null(attr(df, "ARCHIVED"))
  is_wrong_atlas <- attr(df, "atlas_name") != getOption("galah_config")$atlas
  result <- is_local | is_wrong_atlas # if either, update is needed 
  if(length(result) < 1){result <- TRUE} # bug catcher
  result
}

# # code to load the data into R/sysdata.rda
# # NOTE: "show_all_ranks"  and "show_all_atlases" are not included,
# # as they don't query a web service
# devtools::load_all()
# stored_functions <- c("show_all_fields", "show_all_profiles", "show_all_reasons")
# # load all data
# galah_internal_archived <- lapply(stored_functions,
#   function(a){
#     result <- eval(parse(text = paste0(a, "()")))
#     attr(result, "ARCHIVED") <- TRUE
#     attr(result, "atlas_name") <- "Australia"
#     result
#   })
# # lapply(galah_internal_archived, attributes) # check
# names(galah_internal_archived) <- stored_functions
# usethis::use_data(galah_internal_archived, internal = TRUE, overwrite = TRUE)