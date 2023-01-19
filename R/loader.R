# On-load and installation support functionality
# Updated: 2023-01-18
# Ref: https://rstudio.github.io/reticulate/articles/package.html

# Global reference to delphi_utils
delphi_utils <- NULL

.onLoad <- function(libname, pkgname){
    delphi_utils <<- reticulate::import("delphi_utils", delay_load = TRUE)
}

#' @title Installing \code{delphi-utils} using \code{reticulate}
#' @param method Installation method. By default, "auto" automatically
#'     finds a method that will work in the local environment. "virtualenv" is not
#'     available on Windows.
#' @param conda The path to conda executable. By default, "auto" will allow
#'     \code{reticulate} to automatically find an appropriate conda-binary
#' @param force (logical). Whether to force install \code{delphi-utils} if package
#'     is already installed.
#' @param ... Additional arguments passed to [reticulate::py_install]. Since
#'     \code{delphi-utils} is only available on PyPi, pip is always set to TRUE.
#' @seealso [py_install]
#' @export
install_delphi_utils <- function(method = "auto", conda = "auto", force = FALSE, ...){
    if (reticulate::py_module_available("delphi_utils")){
        message("delphi-utils already installed in this environment")
    }

    if (reticulate::py_module_available("delphi_utils") == FALSE | force == TRUE){
        if (grepl(pattern = "Windows", utils::osVersion)){
            message("Installing geopandas for Windows...")
            reticulate::py_install("geopandas", method = method,
                                   conda = conda,
                                   pip = FALSE,
                                   ...)
        }
        message("installing delphi-utils")
        reticulate::py_install("delphi-utils", method = method, conda = conda,
                               pip = TRUE, ...)
        message("Installation Complete")
    }
}

#' @title Checking proper loading of \code{delphi-utils}
#' @details This function double checks whether \code{delphi-utils} is available.
#'     If it is available, returns the version installed.
#' @return None
#' @export
check_delphi_utils <- function(){
    if (!reticulate::py_module_available("delphi_utils")){
        stop("delphi-utils not available. Please double check python environment or re-install delphi-utils")
    } else {
        if (!exists("delphi_utils")){
            delphi_utils <<- reticulate::import("delphi_utils")
        } else {
            message(paste0("Using delphi-utils version ", delphi_utils[["__version__"]]))
        }
    }
}
