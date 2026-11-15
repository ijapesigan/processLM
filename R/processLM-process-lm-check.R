#' Check the `lm` object
#'
#' Stops if `object` is not of class `lm`.
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param object Object of class `lm`.
#' @return Returns `NULL` invisibly.
#'
#' @family Process lm Functions
#' @keywords processLM lm internal
#' @noRd
.CheckProcessLM <- function(object) {
  if (!inherits(x = object, what = "lm")) {
    stop("`object` must be of class `lm`.")
  }
  invisible(x = NULL)
}
