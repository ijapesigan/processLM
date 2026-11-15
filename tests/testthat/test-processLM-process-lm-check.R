## ---- test-processLM-process-lm-check
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "checks"),
      code = {
        object <- stats::lm(formula = y ~ x1, data = .PLMFixture())
        testthat::expect_null(
          object = processLM:::.CheckProcessLM(object = object)
        )
        testthat::expect_error(
          object = processLM:::.CheckProcessLM(object = list(1))
        )
        testthat::expect_error(
          object = processLM:::.CheckProcessLM(object = 1)
        )
        testthat::expect_error(
          object = processLM:::.CheckProcessLM(object = NULL)
        )
      }
    )
  },
  text = "test-processLM-process-lm-check"
)
