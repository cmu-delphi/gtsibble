# On-load and installation support functionality
# Updated: 2022-04-09
# Ref: https://rstudio.github.io/reticulate/articles/package.html

# Global reference to delphi_utils
delphi_utils <- NULL

.onLoad <- function(libname, pkgname){
    reticulate::configure_environment(pkgname)
    #delphi_utils <<- reticulate::import("delphi_utils", delay_load = TRUE)
    #message("Using delphi-utils version ", delphi_utils[["__version__"]])
}

#' @title Installing \code{delphi-utils} using \code{reticulate}
#' @param method Installation method. By default, "auto" automatically
#'     finds a method that will work in the local environment. "virtualenv" is not
#'     available on Windows.
#' @param conda The path to conda executable. By default, "auto" will allow
#'     \code{reticulate} to automatically find an appropriate conda-binary
#' @param ... Additional arguments passed to [reticulate::py_install]. Since
#'     \code{delphi-utils} is only available on PyPi, pip is always set to TRUE.
#' @seealso [py_install]
#' @export
load_delphi_utils <- function(method = "auto", conda = "auto", ...){
    if (reticulate::py_module_available("delphi_utils")){
        delphi_utils <<- reticulate::import("delphi_utils", delay_load = TRUE)
        message("Using delphi-utils version ", delphi_utils[["__version__"]])
    } else {
        if (grepl(pattern = "Windows", osVersion)){
            message("Installing geopandas for Windows...")
            reticulate::py_install("geopandas", method = method, conda = conda, 
                                   pip = FALSE, 
                                   ...)
        }
        message("installing delphi-utils")
        reticulate::py_install("delphi-utils", method = method, conda = conda,
                               pip = TRUE, ...)
    }
}
