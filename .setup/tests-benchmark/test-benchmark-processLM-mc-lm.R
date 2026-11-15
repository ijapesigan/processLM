## ---- test-benchmark-processLM-mc-lm
# Run by hand: bench is not part of the unit tests.
stopifnot(requireNamespace(package = "bench", quietly = TRUE))
lapply(
  X = c(3, 10, 20),
  FUN = function(k) {
    p <- k - 1
    q <- p + 1 + p * (p + 1) / 2
    location <- c(rep(x = 0.1, times = p), 1, as.vector(x = diag(x = p))[
      lower.tri(x = diag(x = p), diag = TRUE)
    ])
    print(
      x = bench::mark(
        processLM:::.MCLM(
          scale = diag(x = 0.001, nrow = q),
          location = location,
          p = p,
          R = 100,
          seed = 1
        ),
        iterations = 5,
        check = FALSE
      )
    )
  }
)
