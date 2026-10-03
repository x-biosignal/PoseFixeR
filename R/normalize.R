#' Normalizing coordinates from OpenPose
#'
#' @param obj Reshaped keypoint data (see [reshaping()]): a list with `x`, `y`
#'   and confidence matrices whose columns are named keypoints.
#' @return The neck-normalised keypoint data, in the same `x`/`y`/`p` structure.
#' @examples
#' ## a minimal reshaped pose over three frames
#' parts <- c("nose","neck","Rshoulder","Relbow","Rwrist","Lshoulder","Lelbow",
#'   "Lwrist","Rhip","Rknee","Rankle","Lhip","Lknee","Lankle","Reye","Leye",
#'   "Rear","Lear")
#' bx <- c(0,0,-.25,-.3,-.32,.25,.3,.32,-.18,-.2,-.22,.18,.2,.22,-.05,.05,-.1,.1)
#' by <- c(-.3,0,.05,.5,.95,.05,.5,.95,1,1.65,2.28,1,1.65,2.28,-.35,-.35,-.3,-.3)
#' dat <- list(x = matrix(bx, 3, 18, byrow = TRUE, dimnames = list(NULL, parts)),
#'             y = matrix(by, 3, 18, byrow = TRUE, dimnames = list(NULL, parts)),
#'             p = matrix(1, 3, 18, dimnames = list(NULL, parts)))
#' norm <- normalize(dat)
#' norm$x[, "neck"]   # neck is the origin after normalisation
#' @export
normalize = function(obj){

  xseq = obj$x
  yseq = obj$y
  pseq = obj$p

  xmeanHip = apply(cbind(xseq[,"Rhip"],xseq[,"Lhip"]),1,mean)
  ymeanHip = apply(cbind(yseq[,"Rhip"],yseq[,"Lhip"]),1,mean)
  HNgap = (cbind(xmeanHip,ymeanHip) - cbind(xseq[,"neck"],yseq[,"neck"]))^2
  realHN_dis = mean(sqrt(apply(HNgap,1,sum)),na.rm = TRUE)
  Xseq = (xseq - xseq[,2])/realHN_dis
  Yseq = (yseq - yseq[,2])/realHN_dis

  output = list(x = Xseq,y=Yseq,p=pseq)

  output
}
