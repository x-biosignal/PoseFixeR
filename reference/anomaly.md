# Flag statistical outliers

Flags values lying more than `k` standard deviations from the mean.

## Usage

``` r
anomaly(x, k = 2)
```

## Arguments

- x:

  A numeric vector.

- k:

  Number of standard deviations for the threshold (default 2).

## Value

A list with `caselist` (logical outlier flags) and `abnormal.values`
(the sorted flagged values).
