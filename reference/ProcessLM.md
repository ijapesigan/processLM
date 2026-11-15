# Process the lm object

Process the lm object

## Usage

``` r
ProcessLM(object)
```

## Arguments

- object:

  Object of class `lm`.

## Value

Returns a list with the following elements:

- call:

  [`lm()`](https://rdrr.io/r/stats/lm.html) function call.

- object:

  Object of class `lm`.

- X:

  Model matrix (\\(1, X\_{1}, \dots, X\_{p}\\) ).

- x:

  Data matrix (\\(Y, X\_{1}, \dots, X\_{p}\\) ).

- varnames:

  Variable names of the model matrix.

- xnames:

  Variable names of the regressors in the model matrix.

- dims:

  Dimensions of the model matrix.

- n:

  Sample size.

- p:

  Number of regressors.

- k:

  `k = p + 1`.

- q:

  Length of the parameters in the covariance structure.

- df:

  `n - k` degrees of freedom.

- mu:

  Mean vector of the model matrix.

- sigmacap:

  Covariance matrix of the model matrix.

- vechsigmacap:

  Half-vectorization of the covariance matrix of the model matrix.

- sigmacapx:

  Covariance matrix of the regressors in the model matrix.

- vechsigmacapx:

  Half-vectorization of the covariance matrix of the regressors in the
  model matrix.

- sigma:

  Standard deviation vector of the model matrix.

- sigmacap_consistent:

  Consistent estimate of the covariance matrix of the model matrix.

- vechsigmacap_consistent:

  Half-vectorization of the consistent estimate of the covariance matrix
  of the model matrix.

- pinv_of_dcap:

  Moore-Penrose inverse of the duplication matrix.

- rhocap:

  Correlation matrix of the model matrix.

- coef:

  Vector of intercept and partial regression slopes.

- beta0:

  Intercept.

- beta:

  Vector of partial regression slopes.

- sigmasq:

  Error variance.

- theta:

  Parameters in the covariance structure, that is, `beta`, `sigmasq`,
  `vechsigmacapx`.

- betastar:

  Vector of standardized regression slopes.

- scor:

  Vector of semipatial correlations.

- pcor:

  Vector of squared patial correlations.

- rsq:

  Vector of multiple correlation coefficients (R-squared and adjusted
  R-squared).

- dif_beta:

  Differences of partial regression slopes.

- dif_betastar:

  Differences of standardized partial regression slopes.

- dif_idx:

  Differences index.

## Author

Ivan Jacob Agaloos Pesigan

## Examples

``` r
object <- lm(QUALITY ~ NARTIC + PCTGRT + PCTSUPP, data = nas1982)
ProcessLM(object = object)
#> $call
#> lm(formula = QUALITY ~ NARTIC + PCTGRT + PCTSUPP, data = nas1982)
#> 
#> $object
#> 
#> Call:
#> lm(formula = QUALITY ~ NARTIC + PCTGRT + PCTSUPP, data = nas1982)
#> 
#> Coefficients:
#> (Intercept)       NARTIC       PCTGRT      PCTSUPP  
#>    10.35925      0.08421      0.21600      0.11260  
#> 
#> 
#> $X
#>    (Intercept) NARTIC PCTGRT PCTSUPP
#> 1            1     14      8      16
#> 2            1     61      3      67
#> 3            1     68     13      66
#> 4            1     49     63      52
#> 5            1    130     53      64
#> 6            1     65     29      59
#> 7            1     79     35      81
#> 8            1    187     40      65
#> 9            1     32     19      87
#> 10           1     50      8      43
#> 11           1     49     25      26
#> 12           1      9      0       7
#> 13           1     65     35      64
#> 14           1     11      0      10
#> 15           1    196     13      28
#> 16           1    173     52      62
#> 17           1     79     19      51
#> 18           1    208     32      56
#> 19           1    120     19      49
#> 20           1    114     14      41
#> 21           1     87     20      22
#> 22           1     10      6      39
#> 23           1    101     12      41
#> 24           1     59      4      33
#> 25           1    274     32      64
#> 26           1    160     23      39
#> 27           1     39     31       4
#> 28           1     84     34      55
#> 29           1     60      5       7
#> 30           1     31     63      25
#> 31           1     62     15      23
#> 32           1     24      4      51
#> 33           1    122     16      65
#> 34           1     92     48      28
#> 35           1    117     36      70
#> 36           1    114     27      10
#> 37           1     19     10      46
#> 38           1     64      6      13
#> 39           1    155     58      70
#> 40           1     70     10      42
#> 41           1     72      5      15
#> 42           1     15      6       9
#> 43           1     85     17      74
#> 44           1     79     29       0
#> 45           1     84     27      68
#> 46           1    172     67      57
#> attr(,"assign")
#> [1] 0 1 2 3
#> 
#> $x
#>    QUALITY NARTIC PCTGRT PCTSUPP
#> 1       12     14      8      16
#> 2       23     61      3      67
#> 3       29     68     13      66
#> 4       36     49     63      52
#> 5       44    130     53      64
#> 6       21     65     29      59
#> 7       40     79     35      81
#> 8       42    187     40      65
#> 9       24     32     19      87
#> 10      30     50      8      43
#> 11      20     49     25      26
#> 12       8      9      0       7
#> 13      28     65     35      64
#> 14      14     11      0      10
#> 15      27    196     13      28
#> 16      46    173     52      62
#> 17      29     79     19      51
#> 18      42    208     32      56
#> 19      33    120     19      49
#> 20      31    114     14      41
#> 21      23     87     20      22
#> 22      18     10      6      39
#> 23      29    101     12      41
#> 24      21     59      4      33
#> 25      45    274     32      64
#> 26      25    160     23      39
#> 27      18     39     31       4
#> 28      33     84     34      55
#> 29      21     60      5       7
#> 30      24     31     63      25
#> 31      15     62     15      23
#> 32      15     24      4      51
#> 33      36    122     16      65
#> 34      38     92     48      28
#> 35      32    117     36      70
#> 36      27    114     27      10
#> 37      16     19     10      46
#> 38      26     64      6      13
#> 39      48    155     58      70
#> 40      26     70     10      42
#> 41      14     72      5      15
#> 42      12     15      6       9
#> 43      29     85     17      74
#> 44      34     79     29       0
#> 45      28     84     27      68
#> 46      39    172     67      57
#> attr(,"assign")
#> [1] 0 1 2 3
#> 
#> $varnames
#> [1] "QUALITY" "NARTIC"  "PCTGRT"  "PCTSUPP"
#> 
#> $xnames
#> [1] "NARTIC"  "PCTGRT"  "PCTSUPP"
#> 
#> $dims
#> [1] 46  4
#> 
#> $n
#> [1] 46
#> 
#> $p
#> [1] 3
#> 
#> $k
#> [1] 4
#> 
#> $q
#> [1] 10
#> 
#> $df
#> [1] 42
#> 
#> $mu
#>  QUALITY   NARTIC   PCTGRT  PCTSUPP 
#> 27.63043 87.17391 23.71739 42.69565 
#> 
#> $sigmacap
#>          QUALITY    NARTIC   PCTGRT  PCTSUPP
#> QUALITY 101.4382  454.5990 128.6488 138.0184
#> NARTIC  454.5990 3507.1691 471.2058 510.5430
#> PCTGRT  128.6488  471.2058 333.2295 150.9121
#> PCTSUPP 138.0184  510.5430 150.9121 554.4386
#> 
#> $vechsigmacap
#>  [1]  101.4382  454.5990  128.6488  138.0184 3507.1691  471.2058  510.5430
#>  [8]  333.2295  150.9121  554.4386
#> 
#> $sigmacapx
#>            NARTIC   PCTGRT  PCTSUPP
#> NARTIC  3507.1691 471.2058 510.5430
#> PCTGRT   471.2058 333.2295 150.9121
#> PCTSUPP  510.5430 150.9121 554.4386
#> 
#> $vechsigmacapx
#> [1] 3507.1691  471.2058  510.5430  333.2295  150.9121  554.4386
#> 
#> $sigma
#>  QUALITY   NARTIC   PCTGRT  PCTSUPP 
#> 10.07165 59.22136 18.25457 23.54652 
#> 
#> $sigmacap_consistent
#>           QUALITY    NARTIC   PCTGRT  PCTSUPP
#> QUALITY  99.23299  444.7164 125.8521 135.0180
#> NARTIC  444.71645 3430.9263 460.9622 499.4442
#> PCTGRT  125.85208  460.9622 325.9853 147.6314
#> PCTSUPP 135.01796  499.4442 147.6314 542.3856
#> 
#> $vechsigmacap_consistent
#>  [1]   99.23299  444.71645  125.85208  135.01796 3430.92628  460.96219
#>  [7]  499.44423  325.98535  147.63138  542.38563
#> 
#> $pinv_of_dcap
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13]
#>  [1,]    1  0.0  0.0  0.0  0.0    0  0.0  0.0  0.0   0.0     0   0.0   0.0
#>  [2,]    0  0.5  0.0  0.0  0.5    0  0.0  0.0  0.0   0.0     0   0.0   0.0
#>  [3,]    0  0.0  0.5  0.0  0.0    0  0.0  0.0  0.5   0.0     0   0.0   0.0
#>  [4,]    0  0.0  0.0  0.5  0.0    0  0.0  0.0  0.0   0.0     0   0.0   0.5
#>  [5,]    0  0.0  0.0  0.0  0.0    1  0.0  0.0  0.0   0.0     0   0.0   0.0
#>  [6,]    0  0.0  0.0  0.0  0.0    0  0.5  0.0  0.0   0.5     0   0.0   0.0
#>  [7,]    0  0.0  0.0  0.0  0.0    0  0.0  0.5  0.0   0.0     0   0.0   0.0
#>  [8,]    0  0.0  0.0  0.0  0.0    0  0.0  0.0  0.0   0.0     1   0.0   0.0
#>  [9,]    0  0.0  0.0  0.0  0.0    0  0.0  0.0  0.0   0.0     0   0.5   0.0
#> [10,]    0  0.0  0.0  0.0  0.0    0  0.0  0.0  0.0   0.0     0   0.0   0.0
#>       [,14] [,15] [,16]
#>  [1,]   0.0   0.0     0
#>  [2,]   0.0   0.0     0
#>  [3,]   0.0   0.0     0
#>  [4,]   0.0   0.0     0
#>  [5,]   0.0   0.0     0
#>  [6,]   0.0   0.0     0
#>  [7,]   0.5   0.0     0
#>  [8,]   0.0   0.0     0
#>  [9,]   0.0   0.5     0
#> [10,]   0.0   0.0     1
#> 
#> $rhocap
#>           QUALITY    NARTIC    PCTGRT   PCTSUPP
#> QUALITY 1.0000000 0.7621658 0.6997346 0.5819818
#> NARTIC  0.7621658 1.0000000 0.4358736 0.3661232
#> PCTGRT  0.6997346 0.4358736 1.0000000 0.3510957
#> PCTSUPP 0.5819818 0.3661232 0.3510957 1.0000000
#> 
#> $coef
#> (Intercept)      NARTIC      PCTGRT     PCTSUPP 
#> 10.35924520  0.08420829  0.21599726  0.11260003 
#> 
#> $beta0
#> (Intercept) 
#>    10.35925 
#> 
#> $beta
#>     NARTIC     PCTGRT    PCTSUPP 
#> 0.08420829 0.21599726 0.11260003 
#> 
#> $sigmasq
#> [1] 21.24482
#> 
#> $theta
#>  [1] 8.420829e-02 2.159973e-01 1.126000e-01 2.124482e+01 3.507169e+03
#>  [6] 4.712058e+02 5.105430e+02 3.332295e+02 1.509121e+02 5.544386e+02
#> 
#> $betastar
#>    NARTIC    PCTGRT   PCTSUPP 
#> 0.4951451 0.3914887 0.2632477 
#> 
#> $scor
#>    NARTIC    PCTGRT   PCTSUPP 
#> 0.4311525 0.3430075 0.2384789 
#> 
#> $pcor
#>    NARTIC    PCTGRT   PCTSUPP 
#> 0.4874382 0.3757383 0.2253739 
#> 
#> $rsq
#>       rsq       adj 
#> 0.8045263 0.7905638 
#> 
#> $dif_beta
#>  NARTIC-PCTGRT NARTIC-PCTSUPP PCTGRT-PCTSUPP 
#>    -0.13178897    -0.02839174     0.10339723 
#> 
#> $dif_betastar
#>  NARTIC-PCTGRT NARTIC-PCTSUPP PCTGRT-PCTSUPP 
#>      0.1036564      0.2318974      0.1282410 
#> 
#> $dif_idx
#>      [,1] [,2] [,3]
#> [1,]    1    1    2
#> [2,]    2    3    3
#> 
```
