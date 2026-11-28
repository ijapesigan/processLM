# processLM 0.0.12

## Monte Carlo draw counts

- `.MCLM()` returns `screen`, the counts of the screened draws (requested, retained, rejected, redraws, exhausted,
  iter), from `semmcci` 1.1.7 (`1076264`: `.ThetaHatStarScreen()`, whose redraws use the same `pd` and `tol` as the
  first pass). The draws are unchanged. For betaMC (`MC()`, `MCMI()`) and manBeta.

# processLM 0.0.11

## Beta chain audit

- Copies refreshed byte for byte from the sources' pushed state: `linearAlgebra` 0.0.5 (`052db63`: `.DMat()`,
  `.PInvDmat()`, `.Vec()`, `.Vech()`; new `.TestPositiveSemiDefinite()`), `randomGaussian` (`da756e4`:
  `.RandomGaussianSVD()`), `rhoMatrix` 0.0.3 (`32c565b`: `.RhoofSigma()`), `semmcci` 1.1.7 (`c4d13a2`: `.ThetaHatStar()`,
  `.ThetaHatStarScreen()`).
- `.TestPositiveDefinite()` is removed: nothing calls it after the `semmcci` refresh.
- `.MCLM()`: `pd = TRUE` checks that `scale` is positive semidefinite (a singular `scale` passes), and
  `decomposition = "chol"` falls back to the eigenvalue decomposition when `chol()` fails (both from `semmcci` 1.1.7).
- `ProcessLM()`: with one regressor (`p = 1`), `scor` and `pcor` are computed (equal to `betastar` and the R-squared)
  instead of `NA`; `dif_beta`, `dif_betastar`, and `dif_idx` stay `NA`.
- `.Dif()` uses vectorized indexing (same results).
- Documentation: typos ("semipartial", "partial"), `rsq`, `pd`, and one `@family` name.

# processLM 0.0.10

## Template

- The rProject template; private `jeksterslab-psu/processLM`, public `ijapesigan/processLM`.
- `DESCRIPTION`: MIT, `Depends: R (>= 3.5.0)` (the data are saved with serialize version 3), `Imports: Rcpp, stats, utils`, `LinkingTo: Rcpp, RcppArmadillo`, `VignetteBuilder: knitr`.
- C++ moves to `.setup/cpp/` with `Makevars`, `Makevars.win`, and `000-forward-declarations.cpp`;
  the scalar `p` is passed by const reference (`cpp-const-ref`); the results are unchanged.
- Locked copies in `.setup/r-dependencies/` (never edited here): `linearAlgebra` (`.DMat()`, `.PInvDmat()`, `.Vec()`,
  `.Vech()`, `.TestPositiveDefinite()`, and the C++ `SymofVechCpp()` and `VechCpp()`), `rhoMatrix` (`.RhoofSigma()`),
  `strRegression` (`.BetaStarofRho()`, `.BetaStarofSigma()`, `.BetaStarSelect()`, `.FSq()`, `.PCorSq()`, `.RSqBar()`,
  `.RSqofSigma()`, `.SPCor()`, and the C++ `StrRegressionofVechSigmaMat()`), `semmcci` (`.ThetaHatStar()`,
  `.ThetaHatStarScreen()`), `randomGaussian` (`.Location()`, `.RandomGaussianChol()`, `.RandomGaussianEigen()`,
  `.RandomGaussianSVD()`, `.RandomGaussianZ()`), and `dataSets` (`nas1982`).
- Complete roxygen for every function; the internal functions use `@noRd`.
- Tests for every function.
- The old template files (`make-project.R`, `make-packages.R`, `latexsrc/`, `.github/workflows/*.yaml`, ...) are replaced by
  what `make project` writes; the tracked secret files are removed.
