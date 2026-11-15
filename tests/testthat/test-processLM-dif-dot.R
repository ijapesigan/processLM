## ---- test-processLM-dif-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "p = 3"),
      code = {
        out <- processLM:::.Dif(
          beta = c(1, 3, 6),
          betastar = c(0.1, 0.2, 0.4),
          p = 3,
          xnames = c("a", "b", "c")
        )
        testthat::expect_equal(
          object = out$dif_beta,
          expected = c("a-b" = -2, "a-c" = -5, "b-c" = -3)
        )
        testthat::expect_equal(
          object = out$dif_betastar,
          expected = c("a-b" = -0.1, "a-c" = -0.3, "b-c" = -0.2)
        )
        testthat::expect_equal(
          object = out$dif_idx,
          expected = rbind(c(1L, 1L, 2L), c(2L, 3L, 3L))
        )
      }
    )
    testthat::test_that(
      desc = paste(text, "p = 2"),
      code = {
        out <- processLM:::.Dif(
          beta = c(1, 3),
          betastar = c(0.1, 0.2),
          p = 2,
          xnames = c("a", "b")
        )
        testthat::expect_equal(
          object = out$dif_beta,
          expected = c("a-b" = -2)
        )
        testthat::expect_equal(
          object = out$dif_idx,
          expected = matrix(data = c(1L, 2L), nrow = 2)
        )
      }
    )
    testthat::test_that(
      desc = paste(text, "p = 1"),
      code = {
        out <- processLM:::.Dif(
          beta = 1,
          betastar = 0.1,
          p = 1,
          xnames = "a"
        )
        testthat::expect_equal(
          object = out,
          expected = list(
            dif_beta = NA,
            dif_betastar = NA,
            dif_idx = NA
          )
        )
      }
    )
  },
  text = "test-processLM-dif-dot"
)
