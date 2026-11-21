## ---- test-processLM-mc-lm-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    if (.PLMCompiled()) {
      object <- stats::lm(formula = y ~ x1 + x2, data = .PLMFixture())
      lm_process <- processLM:::.ProcessLM(object = object)
      location <- lm_process$theta
      scale <- diag(x = c(0.01, 0.01, 0.001, 0.01, 0.001, 0.01))
      testthat::test_that(
        desc = paste(text, "draws"),
        code = {
          out <- processLM:::.MCLM(
            scale = scale,
            location = location,
            p = 2,
            R = 50,
            seed = 42
          )
          testthat::expect_equal(
            object = dim(x = out$thetahatstar),
            expected = c(50, 6)
          )
          testthat::expect_equal(
            object = dim(x = out$vechsigmacap),
            expected = c(50, 6)
          )
          sigmacap <- .PLMSigmaofTheta(theta = out$thetahatstar[7, ], p = 2)
          testthat::expect_equal(
            object = out$vechsigmacap[7, ],
            expected = sigmacap[lower.tri(x = sigmacap, diag = TRUE)]
          )
          again <- processLM:::.MCLM(
            scale = scale,
            location = location,
            p = 2,
            R = 50,
            seed = 42
          )
          testthat::expect_equal(object = again, expected = out)
        }
      )
      testthat::test_that(
        desc = paste(text, "fixed regressors"),
        code = {
          out <- processLM:::.MCLM(
            scale = scale[1:3, 1:3],
            location = location[1:3],
            p = 2,
            fixed_x = TRUE,
            vechsigmacapx = lm_process$vechsigmacapx,
            R = 30,
            seed = 1
          )
          testthat::expect_equal(
            object = dim(x = out$thetahatstar),
            expected = c(30, 6)
          )
          testthat::expect_equal(
            object = unname(obj = out$thetahatstar[5, 4:6]),
            expected = lm_process$vechsigmacapx
          )
        }
      )
      testthat::test_that(
        desc = paste(text, "inadmissible draws are redrawn or dropped"),
        code = {
          wide <- scale
          wide[3, 3] <- 1
          out <- processLM:::.MCLM(
            scale = wide,
            location = location,
            p = 2,
            R = 200,
            iter = 1000,
            seed = 3
          )
          testthat::expect_true(object = all(out$thetahatstar[, 3] > 0))
          testthat::expect_false(object = anyNA(x = out$vechsigmacap))
          none <- processLM:::.MCLM(
            scale = wide,
            location = c(location[1:2], -50, location[4:6]),
            p = 2,
            R = 20,
            iter = 2,
            seed = 3
          )
          testthat::expect_lt(
            object = nrow(x = none$thetahatstar),
            expected = 20
          )
        }
      )
      testthat::test_that(
        desc = paste(text, "singular scale with chol"),
        code = {
          singular <- scale
          singular[1, ] <- 0
          singular[, 1] <- 0
          out <- processLM:::.MCLM(
            scale = singular,
            location = location,
            p = 2,
            R = 20,
            decomposition = "chol",
            pd = TRUE,
            seed = 5
          )
          testthat::expect_equal(
            object = dim(x = out$thetahatstar),
            expected = c(20, 6)
          )
          testthat::expect_equal(
            object = unname(obj = out$thetahatstar[, 1]),
            expected = rep(x = location[1], times = 20)
          )
        }
      )
      testthat::test_that(
        desc = paste(text, "errors"),
        code = {
          testthat::expect_error(
            object = processLM:::.MCLM(
              scale = -diag(x = 6),
              location = location,
              p = 2,
              R = 10
            )
          )
        }
      )
    }
  },
  text = "test-processLM-mc-lm-dot"
)
