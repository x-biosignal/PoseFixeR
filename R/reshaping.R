#' Reshape imported keypoints into frame-by-keypoint matrices
#'
#' @param obj A list of per-frame keypoint matrices (from [import_json()]).
#' @param norm Logical; normalise coordinates relative to the neck (default TRUE).
#' @return A list with `x`, `y` and confidence matrices (frames x keypoints).
#' @examples
#' ## five frames, each an 18 x 3 keypoint matrix as returned by import_json()
#' parts <- c("nose","neck","Rshoulder","Relbow","Rwrist","Lshoulder","Lelbow",
#'   "Lwrist","Rhip","Rknee","Rankle","Lhip","Lknee","Lankle","Reye","Leye",
#'   "Rear","Lear")
#' bx <- c(0,0,-.25,-.3,-.32,.25,.3,.32,-.18,-.2,-.22,.18,.2,.22,-.05,.05,-.1,.1)
#' by <- c(-.3,0,.05,.5,.95,.05,.5,.95,1,1.65,2.28,1,1.65,2.28,-.35,-.35,-.3,-.3)
#' frames <- lapply(1:5, function(i) {
#'   m <- cbind(X = bx, Y = by, P = 1)
#'   rownames(m) <- parts
#'   m
#' })
#' resh <- reshaping(frames)
#' dim(resh$x)                 # 5 frames x 18 keypoints
#' colnames(resh$x)[1:4]
#' @export
reshaping = function(obj,norm = TRUE){

  realHN_dis = rep(NA,length(obj))
  xseq = yseq = pseq = xseq1 = yseq1 = Xseq = Yseq = matrix(NA,nrow=length(obj),ncol = nrow(obj[[1]]))
  colnames(xseq) = colnames(yseq) = colnames(pseq) = colnames(xseq) = colnames(yseq1) = colnames(Xseq) = colnames(Yseq) = rownames(obj[[1]])
  for(j in seq_along(obj)){
    sbj_ij = as.matrix(obj[[j]])
    xseq[j,] = sbj_ij[,1]
    yseq[j,] = sbj_ij[,2]
    pseq[j,] = sbj_ij[,3]
  }

  output = list(x = xseq, y = yseq, p = pseq)

  return(output)
}
