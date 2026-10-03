#' Euclidean distance between two keypoints
#'
#' @param dat Reshaped keypoint data (see [reshaping()]).
#' @param a,b Keypoint indices or names.
#' @param time Frame index or vector of frames.
#' @return The distance(s) between keypoints `a` and `b`.
#' @examples
#' ## a minimal reshaped pose: 18 keypoints over three frames
#' parts <- c("nose","neck","Rshoulder","Relbow","Rwrist","Lshoulder","Lelbow",
#'   "Lwrist","Rhip","Rknee","Rankle","Lhip","Lknee","Lankle","Reye","Leye",
#'   "Rear","Lear")
#' bx <- c(0,0,-.25,-.3,-.32,.25,.3,.32,-.18,-.2,-.22,.18,.2,.22,-.05,.05,-.1,.1)
#' by <- c(-.3,0,.05,.5,.95,.05,.5,.95,1,1.65,2.28,1,1.65,2.28,-.35,-.35,-.3,-.3)
#' dat <- list(x = matrix(bx, 3, 18, byrow = TRUE, dimnames = list(NULL, parts)),
#'             y = matrix(by, 3, 18, byrow = TRUE, dimnames = list(NULL, parts)))
#' ## shoulder width over frames 1:3 (by name) and hip width (by index)
#' distance(dat, "Rshoulder", "Lshoulder", 1:3)
#' distance(dat, 9, 12, 1)
#' @export
distance = function(dat,a,b,time){
  x = dat$x[time,a] - dat$x[time,b]
  y = dat$y[time,a] - dat$y[time,b]
  dist = sqrt(x^2 + y^2)
  return(dist)
}
