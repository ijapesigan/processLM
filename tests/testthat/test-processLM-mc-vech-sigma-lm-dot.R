## ---- test-processLM-mc-vech-sigma-lm-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    if (.PLMCompiled()) {
      testthat::test_that(
        desc = paste(text, "round trip"),
        code = {
          good <- c(0.5, 0.3, 0.4, 1, 0.2, 2)
          draws <- rbind(
            good,
            c(0.5, 0.3, -0.4, 1, 0.2, 2),
            c(0.1, 0.2, 0.3, 1.5, 0.1, 1)
          )
          out <- processLM:::.MCVechSigmaLM(thetahatstar = draws, p = 2)
          testthat::expect_equal(object = dim(x = out), expected = c(3, 6))
          for (r in c(1, 3)) {
            sigmacap <- .PLMSigmaofTheta(theta = draws[r, ], p = 2)
            testthat::expect_equal(
              object = out[r, ],
              expected = sigmacap[lower.tri(x = sigmacap, diag = TRUE)]
            )
          }
          testthat::expect_true(object = all(is.na(x = out[2, ])))
          testthat::expect_equal(
            object = out[1, 1],
            expected = 0.4 + 0.25 * 1 + 2 * 0.15 * 0.2 + 0.09 * 2
          )
        }
      )
      testthat::test_that(
        desc = paste(text, "p = 1"),
        code = {
          out <- processLM:::.MCVechSigmaLM(
            thetahatstar = rbind(c(0.5, 0.4, 2)),
            p = 1
          )
          testthat::expect_equal(
            object = out,
            expected = rbind(c(0.4 + 0.25 * 2, 0.5 * 2, 2))
          )
        }
      )
    }
  },
  text = "test-processLM-mc-vech-sigma-lm-dot"
)
