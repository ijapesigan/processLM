## ---- test-processLM-process-lm
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    data <- processLM::nas1982
    object <- stats::lm(
      formula = QUALITY ~ NARTIC + PCTGRT + PCTSUPP,
      data = data
    )
    out <- processLM::ProcessLM(object = object)
    vars <- c("QUALITY", "NARTIC", "PCTGRT", "PCTSUPP")
    sigmacap <- stats::cov(x = data[, vars])
    sigma <- sqrt(x = diag(x = sigmacap))
    testthat::test_that(
      desc = paste(text, "known values"),
      code = {
        testthat::expect_equal(object = out$object, expected = object)
        testthat::expect_equal(
          object = out$X,
          expected = stats::model.matrix(object = object)
        )
        testthat::expect_equal(object = out$n, expected = nrow(x = data))
        testthat::expect_equal(object = out$p, expected = 3)
        testthat::expect_equal(object = out$k, expected = 4)
        testthat::expect_equal(object = out$q, expected = 10)
        testthat::expect_equal(
          object = out$df,
          expected = object$df.residual
        )
        testthat::expect_equal(
          object = out$mu,
          expected = colMeans(x = data[, vars])
        )
        testthat::expect_equal(object = out$sigmacap, expected = sigmacap)
        testthat::expect_equal(
          object = out$vechsigmacap,
          expected = sigmacap[lower.tri(x = sigmacap, diag = TRUE)]
        )
        testthat::expect_equal(
          object = out$sigmacapx,
          expected = sigmacap[2:4, 2:4]
        )
        testthat::expect_equal(object = out$sigma, expected = sigma)
        testthat::expect_equal(
          object = out$sigmacap_consistent,
          expected = sigmacap * (out$n - 1) / out$n
        )
        testthat::expect_equal(
          object = out$rhocap,
          expected = stats::cor(x = data[, vars])
        )
        testthat::expect_equal(
          object = out$coef,
          expected = stats::coef(object = object)
        )
        testthat::expect_equal(
          object = out$beta,
          expected = stats::coef(object = object)[-1]
        )
        testthat::expect_equal(
          object = out$sigmasq,
          expected = summary(object = object)$sigma^2
        )
        testthat::expect_equal(
          object = out$betastar,
          expected = stats::coef(object = object)[-1] * sigma[-1] / sigma[1]
        )
        testthat::expect_equal(
          object = out$rsq,
          expected = c(
            rsq = summary(object = object)$r.squared,
            adj = summary(object = object)$adj.r.squared
          )
        )
        testthat::expect_equal(
          object = unname(obj = out$dif_beta),
          expected = c(
            0.08420829 - 0.21599726,
            0.08420829 - 0.11260003,
            0.21599726 - 0.11260003
          ),
          tolerance = 0.0001
        )
        testthat::expect_equal(
          object = names(x = out$dif_betastar),
          expected = c("NARTIC-PCTGRT", "NARTIC-PCTSUPP", "PCTGRT-PCTSUPP")
        )
        testthat::expect_equal(
          object = unname(obj = out$dif_betastar),
          expected = c(
            0.4951 - 0.3915,
            0.4951 - 0.2632,
            0.3915 - 0.2632
          ),
          tolerance = 0.0001
        )
      }
    )
    testthat::test_that(
      desc = paste(text, "k = 2"),
      code = {
        out <- processLM::ProcessLM(
          object = stats::lm(formula = QUALITY ~ NARTIC, data = data)
        )
        testthat::expect_equal(object = out$p, expected = 1)
        testthat::expect_equal(object = out$q, expected = 3)
        testthat::expect_equal(
          object = out$scor,
          expected = out$betastar
        )
        testthat::expect_equal(
          object = unname(obj = out$pcor),
          expected = unname(obj = out$rsq[1])
        )
        testthat::expect_named(object = out$pcor, expected = "NARTIC")
        testthat::expect_true(object = is.na(x = out$dif_beta))
        testthat::expect_true(object = is.na(x = out$dif_betastar))
        testthat::expect_true(object = is.na(x = out$dif_idx))
        testthat::expect_equal(
          object = unname(obj = out$betastar),
          expected = stats::cor(x = data$QUALITY, y = data$NARTIC)
        )
      }
    )
    testthat::test_that(
      desc = paste(text, "errors"),
      code = {
        testthat::expect_error(
          object = processLM::ProcessLM(object = list(1))
        )
        testthat::expect_error(object = processLM::ProcessLM(object = NULL))
      }
    )
  },
  text = "test-processLM-process-lm"
)
