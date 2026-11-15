## ---- test-processLM-beta-star-select-lm-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    object <- stats::lm(formula = y ~ x1 + x2, data = .PLMFixture())
    lm_process <- processLM:::.ProcessLM(object = object)
    testthat::test_that(
      desc = paste(text, "standardization choices"),
      code = {
        all_std <- processLM:::.BetaStarSelectLM(
          lm_process = lm_process,
          std_y = TRUE,
          std_x = c(TRUE, TRUE)
        )
        testthat::expect_equal(
          object = all_std,
          expected = lm_process$betastar
        )
        none_std <- processLM:::.BetaStarSelectLM(
          lm_process = lm_process,
          std_y = FALSE,
          std_x = c(FALSE, FALSE)
        )
        testthat::expect_equal(
          object = none_std,
          expected = lm_process$beta
        )
        one_std <- processLM:::.BetaStarSelectLM(
          lm_process = lm_process,
          std_y = TRUE,
          std_x = c(TRUE, FALSE)
        )
        testthat::expect_equal(
          object = one_std,
          expected = c(
            lm_process$betastar[1],
            lm_process$betastar[2] / lm_process$sigma[3]
          ),
          ignore_attr = TRUE
        )
        testthat::expect_equal(
          object = names(x = one_std),
          expected = c("x1", "x2")
        )
      }
    )
  },
  text = "test-processLM-beta-star-select-lm-dot"
)
