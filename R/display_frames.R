#' Plot a sequence of pose frames
#'
#' Lays out one scatter-plus-skeleton panel per frame (see [plt.segment()]).
#'
#' @param obj Reshaped keypoint data (see [reshaping()]): a list with `x` and
#'   `y` matrices (frames x keypoints).
#' @param layout Length-2 vector `c(rows, cols)` passed to [graphics::par()].
#' @param xlim Length-2 vector for the x-axis range.
#' @param ylim Length-2 vector for the y-axis range (top-down image coordinates).
#' @return Called for its side effect of plotting; returns `NULL`.
#' @examples
#' parts <- c("nose","neck","Rshoulder","Relbow","Rwrist","Lshoulder","Lelbow",
#'   "Lwrist","Rhip","Rknee","Rankle","Lhip","Lknee","Lankle","Reye","Leye",
#'   "Rear","Lear")
#' bx <- c(0,0,-.25,-.3,-.32,.25,.3,.32,-.18,-.2,-.22,.18,.2,.22,-.05,.05,-.1,.1)
#' by <- c(-.3,0,.05,.5,.95,.05,.5,.95,1,1.65,2.28,1,1.65,2.28,-.35,-.35,-.3,-.3)
#' obj <- list(x = matrix(bx, 2, 18, byrow = TRUE, dimnames = list(NULL, parts)),
#'             y = matrix(by, 2, 18, byrow = TRUE, dimnames = list(NULL, parts)))
#' op <- graphics::par(no.readonly = TRUE)
#' diplay_frames(obj, layout = c(1, 2), xlim = c(-1, 1), ylim = c(2.5, -0.5))
#' graphics::par(op)
#' @export

diplay_frames = function(obj,layout = c(5,5),xlim = c(450,800), ylim = c(700,200)){
  n_frame = nrow(obj$x)
  graphics::par(mfrow=layout)
  for(j in 1:n_frame){
    plot(obj$x[j,],obj$y[j,],xlim = xlim,ylim = ylim,lwd = 2,main = paste0("T=",j))
    graphics::axis(side=1, tck=1.0, lty="dotted")
    graphics::axis(side=2, tck=1.0, lty="dotted")
    plt.segment(obj$x[j,], obj$y[j,])
  }
}
