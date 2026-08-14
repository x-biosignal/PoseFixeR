# Import OpenPose JSON files in a batch

Import OpenPose JSON files in a batch

## Usage

``` r
import_json(
  files,
  parts = c("nose", "neck", "Rshoulder", "Relbow", "Rwrist", "Lshoulder", "Lelbow",
    "Lwrist", "Rhip", "Rknee", "Rankle", "Lhip", "Lknee", "Lankle", "Reye", "Leye",
    "Rear", "Lear")
)
```

## Arguments

- files:

  Character vector of OpenPose JSON file paths (one per frame).

- parts:

  Keypoint names in row order (default: the 18-keypoint layout).

## Value

A list of per-frame keypoint matrices (keypoint x `c("X","Y","P")`).
