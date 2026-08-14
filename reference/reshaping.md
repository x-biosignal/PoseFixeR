# Reshape imported keypoints into frame-by-keypoint matrices

Reshape imported keypoints into frame-by-keypoint matrices

## Usage

``` r
reshaping(obj, norm = TRUE)
```

## Arguments

- obj:

  A list of per-frame keypoint matrices (from
  [`import_json()`](https://x-biosignal.github.io/PoseFixeR/reference/import_json.md)).

- norm:

  Logical; normalise coordinates relative to the neck (default TRUE).

## Value

A list with `x`, `y` and confidence matrices (frames x keypoints).
