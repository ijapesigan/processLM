## ---- test-processLM-f-sq-lm-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    if (.PLMCompiled()) {
      testthat::test_that(
        desc = paste(text, "f-squared"),
        code = {
          data <- .PLMFixture()
          object <- stats::lm(formula = y ~ x1 + x2, data = data)
          lm_process <- processLM:::.ProcessLM(object = object)
          out <- processLM:::.FSqLM(lm_process = lm_process)
          rsq <- summary(object = object)$r.squared
          srsq <- lm_process$scor^2
          testthat::expect_equal(
            object = names(x = out),
            expected = c("fsq", "x1", "x2")
          )
          testthat::expect_equal(
            object = out[["fsq"]],
            expected = rsq / (1 - rsq)
          )
          testthat::expect_equal(
            object = unname(obj = out[c("x1", "x2")]),
            expected = unname(obj = srsq / (1 - rsq))
          )
        }
      )
    }
  },
  text = "test-processLM-f-sq-lm-dot"
)
