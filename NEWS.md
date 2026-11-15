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
