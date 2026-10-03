#' Knee joint angle between three keypoints
#'
#' @param dat Reshaped keypoint data (see [reshaping()]).
#' @param a,b,c Keypoint indices or names (angle measured at `b`).
#' @param time Frame index or vector of frames.
#' @return The knee angle(s) in degrees.
#' @examples
#' ## a minimal reshaped pose (one frame is enough for a single angle)
#' parts <- c("nose","neck","Rshoulder","Relbow","Rwrist","Lshoulder","Lelbow",
#'   "Lwrist","Rhip","Rknee","Rankle","Lhip","Lknee","Lankle","Reye","Leye",
#'   "Rear","Lear")
#' bx <- c(0,0,-.25,-.3,-.32,.25,.3,.32,-.18,-.2,-.22,.18,.2,.22,-.05,.05,-.1,.1)
#' by <- c(-.3,0,.05,.5,.95,.05,.5,.95,1,1.65,2.28,1,1.65,2.28,-.35,-.35,-.3,-.3)
#' dat <- list(x = matrix(bx, 2, 18, byrow = TRUE, dimnames = list(NULL, parts)),
#'             y = matrix(by, 2, 18, byrow = TRUE, dimnames = list(NULL, parts)))
#' ## right knee angle (Rhip - Rknee - Rankle) in frame 1
#' kdegree(dat, 9, 10, 11, 1)
#' @export
kdegree = function(dat,a,b,c,time){
  vec1x = dat$x[time,a]-dat$x[time,b]
  vec1y = dat$y[time,a]-dat$y[time,b]
  vec2x = dat$x[time,c]-dat$x[time,b]
  vec2y = dat$y[time,c]-dat$y[time,b]
  denom <- sqrt(vec1x^2+vec1y^2)*sqrt(vec2x^2+vec2y^2)
  numer <- vec1x*vec2x+vec1y*vec2y
  cos1 <- numer/denom
  aa = vec1y/vec1x
  bb = (-1)*dat$x[time,a]*aa+dat$y[time,a]
  # if(-180 < acos(cos1)*180/pi&acos(cos1)*180/pi <= 0){
  #   asdeg = (-1)*acos(cos1)*180/pi
  # }else if(0<acos(cos1)*180/pi & acos(cos1)*180/pi <= 180){
   asdeg = acos(cos1)*180/pi
  # }else if(acos(cos1)*180 <= -180){
  #   asdeg = acos(cos1)*180/pi+180
  # }else{
  #   asdeg = acos(cos1)*180/pi-180
  # }
  if(aa<0){
    if(aa*dat$x[time,c] + bb < dat$y[time,c]){
      theta = 180 - asdeg
    }else{
      #theta = acos(cos1)*180/pi - 180
      theta = asdeg - 180
    }
  }else{
    if(aa*dat$x[time,c] + bb < dat$y[time,c]){
      theta = 180 - asdeg
      #theta = 180 - acos(cos1)*180/pi
    }else{
      theta = 180 - asdeg
      #theta = acos(cos1)*180/pi - 180
    }
  }
  return(theta)
}









