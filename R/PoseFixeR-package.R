#' PoseFixeR: Anomaly Detection and Correction for OpenPose Gait Analysis
#'
#' PoseFixeR cleans two-dimensional, video-based gait recordings produced by
#' OpenPose. It imports per-frame keypoint detections, flags the anatomical,
#' biomechanical, physical and low-confidence anomalies that arise when filming
#' in uncontrolled conditions, sets the offending keypoints aside, then imputes
#' and smooths the corrected trajectories so downstream gait analysis sees
#' continuous, physically plausible joint paths. It implements the method of
#' Sugiyama, Uno and Matsui (2023).
#'
#' @section Import and reshape:
#' * [import_json()] reads a batch of OpenPose per-frame JSON files into a list
#'   of keypoint matrices (keypoint x `c("X", "Y", "P")`).
#' * [reshaping()] stacks those frames into `x`, `y` and confidence matrices
#'   (frames x keypoints).
#'
#' @section Normalisation:
#' * [normalize()] expresses every keypoint relative to the neck and scales by
#'   the hip-neck distance, removing camera position and distance.
#'
#' @section Keypoint features:
#' * [distance()] Euclidean distance between two keypoints (a segment length).
#' * [hdegree()] hip joint angle and [kdegree()] knee joint angle, each measured
#'   from three keypoints.
#'
#' @section Anomaly detection and correction:
#' * [anomaly()] flags statistical outliers in a numeric series.
#' * [posefixer()] is the main entry point: it runs the full
#'   detect-correct-impute-smooth workflow on the reshaped trajectories.
#'
#' @section Visualisation:
#' * [plt.segment()] draws the skeleton segments for one frame and
#'   [diplay_frames()] lays out a sequence of frames.
#'
#' @section Getting started:
#' See `vignette("posefixer-workflow", package = "PoseFixeR")` for an end-to-end
#' walk-through on synthetic keypoint data.
#'
#' @references Sugiyama Y, Uno K, Matsui Y (2023). Types of anomalies in
#'   two-dimensional video-based gait analysis in uncontrolled environments.
#'   \emph{PLOS Computational Biology} 19:e1009989.
#'   \doi{10.1371/journal.pcbi.1009989}
#'
#' @keywords internal
"_PACKAGE"
