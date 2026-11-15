## ---- test-processLM-process-lm-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    data <- .PLMFixture()
    object <- stats::lm(formula = y ~ x1 + x2, data = data)
    out <- processLM:::.ProcessLM(object = object)
    sigmacap <- stats::cov(x = data)
    rsq <- summary(object = object)$r.squared
    rsq_without_x1 <- summary(
      object = stats::lm(formula = y ~ x2, data = data)
    )$r.squared
    rsq_without_x2 <- summary(
      object = stats::lm(formula = y ~ x1, data = data)
    )$r.squared
    testthat::test_that(
      desc = paste(text, "dimensions and moments"),
      code = {
        testthat::expect_equal(object = out$n, expected = 12)
        testthat::expect_equal(object = out$p, expected = 2)
        testthat::expect_equal(object = out$k, expected = 3)
        testthat::expect_equal(object = out$q, expected = 6)
        testthat::expect_equal(object = out$df, expected = 9)
        testthat::expect_equal(
          object = out$varnames,
          expected = c("y", "x1", "x2")
        )
        testthat::expect_equal(
          object = out$xnames,
          expected = c("x1", "x2")
        )
        testthat::expect_equal(object = out$sigmacap, expected = sigmacap)
        testthat::expect_equal(
          object = out$vechsigmacapx,
          expected = sigmacap[2:3, 2:3][lower.tri(x = diag(x = 2), diag = TRUE)]
        )
        testthat::expect_equal(
          object = out$theta,
          expected = unname(
            obj = c(
              stats::coef(object = object)[-1],
              summary(object = object)$sigma^2,
              sigmacap[2:3, 2:3][lower.tri(x = diag(x = 2), diag = TRUE)]
            )
          )
        )
        testthat::expect_equal(
          object = out$pinv_of_dcap,
          expected = solve(
            a = crossprod(x = processLM:::.DMat(k = 3)),
            b = t(x = processLM:::.DMat(k = 3))
          )
        )
      }
    )
    testthat::test_that(
      desc = paste(text, "effect sizes"),
      code = {
        testthat::expect_equal(
          object = out$betastar,
          expected = stats::setNames(
            object = solve(
              a = stats::cor(x = data)[2:3, 2:3],
              b = stats::cor(x = data)[2:3, 1]
            ),
            nm = c("x1", "x2")
          ),
          ignore_attr = TRUE
        )
        testthat::expect_equal(object = out$rsq[["rsq"]], expected = rsq)
        testthat::expect_equal(
          object = out$rsq[["adj"]],
          expected = summary(object = object)$adj.r.squared
        )
        testthat::expect_equal(
          object = unname(obj = out$scor^2),
          expected = c(rsq - rsq_without_x1, rsq - rsq_without_x2)
        )
        testthat::expect_equal(
          object = unname(obj = out$pcor),
          expected = c(
            (rsq - rsq_without_x1) / (1 - rsq_without_x1),
            (rsq - rsq_without_x2) / (1 - rsq_without_x2)
          )
        )
        testthat::expect_equal(
          object = out$dif_beta[[1]],
          expected = unname(obj = out$beta[1] - out$beta[2])
        )
        testthat::expect_equal(
          object = out$dif_betastar[[1]],
          expected = unname(obj = out$betastar[1] - out$betastar[2])
        )
      }
    )
  },
  text = "test-processLM-process-lm-dot"
)
