
#' Hip joint angle between three keypoints
#'
#' @param dat Reshaped keypoint data (see [reshaping()]).
#' @param a,b,c Keypoint indices or names (angle measured at `b`).
#' @param time Frame index or vector of frames.
#' @return The hip angle(s) in degrees.
#' @examples
#' ## a minimal reshaped pose (one frame is enough for a single angle)
#' parts <- c("nose","neck","Rshoulder","Relbow","Rwrist","Lshoulder","Lelbow",
#'   "Lwrist","Rhip","Rknee","Rankle","Lhip","Lknee","Lankle","Reye","Leye",
#'   "Rear","Lear")
#' bx <- c(0,0,-.25,-.3,-.32,.25,.3,.32,-.18,-.2,-.22,.18,.2,.22,-.05,.05,-.1,.1)
#' by <- c(-.3,0,.05,.5,.95,.05,.5,.95,1,1.65,2.28,1,1.65,2.28,-.35,-.35,-.3,-.3)
#' dat <- list(x = matrix(bx, 2, 18, byrow = TRUE, dimnames = list(NULL, parts)),
#'             y = matrix(by, 2, 18, byrow = TRUE, dimnames = list(NULL, parts)))
#' ## right hip flexion at the hip (neck - Rhip - Rknee) in frame 1
#' hdegree(dat, 2, 9, 10, 1)
#' @export
hdegree = function(dat,a,b,c,time){

  vec1x = dat$x[time,a]-dat$x[time,b]
  vec1y = dat$y[time,a]-dat$y[time,b]
  vec2x = dat$x[time,c]-dat$x[time,b]
  vec2y = dat$y[time,c]-dat$y[time,b]
  denom <- sqrt(vec1x^2+vec1y^2)*sqrt(vec2x^2+vec2y^2)
  numer <- vec1x*vec2x+vec1y*vec2y
  cos1 <- numer/denom
  aa = vec1y/vec1x
  bb = (-1)*dat$x[time,a]*aa+dat$y[time,a]
  if(dat$x[time,b]>=0){
    if(dat$y[time,c]>dat$x[time,c]*aa + bb){
    theta = acos(cos1)*180/pi - 180
  }else{
    #theta = acos(cos1)*180/pi - 180
    theta = 180 - acos(cos1)*180/pi
  }
  }else{
    if(aa*dat$x[time,c] + bb < dat$y[time,c]){
      theta = 180 - acos(cos1)*180/pi
      #theta = 180 - acos(cos1)*180/pi
    }else{
      theta = acos(cos1)*180/pi - 180
      #theta = acos(cos1)*180/pi - 180
    }
  }
  return(theta)
}






