.onLoad <- function(libname, pkgname) {
    if (pkgname == "galah") {
      galah_config() ## will set to default values if not already set
      galah_internal_cache() # store local values
    }
}
