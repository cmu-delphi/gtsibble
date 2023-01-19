skip_if_no_delphi_utils <- function() {
    have_utils <- py_module_available("delphi_utils")
    if (!have_utils){
        skip("delphi-utils not available for testing")
    }
}


