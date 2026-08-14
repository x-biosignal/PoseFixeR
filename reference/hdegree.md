# Hip joint angle between three keypoints

Hip joint angle between three keypoints

## Usage

``` r
hdegree(dat, a, b, c, time)
```

## Arguments

- dat:

  Reshaped keypoint data (see
  [`reshaping()`](https://x-biosignal.github.io/PoseFixeR/reference/reshaping.md)).

- a, b, c:

  Keypoint indices or names (angle measured at `b`).

- time:

  Frame index or vector of frames.

## Value

The hip angle(s) in degrees.
