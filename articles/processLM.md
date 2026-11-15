# processLM: Process lm Objects

## Description

Preprocessing helper functions for the `lm` object in R (R Core Team,
2026): sample moments, standardized and selectively standardized partial
regression slopes, R-squared and adjusted R-squared, semipartial and
partial correlations, Cohen’s f-squared, and differences of slopes.

## Installation

You can install the development version of `processLM` from
[GitHub](https://github.com/ijapesigan/processLM) with:

\
`if`` ``(``!`[`require`](https://rdrr.io/r/base/library.html)`(`[`"pak"`](https://pak.r-lib.org/)`)``)`` `[`install.packages`](https://rdrr.io/r/utils/install.packages.html)`(``"pak"``)`\
`pak``::`[`pkg_install`](https://pak.r-lib.org/reference/pkg_install.html)`(``"ijapesigan/processLM"``)`

## Example

\
[`library`](https://rdrr.io/r/base/library.html)`(``package ``=`` ``"processLM"``)`\
`object`` ``<-`` ``stats``::`[`lm`](https://rdrr.io/r/stats/lm.html)`(`\
`  formula ``=`` ``QUALITY`` ``~`` ``NARTIC`` ``+`` ``PCTGRT`` ``+`` ``PCTSUPP``,`\
`  data ``=`` ``nas1982`\
`)`\
`out`` ``<-`` `[`ProcessLM`](https://ijapesigan.github.io/processLM/reference/ProcessLM.md)`(``object ``=`` ``object``)`\
`out``$``beta`\
`#>     NARTIC     PCTGRT    PCTSUPP `\
`#> 0.08420829 0.21599726 0.11260003`\
`out``$``betastar`\
`#>    NARTIC    PCTGRT   PCTSUPP `\
`#> 0.4951451 0.3914887 0.2632477`\
`out``$``rsq`\
`#>       rsq       adj `\
`#> 0.8045263 0.7905638`\
`out``$``dif_betastar`\
`#>  NARTIC-PCTGRT NARTIC-PCTSUPP PCTGRT-PCTSUPP `\
`#>      0.1036564      0.2318974      0.1282410`

## References

R Core Team. (2026). *R: A language and environment for statistical
computing*. R Foundation for Statistical Computing.
<https://www.R-project.org/>
