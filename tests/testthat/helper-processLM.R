# Shared test helpers (testthat sources helper-*.R before the tests).
# rProject writes this file once; it is yours after that.

# Slow tests: run on CI and on request, skipped in local builds and on CRAN.
.SkipSlow <- function() {
  testthat::skip_on_cran()
  testthat::skip_if_not(
    condition = Sys.getenv(x = "CI") == "true" ||
      Sys.getenv(x = "RPROJECT_SLOW_TESTS") == "true",
    message = "set RPROJECT_SLOW_TESTS=true to run slow tests"
  )
}

# Proprietary software: never on CI or CRAN, and only where it is found.
.SkipIfMissing <- function(program) {
  testthat::skip_on_cran()
  testthat::skip_on_ci()
  testthat::skip_if(
    condition = Sys.which(names = program) == "",
    message = paste0(program, " is not installed")
  )
}

# Fixture: n = 12 observations of (y, x1, x2); the numbers are fixed.
.PLMFixture <- function() {
  x1 <- c(2.1, 3.4, 1.9, 4.2, 5.0, 3.3, 2.8, 4.6, 3.9, 1.5, 2.6, 4.1)
  x2 <- c(1.0, 0.4, 2.2, 1.8, 0.9, 2.7, 1.5, 0.3, 2.0, 1.1, 2.4, 0.6)
  e <- c(0.3, -0.2, 0.5, -0.4, 0.1, 0.2, -0.5, 0.4, -0.1, 0.0, -0.3, 0.2)
  data.frame(
    y = 1 + 0.5 * x1 - 0.3 * x2 + e,
    x1 = x1,
    x2 = x2
  )
}

# The compiled functions are not available when the R scripts are only sourced.
.PLMCompiled <- function() {
  exists(x = "_processLM_MCScreenLM")
}

# Model-implied covariance matrix of (y, x) from (beta, sigmasq, vech(Sigma_X)).
.PLMSigmaofTheta <- function(theta,
                             p) {
  beta <- theta[seq_len(length.out = p)]
  sigmasq <- theta[p + 1]
  sigmacapx <- matrix(data = 0, nrow = p, ncol = p)
  sigmacapx[lower.tri(x = sigmacapx, diag = TRUE)] <- theta[
    (p + 2):length(x = theta)
  ]
  sigmacapx <- sigmacapx + t(x = sigmacapx) - diag(x = diag(x = sigmacapx))
  sigmayx <- sigmacapx %*% beta
  rbind(
    cbind(sigmasq + sum(beta * sigmayx), t(x = sigmayx)),
    cbind(sigmayx, sigmacapx)
  )
}
