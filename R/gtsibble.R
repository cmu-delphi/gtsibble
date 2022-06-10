# Defining gtsibble and conversion functions

#' @title Creating a new \code{gtsibble} object
#' @param ... Named key-value pairs
#' @param geo_value (String) Column name indicating the geographic values
#' @param time_value (String) Column name indicating the time value
#' @param
#' @importFrom tibble tibble
#' @importFrom rlang list2
new_gtsibble <- function(..., geo_value, time_value, geo_type, time_type) {
    dots <- rlang::list2(...)
    tbl <- tibble::tibble(!!!dots)

    geo_type <- match.arg(geo_type, c())
    time_type <- match.arg(time_type, c())

    structure(

    )
}

as_gtsibble <- function() {

}

