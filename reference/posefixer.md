# Detect and correct OpenPose gait anomalies

The main PoseFixeR workflow. Given imported and reshaped OpenPose
keypoint trajectories, it normalises them, detects and corrects
left/right leg swaps, anatomical (segment-length), biomechanical
(joint-angle / range-of-motion) and physical (frame-transition)
anomalies as well as low-confidence detections, sets anomalous keypoints
to `NA`, standardises segment lengths, then imputes and smooths the
trajectories.

## Usage

``` r
posefixer(dat, race, fps)
```

## Arguments

- dat:

  Imported and reshaped OpenPose data (see
  [`import_json()`](https://x-biosignal.github.io/PoseFixeR/reference/import_json.md)
  and
  [`reshaping()`](https://x-biosignal.github.io/PoseFixeR/reference/reshaping.md)):
  a list with `x`, `y` and confidence keypoint matrices (frames x
  keypoints).

- race:

  Reference-population index for the anatomical proportions (1 or 2).

- fps:

  Frames per second of the source video.

## Value

The corrected data in the same list structure as `dat`, or `NA` if the
recording fails the quality criteria.

## References

Sugiyama Y, Uno K, Matsui Y (2023). Types of anomalies in
two-dimensional video-based gait analysis in uncontrolled environments.
*PLOS Computational Biology* 19:e1009989.
[doi:10.1371/journal.pcbi.1009989](https://doi.org/10.1371/journal.pcbi.1009989)
