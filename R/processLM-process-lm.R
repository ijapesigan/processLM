#' Process the lm object
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @return Returns a list with the following elements:
#'   \describe{
#'     \item{call}{[lm()] function call.}
#'     \item{object}{Object of class `lm`.}
#'     \item{X}{Model matrix (\eqn{1, X_{1}, \dots, X_{p}} ).}
#'     \item{x}{Data matrix (\eqn{Y, X_{1}, \dots, X_{p}} ).}
#'     \item{varnames}{Variable names of the model matrix.}
#'     \item{xnames}{Variable names of the regressors in the model matrix.}
#'     \item{dims}{Dimensions of the model matrix.}
#'     \item{n}{Sample size.}
#'     \item{p}{Number of regressors.}
#'     \item{k}{`k = p + 1`.}
#'     \item{q}{Length of the parameters in the covariance structure.}
#'     \item{df}{`n - k` degrees of freedom.}
#'     \item{mu}{Mean vector of the model matrix.}
#'     \item{sigmacap}{Covariance matrix of the model matrix.}
#'     \item{vechsigmacap}{Half-vectorization of the covariance matrix
#'       of the model matrix.}
#'     \item{sigmacapx}{Covariance matrix of the regressors
#'       in the model matrix.}
#'     \item{vechsigmacapx}{Half-vectorization of the covariance matrix
#'       of the regressors in the model matrix.}
#'     \item{sigma}{Standard deviation vector of the model matrix.}
#'     \item{sigmacap_consistent}{Consistent estimate of the covariance matrix
#'       of the model matrix.}
#'     \item{vechsigmacap_consistent}{Half-vectorization
#'       of the consistent estimate
#'       of the covariance matrix of the model matrix.}
#'     \item{pinv_of_dcap}{Moore-Penrose inverse of the duplication matrix.}
#'     \item{rhocap}{Correlation matrix of the model matrix.}
#'     \item{coef}{Vector of intercept and partial regression slopes.}
#'     \item{beta0}{Intercept.}
#'     \item{beta}{Vector of partial regression slopes.}
#'     \item{sigmasq}{Error variance.}
#'     \item{theta}{Parameters in the covariance structure,
#'       that is, `beta`, `sigmasq`, `vechsigmacapx`.}
#'     \item{betastar}{Vector of standardized regression slopes.}
#'     \item{scor}{Vector of semipartial correlations
#'       (equal to `betastar` when `p = 1`).}
#'     \item{pcor}{Vector of squared partial correlations
#'       (equal to the R-squared when `p = 1`).}
#'     \item{rsq}{Vector of the R-squared and the adjusted R-squared.}
#'     \item{dif_beta}{Differences of partial regression slopes
#'       (`NA` when `p = 1`).}
#'     \item{dif_betastar}{Differences of standardized
#'       partial regression slopes.}
#'     \item{dif_idx}{Differences index.}
#'   }
#'
#' @param object Object of class `lm`.
#'
#' @examples
#' object <- lm(QUALITY ~ NARTIC + PCTGRT + PCTSUPP, data = nas1982)
#' ProcessLM(object = object)
#'
#' @family Process lm Functions
#' @keywords processLM lm
#' @export
ProcessLM <- function(object) {
  .CheckProcessLM(object = object)
  .ProcessLM(object = object)
}
