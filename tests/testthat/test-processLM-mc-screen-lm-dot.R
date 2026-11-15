## ---- test-processLM-mc-screen-lm-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    if (.PLMCompiled()) {
      testthat::test_that(
        desc = paste(text, "p = 2"),
        code = {
          # (beta1, beta2, sigmasq, vech(Sigma_X))
          good <- c(0.5, 0.3, 0.4, 1, 0.2, 2)
          draws <- rbind(
            good,
            c(0.5, 0.3, -0.4, 1, 0.2, 2),
            c(0.5, 0.3, 0.4, -1, 0.2, 2),
            c(0.5, 0.3, 0.4, 1, 2, 2),
            c(0.5, 0.3, 0, 1, 0.2, 2),
            good
          )
          testthat::expect_equal(
            object = processLM:::.MCScreenLM(thetahatstar = draws, p = 2),
            expected = c(TRUE, FALSE, FALSE, FALSE, FALSE, TRUE)
          )
        }
      )
      testthat::test_that(
        desc = paste(text, "p = 1"),
        code = {
          draws <- rbind(
            c(0.5, 0.4, 1),
            c(0.5, 0.4, 0),
            c(0.5, -0.4, 1)
          )
          testthat::expect_equal(
            object = processLM:::.MCScreenLM(thetahatstar = draws, p = 1),
            expected = c(TRUE, FALSE, FALSE)
          )
        }
      )
    }
  },
  text = "test-processLM-mc-screen-lm-dot"
)
