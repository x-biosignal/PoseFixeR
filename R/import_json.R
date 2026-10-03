#' Import OpenPose JSON files in a batch
#'
#' @param files Character vector of OpenPose JSON file paths (one per frame).
#' @param parts Keypoint names in row order (default: the 18-keypoint layout).
#' @return A list of per-frame keypoint matrices (keypoint x `c("X","Y","P")`).
#' @examples
#' ## Each file holds one frame as a flat vector of 54 values
#' ## (18 keypoints x X, Y, confidence), written to a temporary directory here.
#' bx <- c(0,0,-.25,-.3,-.32,.25,.3,.32,-.18,-.2,-.22,.18,.2,.22,-.05,.05,-.1,.1)
#' by <- c(-.3,0,.05,.5,.95,.05,.5,.95,1,1.65,2.28,1,1.65,2.28,-.35,-.35,-.3,-.3)
#' frame <- as.numeric(t(cbind(bx, by, 1)))   # row-major X, Y, P per keypoint
#' f <- tempfile(fileext = ".json")
#' writeLines(rjson::toJSON(frame), f)
#' keypoints <- import_json(f)
#' dim(keypoints[[1]])        # 18 keypoints x 3 columns
#' head(keypoints[[1]])
#' @export
import_json = function(files,parts =
                         c("nose","neck","Rshoulder","Relbow","Rwrist","Lshoulder",
                                         "Lelbow","Lwrist","Rhip","Rknee","Rankle","Lhip",
                                         "Lknee","Lankle","Reye","Leye","Rear","Lear")){
  n_file = length(files)
  f_df = vector("list",n_file)
  for(i in 1:n_file){
    output = rjson::fromJSON(file = files[i])
    f_df[[i]] = matrix(output,nrow=18,ncol=3,byrow=T)
    rownames(f_df[[i]]) = parts
    colnames(f_df[[i]])=c("X","Y","P")
  }
  f_df
}
