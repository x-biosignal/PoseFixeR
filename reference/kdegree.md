# Knee joint angle between three keypoints

Knee joint angle between three keypoints

## Usage

``` r
kdegree(dat, a, b, c, time)
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

The knee angle(s) in degrees.
